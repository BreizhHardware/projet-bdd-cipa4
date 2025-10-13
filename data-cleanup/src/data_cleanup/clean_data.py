import pandas as pd
import numpy as np
import unicodedata
import difflib
from collections import defaultdict

def normalize_text(text):
    return ''.join(c for c in unicodedata.normalize('NFD', text) if unicodedata.category(c) != 'Mn')

def clean_data(input_file, output_file):
    # Load communes data for postal code lookup
    print("Loading communes data...")
    communes_file = "../communes-france-2024-limite.csv"
    df_communes = pd.read_csv(communes_file, encoding='utf-8', low_memory=False, sep=';')
    # Assume columns: 'nom_standard', 'code_postal', 'dep_nom', 'reg_nom', 'code_insee'
    reg_mapping = {}
    dep_mapping = {}
    postal_mapping = {}
    insee_mapping = {}
    dep_to_cities = defaultdict(list)
    dep_postal_to_info = defaultdict(list)
    postal_to_info = defaultdict(list)
    for idx, row in df_communes.iterrows():
        key = (normalize_text(str(row['nom_standard']).replace('-', '').lower().strip()), normalize_text(str(row['dep_nom']).replace('-', '').lower().strip()))
        reg_mapping[key] = row['reg_nom']
        dep_mapping[key] = row['dep_nom']
        postal_mapping[key] = int(row['code_postal']) if pd.notna(row['code_postal']) else pd.NA
        insee_mapping[key] = row['code_insee']

        dep_norm = normalize_text(str(row['dep_nom']).replace('-', '').lower().strip())
        city_norm = normalize_text(str(row['nom_standard']).replace('-', '').lower().strip())
        dep_to_cities[dep_norm].append(city_norm)

        postal = row['code_postal']
        info = (city_norm, row['reg_nom'], row['dep_nom'], row['code_insee'])
        dep_postal_to_info[(dep_norm, postal)].append(info)
        postal_to_info[postal].append(info)

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
    df.drop(columns=['postal_code_suffix', 'postal_town', 'administrative_area_level_3', 'administrative_area_level_4', 'installateur'], inplace=True)

    # locality: Strip and remove backslashes
    df['locality'] = df['locality'].str.strip().str.replace('\\', '', regex=False)

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

    # After cleaning locality and administrative_area_level_2, remap columns
    print("Remapping columns using communes data...")
    df['code_insee'] = None  # Add new column
    indices_to_drop = []
    for idx, row in df.iterrows():
        locality_normalized = normalize_text(str(row['locality']).replace('-', '').lower().strip())
        dep_normalized = normalize_text(str(row['administrative_area_level_2']).replace('-', '').replace('\\', '').lower().strip())
        # Special case for Paris
        if 'paris' in locality_normalized and ('paris' in dep_normalized or 'arrondissement' in dep_normalized or 'departement' in dep_normalized):
            df.at[idx, 'administrative_area_level_1'] = 'Île-de-France'
            df.at[idx, 'administrative_area_level_2'] = 'Paris'
            df.at[idx, 'code_insee'] = 75056
            continue
        key = (locality_normalized, dep_normalized)
        if key in reg_mapping:
            df.at[idx, 'administrative_area_level_1'] = reg_mapping[key]
        if key in dep_mapping:
            df.at[idx, 'administrative_area_level_2'] = dep_mapping[key]
        if key in postal_mapping:
            df.at[idx, 'postal_code'] = postal_mapping[key]
        if key in insee_mapping:
            df.at[idx, 'code_insee'] = insee_mapping[key]
        else:
            dep_norm = normalize_text(str(row['administrative_area_level_2']).replace('-', '').replace('\\', '').lower().strip())
            locality_norm = normalize_text(str(row['locality']).replace('-', '').lower().strip())
            matched = False
            if pd.notna(row['postal_code']):
                postal = int(row['postal_code'])
                if postal in postal_to_info:
                    best_score = 0
                    best_info = None
                    for info in postal_to_info[postal]:
                        city_norm_ref = info[0]
                        if locality_norm in city_norm_ref or city_norm_ref in locality_norm:
                            score = 1.0
                        else:
                            score = difflib.SequenceMatcher(None, locality_norm, city_norm_ref).ratio()
                        if score > best_score:
                            best_score = score
                            best_info = info
                    if best_score > 0.5:
                        df.at[idx, 'administrative_area_level_1'] = best_info[1]
                        df.at[idx, 'administrative_area_level_2'] = best_info[2]
                        df.at[idx, 'code_insee'] = best_info[3]
                        matched = True
            if not matched and dep_norm in dep_to_cities:
                best_score = 0
                best_match = None
                for city_norm in dep_to_cities[dep_norm]:
                    if locality_norm in city_norm or city_norm in locality_norm:
                        score = 1.0
                    else:
                        score = difflib.SequenceMatcher(None, locality_norm, city_norm).ratio()
                    if score > best_score:
                        best_score = score
                        best_match = city_norm
                if best_score > 0.5:
                    matched_key = (best_match, dep_norm)
                    if matched_key in reg_mapping:
                        df.at[idx, 'administrative_area_level_1'] = reg_mapping[matched_key]
                    if matched_key in dep_mapping:
                        df.at[idx, 'administrative_area_level_2'] = dep_mapping[matched_key]
                    if matched_key in postal_mapping:
                        df.at[idx, 'postal_code'] = postal_mapping[matched_key]
                    if matched_key in insee_mapping:
                        df.at[idx, 'code_insee'] = insee_mapping[matched_key]
                    matched = True
            if not matched:
                print(f"City not found: {row['locality']} in {row['administrative_area_level_2']}")
                indices_to_drop.append(idx)

    # Drop unmatched rows
    df.drop(indices_to_drop, inplace=True)

    # Save cleaned data
    df.to_csv(output_file, index=False, encoding='utf-8')

