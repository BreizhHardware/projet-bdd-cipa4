import psycopg2
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
from datetime import datetime
from config import DB_CONFIG

# Configuration de la connexion à la base de données

def executer_requete():
    """Crée la vue si nécessaire et retourne un DataFrame pandas"""
    try:
        conn = psycopg2.connect(**DB_CONFIG)
        cursor = conn.cursor()
        conn.set_client_encoding('UTF8')

        # Créer la vue si elle n'existe pas
        create_view_query = """
        DROP VIEW IF EXISTS vue_puissance_region_annee;

        CREATE VIEW vue_puissance_region_annee AS
        SELECT *
        FROM (
            SELECT 
                r.nom AS region,
                EXTRACT(YEAR FROM i.date_installation) AS annee,
                SUM(i.puissance_crete) AS puissance_totale,
                AVG(i.puissance_crete) AS puissance_moyenne,
                COUNT(i.id_installation) AS nombre_installations
            FROM Installation i
            JOIN Localisation l ON i.id_ville = l.id_ville
            JOIN Departement d ON l.departement_code = d.departement_code
            JOIN Region r ON d.region_code = r.region_code
            WHERE i.date_installation IS NOT NULL
            GROUP BY r.nom, EXTRACT(YEAR FROM i.date_installation)
            ORDER BY annee DESC, puissance_totale DESC
        ) as view;
        """
        
        cursor.execute(create_view_query)
        conn.commit()
        print("✓ Vue 'vue_puissance_region_annee' créée ou déjà existante")
        
        # Sélectionner toutes les données de la vue
        select_query = "SELECT * FROM vue_puissance_region_annee;"
        
        df = pd.read_sql_query(select_query, conn)
        cursor.close()
        conn.close()
        
        return df
    
    except Exception as e:
        print(f"Erreur lors de l'exécution de la requête: {e}")
        return None

def creer_visualisations(df):
    """Crée plusieurs graphiques à partir des données"""
    
    # Configuration du style
    sns.set_style("whitegrid")
    plt.rcParams['figure.figsize'] = (16, 12)
    
    # Calculer la puissance moyenne par installation
    df['puissance_par_installation'] = df['puissance_totale'] / df['nombre_installations']
    
    # Créer une figure avec plusieurs sous-graphiques
    fig = plt.figure(figsize=(22, 14))
    gs = fig.add_gridspec(3, 2, hspace=0.3, wspace=0.3, 
                          left=0.05, right=0.98, top=0.95, bottom=0.05)
    
    ax1 = fig.add_subplot(gs[0, :])  # Evolution (sur toute la largeur en haut)
    ax2 = fig.add_subplot(gs[1, 0])  # Heatmap (milieu gauche)
    ax3 = fig.add_subplot(gs[1, 1])  # Année 1
    ax4 = fig.add_subplot(gs[2, 0])  # Année 2
    ax5 = fig.add_subplot(gs[2, 1])  # Année 3
    
    fig.suptitle('Analyse de la Puissance Solaire par Région et Année', 
                 fontsize=16, fontweight='bold')
    
    # 1. Évolution de la puissance totale par région (toutes les régions)
    toutes_regions = df['region'].unique()
    colors = plt.cm.tab20(range(len(toutes_regions)))
    
    for idx, region in enumerate(toutes_regions):
        data = df[df['region'] == region].sort_values('annee')
        ax1.plot(data['annee'], data['puissance_totale'], 
                       marker='o', markersize=3, linewidth=1, label=region, 
                       color=colors[idx], alpha=0.8)
    
    ax1.set_title('Évolution de la Puissance Totale par Région et par Année', 
                         fontsize=12, fontweight='bold')
    ax1.set_xlabel('Année')
    ax1.set_ylabel('Puissance Totale (kW)')
    ax1.legend(bbox_to_anchor=(1.02, 1), loc='upper left', fontsize=8)
    ax1.grid(True, alpha=0.3)
    
    # 2. Nombre d'installations par région et par année (heatmap)
    pivot_installations = df.pivot_table(
        values='nombre_installations', 
        index='region', 
        columns='annee', 
        aggfunc='sum',
        fill_value=0
    )
    
    pivot_installations.columns = pivot_installations.columns.astype(int)
    
    sns.heatmap(pivot_installations, annot=False, 
                cmap='YlOrRd', ax=ax2, cbar_kws={'label': 'Nombre d\'installations'})
    ax2.set_title('Nombre d\'installations par Région et Année', 
                         fontsize=12, fontweight='bold')
    ax2.set_xlabel('Année')
    ax2.set_ylabel('Région')
    
    # 3-5. Puissance moyenne par installation pour plusieurs années
    annees_cibles = [1998, 2008, 2023]
    axes_barres = [ax3, ax4, ax5]
    colors_barres = ['steelblue', 'coral', 'seagreen']
    
    for annee, ax, color in zip(annees_cibles, axes_barres, colors_barres):
        df_annee = df[df['annee'] == annee].sort_values('puissance_par_installation', ascending=True)
        
        if not df_annee.empty:
            ax.barh(df_annee['region'], df_annee['puissance_par_installation'], 
                    color=color, alpha=0.8)
            ax.set_title(f'Puissance Moyenne par Installation - Année {int(annee)}', 
                         fontsize=11, fontweight='bold')
            ax.set_xlabel('Puissance Moyenne (kW)')
            ax.set_ylabel('Région')
            ax.grid(True, alpha=0.3, axis='x')
        else:
            ax.text(0.5, 0.5, f'Pas de données pour {int(annee)}', 
                    ha='center', va='center', transform=ax.transAxes, fontsize=12)
            ax.set_title(f'Puissance Moyenne par Installation - Année {int(annee)}', 
                         fontsize=11, fontweight='bold')
            ax.axis('off')
    
    plt.tight_layout()
    
    # Sauvegarder le graphique
    timestamp = datetime.now().strftime('%Y%m%d_%H%M%S')
    filename = f'analyse_puissance_solaire_{timestamp}.png'
    plt.savefig(filename, dpi=300, bbox_inches='tight')
    print(f"\nGraphique sauvegardé: {filename}")
    
    plt.show()

