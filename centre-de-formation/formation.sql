CREATE DATABASE IF NOT EXISTS centre_formation DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE centre_formation;
CREATE TABLE Formateur (
  `id_formateur` INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nom` varchar(25) NOT NULL,
  `prenom` varchar(25) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(30) NOT NULL
);

CREATE TABLE Formation(
    `id_formation` INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `sujet` varchar(50) NOT NULL,
    `catégorie` varchar(50) NOT NULL,
    `masse_horaire` varchar(30) NOT NULL,
    `description` varchar(500) NOT NULL
);

CREATE TABLE session(
    `id_session` INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `date_début` date NOT NULL,
    `date_fin` date NOT NULL,
    `place_max` INT NOT NULL,
    `etat` varchar(20) NOT NULL,
    `id_formation`INT(11) NOT NULL,
    `id_formateur` INT(11) NOT NULL,
     FOREIGN KEY (id_formation) REFERENCES Formation(id_formation),
     FOREIGN KEY (id_formateur) REFERENCES Formateur(id_formateur)
);

CREATE TABLE aprenant(
    `id_aprenant` INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `nom` varchar(50) NOT NULL,
    `prenom` varchar(50) NOT NULL,
    `email` varchar(100) NOT NULL,
    `password` varchar(30) NOT NULL
);

CREATE TABLE aprenant_session(
    `id_aprenant`INT NOT NULL,
    `id_session`INT NOT NULL,
    `resultat`varchar(30) DEFAULT NULL,
    `date_validation`TIMESTAMP NOT NULL DEFAULT CURRENT_DATE(),
    FOREIGN KEY (id_aprenant) REFERENCES  aprenant(id_aprenant),
    FOREIGN KEY (id_session) REFERENCES  session(id_session),
    PRIMARY KEY (id_aprenant, id_session)
);

INSERT INTO `aprenant`(`nom`, `prenom`, `email`, `password`) 
VALUES  ('el fraihi','hanae','hanae.fraihi@gmail.com','hanae'),
        ('merrah','zineb','zineb.merrah@gmail.com','zineb'),
        ('bakali','ayoub','ayoub-bakali@gmail.com','bakaliAYOUB'),
        ('mejdoubi','faima','fatima_mejdoubi@gmail.com','fatimaMEJDOUBI'),
        ('khabali','hamid','hamid-khabali1@gmail.com','hamidKHABALI12');

INSERT INTO `formateur`( `nom`, `prenom`, `email`, `password`)
VALUES  ('chaba','fouad','fouad-chaba@gmail.com','fouadCHABA100'),
        ('ghaylan','ahemd','ahemd_ghaylan@gmail.com','ghaylanahemd09'),
        ('thami','souad','souad.thami@gmail.com','thamiSOUAD'),
        ('bakhat','chaimae','chaimae_bakhat@gmail.com','bakhatCHAIMAE'),
        ('wazani','mohamed','mohamed-wazani@gmail.com','mohamedWAZANI');

INSERT INTO `formation`(`sujet`, `catégorie`, `masse_horaire`, `description`)
 VALUES   ('Introduction à la gestion de projet', 'Gestion de projet', 40, 'Cette formation permet aux participants de comprendre les fondamentaux de la gestion de projet et de mettre en place des processus efficaces.'),
          ('Langue française pour les débutants', 'Langues', 60, 'Cette formation est conçue pour les débutants qui souhaitent apprendre les bases de la langue française.'),
          ('Excel avancé pour les professionnels', 'Informatique', 30, 'Cette formation sadresse aux professionnels qui souhaitent améliorer leur utilisation dExcel pour des tâches avancées, telles que lanalyse de données.'),
          ('Communication professionnelle', 'Communication', 50, 'Cette formation enseigne les compétences clés de communication nécessaires pour réussir dans un environnement professionnel.'),
          ('Gestion des ressources humaines', 'Ressources humaines', 70, 'Cette formation couvre les concepts de base de la gestion des ressources humaines, y compris le recrutement, la formation et le développement, la rémunération et les avantages sociaux.');

INSERT INTO `session`( `date_début`, `date_fin`, `place_max`, `etat`, `id_formation`, `id_formateur`)
 VALUES   ('2023-03-05','2023-05-23', 18, 'en cours', 1,3),
          ('2023-04-06','2023-05-27',15,'en cours dinscription',3,4),
          ('2023-06-01','2023-06-30',20,'cloturée',5,2),
          ('2023-06-15','2023-07-29',15,' inscription achevée',2,1),
          ('2023-07-01','2023-07-29',25,'annulé',4,5);

INSERT INTO `aprenant_session`(`id_aprenant`, `id_session`) 
VALUES  (1,3),
        (2,5),
        (5,1),
        (3,2),
        (4,4);


