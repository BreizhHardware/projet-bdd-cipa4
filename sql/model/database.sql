-- ----------------------------------------------------------
-- Script Postgresql pour mcd
-- ----------------------------------------------------------


-- ----------------------------
-- Table: Marque
-- ----------------------------
CREATE TABLE Marque (
                        Id_marque uuid NOT NULL DEFAULT gen_random_uuid(),
                        marque VARCHAR(255) NOT NULL,
                        CONSTRAINT Marque_PK PRIMARY KEY (Id_marque)
);


-- ----------------------------
-- Table: Region
-- ----------------------------
CREATE TABLE Region (
                        region_code uuid NOT NULL DEFAULT gen_random_uuid(),
                        nom VARCHAR(255) NOT NULL,
                        pays VARCHAR(5) NOT NULL,
                        CONSTRAINT Region_PK PRIMARY KEY (region_code)
);


-- ----------------------------
-- Table: Installateur
-- ----------------------------
CREATE TABLE Installateur (
                              Id_installateur uuid NOT NULL DEFAULT gen_random_uuid(),
                              installateur TEXT NOT NULL,
                              est_valide BOOLEAN NOT NULL,
                              CONSTRAINT Installateur_PK PRIMARY KEY (Id_installateur)
);


-- ----------------------------
-- Table: Panneau
-- ----------------------------
CREATE TABLE Panneau (
                         Id_panneau uuid NOT NULL DEFAULT gen_random_uuid(),
                         modele VARCHAR(255),
                         Id_marque uuid NOT NULL,
                         CONSTRAINT Panneau_PK PRIMARY KEY (Id_panneau),
                         CONSTRAINT Panneau_Id_marque_FK FOREIGN KEY (Id_marque) REFERENCES Marque (Id_marque)
);


-- ----------------------------
-- Table: Onduleur
-- ----------------------------
CREATE TABLE Onduleur (
                          Id_onduleur uuid NOT NULL DEFAULT gen_random_uuid(),
                          modele VARCHAR(255),
                          Id_marque uuid NOT NULL,
                          CONSTRAINT Onduleur_PK PRIMARY KEY (Id_onduleur),
                          CONSTRAINT Onduleur_Id_marque_FK FOREIGN KEY (Id_marque) REFERENCES Marque (Id_marque)
);


-- ----------------------------
-- Table: Departement
-- ----------------------------
CREATE TABLE Departement (
                             departement_code uuid NOT NULL DEFAULT gen_random_uuid(),
                             nom VARCHAR(255) NOT NULL,
                             region_code uuid,
                             CONSTRAINT Departement_PK PRIMARY KEY (departement_code),
                             CONSTRAINT Departement_region_code_FK FOREIGN KEY (region_code) REFERENCES Region (region_code)
);


-- ----------------------------
-- Table: Localisation
-- ----------------------------
CREATE TABLE Localisation (
                              code_Insee CHAR(5) NOT NULL,
                              ville VARCHAR(255) NOT NULL,
                              code_postal CHAR(5) NOT NULL,
                              population INT NOT NULL,
                              departement_code uuid,
                              CONSTRAINT Localisation_PK PRIMARY KEY (code_Insee),
                              CONSTRAINT Localisation_departement_code_FK FOREIGN KEY (departement_code) REFERENCES Departement (departement_code)
);


-- ----------------------------
-- Table: Installation
-- ----------------------------
CREATE TABLE Installation (
                              Id_installation uuid NOT NULL DEFAULT gen_random_uuid(),
                              nb_panneaux INT NOT NULL,
                              nb_onduleurs INT NOT NULL,
                              date_installation DATE NOT NULL,
                              production INT NOT NULL,
                              puissance_crete INT NOT NULL,
                              orientation INT NOT NULL,
                              orientation_optimum INT NOT NULL,
                              pente INT NOT NULL,
                              pente_optimum INT NOT NULL,
                              surface INT NOT NULL,
                              latitude VARCHAR(6) NOT NULL,
                              longitude VARCHAR(6) NOT NULL,
                              code_Insee CHAR(5),
                              Id_installateur uuid,
                              Id_panneau uuid,
                              Id_onduleur uuid,
                              CONSTRAINT Installation_PK PRIMARY KEY (Id_installation),
                              CONSTRAINT Installation_code_Insee_FK FOREIGN KEY (code_Insee) REFERENCES Localisation (code_Insee),
                              CONSTRAINT Installation_Id_installateur_FK FOREIGN KEY (Id_installateur) REFERENCES Installateur (Id_installateur),
                              CONSTRAINT Installation_Id_panneau_FK FOREIGN KEY (Id_panneau) REFERENCES Panneau (Id_panneau),
                              CONSTRAINT Installation_Id_onduleur_FK FOREIGN KEY (Id_onduleur) REFERENCES Onduleur (Id_onduleur)
);
