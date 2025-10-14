import psycopg2
import pandas as pd
import folium
import requests
import json
from branca.colormap import LinearColormap
from config import DB_CONFIG

def get_data_from_db():
    """Récupère les données depuis PostgreSQL"""
    conn = psycopg2.connect(**DB_CONFIG)
    conn.set_client_encoding('UTF8')

    query = """
            SELECT
                r.nom AS region,
                d.nom AS departement,
                l.code_insee,
                CASE WHEN d.nom IS NULL THEN 'REGION' ELSE 'DEPARTEMENT' END AS niveau,
                COUNT(i.id_installation) AS nombre_installations,
                ROUND(AVG(i.orientation)::numeric, 2) AS orientation_moyenne,
                MIN(i.orientation) AS orientation_min,
                MAX(i.orientation) AS orientation_max,
                ROUND(STDDEV(i.orientation)::numeric, 2) AS orientation_ecart_type,
                ROUND(AVG(i.pente)::numeric, 2) AS pente_moyenne,
                MIN(i.pente) AS pente_min,
                MAX(i.pente) AS pente_max,
                ROUND(STDDEV(i.pente)::numeric, 2) AS pente_ecart_type
            FROM Installation i
                     JOIN Localisation l ON i.id_ville = l.id_ville
                     JOIN Departement d ON l.departement_code = d.departement_code
                     JOIN Region r ON d.region_code = r.region_code
            WHERE i.orientation IS NOT NULL AND i.pente IS NOT NULL
            GROUP BY GROUPING SETS (
                (r.nom, d.nom, l.code_insee),
                (r.nom)
                )
            ORDER BY r.nom, d.nom NULLS FIRST; \
            """

    cursor = conn.cursor()
    cursor.execute(query)
    columns = [desc[0] for desc in cursor.description]
    data = cursor.fetchall()

    df = pd.DataFrame(data, columns=columns)

    cursor.close()
    conn.close()

    return df

def get_geojson_france():
    """Télécharge les contours géographiques de la France"""
    # GeoJSON des régions françaises
    url_regions = "https://raw.githubusercontent.com/gregoiredavid/france-geojson/master/regions.geojson"
    # GeoJSON des départements français
    url_departements = "https://raw.githubusercontent.com/gregoiredavid/france-geojson/master/departements.geojson"

    regions_geojson = requests.get(url_regions).json()
    departements_geojson = requests.get(url_departements).json()

    return regions_geojson, departements_geojson

