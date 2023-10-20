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
    idPersonne INT PRIMARY KEY,
    idEntreprise INT,
    FOREIGN KEY (idPersonne) REFERENCES PERSONNE(idPersonne),
    FOREIGN KEY (idEntreprise) REFERENCES ENTREPRISE(idEntreprise)
);

CREATE TABLE VISITE (
    idVisite INT AUTO_INCREMENT PRIMARY KEY,
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
    idMemoire INT AUTO_INCREMENT PRIMARY KEY,
    themeSujet TEXT,
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
    idEstValue INT AUTO_INCREMENT PRIMARY KEY,
    idEvaluation INT,
    idPersonne INT,
    FOREIGN KEY (idEvaluation) REFERENCES EVALUATION(idEvaluation),
    FOREIGN KEY (idPersonne) REFERENCES PERSONNE(idPersonne)
);


INSERT INTO PERSONNE (nom, prenom, email, telephone) VALUES
    ('Dupont', 'Jean', 'jean.dupont@email.com', '0694386721'),
    ('Martin', 'Marie', 'marie.martin@email.com', '0634567635'),
    ('Lefebvre', 'Pierre', 'pierre.lefebvre@email.com', '0743252425'),
    ('Dubois', 'Sophie', 'sophie.dubois@email.com', '0632456548'),
    ('Rousseau', 'Éric', 'eric.rousseau@email.com', '0798454349'),
    ('Lepetit', 'Luc', 'luc.lepetit@email.com', '0635829468'),
    ('Roux', 'Thierry', 'thierry.roux@email.com', '0729475027'),
    ('Bernard', 'Bob', 'bob.bernard@email.com', '0692374591'),
    ('Chaumont', 'Carlos', 'carlos.chaumont@email.com', '0745643212'),
    ('Burrot', 'Sandy', 'sandy.burrot@email.com', '0711134565');

INSERT INTO ENTREPRISE (raisonSocial, adresse, informations) VALUES
    ('ABC Inc.', '123 Rue de la Société', 'Entreprise informatique spécialisée dans les logiciels.'),
    ('XYZ Ltd.', '456 Avenue des Affaires', 'Banque.'),
    ('EFG SARL', '789 Boulevard des Solutions', 'Entreprise de développement web.'),
    ('LMN GmbH', '1010 Straße der Produkte', 'Fabricant d''applications inf.'),
    ('UVW SA', '2020 Rue des Services', 'Fournisseur de services de télécommunications');

INSERT INTO APPRENTI (anneeAcademique, majeure, programme, idPersonne, idEntreprise) VALUES
    (2023, 'Informatique', 'Bachelor', 1, 1),
    (2023, 'Gestion', 'Master', 2, 2),
    (2022, 'Informatique', 'Bachelor', 3, 3),
    (2024, 'Électronique', 'Doctorat', 4, 4),
    (2022, 'Télécoms', 'Bachelor', 5, 5);

INSERT INTO MAITREAPPRENTISSAGE (poste, remarques, idPersonne, idEntreprise) VALUES
    ('Chef de projet', 'Bon mentor', 6, 1),
    ('Consultant', 'Excellentes compétences', 7, 2),
    ('Ingénieur', 'Passionné par l''enseignement', 8, 3),
    ('Directeur technique', 'Expérience considérable', 9, 4),
    ('Manager', 'Aime travailler avec des étudiants', 10, 5);

INSERT INTO VISITE (dateVisite, format, compteRenduExpress, idPersonne) VALUES
    ('2023-01-15', 'On-site', 'Visite réussie avec l''apprenti Jean Dupont.', 1),
    ('2023-02-20', 'Remote', 'Réunion en ligne avec l''apprenti Marie Martin.', 2),
    ('2023-03-10', 'On-site', 'Visite sur site avec l''apprenti Pierre Lefebvre.', 3),
    ('2023-04-05', 'Remote', 'Réunion à distance avec l''apprenti Sophie Dubois.', 4),
    ('2023-05-12', 'On-site', 'Visite réussie avec l''apprenti Éric Rousseau.', 5);

INSERT INTO MISSION (motsCles, commentaires, metierCible, idPersonne) VALUES
    ('Web', 'Mission de développement web.', 'Développeur web', 1),
    ('Marketing', 'Étude de marché.', 'Analyste marketing', 2),
    ('Informatique', 'Conception de logiciels.', 'Ingénieur logiciel', 3),
    ('Électronique', 'Conception de circuits électroniques.', 'Ingénieur électronique', 4),
    ('Télécommunications', 'Infrastructure réseau.', 'Ingénieur réseau', 5);

INSERT INTO EVALUATION (note, commentaires) VALUES
    (19, 'Travail exceptionnel.'),
    (14, 'Bon travail.'),
    (13, 'Résultats solides.'),
    (20, 'Très bien exécuté.'),
    (15, 'Très satisfaisante.');

INSERT INTO MEMOIRERAPPORT (themeSujet, idEvaluation) VALUES
    ('Développement d''une application web', 1),
    ('Gestion des ressources d''un projet', 2),
    ('Conception de logiciel de gestion', 3),
    ('Conception de applications avancés', 4),
    ('Optimisation des réseaux', 5);

INSERT INTO SOUTENANCE (dateSoutenance, idEvaluation) VALUES
    ('2023-06-10', 1),
    ('2023-06-15', 2),
    ('2023-06-20', 3),
    ('2023-06-25', 4),
    ('2023-06-30', 5);

INSERT INTO ESTEVALUE (idEvaluation, idPersonne) VALUES
     (1, 6),
     (2, 7),
     (3, 8),
     (4, 9),
     (5, 10);