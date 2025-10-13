import unicodedata
import pandas as pd
import numpy as np

def normalize_text(text):
    return ''.join(c for c in unicodedata.normalize('NFD', text) if unicodedata.category(c) != 'Mn')

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
        'Ã‰': 'É',
        'Ãˆ': 'È',
        'ÃŠ': 'Ê',
        'Ã‹': 'Ë',
        'ÃŒ': 'Ì',
        'Ã': 'Í'
    }
    for wrong, correct in replacements.items():
        text = text.replace(wrong, correct)
    return text

def is_valid_company_name(text):
    if pd.isna(text):
        return False
    text = str(text).strip()
    if len(text) < 3:
        return False
    # Exclude invalid patterns
    if 'http' in text.lower() or 'www.' in text.lower() or 'ww.' in text.lower() or '&' in text or 'non renseign' in text.lower() or 'moi' in text.lower() or 'je' in text.lower() or 'particulier' in text.lower() or 'auto installation' in text.lower() or 'particulier' in text.lower() or 'particulier' in text.lower() or 'auto installation' in text.lower() or "ne merite plus d'etre cite" in text.lower() or "000" in text or "a bannir" in text.lower() or "a eviter" in text.lower() or "a fuir" in text.lower() or "a proscrire" in text.lower() or "a oublier" in text.lower() or "a deconseiller" in text.lower() or "a ne pas contacter" in text.lower() or "a ne pas retenir" in text.lower() or "a ne pas choisir" in text.lower() or "a ne pas faire travailler" in text.lower() or "a ne pas faire appel" in text.lower() or "ne pas contacter" in text.lower() or "ne pas retenir" in text.lower() or "ne pas choisir" in text.lower() or "ne pas faire travailler" in text.lower() or "ne pas faire appel" in text.lower() or "a completer" in text.lower() or "a voir" in text.lower():
        return False
    # Check for company indicators
    if any(char.isdigit() for char in text):
        return True  # Likely has registration number
    if ' ' in text:
        return True  # Likely full name
    keywords = ['sar', 'sas', 'sa', 'gmb', 'ltd', 'inc', 'co', 'entreprise', 'societe', 'electricite', 'energie', 'solaire']
    if any(kw.lower() in text.lower() for kw in keywords):
        return True
    return False

def standardize_orientation(x):
    if pd.isna(x):
        return np.nan
    x = str(x).strip().lower()
    if x in ['sud', 'south']:
        return 0
    try:
        return int(float(x))
    except:
        return np.nan
