
-- APPRENTI(idApprenti, nom, prenom, email, telephone, anneeAcademique, majeure, programme, isArchive, #idEntreprise)
-- MAITREAPPRENTISSAGE(idMaitreApprentissage, nom, prenom, email, telephone, poste, remarques, #idEntreprise)
-- VISITE(idVisite, dateVisite, format, compteRenduExpress, #idApprenti)
-- ENTREPRISE(idEntreprise, raisonSociale, adresse, informations)
-- MISSION(idMission, motsCles, commentaires, metierCible, #idApprenti)
-- EVALUATION(idEvaluation, note, commentaires)
-- MEMOIRERAPPORT(idMemoireRapport, themeSujet, #idEvaluation)
-- SOUTENANCE(idSoutenance, dateSoutenance, #idEvaluation)
-- ESTEVALUE(#idEvaluation, #idApprenti)

DROP SCHEMA IF EXISTS ApprenTrackBDD;
CREATE SCHEMA ApprenTrackBDD;
USE ApprenTrackBDD;
DROP TABLE IF EXISTS VISITE;
DROP TABLE IF EXISTS APPRENTI;
DROP TABLE IF EXISTS MAITREAPPRENTISSAGE;
DROP TABLE IF EXISTS ENTREPRISE;
DROP TABLE IF EXISTS MISSION;
DROP TABLE IF EXISTS MEMOIRERAPPORT;
DROP TABLE IF EXISTS EVALUATION;
DROP TABLE IF EXISTS SOUTENANCE;
DROP TABLE IF EXISTS ESTEVALUE;


CREATE TABLE ENTREPRISE (
                            idEntreprise INT PRIMARY KEY AUTO_INCREMENT,
                            raisonSociale VARCHAR(255),
                            adresse VARCHAR(255),
                            informations VARCHAR(255)
);

CREATE TABLE APPRENTI (
                          idApprenti INT PRIMARY KEY AUTO_INCREMENT,
                          nom VARCHAR(255),
                          prenom VARCHAR(255),
                          email VARCHAR(255),
                          telephone VARCHAR(15),
                          anneeAcademique INT,
                          majeure VARCHAR(255),
                          programme VARCHAR(255),
                          isArchive BOOL,
                          idEntreprise INT,
                          FOREIGN KEY (idEntreprise) REFERENCES ENTREPRISE(idEntreprise)
  
);

CREATE TABLE MAITREAPPRENTISSAGE (
                                     idMaitreApprentissage INT PRIMARY KEY AUTO_INCREMENT,
                                     nom VARCHAR(255),
                                     prenom VARCHAR(255),
                                     email VARCHAR(255),
                                     telephone VARCHAR(15),
                                     poste VARCHAR(255),
                                     remarques VARCHAR(255),
                                     idEntreprise INT,
                                     FOREIGN KEY (idEntreprise) REFERENCES ENTREPRISE(idEntreprise)
);

CREATE TABLE VISITE (
                        idVisite INT AUTO_INCREMENT PRIMARY KEY,
                        dateVisite DATE,
                        format VARCHAR(255),
                        compteRenduExpress VARCHAR(255),
                        idApprenti INT,
                        FOREIGN KEY (idApprenti) REFERENCES APPRENTI(idApprenti)
);



CREATE TABLE MISSION (
                         idMission INT AUTO_INCREMENT PRIMARY KEY,
                         motsCles VARCHAR(255),
                         commentaires VARCHAR(255),
                         metierCible VARCHAR(255),
                         idApprenti INT,
                         FOREIGN KEY (idApprenti) REFERENCES APPRENTI(idApprenti)
);

CREATE TABLE EVALUATION (
                            idEvaluation INT AUTO_INCREMENT PRIMARY KEY,
                            note DECIMAL(3, 1),
                            commentaires VARCHAR(255)
);

CREATE TABLE MEMOIRERAPPORT (
                                idMemoireRapport INT AUTO_INCREMENT PRIMARY KEY,
                                themeSujet VARCHAR(255),
                                idEvaluation INT,
                                FOREIGN KEY (idEvaluation) REFERENCES EVALUATION(idEvaluation)
);

CREATE TABLE SOUTENANCE (
                            idSoutenance INT AUTO_INCREMENT PRIMARY KEY,
                            dateSoutenance DATE,
                            idEvaluation INT,
                            FOREIGN KEY (idEvaluation) REFERENCES EVALUATION(idEvaluation)
);

CREATE TABLE ESTEVALUE (
                           idEvaluation INT,
                           idApprenti INT,
                           FOREIGN KEY (idEvaluation) REFERENCES EVALUATION(idEvaluation),
                           FOREIGN KEY (idApprenti) REFERENCES APPRENTI(idApprenti),
                           PRIMARY KEY (idEvaluation, idApprenti)
);

INSERT INTO ENTREPRISE (raisonSociale, adresse, informations)
VALUES
    ('ABC Solutions', '456 Rue de l\'Innovation, VilleInnovante', 'Société de solutions technologiques'),
    ('Global Motors', '789 Avenue des Voitures, VilleAutomobile', 'Fabricant mondial de véhicules'),
    ('EcoGreen', '101 Boulevard de l\'Environnement, VilleEcologique', 'Entreprise axée sur le développement durable'),
    ('Tech Innovators', '202 Rue de la Technologie, VilleTech', 'Innovateurs technologiques de premier plan'),
    ('HealthTech', '303 Avenue de la Santé, VilleSanté', 'Société de technologies médicales avancées');
    
INSERT INTO APPRENTI (nom, prenom, email, telephone, anneeAcademique, majeure, programme, isArchive, idEntreprise)
VALUES
    ('Smith', 'Jessica', 'jessica.smith@example.com', '111-222-3333', 2023, 'Informatique', 'BAC+5', false, 1),
    ('Williams', 'Daniel', 'daniel.williams@example.com', '444-555-6666', 2022, 'Génie Civil', 'BAC+4', false, 2),
    ('Taylor', 'Sophie', 'sophie.taylor@example.com', '777-888-9999', 2023, 'Marketing', 'BAC+5', false, 3),
    ('Jones', 'David', 'david.jones@example.com', '222-333-4444', 2022, 'Informatique', 'BAC+4', false, 4),
    ('Brown', 'Olivia', 'olivia.brown@example.com', '555-666-7777', 2023, 'Santé', 'BAC+5', false, 5);

INSERT INTO MAITREAPPRENTISSAGE (nom, prenom, email, telephone, poste, remarques, idEntreprise)
VALUES
    ('Johnson', 'Andrew', 'andrew.johnson@example.com', '111-222-3333', 'Ingénieur en Chef', 'Très compétent', 1),
    ('Wright', 'Emma', 'emma.wright@example.com', '444-555-6666', 'Architecte', 'Excellente collaboration', 2),
    ('Miller', 'Sophie', 'sophie.miller@example.com', '777-888-9999', 'Directeur Marketing', 'Très impliqué', 3),
    ('Anderson', 'Michael', 'michael.anderson@example.com', '222-333-4444', 'Chef de Projet', 'Encadrement exceptionnel', 4),
    ('Davis', 'Olivia', 'olivia.davis@example.com', '555-666-7777', 'Directeur Financier', 'Très compétent', 5);

INSERT INTO VISITE (dateVisite, format, compteRenduExpress, idApprenti)
VALUES
    ('2023-05-15', 'En personne', 'Discussion constructive', 1),
    ('2023-06-20', 'En ligne', 'Échanges approfondis', 2),
    ('2023-07-10', 'En personne', 'Rencontre productive', 3),
    ('2023-08-05', 'En ligne', 'Entretien fructueux', 4),
    ('2023-09-12', 'En personne', 'Bonne collaboration', 5);

INSERT INTO MISSION (motsCles, commentaires, metierCible, idApprenti)
VALUES
    ('Intelligence Artificielle, Machine Learning', 'Mission innovante', 'Ingénieur en IA', 1),
    ('Conception de ponts, Génie civil', 'Mission réussie', 'Ingénieur civil', 2),
    ('Stratégie publicitaire, Campagnes en ligne', 'Mission en cours', 'Spécialiste en marketing', 3),
    ('Développement d\'applications mobiles, React Native', 'Mission en cours', 'Développeur mobile', 4),
    ('Recherche médicale, Biotechnologie', 'Mission prometteuse', 'Chercheur en santé', 5);

INSERT INTO EVALUATION (note, commentaires)
VALUES
    (4.8, 'Travail exceptionnel, résultats remarquables.'),
    (3.9, 'Bonne performance globale, des améliorations possibles.'),
    (4.5, 'Excellente contribution au projet.'),
    (4.2, 'Travail bien réalisé, résultats solides.'),
    (3.7, 'Satisfaisant, des points à améliorer pour atteindre l\'excellence.');

INSERT INTO MEMOIRERAPPORT (themeSujet, idEvaluation)
VALUES
    ('Applications de l\'IA dans les affaires', 1),
    ('Durabilité dans la construction civile', 2),
    ('Impact des campagnes publicitaires en ligne', 3),
    ('Développement d\'applications de gestion', 4),
    ('Avancées en biotechnologie médicale', 5);

INSERT INTO SOUTENANCE (dateSoutenance, idEvaluation)
VALUES
    ('2023-06-10', 1),
    ('2023-07-15', 2),
    ('2023-08-20', 3),
    ('2023-09-25', 4),
    ('2023-10-30', 5);

INSERT INTO ESTEVALUE (idApprenti, idEvaluation)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5);
