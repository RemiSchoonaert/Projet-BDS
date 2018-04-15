CREATE TABLE `statut` (
  `statut_id` int(11) NOT NULL,
  `statut_nom` varchar(20) NOT NULL,
  PRIMARY KEY (`statut_id`)
);

CREATE TABLE `etudiant` (
  `etudiant_id` int(11) NOT NULL AUTO_INCREMENT,
  `statut_id` int(11) NOT NULL,
  `etudiant_nom` varchar(30) NOT NULL,
  `prenom` varchar(30) NOT NULL,
  `mdp` char(96) NOT NULL,
  `mail` varchar(50) NOT NULL,
  `telephone` char(10) NOT NULL,
  `verifie` varchar(5) NOT NULL,
  `mdp_verification` char(96) NOT NULL,
  PRIMARY KEY (`etudiant_id`),
  KEY `statut_id_fk_4` (`statut_id`),
  CONSTRAINT `statut_id_fk_4` FOREIGN KEY (`statut_id`) REFERENCES `statut` (`statut_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE `association` (
  `association_id` int(11) NOT NULL AUTO_INCREMENT,
  `etudiant_id` int(11) NOT NULL,
  `association_nom` varchar(30) NOT NULL,
  PRIMARY KEY (`association_id`),
  KEY `etudiant_id_fk_0` (`etudiant_id`),
  CONSTRAINT `etudiant_id_fk_0` FOREIGN KEY (`etudiant_id`) REFERENCES `etudiant` (`etudiant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE `gerer` (
  `etudiant_id` int(11) NOT NULL,
  `association_id` int(11) NOT NULL,
  KEY `etudiant_id_fk_5` (`etudiant_id`),
  CONSTRAINT `etudiant_id_fk_5` FOREIGN KEY (`etudiant_id`) REFERENCES `etudiant` (`etudiant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  KEY `association_id_fk_5` (`association_id`),
  CONSTRAINT `association_id_fk_5` FOREIGN KEY (`association_id`) REFERENCES `association` (`association_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE `licencier` (
  `etudiant_id` int(11) NOT NULL,
  `association_id` int(11) NOT NULL,
  KEY `etudiant_id_fk_1` (`etudiant_id`),
  CONSTRAINT `etudiant_id_fk_1` FOREIGN KEY (`etudiant_id`) REFERENCES `etudiant` (`etudiant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  KEY `association_id_fk_1` (`association_id`),
  CONSTRAINT `association_id_fk_1` FOREIGN KEY (`association_id`) REFERENCES `association` (`association_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE `lieu` (
  `lieu_id` int(11) NOT NULL AUTO_INCREMENT,
  `lieu_nom` varchar(30) NOT NULL,
  PRIMARY KEY (`lieu_id`)
);

CREATE TABLE `materiel` (
  `materiel_id` int(11) NOT NULL AUTO_INCREMENT,
  `lieu_id` int(11) NOT NULL,
  `association_id` int(11) NOT NULL,
  `designation` varchar(50) NOT NULL,
  `quantite` int(11) NOT NULL,
  `prix_achat` DOUBLE(10,2) NOT NULL,
  PRIMARY KEY (`materiel_id`),
  KEY `lieu_id_fk_2` (`lieu_id`),
  CONSTRAINT `lieu_id_fk_2` FOREIGN KEY (`lieu_id`) REFERENCES `lieu` (`lieu_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  KEY `association_id_fk_2` (`association_id`),
  CONSTRAINT `association_id_fk_2` FOREIGN KEY (`association_id`) REFERENCES `association` (`association_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE `emprunt` (
  `emprunt_id` int(11) NOT NULL AUTO_INCREMENT,
  `etudiant_id` int(11) NOT NULL,
  `materiel_id` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  `emprunt_debut` date NOT NULL,
  `emprunt_fin` date NOT NULL,
  `valide` varchar(5) NOT NULL,
  `termine` varchar(5) NOT NULL,
  `emprunt_demande` date NOT NULL,
  PRIMARY KEY (`emprunt_id`),
  KEY `etudiant_id_fk_3` (`etudiant_id`),
  CONSTRAINT `etudiant_id_fk_3` FOREIGN KEY (`etudiant_id`) REFERENCES `etudiant` (`etudiant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  KEY `materiel_id_fk_3` (`materiel_id`),
  CONSTRAINT `materiel_id_fk_3` FOREIGN KEY (`materiel_id`) REFERENCES `materiel` (`materiel_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
);