def fix_encoding(text):
    if pd.isna(text):
        return text
    replacements = {
        'Ã©': 'é',
        'Ã¨': 'è',
        'ÃŽ': 'Î',
        'Ã¢': 'â',
        'Ã§': 'ç',
        'Ã»': 'û',
        'Ã´': 'ô',
        'Ã¯': 'ï',
        'Ã¼': 'ü',
        'Ã«': 'ë',
        'Ã¹': 'ù',
        'Ãª': 'ê',
        'Ã®': 'î',
        'Ã¶': 'ö',
        'Ã¤': 'ä',
        'Ã¿': 'ÿ',
        'Ã': 'É',
        'Ã': 'È',
        'Ã': 'Ê',
        'Ã': 'Ë',
        'Ã': 'Ì',
        'Ã': 'Í',
        'Ã': 'Î',
        'Ã': 'Ï',
        'Ã': 'Ð',
        'Ã': 'Ñ',
        'Ã': 'Ò',
        'Ã': 'Ó',
        'Ã': 'Ô',
        'Ã': 'Õ',
        'Ã': 'Ö',
        'Ã': '×',
        'Ã': 'Ø',
        'Ã': 'Ù',
        'Ã': 'Ú',
        'Ã': 'Û',
        'Ã': 'Ü',
        'Ã': 'Ý',
        'Ã': 'Þ',
        'Ã': 'ß',
        'Ã ': 'à',
        'Ã¡': 'á',
        'Ã¢': 'â',
        'Ã£': 'ã',
        'Ã¤': 'ä',
        'Ã¥': 'å',
        'Ã¦': 'æ',
        'Ã§': 'ç',
        'Ã¨': 'è',
        'Ã©': 'é',
        'Ãª': 'ê',
        'Ã«': 'ë',
        'Ã¬': 'ì',
        'Ã­': 'í',
        'Ã®': 'î',
        'Ã¯': 'ï',
        'Ã°': 'ð',
        'Ã±': 'ñ',
        'Ã²': 'ò',
        'Ã³': 'ó',
        'Ã´': 'ô',
        'Ãµ': 'õ',
        'Ã¶': 'ö',
        'Ã·': '÷',
        'Ã¸': 'ø',
        'Ã¹': 'ù',
        'Ãº': 'ú',
        'Ã»': 'û',
        'Ã¼': 'ü',
        'Ã½': 'ý',
        'Ã¾': 'þ',
        'Ã¿': 'ÿ',
    }
    for wrong, correct in replacements.items():
        text = text.replace(wrong, correct)
    return text

if __name__ == "__main__":
    input_file = "../data.csv"
    output_file = "../cleaned_data.csv"
    clean_data(input_file, output_file)