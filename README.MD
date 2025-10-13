# Projet BDD - Gestion des installations photovoltaïques

## Introduction
Dans le cadre du cours de Base de Données, on vous demande de concevoir et d’interroger une base portant sur les installations photovoltaïques résidentielles (le jeu de données est réel). Les objectifs sont les suivants :
- construire un schéma relationnel en 3FN,
- nettoyer et homogénéiser les fichiers source, puis
- charger les données dans une base de données PostgreSQL, et ensuite
- répondre à un ensemble de requêtes d’analyse.

Les fichiers de base sont fournis, à savoir :
- data.csv, qui reprend les installations, avec les informations suivantes : puissance crête, surface, marques, orientation, etc., et
- communes-france-2024-limite.csv, qui est le référentiel des communes, avec le code INSEE, la commune, le département, la région, et le code postal.

## Requirements
- Python 3.x
- PostgreSQL
- poetry (pour la gestion des dépendances)

## Installation
1. Cloner le dépôt GitHub :
    ```bash
    git clone https://github.com/breizhhardware/projet-bdd-cipa4.git
    cd projet-bdd-cipa4/data-cleanup
    ```
2. Installer les dépendances avec poetry :
    ```bash
    poetry install
    ```
3. Configurer la base de données PostgreSQL :