def create_map(df, regions_geojson, departements_geojson, metric='nombre_installations'):
    """Crée une carte interactive avec Folium"""

    # Séparer les données par niveau
    # Les lignes 'DEPARTEMENT' sont en fait au niveau ville (code_insee) à cause du GROUPING SETS
    df_villes = df[df['niveau'] == 'DEPARTEMENT'].copy()
    df_regions = df[df['niveau'] == 'REGION'].copy()

    # --- FIX: Agréger les données du niveau 'ville' (DEPARTEMENT) au niveau 'département' ---
    # Extraire les 2 premiers caractères du code INSEE
    df_villes['dept_code'] = df_villes['code_insee'].astype(str).str[:2]

    # Agréger par code département pour obtenir les données au bon niveau pour la carte et le tooltip
    df_departements_agg = df_villes.groupby(['dept_code', 'departement', 'region']).agg(
        nombre_installations=('nombre_installations', 'sum'),
        orientation_moyenne=('orientation_moyenne', 'mean'), # On moyenne les moyennes des villes
        orientation_min=('orientation_min', 'min'),         # Le minimum global du département
        orientation_max=('orientation_max', 'max'),         # Le maximum global du département
        orientation_ecart_type=('orientation_ecart_type', 'mean'), # Approximation: moyenne des écarts-types
        pente_moyenne=('pente_moyenne', 'mean'),
        pente_min=('pente_min', 'min'),
        pente_max=('pente_max', 'max'),
        pente_ecart_type=('pente_ecart_type', 'mean'),
    ).reset_index()
    # Note: L'écart-type agrégé n'est pas techniquement la stddev du département, mais une moyenne des stddev des villes,
    # qui peut être une bonne approximation si les tailles de villes sont similaires. Pour l'écart-type exact,
    # il faudrait revenir aux données brutes. Ici, on utilise la moyenne des écarts-types des villes.

    # S'assurer que les colonnes numériques sont au bon type
    numeric_cols = [col for col in df_departements_agg.columns if 'moyenne' in col or 'ecart_type' in col or 'min' in col or 'max' in col or 'nombre' in col]
    for col in numeric_cols:
        df_departements_agg[col] = pd.to_numeric(df_departements_agg[col], errors='coerce')
    for col in df_departements_agg.columns:
        if 'moyenne' in col or 'ecart_type' in col:
            df_departements_agg[col] = df_departements_agg[col].round(2)
    # ------------------------------------------------------------------------------------------------

    # Debug: afficher les codes
    print("\n=== Codes départements dans la BDD (Après agrégation) ===")
    print(df_departements_agg[['departement', 'dept_code', 'nombre_installations']].head(10))
    print("\n=== Codes dans le GeoJSON ===")
    codes_geojson = [f['properties']['code'] for f in departements_geojson['features'][:10]]
    print(codes_geojson)

    # Créer la carte centrée sur la France
    m = folium.Map(
        location=[46.603354, 1.888334],
        zoom_start=6,
        tiles='OpenStreetMap'
    )

    # Créer une colormap pour les installations
    if len(df_departements_agg) > 0:
        vmin = df_departements_agg[metric].min()
        vmax = df_departements_agg[metric].max()
        colormap = LinearColormap(
            colors=['yellow', 'orange', 'red'],
            vmin=vmin,
            vmax=vmax,
            caption=f'{metric}'
        )

    # Ajouter la couche des départements (utiliser la DataFrame agrégée)
    if len(df_departements_agg) > 0:
        folium.Choropleth(
            geo_data=departements_geojson,
            name='Départements',
            data=df_departements_agg, # Utiliser la DF agrégée
            columns=['dept_code', metric],
            key_on='feature.properties.code',
            fill_color='YlOrRd',
            fill_opacity=0.7,
            line_opacity=0.2,
            legend_name=f'{metric} par département',
            highlight=True
        ).add_to(m)

    # Ajouter les tooltips pour les départements
    for feature in departements_geojson['features']:
        dept_code = feature['properties']['code']
        # Rechercher les données dans la DataFrame agrégée
        dept_data = df_departements_agg[df_departements_agg['dept_code'] == dept_code]

        if not dept_data.empty:
            row = dept_data.iloc[0]
            # Utiliser la colonne 'departement' pour le nom (si elle existe, sinon utiliser le nom du GeoJSON)
            departement_nom = row['departement'] if 'departement' in row else feature['properties']['nom']
            region_nom = row['region'] if 'region' in row else 'Non spécifiée'

            popup_html = f"""
            <div style="font-family: Arial; font-size: 12px;">
                <h4>{departement_nom} ({dept_code})</h4>
                <b>Région:</b> {region_nom}<br>
                <b>Installations:</b> {row['nombre_installations']}<br>
                <hr>
                <b>Orientation:</b><br>
                - Moyenne: {row['orientation_moyenne']}°<br>
                - Min/Max: {row['orientation_min']}° / {row['orientation_max']}°<br>
                - Écart-type: {row['orientation_ecart_type']}<br>
                <hr>
                <b>Pente:</b><br>
                - Moyenne: {row['pente_moyenne']}°<br>
                - Min/Max: {row['pente_min']}° / {row['pente_max']}°<br>
                - Écart-type: {row['pente_ecart_type']}
            </div>
            """

            folium.GeoJson(
                feature,
                style_function=lambda x: {
                    'fillColor': 'transparent',
                    'color': 'transparent',
                    'weight': 0
                },
                tooltip=folium.Tooltip(popup_html)
            ).add_to(m)

    # Ajouter un contrôle de couches
    folium.LayerControl().add_to(m)

    # Ajouter la légende de la colormap
    if len(df_departements_agg) > 0:
        colormap.add_to(m)

    return m

def main():
    print("Récupération des données depuis PostgreSQL...")
    df = get_data_from_db()

    print(f"Données récupérées: {len(df)} lignes")
    print(f"- Régions: {len(df[df['niveau'] == 'REGION'])}")
    print(f"- Départements: {len(df[df['niveau'] == 'DEPARTEMENT'])}")

    print("\nTéléchargement des contours géographiques...")
    regions_geojson, departements_geojson = get_geojson_france()

    print("\nCréation de la carte...")
    carte = create_map(df, regions_geojson, departements_geojson)

    # Sauvegarder la carte
    output_file = 'carte_installations_france.html'
    carte.save(output_file)
    print(f"\nCarte sauvegardée dans: {output_file}")

    # Afficher quelques statistiques
    print("\n=== Statistiques globales ===")
    df_dept = df[df['niveau'] == 'DEPARTEMENT']
    print(f"Total installations: {df_dept['nombre_installations'].sum()}")
    print(f"Orientation moyenne globale: {df_dept['orientation_moyenne'].mean():.2f}°")
    print(f"Pente moyenne globale: {df_dept['pente_moyenne'].mean():.2f}°")

    print("\n=== Top 5 départements par nombre d'installations ===")
    top5 = df_dept.nlargest(5, 'nombre_installations')[['departement', 'nombre_installations', 'orientation_moyenne', 'pente_moyenne']]
    print(top5.to_string(index=False))

if __name__ == "__main__":
    main()