def afficher_statistiques(df):
    """Affiche des statistiques descriptives"""
    print("\n" + "="*70)
    print("STATISTIQUES GÉNÉRALES")
    print("="*70)
    
    print(f"\nPériode analysée: {int(df['annee'].min())} - {int(df['annee'].max())}")
    print(f"Nombre de régions: {df['region'].nunique()}")
    print(f"Nombre total d'enregistrements: {len(df)}")
    
    print("\n" + "-"*70)
    print("TOP 5 RÉGIONS - Puissance Totale Cumulée")
    print("-"*70)
    top5_total = df.groupby('region')['puissance_totale'].sum().nlargest(5)
    for i, (region, puissance) in enumerate(top5_total.items(), 1):
        print(f"{i}. {region}: {puissance:,.0f} kW")
    
    print("\n" + "-"*70)
    print("TOP 5 RÉGIONS - Nombre Total d'Installations")
    print("-"*70)
    top5_installations = df.groupby('region')['nombre_installations'].sum().nlargest(5)
    for i, (region, nb) in enumerate(top5_installations.items(), 1):
        print(f"{i}. {region}: {int(nb)} installations")
    
    print("\n" + "-"*70)
    print("ÉVOLUTION ANNUELLE")
    print("-"*70)
    evolution = df.groupby('annee').agg({
        'puissance_totale': 'sum',
        'nombre_installations': 'sum',
        'puissance_moyenne': 'mean'
    }).sort_index()
    
    print(evolution.to_string())
    print("\n")

def main():
    """Fonction principale"""
    print("Récupération des données...")
    df = executer_requete()
    
    if df is not None and not df.empty:
        print(f"✓ {len(df)} enregistrements récupérés")
        
        # Afficher un aperçu des données
        print("\nAperçu des données:")
        print(df.head(10).to_string())
        
        # Afficher les statistiques
        afficher_statistiques(df)
        
        # Créer les visualisations
        print("\nGénération des graphiques...")
        creer_visualisations(df)
        
        print("\n✓ Analyse terminée avec succès!")
    else:
        print("✗ Aucune donnée récupérée")

if __name__ == "__main__":
    main()