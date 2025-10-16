-- Query 2
SELECT
    p.modele AS modele_panneau,
    i.puissance_crete,
    i.surface,
    i.orientation,
    i.pente,
    mo.marque AS marque_onduleur,
    o.modele AS modele_onduleur
FROM Installation i
         JOIN Onduleur o ON o.Id_onduleur= i.Id_onduleur
         JOIN Panneau p ON p.Id_panneau= i.Id_panneau
         JOIN Marque mo ON mo.id_marque = o.id_marque
WHERE p.modele = 'HIP-210 NKHE1';
-- Result
 modele_panneau | puissance_crete | surface | orientation | pente |      marque_onduleur       |      modele_onduleur       
----------------+-----------------+---------+-------------+-------+----------------------------+----------------------------
 HIP-210 NKHE1  |            2520 |      16 |          10 |    20 | FRONIUS                    | IG 20
 HIP-210 NKHE1  |            2940 |      18 |           0 |    30 | SMA                        | SUNNY BOY 3300 TL
 HIP-210 NKHE1  |            2940 |      18 |          80 |    20 | SMA                        | SUNNY BOY 2800
 HIP-210 NKHE1  |            2940 |      22 |           0 |    20 | SMA                        | SUNNY BOY 3000
 HIP-210 NKHE1  |            2940 |      17 |          20 |    20 | SPUTNIK                    | SOLARMAX SM3000S
 HIP-210 NKHE1  |            1260 |       8 |          30 |    20 | SMA                        | SUNNY BOY 1100
 HIP-210 NKHE1  |            2940 |      18 |         -30 |    35 | SPUTNIK                    | SOLARMAX SM3000S
 HIP-210 NKHE1  |            2940 |      18 |          20 |    20 | SPUTNIK                    | SOLARMAX SM3000S
 HIP-210 NKHE1  |            2940 |      18 |          10 |    30 | SPUTNIK                    | SOLARMAX SM3000S
 HIP-210 NKHE1  |            2940 |      18 |           5 |    35 | SPUTNIK                    | SOLARMAX S
 HIP-210 NKHE1  |            2940 |      18 |         -35 |    20 | SPUTNIK                    | SOLARMAX SM3000S
 HIP-210 NKHE1  |            2940 |      18 |         -35 |    20 | SPUTNIK                    | SOLARMAX 3000S
 HIP-210 NKHE1  |            2940 |      18 |         -70 |    20 | SMA                        | SUNNY BOY 2800
 HIP-210 NKHE1  |            2520 |      16 |           0 |    25 | SUNWAYS                    | NT 2600
 HIP-210 NKHE1  |            2520 |      15 |          30 |    20 | SPUTNIK                    | SOLARMAX SM3000S
 HIP-210 NKHE1  |            2100 |      13 |           0 |    35 | SPUTNIK                    | SOLARMAX 10
 HIP-210 NKHE1  |            2940 |      18 |          60 |    20 | SMA                        | SUNNY BOY 2800
 HIP-210 NKHE1  |            2520 |      15 |          40 |    20 | SMA                        | SUNNY BOY 3000
 HIP-210 NKHE1  |            2940 |      18 |          45 |    20 | MASTERVOLT                 | SUNMASTER QS 3500
 HIP-210 NKHE1  |            2940 |      18 |         -40 |    45 | SPUTNIK                    | SOLARMAX SM3000S
 HIP-210 NKHE1  |            2940 |      18 |          40 |    35 | SMA                        | SUNNY BOY 2800
 HIP-210 NKHE1  |            2940 |      18 |           0 |    15 | SMA                        | SUNNY BOY 2800
 HIP-210 NKHE1  |            2940 |      18 |           5 |    45 | MASTERVOLT                 | SUNMASTER XS4300
 HIP-210 NKHE1  |            2940 |      20 |         -45 |    35 | SMA                        | SUNNY BOY 3300 TL
 HIP-210 NKHE1  |            2940 |      18 |          40 |    35 | SOLARMAX                   | CHOISIR LA MARQUE SPUTNIK
 HIP-210 NKHE1  |            2100 |      13 |          55 |    45 | SPUTNIK                    | SOLARMAX 2000C
 HIP-210 NKHE1  |            2520 |      16 |          15 |    45 | SMA                        | SUNNY BOY 2100TL
 HIP-210 NKHE1  |            2100 |      13 |          30 |    20 | SPUTNIK                    | SOLARMAX 2000S
 HIP-210 NKHE1  |            2940 |      18 |           0 |    15 | SPUTNIK                    | SOLARMAX SM3000S
 HIP-210 NKHE1  |            2940 |      18 |           0 |    25 | SMA                        | SUNNY BOY 2500
 HIP-210 NKHE1  |            2940 |      18 |           0 |    20 | SPUTNIK                    | SOLARMAX SM3000S
 HIP-210 NKHE1  |            2940 |      17 |           0 |    40 | SPUTNIK                    | SOLARMAX 10
 HIP-210 NKHE1  |            5460 |      42 |           0 |    40 | SMA                        | SUNNY BOY 5000 TL
 HIP-210 NKHE1  |            2940 |      18 |           0 |    30 | SMA                        | SUNNY BOY 3300 TL
 HIP-210 NKHE1  |            2940 |      18 |         -10 |    20 | SMA                        | SUNNY BOY 3300
 HIP-210 NKHE1  |            2940 |      18 |         -15 |    25 | MASTERVOLT                 | SUNMASTER XS4300
 HIP-210 NKHE1  |            2520 |      16 |           5 |    30 | SPUTNIK                    | SOLARMAX SM3000S
 HIP-210 NKHE1  |            2940 |      18 |         -20 |    15 | SMA                        | SUNNY BOY 2800
 HIP-210 NKHE1  |            3150 |      20 |         -45 |    15 | SMA                        | SUNNY BOY 2100TL
 HIP-210 NKHE1  |            2940 |      18 |         -45 |    20 | SMA                        | SUNNY BOY 2800
 HIP-210 NKHE1  |            2940 |      20 |         -65 |    30 | SPUTNIK                    | SOLARMAX 3000S
 HIP-210 NKHE1  |            2940 |      18 |          10 |    20 | SMA                        | SUNNY BOY 3000
 HIP-210 NKHE1  |            2520 |      15 |         -60 |    20 | FRONIUS                    | IG 20
 HIP-210 NKHE1  |            2520 |      15 |         -55 |    20 | FRONIUS                    | IG 20
 HIP-210 NKHE1  |            2940 |      18 |         -20 |    15 | SMA                        | SUNNY BOY 3300
 HIP-210 NKHE1  |            2940 |      21 |         -20 |    30 | SMA                        | SUNNY BOY 2800
 HIP-210 NKHE1  |            2940 |      18 |           0 |    30 | SPUTNIK                    | SOLARMAX SM3000S
 HIP-210 NKHE1  |            2940 |      18 |         -40 |    40 | SOLARMAX                   | CHOISIR LA MARQUE SPUTNIK
 HIP-210 NKHE1  |            2100 |      17 |           0 |    30 | SPUTNIK                    | SOLARMAX 2000S
 HIP-210 NKHE1  |            2940 |      17 |          45 |    20 | SPUTNIK                    | SOLARMAX 3000S
 HIP-210 NKHE1  |            2940 |      20 |         -40 |    15 | SMA                        | SUNNY BOY 2800
 HIP-210 NKHE1  |            2940 |      18 |          35 |    45 | SOLARMAX                   | CHOISIR LA MARQUE SPUTNIK
 HIP-210 NKHE1  |            2940 |      18 |          35 |    45 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2100 |      13 |           5 |    35 | SOLARMAX                   | CHOISIR LA MARQUE SPUTNIK
 HIP-210 NKHE1  |            2940 |      18 |          20 |    20 | SMA                        | SUNNY BOY 3300
 HIP-210 NKHE1  |            2940 |      18 |          15 |    45 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      17 |          60 |    45 | SOLARMAX                   | CHOISIR LA MARQUE SPUTNIK
 HIP-210 NKHE1  |            2940 |      18 |          25 |    20 | SMA                        | SUNNY BOY 2800
 HIP-210 NKHE1  |            2940 |      18 |         -80 |    20 | SMA                        | SUNNY BOY 3000
 HIP-210 NKHE1  |            2730 |      16 |          30 |    40 | MASTERVOLT                 | SUNMASTER QS 3500
 HIP-210 NKHE1  |            2940 |      18 |          25 |    15 | SMA                        | SUNNY BOY 3300 TL
 HIP-210 NKHE1  |            2940 |      18 |          40 |    20 | SMA                        | SUNNY BOY 3000
 HIP-210 NKHE1  |            2940 |      19 |         -25 |    20 | SMA                        | SUNNY BOY 3300 TL
 HIP-210 NKHE1  |            2940 |      17 |          45 |    15 | SPUTNIK                    | SOLARMAX SM3000S
 HIP-210 NKHE1  |            2940 |      18 |         -90 |    15 | SPUTNIK                    | SOLARMAX 2000S
 HIP-210 NKHE1  |            2940 |      18 |          45 |    45 | SPUTNIK                    | SOLARMAX SM3000S
 HIP-210 NKHE1  |            2940 |      17 |          40 |    20 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |         -90 |    20 | SMA                        | SUNNY BOY 3000
 HIP-210 NKHE1  |            2940 |      20 |         -40 |    25 | SPUTNIK                    | SOLARMAX SM3000S
 HIP-210 NKHE1  |            2940 |      18 |          40 |    20 | SPUTNIK                    | SOLARMAX 3000S
 HIP-210 NKHE1  |            2940 |      20 |          20 |    20 | SPUTNIK                    | SOLARMAX 3000S
 HIP-210 NKHE1  |            2940 |      18 |         -20 |    20 | MASTERVOLT                 | SUNMASTER QS 3500
 HIP-210 NKHE1  |            2940 |      18 |         -20 |    45 | SPUTNIK                    | SOLARMAX SM3000S
 HIP-210 NKHE1  |            2940 |      18 |         110 |    20 | SMA                        | SUNNY BOY 3300 TL
 HIP-210 NKHE1  |            2940 |      18 |          30 |    15 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |          20 |    15 | POWER-ONE                  | AURORA PVI-3.0
 HIP-210 NKHE1  |            2940 |      18 |         -35 |    35 | KOSTAL                     | PIKO 3.0
 HIP-210 NKHE1  |            2940 |      18 |         -30 |    25 | FRONIUS                    | IG 15
 HIP-210 NKHE1  |            2940 |      18 |          15 |    20 | SPUTNIK                    | SOLARMAX 3000S
 HIP-210 NKHE1  |            2940 |      18 |           5 |    15 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |           0 |    40 | FRONIUS                    | IG 30
 HIP-210 NKHE1  |            2940 |      18 |          10 |    45 | SMA                        | SUNNY BOY 3000
 HIP-210 NKHE1  |            2940 |      18 |           0 |    20 | SOLUTRONIC                 | SOLPLUS 35
 HIP-210 NKHE1  |            2940 |      18 |         160 |    30 | PAS_DANS_LA_LISTE_ONDULEUR | PAS_DANS_LA_LISTE_ONDULEUR
 HIP-210 NKHE1  |            2940 |      18 |         -40 |    30 | SPUTNIK                    | SOLARMAX 3000S
 HIP-210 NKHE1  |            2940 |      18 |         -10 |    20 | SUNWAYS                    | AT 2700
 HIP-210 NKHE1  |            2940 |      18 |           0 |    20 | SMA                        | SUNNY BOY 3300 TL
 HIP-210 NKHE1  |            2940 |      22 |          -5 |    30 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      17 |         -90 |    20 | SPUTNIK                    | SOLARMAX 3000S
 HIP-210 NKHE1  |            2940 |      18 |          45 |    15 | POWER-ONE                  | AURORA PVI-3.0
 HIP-210 NKHE1  |            2940 |      18 |           0 |    15 | PAS_DANS_LA_LISTE_ONDULEUR | PAS_DANS_LA_LISTE_ONDULEUR
 HIP-210 NKHE1  |            2520 |      20 |         -45 |    30 | POWER-ONE                  | AURORA PVI-3.0
 HIP-210 NKHE1  |            2940 |      35 |           0 |    35 | SMA                        | PV-WR 1500
 HIP-210 NKHE1  |            2940 |      19 |          25 |    20 | INGETEAM                   | INGECON SUN LITE  3TL
 HIP-210 NKHE1  |            2940 |      18 |         -15 |    15 | SMA                        | PV-WR 1500
 HIP-210 NKHE1  |            2940 |      18 |          45 |    20 | INGETEAM                   | INGECON SUN LITE  3TL
 HIP-210 NKHE1  |            2100 |      12 |          45 |    45 | SPUTNIK                    | SOLARMAX 2000S
 HIP-210 NKHE1  |            2940 |      19 |         -85 |    20 | AXUN                       | (VOIR MARQUE DIEHL)
 HIP-210 NKHE1  |            2520 |      10 |          50 |    15 | SCHNEIDER ELECTRIC         | SUNEZY 2800
 HIP-210 NKHE1  |            2940 |      18 |          45 |    15 | FRONIUS                    | IG 30
 HIP-210 NKHE1  |            2940 |      24 |          70 |    15 | FRONIUS                    | IG 30
 HIP-210 NKHE1  |            2100 |      18 |        -170 |    35 | SMA                        | SUNNY BOY 2100TL
 HIP-210 NKHE1  |            2940 |      18 |          30 |    30 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |           0 |    20 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2520 |      15 |         -60 |    25 | SPUTNIK                    | SOLARMAX 3000C
 HIP-210 NKHE1  |            2940 |      19 |          15 |    35 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      16 |           0 |    15 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |           25200 |     150 |         -45 |    15 | SMA                        | PV-WR 1500
 HIP-210 NKHE1  |            2940 |      20 |         -40 |    20 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      16 |          30 |    35 | SMA                        | SUNNY BOY 3300
 HIP-210 NKHE1  |            2940 |      18 |          10 |    35 | SMA                        | SUNNY BOY 3000
 HIP-210 NKHE1  |            2940 |      18 |         -30 |    40 | SOLARMAX                   | CHOISIR LA MARQUE SPUTNIK
 HIP-210 NKHE1  |            2940 |      18 |         -30 |    30 | SPUTNIK                    | SOLARMAX SM3000S
 HIP-210 NKHE1  |            2940 |      18 |         -10 |    30 | SMA                        | SUNNY BOY 2800
 HIP-210 NKHE1  |            2940 |      18 |         -10 |    25 | SMA                        | SUNNY BOY 3300 TL
 HIP-210 NKHE1  |            2940 |      18 |         -75 |    30 | SMA                        | SUNNY BOY 3300
 HIP-210 NKHE1  |            2940 |      18 |          10 |    20 | SMA                        | SUNNY BOY 3300
 HIP-210 NKHE1  |            2940 |      17 |           0 |    20 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      20 |          50 |    20 | SMA                        | SUNNY BOY 3300
 HIP-210 NKHE1  |            2940 |      18 |         -90 |    15 | DIEHL AKO                  | PLATINUM 3100S
 HIP-210 NKHE1  |            2940 |      18 |         -40 |    20 | POWER-ONE                  | AURORA PVI-3.0
 HIP-210 NKHE1  |            2520 |      15 |          40 |    45 | SPUTNIK                    | SOLARMAX SM3000S
 HIP-210 NKHE1  |            2940 |      18 |          -5 |    45 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |           5 |    35 | SPUTNIK                    | SOLARMAX SM3000S
 HIP-210 NKHE1  |            2940 |      17 |         -60 |    20 | MASTERVOLT                 | SUNMASTER QS 3500
 HIP-210 NKHE1  |            2940 |      18 |          -5 |    20 | SMA                        | SUNNY BOY 3000
 HIP-210 NKHE1  |            2940 |      18 |           0 |    20 | MASTERVOLT                 | SUNMASTER XS3200
 HIP-210 NKHE1  |            2940 |      21 |           0 |    40 | SPUTNIK                    | SOLARMAX SM3000S
 HIP-210 NKHE1  |            2940 |      18 |         -40 |    20 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |         -80 |    45 | SPUTNIK                    | SOLARMAX SM3000S
 HIP-210 NKHE1  |            2940 |      17 |         -45 |    45 | SPUTNIK                    | SOLARMAX 3000C
 HIP-210 NKHE1  |            2520 |      14 |           0 |    30 | MASTERVOLT                 | SUNMASTER XS3200
 HIP-210 NKHE1  |            2940 |      19 |          55 |    45 | SMA                        | SUNNY BOY 3000
 HIP-210 NKHE1  |            2940 |      18 |         -20 |    25 | SMA                        | SUNNY BOY 3000
 HIP-210 NKHE1  |            2520 |      18 |          70 |    30 | KACO                       | POWADOR 2500 XI
 HIP-210 NKHE1  |            2940 |      18 |         -15 |    20 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |           5 |    20 | SPUTNIK                    | SOLARMAX SM3000S
 HIP-210 NKHE1  |            2940 |      18 |          40 |    35 | SPUTNIK                    | SOLARMAX SM3000S
 HIP-210 NKHE1  |            2940 |      18 |         -10 |    40 | SPUTNIK                    | SOLARMAX SM3000S
 HIP-210 NKHE1  |            2940 |      18 |         -50 |    45 | SPUTNIK                    | SOLARMAX SM3000S
 HIP-210 NKHE1  |            2940 |      18 |          10 |    20 | SMA                        | SUNNY BOY 2800
 HIP-210 NKHE1  |            2940 |      19 |          40 |    45 | SMA                        | SUNNY BOY 3000
 HIP-210 NKHE1  |            2940 |      18 |         -10 |    20 | SMA                        | SUNNY BOY 3000
 HIP-210 NKHE1  |            2940 |      18 |          -5 |    30 | SPUTNIK                    | SOLARMAX SM3000S
 HIP-210 NKHE1  |            2940 |      19 |          55 |    40 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |           5 |    45 | SOLARMAX                   | CHOISIR LA MARQUE SPUTNIK
 HIP-210 NKHE1  |            2940 |      18 |         -10 |    20 | SMA                        | SUNNY BOY 2800
 HIP-210 NKHE1  |            2940 |      18 |          25 |    20 | SPUTNIK                    | SOLARMAX SM3000S
 HIP-210 NKHE1  |            2940 |      18 |           0 |    15 | SMA                        | SUNNY BOY 3300
 HIP-210 NKHE1  |            2940 |      19 |          30 |    20 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            1890 |      12 |           0 |    20 | SMA                        | SUNNY BOY 2100TL
 HIP-210 NKHE1  |            2940 |      18 |         -40 |    40 | SOLARMAX                   | CHOISIR LA MARQUE SPUTNIK
 HIP-210 NKHE1  |            2940 |      17 |          85 |    30 | SPUTNIK                    | SOLARMAX 3000S
 HIP-210 NKHE1  |            2940 |      18 |          -5 |    15 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |           0 |    35 | SMA                        | SUNNY BOY 3000
 HIP-210 NKHE1  |            2940 |      18 |          60 |    35 | SPUTNIK                    | SOLARMAX 3000S
 HIP-210 NKHE1  |            2520 |      15 |           5 |    30 | MASTERVOLT                 | SUNMASTER XS3200
 HIP-210 NKHE1  |            2940 |      17 |           0 |    20 | SOLARMAX                   | CHOISIR LA MARQUE SPUTNIK
 HIP-210 NKHE1  |            2940 |      17 |           0 |    20 | SOLARMAX                   | CHOISIR LA MARQUE SPUTNIK
 HIP-210 NKHE1  |            2940 |      18 |          90 |    30 | SPUTNIK                    | SOLARMAX SM3000S
 HIP-210 NKHE1  |            2940 |      18 |         -20 |    45 | SPUTNIK                    | SOLARMAX SM3000S
 HIP-210 NKHE1  |            2940 |      18 |         -20 |    20 | SMA                        | SUNNY BOY 2500
 HIP-210 NKHE1  |            2940 |      18 |          10 |    45 | FRONIUS                    | IG 30
 HIP-210 NKHE1  |            2940 |      20 |          10 |    25 | SMA                        | SUNNY BOY 3000
 HIP-210 NKHE1  |            2520 |      15 |           0 |    15 | MASTERVOLT                 | SUNMASTER XS3200
 HIP-210 NKHE1  |            2940 |      17 |         -20 |    20 | SOLARWORLD                 | SPI 3000 HV INDOOR
 HIP-210 NKHE1  |            2940 |      18 |          -5 |    10 | KACO                       | POWADOR 2500 XI
 HIP-210 NKHE1  |            2940 |      18 |          30 |    15 | SMA                        | SUNNY BOY 2500
 HIP-210 NKHE1  |            2940 |      20 |           0 |    20 | FRONIUS                    | IG 30
 HIP-210 NKHE1  |            2100 |      12 |          45 |    20 | SPUTNIK                    | SOLARMAX 2000S
 HIP-210 NKHE1  |            2100 |      12 |         -45 |    20 | SOLARMAX                   | CHOISIR LA MARQUE SPUTNIK
 HIP-210 NKHE1  |            2100 |      13 |          70 |    20 | SPUTNIK                    | SOLARMAX 2000S
 HIP-210 NKHE1  |            2940 |      18 |         -90 |    20 | SMA                        | SUNNY BOY 3000
 HIP-210 NKHE1  |            2940 |      21 |          10 |    20 | SMA                        | SUNNY BOY 3300 TL
 HIP-210 NKHE1  |            2520 |      15 |          -5 |    45 | SPUTNIK                    | SOLARMAX SM3000S
 HIP-210 NKHE1  |            2940 |      18 |         -15 |    40 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |           0 |    20 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |         -45 |    20 | MASTERVOLT                 | SUNMASTER XS2000
 HIP-210 NKHE1  |            2940 |      18 |           0 |    35 | SPUTNIK                    | SOLARMAX SM3000S
 HIP-210 NKHE1  |            2940 |      18 |          10 |    40 | MASTERVOLT                 | SUNMASTER QS 3500
 HIP-210 NKHE1  |            2940 |      18 |         -90 |    30 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      19 |          20 |    45 | SPUTNIK                    | SOLARMAX 2000C
 HIP-210 NKHE1  |            2940 |      18 |          -5 |    35 | FRONIUS                    | IG 30
 HIP-210 NKHE1  |            2940 |      16 |          60 |    20 | SMA                        | SUNNY BOY 3300 TL
 HIP-210 NKHE1  |           10080 |      61 |           0 |    20 | SMA                        | SUNNY BOY 3000
 HIP-210 NKHE1  |            2940 |      14 |           0 |    10 | SMA                        | SUNNY BOY 2800
 HIP-210 NKHE1  |            2940 |      18 |          60 |    15 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |           0 |    25 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |          50 |    15 | SPUTNIK                    | SOLARMAX SM3000S
 HIP-210 NKHE1  |            2940 |      20 |          25 |    40 | SOLARMAX                   | CHOISIR LA MARQUE SPUTNIK
 HIP-210 NKHE1  |            2940 |      18 |         -30 |    20 | SPUTNIK                    | SOLARMAX SM3000S
 HIP-210 NKHE1  |            2940 |      18 |          25 |    45 | SOLARMAX                   | CHOISIR LA MARQUE SPUTNIK
 HIP-210 NKHE1  |            2940 |      18 |           0 |    20 | SPUTNIK                    | SOLARMAX 3000S
 HIP-210 NKHE1  |            2940 |      18 |          10 |    45 | SMA                        | SUNNY BOY 3000
 HIP-210 NKHE1  |            2940 |      18 |         -10 |    15 | SMA                        | SUNNY BOY 3300
 HIP-210 NKHE1  |            2940 |      18 |         -30 |    30 | SMA                        | SUNNY BOY 2800
 HIP-210 NKHE1  |            2940 |      18 |           0 |    20 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |         -45 |    40 | SMA                        | SUNNY BOY 1700
 HIP-210 NKHE1  |            2940 |      18 |          20 |    20 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |         -40 |    35 | SPUTNIK                    | SOLARMAX SM3000S
 HIP-210 NKHE1  |            2940 |      18 |         -30 |    20 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      19 |         -40 |    15 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |           5 |    20 | SMA                        | SUNNY BOY 2800
 HIP-210 NKHE1  |            2940 |      18 |          -5 |    20 | FRONIUS                    | IG 30
 HIP-210 NKHE1  |            2940 |      18 |          40 |    50 | SMA                        | SUNNY BOY 2800
 HIP-210 NKHE1  |            2940 |      18 |         -20 |    20 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |         -10 |    30 | MASTERVOLT                 | SUNMASTER XS4300
 HIP-210 NKHE1  |            2940 |      18 |          40 |    20 | SMA                        | SUNNY BOY 3000
 HIP-210 NKHE1  |            2520 |      15 |          90 |    35 | SOLARMAX                   | CHOISIR LA MARQUE SPUTNIK
 HIP-210 NKHE1  |            2940 |      18 |         -55 |    20 | SMA                        | SUNNY BOY 3000
 HIP-210 NKHE1  |            2940 |      18 |           0 |    45 | SPUTNIK                    | SOLARMAX 3000S
 HIP-210 NKHE1  |            2940 |      18 |         -60 |    20 | SPUTNIK                    | SOLARMAX SM3000S
 HIP-210 NKHE1  |            1470 |       9 |           0 |    15 | SMA                        | SUNNY BOY 1700
 HIP-210 NKHE1  |            2940 |      18 |          25 |    45 | SPUTNIK                    | SOLARMAX SM3000S
 HIP-210 NKHE1  |            2940 |      19 |          15 |    45 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      24 |         -25 |    15 | MASTERVOLT                 | SUNMASTER XS3200
 HIP-210 NKHE1  |            2940 |      19 |         -30 |    50 | SOLARMAX                   | CHOISIR LA MARQUE SPUTNIK
 HIP-210 NKHE1  |            2940 |      17 |           0 |    35 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |           0 |    15 | SMA                        | SUNNY BOY 3000
 HIP-210 NKHE1  |            2940 |      18 |           0 |    30 | SMA                        | SUNNY BOY 3000
 HIP-210 NKHE1  |            2940 |      18 |         -10 |    25 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |          30 |    20 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            1680 |      10 |          20 |    20 | SMA                        | SUNNY BOY 2100TL
 HIP-210 NKHE1  |            2940 |      18 |          10 |    30 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |           0 |    45 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |         -10 |    20 | MASTERVOLT                 | SUNMASTER XS3200
 HIP-210 NKHE1  |            2940 |      18 |          -5 |    50 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      19 |          20 |    20 | SMA                        | SUNNY BOY 3000
 HIP-210 NKHE1  |            2940 |      18 |           0 |    15 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      17 |          40 |    10 | SPUTNIK                    | SOLARMAX SM3000S
 HIP-210 NKHE1  |            2940 |      18 |          30 |    45 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2520 |      15 |          45 |    15 | SMA                        | SUNNY BOY 2100TL
 HIP-210 NKHE1  |            2940 |      18 |         -40 |    45 | SPUTNIK                    | SOLARMAX 3000S
 HIP-210 NKHE1  |            2940 |      20 |          15 |    35 | SMA                        | SUNNY BOY 3000
 HIP-210 NKHE1  |            2940 |      18 |          40 |    20 | SMA                        | SUNNY BOY 3000
 HIP-210 NKHE1  |            2940 |      18 |          40 |    45 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |         -10 |    25 | SMA                        | SUNNY BOY 3000
 HIP-210 NKHE1  |            2100 |      13 |         -40 |    45 | SPUTNIK                    | SOLARMAX 2000S
 HIP-210 NKHE1  |            2940 |      18 |          45 |    20 | SMA                        | SUNNY BOY 2.5
 HIP-210 NKHE1  |            2940 |      17 |         -85 |    25 | DIEHL AKO                  | PLATINUM 3100S
 HIP-210 NKHE1  |            2940 |      19 |         -60 |    20 | SMA                        | SUNNY BOY 3300
 HIP-210 NKHE1  |            2940 |      21 |           0 |    30 | SMA                        | SUNNY BOY 3300 TL
 HIP-210 NKHE1  |            2940 |      18 |           0 |    20 | SMA                        | SUNNY BOY 3000
 HIP-210 NKHE1  |            2940 |      18 |          65 |    20 | SPUTNIK                    | SOLARMAX SM3000S
 HIP-210 NKHE1  |            2940 |      18 |         -40 |    20 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      21 |           0 |    20 | SMA                        | SUNNY BOY 3000
 HIP-210 NKHE1  |            2940 |      18 |          20 |    30 | SPUTNIK                    | SOLARMAX SM3000S
 HIP-210 NKHE1  |            2940 |      18 |          20 |    45 | SPUTNIK                    | SOLARMAX SM3000S
 HIP-210 NKHE1  |            2940 |      19 |           0 |    20 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |           0 |    20 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |           0 |    50 | SMA                        | SUNNY BOY 3000
 HIP-210 NKHE1  |            2940 |      18 |          10 |    15 | FRONIUS                    | IG 30
 HIP-210 NKHE1  |            2940 |      18 |          20 |    35 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2520 |      15 |          10 |    15 | SPUTNIK                    | SOLARMAX SM3000S
 HIP-210 NKHE1  |            2940 |      19 |         -15 |    30 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      19 |           0 |    30 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |          10 |    45 | SUNWAYS                    | NT 2600
 HIP-210 NKHE1  |            2940 |      18 |           0 |    15 | SMA                        | SUNNY BOY 3000
 HIP-210 NKHE1  |            2940 |      18 |         -70 |    20 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      22 |          15 |    20 | FRONIUS                    | IG 30
 HIP-210 NKHE1  |            2940 |      19 |          20 |    45 | SPUTNIK                    | SOLARMAX SM3000S
 HIP-210 NKHE1  |            2940 |      18 |          30 |    30 | SPUTNIK                    | SOLARMAX SM3000S
 HIP-210 NKHE1  |            2940 |      17 |          60 |    25 | SPUTNIK                    | SOLARMAX 3000S
 HIP-210 NKHE1  |            2940 |      18 |           5 |    45 | SPUTNIK                    | SOLARMAX SM3000S
 HIP-210 NKHE1  |            2940 |      18 |         -20 |    30 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |         -10 |    20 | SMA                        | SUNNY BOY 3000
 HIP-210 NKHE1  |            2940 |      19 |         -40 |    20 | SMA                        | SUNNY BOY 3000
 HIP-210 NKHE1  |            2940 |      20 |          40 |    20 | SPUTNIK                    | SOLARMAX 10
 HIP-210 NKHE1  |            2940 |      18 |          60 |    20 | SMA                        | SUNNY BOY 3300
 HIP-210 NKHE1  |            2940 |      18 |         -35 |    20 | SMA                        | SUNNY BOY 3000
 HIP-210 NKHE1  |            2940 |      18 |           5 |    45 | SMA                        | SUNNY BOY 3000
 HIP-210 NKHE1  |            2940 |      18 |         -45 |    20 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |          -5 |    45 | SMA                        | SUNNY BOY 3000
 HIP-210 NKHE1  |            2940 |      20 |           5 |    45 | SMA                        | SUNNY BOY 3000
 HIP-210 NKHE1  |            2940 |      20 |           0 |    15 | SMA                        | SUNNY BOY 3300 TL
 HIP-210 NKHE1  |            2940 |      18 |          40 |    35 | SMA                        | SUNNY BOY 3000
 HIP-210 NKHE1  |            2940 |      20 |          70 |    20 | SMA                        | SUNNY BOY 3000
 HIP-210 NKHE1  |            2940 |      18 |           0 |    15 | SMA                        | SUNNY BOY 3300 TL
 HIP-210 NKHE1  |            2940 |      21 |         -20 |    20 | SPUTNIK                    | SOLARMAX 3000S
 HIP-210 NKHE1  |            2940 |      18 |          15 |    30 | FRONIUS                    | IG 30
 HIP-210 NKHE1  |            2100 |      13 |         -35 |    35 | SMA                        | SUNNY BOY 2100TL
 HIP-210 NKHE1  |            2940 |      18 |         -15 |    20 | SPUTNIK                    | SOLARMAX 3000S
 HIP-210 NKHE1  |            2940 |      18 |         -30 |    35 | SMA                        | SUNNY BOY 3000
 HIP-210 NKHE1  |            2940 |      18 |           5 |    15 | SMA                        | SUNNY BOY 3000
 HIP-210 NKHE1  |            2940 |      18 |         -30 |    45 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      17 |         -90 |    35 | SPUTNIK                    | SOLARMAX 3000S
 HIP-210 NKHE1  |            2940 |      18 |         -10 |    45 | SPUTNIK                    | SOLARMAX 3000S
 HIP-210 NKHE1  |            2940 |      20 |           0 |    30 | SMA                        | SUNNY BOY 3000
 HIP-210 NKHE1  |            2940 |      17 |          85 |    30 | SPUTNIK                    | SOLARMAX 3000S
 HIP-210 NKHE1  |            2940 |      18 |          80 |    35 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2520 |      15 |          10 |    20 | SPUTNIK                    | SOLARMAX 3000S
 HIP-210 NKHE1  |            2940 |      18 |          45 |    20 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2100 |      12 |          10 |    30 | SMA                        | SUNNY BOY 2100TL
 HIP-210 NKHE1  |            2940 |      18 |          20 |    45 | SPUTNIK                    | SOLARMAX 3000S
 HIP-210 NKHE1  |            2940 |      18 |         -75 |    20 | MASTERVOLT                 | SUNMASTER XS3200
 HIP-210 NKHE1  |            2940 |      18 |          20 |    20 | SMA                        | SUNNY BOY 3000
 HIP-210 NKHE1  |            2940 |      18 |          60 |    20 | SMA                        | SUNNY BOY 3000
 HIP-210 NKHE1  |            2940 |      19 |         -70 |    20 | MASTERVOLT                 | SUNMASTER XS3200
 HIP-210 NKHE1  |            2940 |      20 |         -20 |    25 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2520 |      15 |          20 |    30 | FRONIUS                    | IG 15
 HIP-210 NKHE1  |            2940 |      18 |         -40 |    20 | SPUTNIK                    | SOLARMAX 3000S
 HIP-210 NKHE1  |            2940 |      18 |         -15 |    30 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |           0 |    15 | SMA                        | SUNNY BOY 3300
 HIP-210 NKHE1  |            2100 |      13 |           0 |    45 | SPUTNIK                    | SOLARMAX 10
 HIP-210 NKHE1  |            2940 |      18 |           0 |    20 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      19 |         -30 |    30 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |          15 |    30 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      20 |           0 |    25 | SMA                        | SUNNY BOY 4200 TL
 HIP-210 NKHE1  |            2940 |      22 |         -10 |    35 | FRONIUS                    | IG 30
 HIP-210 NKHE1  |            2940 |      19 |          45 |    40 | SPUTNIK                    | SOLARMAX 3000S
 HIP-210 NKHE1  |            2940 |      18 |          90 |    45 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      17 |         -90 |    20 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |         -35 |    30 | KOSTAL                     | PIKO 3.0
 HIP-210 NKHE1  |            2940 |      18 |         -30 |    30 | SPUTNIK                    | SOLARMAX 3000C
 HIP-210 NKHE1  |            2940 |      21 |         -45 |    15 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |         175 |    10 | FRONIUS                    | IG 30
 HIP-210 NKHE1  |            2940 |      18 |         -30 |    20 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |           0 |    25 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |         -30 |    30 | SPUTNIK                    | SOLARMAX 3000S
 HIP-210 NKHE1  |            2940 |      18 |         -70 |    30 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |         -45 |    20 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |         -45 |    20 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2520 |      16 |           0 |    20 | SPUTNIK                    | SOLARMAX 3000S
 HIP-210 NKHE1  |            2100 |      13 |          45 |    20 | SMA                        | SUNNY BOY 2100TL
 HIP-210 NKHE1  |            2940 |      18 |          45 |    15 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |         -20 |    45 | MASTERVOLT                 | SUNMASTER QS 3500
 HIP-210 NKHE1  |            2940 |      18 |          10 |    20 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |          10 |    20 | SPUTNIK                    | SOLARMAX 3000S
 HIP-210 NKHE1  |            2940 |      18 |          25 |    15 | MASTERVOLT                 | SUNMASTER XS3200
 HIP-210 NKHE1  |            2940 |      18 |         -45 |    15 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |           5 |    25 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |           0 |    45 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2100 |      13 |          45 |    45 | SMA                        | SUNNY BOY 2500
 HIP-210 NKHE1  |            2940 |      18 |        -110 |    45 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |          60 |    20 | SPUTNIK                    | SOLARMAX 3000S
 HIP-210 NKHE1  |            2940 |      18 |           0 |    50 | SMA                        | SUNNY BOY 3300 TL
 HIP-210 NKHE1  |            2940 |      18 |         -75 |    20 | SMA                        | SUNNY BOY 2800I
 HIP-210 NKHE1  |            2940 |      18 |          80 |    20 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |         -25 |    35 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |        -140 |    40 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |         -10 |    25 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      19 |           0 |    45 | CONERGY                    | IPG3000
 HIP-210 NKHE1  |            2940 |      19 |          45 |    20 | CONERGY                    | IPG3000
 HIP-210 NKHE1  |            2940 |      18 |          30 |    45 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |           0 |    45 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2730 |      18 |         -30 |    40 | CONERGY                    | IPG3000
 HIP-210 NKHE1  |            2940 |      18 |         -30 |    40 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2520 |      15 |          10 |    20 | SPUTNIK                    | SOLARMAX 3000S
 HIP-210 NKHE1  |            2940 |      19 |          10 |    25 | FRONIUS                    | IG 30
 HIP-210 NKHE1  |            2940 |      19 |         -40 |    35 | SPUTNIK                    | SOLARMAX 3000S
 HIP-210 NKHE1  |            2940 |      18 |         -40 |    25 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |           15120 |      94 |         -30 |    20 | KACO                       | POWADOR 4000 XI
 HIP-210 NKHE1  |            2520 |      15 |          40 |    20 | SMA                        | SUNNY BOY 1100
 HIP-210 NKHE1  |            2940 |      18 |        -130 |    30 | SPUTNIK                    | SOLARMAX 3000S
 HIP-210 NKHE1  |            2940 |      18 |         -40 |    45 | SPUTNIK                    | SOLARMAX 3000S
 HIP-210 NKHE1  |            3780 |      22 |          -5 |    30 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2520 |      16 |           0 |    20 | FRONIUS                    | IG 30
 HIP-210 NKHE1  |            2940 |      18 |         -20 |    40 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |           5 |    25 | SMA                        | SUNNY BOY 3300
 HIP-210 NKHE1  |            2940 |      18 |          40 |    40 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |          20 |    15 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |         -20 |    20 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |         -20 |    20 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |         -20 |    20 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2520 |      20 |         -20 |    30 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      17 |         -40 |    20 | MASTERVOLT                 | SUNMASTER XS3200
 HIP-210 NKHE1  |            2940 |      19 |          20 |    45 | SPUTNIK                    | SOLARMAX 3000S
 HIP-210 NKHE1  |            2940 |      24 |          85 |    45 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |         -50 |    20 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |          30 |    20 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |          45 |    40 | SPUTNIK                    | SOLARMAX 3000S
 HIP-210 NKHE1  |            2940 |      18 |           0 |    15 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |          20 |    20 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      17 |          15 |    25 | SPUTNIK                    | SOLARMAX 3000S
 HIP-210 NKHE1  |            2940 |      18 |          80 |    40 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      19 |         -75 |    25 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |           0 |    45 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      19 |          20 |    30 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      17 |           5 |    30 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |         -20 |    30 | SPUTNIK                    | SOLARMAX 3000S
 HIP-210 NKHE1  |            2940 |      18 |          -5 |    30 | SMA                        | SUNNY BOY 2800I
 HIP-210 NKHE1  |            2940 |      18 |         -30 |    30 | SMA                        | SUNNY BOY 3000
 HIP-210 NKHE1  |            2100 |      13 |         -35 |    20 | SMA                        | SUNNY BOY 2100TL
 HIP-210 NKHE1  |            2520 |      15 |         -90 |    30 | SPUTNIK                    | SOLARMAX 3000S
 HIP-210 NKHE1  |            2940 |      18 |         -10 |    20 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      20 |           5 |    30 | SMA                        | SUNNY BOY 3000
 HIP-210 NKHE1  |            2940 |      18 |         -50 |    20 | KOSTAL                     | PIKO 4.2
 HIP-210 NKHE1  |            2940 |      18 |          85 |    20 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |           0 |    20 | FRONIUS                    | IG 30
 HIP-210 NKHE1  |            2940 |      18 |         -30 |    20 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |         -50 |    40 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |         -10 |    20 | SPUTNIK                    | SOLARMAX 3000S
 HIP-210 NKHE1  |            2940 |      18 |          10 |    40 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |          90 |    30 | KACO                       | POWADOR 2500 XI
 HIP-210 NKHE1  |            2940 |      18 |         -20 |    20 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |         -70 |    20 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |           0 |    20 | SMA                        | SUNNY BOY 1100 (
 HIP-210 NKHE1  |            2940 |      17 |         -10 |    15 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |           0 |    45 | MASTERVOLT                 | SUNMASTER XS4300
 HIP-210 NKHE1  |            2520 |      16 |         -15 |    15 | FRONIUS                    | IG 30
 HIP-210 NKHE1  |            2940 |      18 |         -25 |    15 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |          20 |    20 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2310 |      13 |          10 |    30 | SUNWAYS                    | NT 2600
 HIP-210 NKHE1  |            2940 |      18 |          10 |    35 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |         -15 |     5 | SMA                        | SUNNY BOY 3300 TL
 HIP-210 NKHE1  |            2940 |      18 |          45 |    25 | SMA                        | SUNNY BOY 2100TL
 HIP-210 NKHE1  |            2520 |      25 |           0 |    35 | SPUTNIK                    | SOLARMAX 3000S
 HIP-210 NKHE1  |            2940 |      18 |          40 |    20 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |         -65 |    20 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |          20 |    15 | FRONIUS                    | IG 30
 HIP-210 NKHE1  |            2940 |      18 |           0 |    35 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      20 |          20 |    35 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2520 |      15 |           0 |    45 | SMA                        | SUNNY BOY 3000
 HIP-210 NKHE1  |            2940 |      18 |          30 |    45 | SMA                        | SUNNY BOY 3300 TL
 HIP-210 NKHE1  |            2940 |      18 |         -30 |    15 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      17 |         -15 |    20 | SPUTNIK                    | SOLARMAX 3000S
 HIP-210 NKHE1  |            2100 |      13 |          45 |    40 | SMA                        | SUNNY BOY 2100TL
 HIP-210 NKHE1  |            2940 |      18 |           0 |    35 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |         -55 |    35 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |         -10 |    45 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |         -40 |    20 | MASTERVOLT                 | SUNMASTER QS 3500
 HIP-210 NKHE1  |            1890 |      11 |          15 |    15 | SPUTNIK                    | SOLARMAX 2000S
 HIP-210 NKHE1  |            2940 |      17 |         -20 |    20 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |          35 |    45 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |          10 |    35 | SPUTNIK                    | SOLARMAX 3000S
 HIP-210 NKHE1  |            2940 |      18 |          20 |    20 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      17 |          45 |    30 | SPUTNIK                    | SOLARMAX 3000S
 HIP-210 NKHE1  |            2940 |      20 |         -10 |    25 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |           0 |    30 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |         -30 |    20 | SMA                        | SUNNY BOY 3300 TL
 HIP-210 NKHE1  |            2520 |      16 |         -30 |    40 | FRONIUS                    | IG 20
 HIP-210 NKHE1  |            2940 |      19 |          30 |    15 | SPUTNIK                    | SOLARMAX 3000S
 HIP-210 NKHE1  |            2100 |      13 |         -85 |    30 | SMA                        | SUNNY BOY 2500
 HIP-210 NKHE1  |            2940 |      17 |          90 |    15 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |          15 |    20 | SMA                        | SUNNY BOY 3000
 HIP-210 NKHE1  |            5040 |      32 |           5 |    15 | SMA                        | SUNNY BOY 5000 TL
 HIP-210 NKHE1  |            2940 |      17 |          80 |    20 | SCHNEIDER ELECTRIC         | CONEXT RL 3000 E
 HIP-210 NKHE1  |            2940 |      18 |         -40 |    20 | SPUTNIK                    | SOLARMAX 3000S
 HIP-210 NKHE1  |            2940 |      19 |          40 |    45 | SPUTNIK                    | SOLARMAX 3000S
 HIP-210 NKHE1  |            2940 |      18 |          -5 |    25 | INGETEAM                   | INGECON SUN 3.3 TL
 HIP-210 NKHE1  |            2940 |      20 |           5 |    15 | FRONIUS                    | IG 15
 HIP-210 NKHE1  |            2940 |      18 |           0 |    15 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2730 |      22 |           0 |    25 | SMA                        | SUNNY BOY 3300 TL
 HIP-210 NKHE1  |            2940 |      18 |          15 |    20 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      14 |         -45 |    15 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2100 |      13 |           0 |    35 | SMA                        | SUNNY BOY 2100TL
 HIP-210 NKHE1  |            2940 |      18 |           0 |    35 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2520 |      16 |          60 |    45 | SPUTNIK                    | SOLARMAX 2000S
 HIP-210 NKHE1  |            2100 |      13 |          75 |    30 | SMA                        | SUNNY BOY 2500
 HIP-210 NKHE1  |            2940 |      18 |          -5 |    45 | SPUTNIK                    | SOLARMAX 3000S
 HIP-210 NKHE1  |            2940 |      18 |           0 |    45 | SPUTNIK                    | SOLARMAX 3000S
 HIP-210 NKHE1  |            2940 |      18 |         -10 |    20 | SPUTNIK                    | SOLARMAX 3000S
 HIP-210 NKHE1  |            2940 |      18 |          10 |    20 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      19 |           0 |    45 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      20 |         -30 |    20 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |         -20 |    30 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |          65 |    35 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |          25 |    15 | SMA                        | SUNNY BOY 3300
 HIP-210 NKHE1  |            2940 |      20 |          85 |    20 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |         -40 |    35 | FRONIUS                    | IG 30
 HIP-210 NKHE1  |            2940 |      18 |          20 |    30 | SPUTNIK                    | SOLARMAX 3000S
 HIP-210 NKHE1  |            2940 |      18 |           0 |    30 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      22 |           0 |    40 | SMA                        | SUNNY BOY 3000
 HIP-210 NKHE1  |            2940 |      18 |           5 |    20 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |          20 |    20 | FRONIUS                    | IG PLUS 35
 HIP-210 NKHE1  |            2940 |      19 |          -5 |    20 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2520 |      20 |           0 |    10 | SMA                        | SUNNY BOY 2500
 HIP-210 NKHE1  |            2940 |      18 |          -5 |    20 | FRONIUS                    | IG 30
 HIP-210 NKHE1  |            2940 |      22 |         -25 |    30 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |         -80 |    20 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |          35 |    20 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |          45 |    20 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |         -10 |    30 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |           5 |    45 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |         -20 |    20 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |          10 |    35 | SPUTNIK                    | SOLARMAX 3000S
 HIP-210 NKHE1  |            2940 |      18 |          15 |    35 | MASTERVOLT                 | SUNMASTER XS3200
 HIP-210 NKHE1  |            2940 |      18 |           0 |    45 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2520 |      16 |           5 |    15 | AXUN                       | (VOIR MARQUE DIEHL)
 HIP-210 NKHE1  |            2520 |      15 |         -45 |    20 | SPUTNIK                    | SOLARMAX 3000S
 HIP-210 NKHE1  |            2940 |      19 |           0 |    20 | SPUTNIK                    | SOLARMAX 3000S
 HIP-210 NKHE1  |            2520 |      15 |          35 |    30 | SPUTNIK                    | SOLARMAX 3000S
 HIP-210 NKHE1  |            2940 |      17 |          45 |    20 | SPUTNIK                    | SOLARMAX 3000S
 HIP-210 NKHE1  |            2940 |      18 |         -45 |    20 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      17 |         -70 |    20 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      19 |         -40 |    45 | SCHNEIDER ELECTRIC         | SUNEZY 3000
 HIP-210 NKHE1  |            2940 |      20 |          90 |    15 | SPUTNIK                    | SOLARMAX S
 HIP-210 NKHE1  |            2940 |      20 |          -5 |    35 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |           5 |    15 | SCHNEIDER ELECTRIC         | SUNEZY 2800
 HIP-210 NKHE1  |            2940 |      17 |         -35 |    35 | SPUTNIK                    | SOLARMAX 3000S
 HIP-210 NKHE1  |            2940 |      18 |          30 |    20 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |         -10 |    30 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |          10 |    40 | FRONIUS                    | IG 15
 HIP-210 NKHE1  |            2940 |      18 |           5 |    40 | MASTERVOLT                 | SUNMASTER XS 3200
 HIP-210 NKHE1  |            2940 |      18 |         -20 |    20 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |          85 |    50 | SPUTNIK                    | SOLARMAX 3000S
 HIP-210 NKHE1  |            2940 |      18 |         -90 |    15 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |           0 |    20 | SPUTNIK                    | SOLARMAX 10
 HIP-210 NKHE1  |            2940 |      18 |         -40 |    45 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      20 |         -15 |    20 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      17 |          10 |    30 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |          -5 |    20 | FRONIUS                    | IG 30
 HIP-210 NKHE1  |            2940 |      20 |           0 |    30 | AUNILEC                    | AUNI 3000
 HIP-210 NKHE1  |            2940 |      17 |           0 |    30 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2730 |      27 |          45 |    15 | FRONIUS                    | IG 15
 HIP-210 NKHE1  |            2940 |      20 |          55 |    20 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |           5 |    45 | SPUTNIK                    | SOLARMAX 3000S
 HIP-210 NKHE1  |            2520 |      17 |         -75 |    20 | SCHNEIDER ELECTRIC         | SUNEZY 2800
 HIP-210 NKHE1  |            2940 |      18 |          -5 |    15 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |           0 |    15 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |           5 |    15 | FRONIUS                    | IG 30
 HIP-210 NKHE1  |            2940 |      18 |          45 |    20 | SPUTNIK                    | SOLARMAX 3000S
 HIP-210 NKHE1  |            2940 |      18 |          65 |    45 | SPUTNIK                    | SOLARMAX 3000S
 HIP-210 NKHE1  |            2940 |      18 |         -45 |    35 | SPUTNIK                    | SOLARMAX 3000C
 HIP-210 NKHE1  |            2940 |      22 |          45 |    30 | SPUTNIK                    | SOLARMAX 3000S
 HIP-210 NKHE1  |            2940 |      18 |           0 |    25 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |         -70 |    35 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      19 |           5 |    15 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |           0 |    20 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |           0 |    15 | SMA                        | SUNNY BOY 2500
 HIP-210 NKHE1  |            2940 |      17 |          60 |    10 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |         -30 |    35 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      16 |           0 |    20 | SMA                        | SUNNY BOY 3000
 HIP-210 NKHE1  |            2940 |      18 |          15 |    20 | SMA                        | SUNNY BOY 3300 TL
 HIP-210 NKHE1  |            3360 |      21 |           0 |    20 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |          45 |    20 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |          20 |    20 | SPUTNIK                    | SOLARMAX 3000S
 HIP-210 NKHE1  |            2940 |      17 |           0 |    45 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |          35 |    35 | SPUTNIK                    | SOLARMAX 3000S
 HIP-210 NKHE1  |            2940 |      16 |          10 |    45 | POWER-ONE                  | AURORA PVI-3.0
 HIP-210 NKHE1  |            2100 |      13 |           0 |    30 | FRONIUS                    | IG 20
 HIP-210 NKHE1  |            2520 |      15 |           0 |    30 | FRONIUS                    | IG 30
 HIP-210 NKHE1  |            2940 |      18 |          30 |    20 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |         -10 |    30 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |         -15 |    25 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |         -30 |    45 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      17 |           0 |    30 | SPUTNIK                    | SOLARMAX 3000S
 HIP-210 NKHE1  |            2940 |      18 |           0 |    30 | SPUTNIK                    | SOLARMAX 3000S
 HIP-210 NKHE1  |            2940 |      17 |        -180 |    35 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |           0 |    45 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      18 |          30 |    30 | SPUTNIK                    | SOLARMAX 3000S
 HIP-210 NKHE1  |            2940 |      18 |         -30 |    25 | SMA                        | PV-WR 1500
 HIP-210 NKHE1  |            2940 |      20 |           0 |    25 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      17 |           0 |    30 | SPUTNIK                    | SOLARMAX 3000S
 HIP-210 NKHE1  |            2100 |      13 |         -45 |    30 | SPUTNIK                    | SOLARMAX 2000C
 HIP-210 NKHE1  |            2940 |      18 |         -30 |    30 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2940 |      20 |           0 |    20 | FRONIUS                    | IG 30
 HIP-210 NKHE1  |            2940 |      17 |          50 |    15 | SMA                        | SUNNY BOY 3000TL
 HIP-210 NKHE1  |            2100 |      15 |         -20 |    20 | SMA                        | SUNNY BOY 2100TL
 HIP-210 NKHE1  |            2520 |      25 |          -5 |    15 | HUAWEI                     | SUN2000-30KTL
 HIP-210 NKHE1  |            2940 |      18 |          20 |    20 | SMA                        | SUNNY BOY SB 3300TL HC
(551 rows)

