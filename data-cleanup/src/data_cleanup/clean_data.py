import pandas as pd
import numpy as np

def clean_data(input_file, output_file):
    # Load the data
    print("Loading data...")
    df = pd.read_csv(input_file, encoding='utf-8-sig')
    print(f"Data loaded, shape: {df.shape}")

    # Fix encoding issues in the data
    print("Fixing encoding...")
    string_cols = ['panneaux_marque', 'panneaux_modele', 'onduleur_marque', 'onduleur_modele', 'installateur', 'country', 'locality', 'administrative_area_level_1', 'administrative_area_level_2']
    for col in string_cols:
        if col in df.columns:
            df[col] = df[col].apply(fix_encoding)

    # Clean each column based on analysis

    # Id, Iddoc, mois_installation, an_installation, nb_panneaux: OK, Int
    # Already int, but ensure
    int_cols = ['id', 'iddoc', 'mois_installation', 'an_installation', 'nb_panneaux']
    for col in int_cols:
        df[col] = pd.to_numeric(df[col], errors='coerce').astype('Int64')

    # panneaux_marque: Standardize brands (basic lowercase)
    df['panneaux_marque'] = df['panneaux_marque'].str.lower().str.strip()

    # panneaux_modele: Leave as is, but strip
    df['panneaux_modele'] = df['panneaux_modele'].str.strip()

    # nb_onduleur: Filter aberrante, if >99 set to NaN
    df['nb_onduleur'] = pd.to_numeric(df['nb_onduleur'], errors='coerce')
    df.loc[df['nb_onduleur'] > 99, 'nb_onduleur'] = np.nan
    df['nb_onduleur'] = df['nb_onduleur'].astype('Int64')

    # onduleur_marque: Lowercase
    df['onduleur_marque'] = df['onduleur_marque'].str.lower().str.strip()

    # onduleur_modele: Strip
    df['onduleur_modele'] = df['onduleur_modele'].str.strip()

    # puissance_crete: If 0, set to NaN
    df['puissance_crete'] = pd.to_numeric(df['puissance_crete'], errors='coerce')
    df.loc[df['puissance_crete'] == 0, 'puissance_crete'] = np.nan
    df['puissance_crete'] = df['puissance_crete'].astype('Int64')

    # surface: If 0 or very large (>10000?), set to NaN
    df['surface'] = pd.to_numeric(df['surface'], errors='coerce')
    df.loc[(df['surface'] == 0) | (df['surface'] > 10000), 'surface'] = np.nan
    df['surface'] = df['surface'].astype('Int64')

    # pente: OK
    df['pente'] = pd.to_numeric(df['pente'], errors='coerce').astype('Int64')

    # pente_optimum: Handle nulls, keep as is
    df['pente_optimum'] = pd.to_numeric(df['pente_optimum'], errors='coerce').astype('Int64')

    # orientation: Standardize to numbers, Sud/South = 180
    def standardize_orientation(x):
        if pd.isna(x):
            return np.nan
        x = str(x).strip().lower()
        if x in ['sud', 'south']:
            return 180
        try:
            return int(float(x))
        except:
            return np.nan
    df['orientation'] = df['orientation'].apply(standardize_orientation).astype('Int64')

    # orientation_optimum: Handle nulls
    df['orientation_optimum'] = pd.to_numeric(df['orientation_optimum'], errors='coerce').astype('Int64')

    # installateur: Strip
    df['installateur'] = df['installateur'].str.strip()

    # production_pvgis: If 0, set to NaN
    df['production_pvgis'] = pd.to_numeric(df['production_pvgis'], errors='coerce')
    df.loc[df['production_pvgis'] == 0, 'production_pvgis'] = np.nan
    df['production_pvgis'] = df['production_pvgis'].astype('Int64')

    # lat, lon: To float
    df['lat'] = pd.to_numeric(df['lat'], errors='coerce')
    df['lon'] = pd.to_numeric(df['lon'], errors='coerce')

    # country: OK
    df['country'] = df['country'].str.strip()

    # postal_code: Handle nulls
    df['postal_code'] = pd.to_numeric(df['postal_code'], errors='coerce').astype('Int64')

    # postal_code_suffix, postal_town, administrative_area_level_3, administrative_area_level_4, political: Drop as VIDE or mostly null
    df.drop(columns=['postal_code_suffix', 'postal_town', 'administrative_area_level_3', 'administrative_area_level_4'], inplace=True)

    # locality: Strip
    df['locality'] = df['locality'].str.strip()

    # administrative_area_level_1: Standardize regions (basic, assume current)
    # This is complex, for now lowercase and strip
    print("Unique administrative_area_level_1 before standardization:")
    print(df['administrative_area_level_1'].unique()[:20])  # First 20 unique
    df['administrative_area_level_1'] = df['administrative_area_level_1'].str.lower().str.strip()

    # administrative_area_level_2: Strip
    df['administrative_area_level_2'] = df['administrative_area_level_2'].str.strip()

    # administrative_area_level_1: Standardize regions
    region_mapping = {
        'provence-alpes-côte d\'azur': 'Provence-Alpes-Côte d\'Azur',
        'paca': 'Provence-Alpes-Côte d\'Azur',
        'provence-alpes-cote d\'azur': 'Provence-Alpes-Côte d\'Azur',
        "provence-alpes-côte d\\'azur": 'Provence-Alpes-Côte d\'Azur',
        'languedoc-roussillon': 'Occitanie',
        'midi-pyrénées': 'Occitanie',
        'languedoc-roussillon midi-pyrénées': 'Occitanie',
        'aquitaine': 'Nouvelle-Aquitaine',
        'poitou-charentes': 'Nouvelle-Aquitaine',
        'limousin': 'Nouvelle-Aquitaine',
        'aquitaine-limousin-poitou-charentes': 'Nouvelle-Aquitaine',
        'alsace': 'Grand Est',
        'champagne-ardenne': 'Grand Est',
        'lorraine': 'Grand Est',
        'alsace-champagne-ardenne-lorraine': 'Grand Est',
        'bourgogne': 'Bourgogne-Franche-Comté',
        'franche-comté': 'Bourgogne-Franche-Comté',
        'bourgogne franche-comté': 'Bourgogne-Franche-Comté',
        'picardie': 'Hauts-de-France',
        'nord-pas-de-calais': 'Hauts-de-France',
        'nord-pas-de-calais picardie': 'Hauts-de-France',
        'basse-normandie': 'Normandie',
        'haute-normandie': 'Normandie',
        'normandy': 'Normandie',
        'auvergne': 'Auvergne-Rhône-Alpes',
        'rhône-alpes': 'Auvergne-Rhône-Alpes',
        'centre': 'Centre-Val de Loire',
        'corse': 'Corse',
        'bretagne': 'Bretagne',
        'britany': 'Bretagne',
        'pays de la loire': 'Pays de la Loire',
        'ile-de-france': 'Île-de-France',
        'Ã®le-de-france': 'Île-de-France',
        'Ãžle-De-France': 'Île-de-France',
        'Ãžle-de-france': 'Île-de-France',
    }
    df['administrative_area_level_1'] = df['administrative_area_level_1'].map(lambda x: region_mapping.get(x, x) if pd.notna(x) else x)
    # Then title case
    df['administrative_area_level_1'] = df['administrative_area_level_1'].str.title()

    # Save cleaned data
    df.to_csv(output_file, index=False, encoding='utf-8')

def fix_encoding(text):
    if pd.isna(text):
        return text
    try:
        # Fix double-encoded UTF-8
        return text.encode('latin1').decode('utf-8')
    except:
        return text

if __name__ == "__main__":
    input_file = "../data.csv"
    output_file = "../cleaned_data.csv"
    clean_data(input_file, output_file)