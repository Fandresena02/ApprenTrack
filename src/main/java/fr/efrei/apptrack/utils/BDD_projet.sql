-- OLD
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
DROP TABLE IF EXISTS APPRENTI;
DROP TABLE IF EXISTS MAITREAPPRENTISSAGE;
DROP TABLE IF EXISTS ENTREPRISE;
DROP TABLE IF EXISTS MISSION;
DROP TABLE IF EXISTS MEMOIRERAPPORT;
DROP TABLE IF EXISTS EVALUATION;
DROP TABLE IF EXISTS SOUTENANCE;
DROP TABLE IF EXISTS ESTEVALUE;


CREATE TABLE ENTREPRISE (
                            idEntreprise INT AUTO_INCREMENT PRIMARY KEY,
                            raisonSocial VARCHAR(255) NOT NULL,
                            adresse TEXT,
                            informations TEXT
);

CREATE TABLE APPRENTI (
                          idApprenti INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
                          nom VARCHAR(255) NOT NULL,
                          prenom VARCHAR(255) NOT NULL,
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
                                     idMaitreApprentissage INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
                                     poste VARCHAR(255),
                                     remarques TEXT,
                                     idEntreprise INT,
                                     FOREIGN KEY (idEntreprise) REFERENCES ENTREPRISE(idEntreprise)
);

CREATE TABLE VISITE (
                        dateVisite DATE,
                        format VARCHAR(255),
                        compteRenduExpress TEXT,
                        idApprenti INT,
                        FOREIGN KEY (idApprenti) REFERENCES APPRENTI(idApprenti)
);



CREATE TABLE MISSION (
                         idMission INT AUTO_INCREMENT PRIMARY KEY,
                         motsCles TEXT,
                         commentaires TEXT,
                         metierCible VARCHAR(255),
                         idApprenti INT,
                         FOREIGN KEY (idApprenti) REFERENCES APPRENTI(idApprenti)
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
                           idApprenti INT,
                           FOREIGN KEY (idEvaluation) REFERENCES EVALUATION(idEvaluation),
                           FOREIGN KEY (idApprenti) REFERENCES APPRENTI(idApprenti)
);



INSERT INTO APPRENTI (nom, prenom, email, telephone, anneeAcademique, majeure, programme, isArchive, idEntreprise)
VALUES
    ('Doe', 'John', 'john.doe@example.com', '123-456-7890', 2023, 'Informatique', 'BAC+5', false, 1),
    ('Smith', 'Alice', 'alice.smith@example.com', '987-654-3210', 2022, 'Génie Civil', 'BAC+4', false, 2),
    ('Johnson', 'Bob', 'bob.johnson@example.com', '555-123-4567', 2023, 'Marketing', 'BAC+5', false, 3),
    ('Brown', 'Emily', 'emily.brown@example.com', '222-333-4444', 2022, 'Informatique', 'BAC+4', false, 4),
    ('Davis', 'Michael', 'michael.davis@example.com', '777-888-9999', 2023, 'Finance', 'BAC+5', false, 5);

INSERT INTO MAITREAPPRENTISSAGE (poste, remarques, idEntreprise)
VALUES
    ('Ingénieur en Chef', 'Excellente supervision', 1),
    ('Architecte', 'Très compétent', 2),
    ('Directeur Marketing', 'Très impliqué', 3),
    ('Chef de Projet', 'Très expérimenté', 4),
    ('Directeur Financier', 'Très compétent', 5);

INSERT INTO VISITE (dateVisite, format, compteRenduExpress, idApprenti)
VALUES
    ('2023-05-15', 'En personne', 'Bonne réunion', 1),
    ('2023-06-20', 'En ligne', 'Discussion approfondie', 2),
    ('2023-07-10', 'En personne', 'Visite fructueuse', 3),
    ('2023-08-05', 'En ligne', 'Entretien productif', 4),
    ('2023-09-12', 'En personne', 'Rencontre prometteuse', 5);

INSERT INTO MISSION (motsCles, commentaires, metierCible, idApprenti)
VALUES
    ('Développement web, Java, Front-end', 'Mission réussie', 'Développeur web', 1),
    ('Conception de bâtiments, Génie civil', 'Mission accomplie', 'Ingénieur civil', 2),
    ('Stratégie marketing, Publicité', 'Mission en cours', 'Responsable marketing', 3),
    ('Développement de logiciels, C#, Back-end', 'Mission en cours', 'Développeur logiciel', 4),
    ('Analyse financière, Investissement', 'Mission achevée', 'Analyste financier', 5);

INSERT INTO ESTEVALUE (idApprenti, idEvaluation)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5);
