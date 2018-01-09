/*
MySQL Backup
Source Server Version: 5.5.46
Source Database: toto3u_peve
Date: 07/12/2015 20:37:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
--  Table structure for `commune`
-- ----------------------------
DROP TABLE IF EXISTS `commune`;
CREATE TABLE `commune` (
  `no_com` varchar(5) CHARACTER SET latin1 NOT NULL,
  `nom_com` varchar(25) CHARACTER SET latin1 NOT NULL,
  `cp` varchar(5) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`no_com`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii COLLATE=ascii_bin;

-- ----------------------------
--  Table structure for `comprend`
-- ----------------------------
DROP TABLE IF EXISTS `comprend`;
CREATE TABLE `comprend` (
  `id_inf` varchar(5) CHARACTER SET latin1 NOT NULL,
  `id_delit` int(3) NOT NULL,
  PRIMARY KEY (`id_inf`,`id_delit`),
  KEY `comprend_id_delit_fkey` (`id_delit`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii COLLATE=ascii_bin;

-- ----------------------------
--  Table structure for `conducteur`
-- ----------------------------
DROP TABLE IF EXISTS `conducteur`;
CREATE TABLE `conducteur` (
  `no_permis` varchar(4) CHARACTER SET latin1 NOT NULL,
  `date_permis` date NOT NULL DEFAULT '0000-00-00',
  `nom` varchar(25) CHARACTER SET latin1 NOT NULL,
  `prenom` varchar(25) CHARACTER SET latin1 NOT NULL,
  `adresse` varchar(50) CHARACTER SET latin1 NOT NULL,
  `no_com` varchar(5) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`no_permis`),
  KEY `conducteur_no_com_fkey` (`no_com`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii COLLATE=ascii_bin;

-- ----------------------------
--  Table structure for `delit`
-- ----------------------------
DROP TABLE IF EXISTS `delit`;
CREATE TABLE `delit` (
  `id_delit` int(11) NOT NULL AUTO_INCREMENT,
  `nature` varchar(40) CHARACTER SET latin1 NOT NULL,
  `tarif` decimal(6,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id_delit`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=ascii COLLATE=ascii_bin;

-- ----------------------------
--  Table structure for `infraction`
-- ----------------------------
DROP TABLE IF EXISTS `infraction`;
CREATE TABLE `infraction` (
  `id_inf` varchar(5) CHARACTER SET latin1 NOT NULL,
  `date_inf` date NOT NULL DEFAULT '0000-00-00',
  `no_immat` varchar(8) CHARACTER SET latin1 NOT NULL,
  `no_com` varchar(5) CHARACTER SET latin1 NOT NULL,
  `no_permis` varchar(4) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`id_inf`),
  KEY `infraction_no_com_fkey` (`no_com`),
  KEY `infraction_no_immat_fkey` (`no_immat`),
  KEY `infraction_no_permis_fkey` (`no_permis`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii COLLATE=ascii_bin;

-- ----------------------------
--  Table structure for `type_vehi`
-- ----------------------------
DROP TABLE IF EXISTS `type_vehi`;
CREATE TABLE `type_vehi` (
  `id_type` int(11) NOT NULL AUTO_INCREMENT,
  `modele` varchar(20) CHARACTER SET latin1 NOT NULL,
  `marque` varchar(20) CHARACTER SET latin1 NOT NULL,
  `puissance` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_type`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=ascii COLLATE=ascii_bin;

-- ----------------------------
--  Table structure for `vehicule`
-- ----------------------------
DROP TABLE IF EXISTS `vehicule`;
CREATE TABLE `vehicule` (
  `no_immat` varchar(8) CHARACTER SET latin1 NOT NULL,
  `date_immat` date NOT NULL DEFAULT '0000-00-00',
  `id_type` int(11) NOT NULL,
  `no_permis` varchar(4) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`no_immat`),
  KEY `vehicule_no_permis_fkey` (`no_permis`),
  KEY `vehicule_no_typ_fkey` (`id_type`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii COLLATE=ascii_bin;


-- ----------------------------
--  Records 
-- ----------------------------
INSERT INTO `commune` VALUES ('54273','Jarny','54800'), ('54395','Nancy','54000'), ('57020','Ancerville','57580'), ('57123','Carling','57490'), ('57283','Hagondange','57300'), ('57463','Metz','57000'), ('57480','Montigny les metz','57158'), ('57672','thionville','57100');
INSERT INTO `comprend` VALUES ('01','3'), ('02','3'), ('03','2'), ('1','1'), ('2','1'), ('2','2'), ('3','3'), ('4','4'), ('4','5'), ('5','3'), ('56','2'), ('56','6'), ('6','0'), ('6','1'), ('6','2'), ('6','6'), ('7','0'), ('7','1'), ('7','2'), ('8','6'), ('85','1');
INSERT INTO `conducteur` VALUES ('AZ67','2001-02-01','AIRPACH','Fabrice','25 rue des tilleuls','57463'), ('AZ69','2001-02-01','CAVALLI','Frederic','6 rue des mimosas','54273'), ('AZ71','2002-02-02','MANGONI','Joseph','9 avenue de nancy','57020'), ('AZ81','1997-04-09','GAUDE','David','10 bld des capucins','57672'), ('AZ90','2000-05-04','KIEFFER','Claudine','45 rue des oursins','57123'), ('AZ92','2001-04-06','THEOBALD','Pascal','38 rue du lilas','57463'), ('AZ99','2003-09-06','TOTO','Souleymane','49 bld des artichauts','57463');
INSERT INTO `delit` VALUES ('1','Exces de vitesse','220.00'), ('2','Outrage a agent','450.00'), ('3','Feu rouge grille','270.00'), ('4','Conduite en etat d\'ivresse','380.00'), ('5','Delit de fuite','400.00'), ('6','refus de priorite','280.00');
INSERT INTO `infraction` VALUES ('01','2013-12-02','AA643BB','57463',''), ('02','2013-12-02','AA643BB','57463','AZ99'), ('03','2013-12-02','AA643BB','57463','AZ71'), ('1','2013-09-02','CA409BG','57463','AZ67'), ('2','2013-09-04','BE456AD','57672','AZ69'), ('3','2013-09-04','AA643BB','57463','AZ71'), ('4','2013-09-06','BF823NG','57480','AZ81'), ('5','2013-09-08','5432YZ88','54395','AZ90'), ('56','2013-12-02','AA643BB','57463','AZ81'), ('6','2013-09-11','AB308FG','57283','AZ92'), ('7','2013-09-08','AB308FG','57283',''), ('8','2012-06-05','AA643BB','57463',''), ('85','2014-03-19','AA643BB','57463',''), ('9','2013-10-01','CA409BG','57672','AZ92');
INSERT INTO `type_vehi` VALUES ('1','308','Peugeot','6'), ('2','C3','Citroen','5'), ('3','Golf','Volkswagen','7'), ('4','Kangoo','Renault','5');
INSERT INTO `vehicule` VALUES ('5432YZ88','2007-08-15','2','AZ90'), ('AA643BB','2012-01-07','3','AZ71'), ('AB308FG','2010-03-27','1','AZ92'), ('BE456AD','2009-07-10','4','AZ69'), ('BF823NG','2006-05-10','2','AZ81'), ('CA409BG','2011-03-21','4','AZ67');
