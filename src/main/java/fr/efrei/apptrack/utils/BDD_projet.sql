-- PERSONNE(idPersonne, nom, prenom, email, telephone)
-- APPRENTI(anneeAcademique, majeure, programme, #idPersonne, #idEntreprise)
-- MAITREAPPRENTISSAGE(poste, remarques, #idPersonne, #idEntreprise)
-- VISITE(dateVisite, format, compteRenduExpress, #idPersonne)
-- ENTREPRISE(idEntreprise, raisonSocial, adresse, informations)
-- MISSION(idMission, motsCles, commentaires, metierCible, #idPersonne)
-- EVALUATION(idEvaluation, note, commentaires)
-- MEMOIRERAPPORT(themeSujet, #idEvaluation)
-- SOUTENANCE(dateSoutenance, #idEvaluation)
-- ESTEVALUE(#idEvaluation

DROP SCHEMA IF EXISTS ApprenTrackBDD;
CREATE SCHEMA ApprenTrackBDD;
USE ApprenTrackBDD;
DROP TABLE IF EXISTS VISITE;
DROP TABLE IF EXISTS PERSONNE;
DROP TABLE IF EXISTS APPRENTI;
DROP TABLE IF EXISTS MAITREAPPRENTISSAGE;
DROP TABLE IF EXISTS ENTREPRISE;
DROP TABLE IF EXISTS MISSION;
DROP TABLE IF EXISTS MEMOIRERAPPORT;
DROP TABLE IF EXISTS EVALUATION;
DROP TABLE IF EXISTS SOUTENANCE;
DROP TABLE IF EXISTS ESTEVALUE;


CREATE TABLE PERSONNE (
                          idPersonne INT AUTO_INCREMENT PRIMARY KEY,
                          nom VARCHAR(255) NOT NULL,
                          prenom VARCHAR(255) NOT NULL,
                          email VARCHAR(255),
                          telephone VARCHAR(15)
);

CREATE TABLE ENTREPRISE (
                            idEntreprise INT AUTO_INCREMENT PRIMARY KEY,
                            raisonSocial VARCHAR(255) NOT NULL,
                            adresse TEXT,
                            informations TEXT
);

CREATE TABLE APPRENTI (
                          anneeAcademique INT,
                          majeure VARCHAR(255),
                          programme VARCHAR(255),
                          idPersonne INT PRIMARY KEY,
                          idEntreprise INT,
                          FOREIGN KEY (idPersonne) REFERENCES PERSONNE(idPersonne),
                          FOREIGN KEY (idEntreprise) REFERENCES ENTREPRISE(idEntreprise)
);

CREATE TABLE MAITREAPPRENTISSAGE (
                                     poste VARCHAR(255),
                                     remarques TEXT,
                                     idPersonne INT,
                                     idEntreprise INT,
                                     FOREIGN KEY (idPersonne) REFERENCES PERSONNE(idPersonne),
                                     FOREIGN KEY (idEntreprise) REFERENCES ENTREPRISE(idEntreprise)
);

CREATE TABLE VISITE (
                        dateVisite DATE,
                        format VARCHAR(255),
                        compteRenduExpress TEXT,
                        idPersonne INT,
                        FOREIGN KEY (idPersonne) REFERENCES PERSONNE(idPersonne)
);



CREATE TABLE MISSION (
                         idMission INT AUTO_INCREMENT PRIMARY KEY,
                         motsCles TEXT,
                         commentaires TEXT,
                         metierCible VARCHAR(255),
                         idPersonne INT,
                         FOREIGN KEY (idPersonne) REFERENCES PERSONNE(idPersonne)
);

CREATE TABLE EVALUATION (
                            idEvaluation INT AUTO_INCREMENT PRIMARY KEY,
                            note DECIMAL(3, 1),
                            commentaires TEXT
);

CREATE TABLE MEMOIRERAPPORT (
                                themeSujet TEXT,
                                idEvaluation INT,
                                FOREIGN KEY (idEvaluation) REFERENCES EVALUATION(idEvaluation)
);

CREATE TABLE SOUTENANCE (
                            dateSoutenance DATE,
                            idEvaluation INT,
                            FOREIGN KEY (idEvaluation) REFERENCES EVALUATION(idEvaluation)
);

CREATE TABLE ESTEVALUE (
                           idEvaluation INT,
                           idPersonne INT,
                           FOREIGN KEY (idEvaluation) REFERENCES EVALUATION(idEvaluation),
                           FOREIGN KEY (idPersonne) REFERENCES PERSONNE(idPersonne)
);




INSERT INTO PERSONNE (nom, prenom, email, telephone)
VALUES
    ('Doe', 'John', 'john.doe@example.com', '123-456-7890'),
    ('Smith', 'Alice', 'alice.smith@example.com', '987-654-3210'),
    ('Johnson', 'Bob', 'bob.johnson@example.com', '555-123-4567'),
    ('Brown', 'Emily', 'emily.brown@example.com', '222-333-4444'),
    ('Davis', 'Michael', 'michael.davis@example.com', '777-888-9999');
INSERT INTO ENTREPRISE (raisonSocial, adresse, informations)
VALUES
    ('XYZ Tech', '123 Rue de la Technologie, VilleTech', 'Entreprise spécialisée en informatique'),
    ('BuildPro', '456 Avenue des Bâtisseurs, VilleConstruction', 'Entreprise de génie civil renommée'),
    ('MarketMax', '789 Boulevard du Marketing, VilleMarketing', 'Agence de marketing prospère'),
    ('SoftDev', '101 Rue du Développement, VilleDev', 'Société de développement de logiciels'),
    ('FinanceWorld', '202 Avenue de la Finance, VilleFinance', 'Entreprise financière leader du secteur');


INSERT INTO APPRENTI (anneeAcademique, majeure, programme, idPersonne, idEntreprise)
VALUES
    (2023, 'Informatique', 'BAC+5', 1, 1),
    (2022, 'Génie Civil', 'BAC+4', 2, 2),
    (2023, 'Marketing', 'BAC+5', 3, 3),
    (2022, 'Informatique', 'BAC+4', 4, 4),
    (2023, 'Finance', 'BAC+5', 5, 5);

INSERT INTO MAITREAPPRENTISSAGE (poste, remarques, idPersonne, idEntreprise)
VALUES
    ('Ingénieur en Chef', 'Excellente supervision', 1, 1),
    ('Architecte', 'Très compétent', 2, 2),
    ('Directeur Marketing', 'Très impliqué', 3, 3),
    ('Chef de Projet', 'Très expérimenté', 4, 4),
    ('Directeur Financier', 'Très compétent', 5, 5);

INSERT INTO VISITE (dateVisite, format, compteRenduExpress, idPersonne)
VALUES
    ('2023-05-15', 'En personne', 'Bonne réunion', 1),
    ('2023-06-20', 'En ligne', 'Discussion approfondie', 2),
    ('2023-07-10', 'En personne', 'Visite fructueuse', 3),
    ('2023-08-05', 'En ligne', 'Entretien productif', 4),
    ('2023-09-12', 'En personne', 'Rencontre prometteuse', 5);


INSERT INTO MISSION (motsCles, commentaires, metierCible, idPersonne)
VALUES
    ('Développement web, Java, Front-end', 'Mission réussie', 'Développeur web', 1),
    ('Conception de bâtiments, Génie civil', 'Mission accomplie', 'Ingénieur civil', 2),
    ('Stratégie marketing, Publicité', 'Mission en cours', 'Responsable marketing', 3),
    ('Développement de logiciels, C#, Back-end', 'Mission en cours', 'Développeur logiciel', 4),
    ('Analyse financière, Investissement', 'Mission achevée', 'Analyste financier', 5);

INSERT INTO EVALUATION (note, commentaires)
VALUES
    (4.5, 'Excellent travail.'),
    (3.8, 'Très bon projet.'),
    (4.0, 'Très satisfaisant.'),
    (4.2, 'Très bien réalisé.'),
    (3.5, 'Bonne performance.');

INSERT INTO MEMOIRERAPPORT (themeSujet, idEvaluation)
VALUES
    ('Analyse des performances web', 1),
    ('Conception de bâtiments durables', 2),
    ('Stratégie marketing pour les produits technologiques', 3),
    ('Développement d une application de gestion', 4),
    ('Analyse financière des investissements', 5);

INSERT INTO SOUTENANCE (dateSoutenance, idEvaluation)
VALUES
    ('2023-06-10', 1),
    ('2023-07-15', 2),
    ('2023-08-20', 3),
    ('2023-09-25', 4),
    ('2023-10-30', 5);

INSERT INTO ESTEVALUE (idEvaluation, idPersonne)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5);
