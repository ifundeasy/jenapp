# ************************************************************
# Sequel Pro SQL dump
# Version 4135
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.5.34)
# Database: zen
# Generation Time: 2014-12-08 16:10:59 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table bank
# ------------------------------------------------------------

DROP TABLE IF EXISTS `bank`;

CREATE TABLE `bank` (
  `id_bank` varchar(30) NOT NULL,
  `fk.id_city_official` varchar(30) DEFAULT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `type` enum('central','conventional','syariah') DEFAULT NULL,
  `active` enum('0','1') NOT NULL DEFAULT '0',
  `notes` varchar(100) DEFAULT '',
  PRIMARY KEY (`id_bank`),
  KEY `fk.id_city_official` (`fk.id_city_official`),
  CONSTRAINT `bank_ibfk_1` FOREIGN KEY (`fk.id_city_official`) REFERENCES `city` (`id_city`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table city
# ------------------------------------------------------------

DROP TABLE IF EXISTS `city`;

CREATE TABLE `city` (
  `id_city` varchar(30) NOT NULL DEFAULT '',
  `fk.id_state` varchar(30) DEFAULT NULL,
  `name` varchar(100) NOT NULL DEFAULT '',
  `active` enum('0','1') NOT NULL DEFAULT '0',
  `notes` varchar(100) DEFAULT '',
  PRIMARY KEY (`id_city`),
  KEY `fk.id_state` (`fk.id_state`),
  CONSTRAINT `city_ibfk_1` FOREIGN KEY (`fk.id_state`) REFERENCES `state` (`id_state`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table country
# ------------------------------------------------------------

DROP TABLE IF EXISTS `country`;

CREATE TABLE `country` (
  `id_country` varchar(30) NOT NULL DEFAULT '',
  `name` varchar(100) NOT NULL DEFAULT '',
  `alpha2` varchar(2) NOT NULL DEFAULT '',
  `alpha3` varchar(3) NOT NULL DEFAULT '',
  `numeric` varchar(3) DEFAULT '',
  `iso3166_2` varchar(13) DEFAULT '',
  `currency` varchar(10) DEFAULT '?',
  `symbolic` varchar(10) DEFAULT '?',
  `active` enum('0','1') NOT NULL DEFAULT '0',
  `notes` varchar(100) DEFAULT '',
  PRIMARY KEY (`id_country`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table relationship
# ------------------------------------------------------------

DROP TABLE IF EXISTS `relationship`;

CREATE TABLE `relationship` (
  `id_relationship` varchar(30) NOT NULL DEFAULT '',
  `name` varchar(30) NOT NULL DEFAULT '',
  `active` enum('0','1') NOT NULL DEFAULT '0',
  `notes` varchar(100) DEFAULT '',
  PRIMARY KEY (`id_relationship`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table religion
# ------------------------------------------------------------

DROP TABLE IF EXISTS `religion`;

CREATE TABLE `religion` (
  `id_religion` varchar(30) NOT NULL DEFAULT '',
  `name` varchar(30) NOT NULL DEFAULT '',
  `active` enum('0','1') NOT NULL DEFAULT '0',
  `notes` varchar(100) DEFAULT '',
  PRIMARY KEY (`id_religion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table social
# ------------------------------------------------------------

DROP TABLE IF EXISTS `social`;

CREATE TABLE `social` (
  `id_social` varchar(30) NOT NULL DEFAULT '',
  `name` varchar(30) NOT NULL DEFAULT '',
  `active` enum('0','1') NOT NULL DEFAULT '0',
  `notes` varchar(100) DEFAULT '',
  PRIMARY KEY (`id_social`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table state
# ------------------------------------------------------------

DROP TABLE IF EXISTS `state`;

CREATE TABLE `state` (
  `id_state` varchar(30) NOT NULL DEFAULT '',
  `fk.id_country` varchar(30) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `type` enum('autonomous province','province','special district','special region') DEFAULT 'province',
  `geo_code` varchar(30) DEFAULT NULL,
  `geo_unit` varchar(2) DEFAULT '',
  `active` enum('0','1') NOT NULL DEFAULT '0',
  `notes` varchar(100) DEFAULT '',
  PRIMARY KEY (`id_state`),
  KEY `fk.id_country` (`fk.id_country`),
  CONSTRAINT `state_ibfk_1` FOREIGN KEY (`fk.id_country`) REFERENCES `country` (`id_country`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table unit
# ------------------------------------------------------------

DROP TABLE IF EXISTS `unit`;

CREATE TABLE `unit` (
  `id_unit` varchar(30) NOT NULL DEFAULT '',
  `name` varchar(30) NOT NULL DEFAULT '',
  `active` enum('0','1') NOT NULL DEFAULT '0',
  `notes` varchar(100) DEFAULT '',
  PRIMARY KEY (`id_unit`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
