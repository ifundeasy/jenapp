# ************************************************************
# Sequel Pro SQL dump
# Version 4135
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.5.34)
# Database: zen
# Generation Time: 2014-12-08 16:09:26 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table _
# ------------------------------------------------------------

DROP TABLE IF EXISTS `_`;

CREATE TABLE `_` (
  `id` varchar(100) NOT NULL DEFAULT '',
  `query` text,
  `active` enum('0','1') DEFAULT '0' COMMENT 'Leave it ''0'' for safety',
  `notes` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



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



# Dump of table branch
# ------------------------------------------------------------

DROP TABLE IF EXISTS `branch`;

CREATE TABLE `branch` (
  `id_branch` varchar(30) NOT NULL DEFAULT '',
  `fk.id_company` varchar(30) DEFAULT NULL,
  `name` varchar(30) NOT NULL DEFAULT '',
  `active` enum('0','1') NOT NULL DEFAULT '0',
  `notes` varchar(100) DEFAULT '',
  PRIMARY KEY (`id_branch`),
  KEY `fk.id_company` (`fk.id_company`),
  CONSTRAINT `branch_ibfk_1` FOREIGN KEY (`fk.id_company`) REFERENCES `company` (`id_company`) ON UPDATE CASCADE
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



# Dump of table company
# ------------------------------------------------------------

DROP TABLE IF EXISTS `company`;

CREATE TABLE `company` (
  `id_company` varchar(30) NOT NULL DEFAULT '',
  `name` varchar(30) NOT NULL DEFAULT '',
  `active` enum('0','1') NOT NULL DEFAULT '0',
  `notes` varchar(100) DEFAULT '',
  PRIMARY KEY (`id_company`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table contact
# ------------------------------------------------------------

DROP TABLE IF EXISTS `contact`;

CREATE TABLE `contact` (
  `id_contact` varchar(30) NOT NULL DEFAULT '',
  `pin` varchar(6) NOT NULL DEFAULT '',
  `user_name` varchar(50) NOT NULL DEFAULT '',
  `user_pass` varchar(100) NOT NULL DEFAULT '',
  `first_name` varchar(20) NOT NULL DEFAULT '',
  `last_name` varchar(20) DEFAULT '',
  `alias` varchar(20) DEFAULT NULL,
  `registered` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_of_birth` date NOT NULL DEFAULT '0000-00-00',
  `genre` enum('L','P') DEFAULT NULL,
  `blood` enum('A','B','AB','O') DEFAULT NULL,
  `fk.id_religion` varchar(30) DEFAULT NULL,
  `fk.id_relationship` varchar(30) DEFAULT NULL,
  `picture` text,
  `allow_access` enum('0','1') NOT NULL DEFAULT '0',
  `notes` varchar(100) DEFAULT '',
  `active` enum('0','1') DEFAULT '1',
  PRIMARY KEY (`id_contact`),
  UNIQUE KEY `user_name` (`user_name`),
  UNIQUE KEY `pin` (`pin`),
  KEY `fk.id_religion` (`fk.id_religion`),
  KEY `fk.id_relationship` (`fk.id_relationship`),
  CONSTRAINT `contact_ibfk_1` FOREIGN KEY (`fk.id_religion`) REFERENCES `religion` (`id_religion`) ON UPDATE CASCADE,
  CONSTRAINT `contact_ibfk_2` FOREIGN KEY (`fk.id_relationship`) REFERENCES `relationship` (`id_relationship`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table contact_addr
# ------------------------------------------------------------

DROP TABLE IF EXISTS `contact_addr`;

CREATE TABLE `contact_addr` (
  `fk.id_contact` varchar(30) DEFAULT NULL,
  `fk.id_city` varchar(30) DEFAULT NULL,
  `address` varchar(100) NOT NULL DEFAULT '',
  `zip_code` varchar(6) DEFAULT '',
  `active` enum('0','1') NOT NULL DEFAULT '0',
  `notes` varchar(100) DEFAULT '',
  KEY `fk.id_contact` (`fk.id_contact`),
  KEY `fk.id_city` (`fk.id_city`),
  CONSTRAINT `contact_addr_ibfk_1` FOREIGN KEY (`fk.id_contact`) REFERENCES `contact` (`id_contact`) ON UPDATE CASCADE,
  CONSTRAINT `contact_addr_ibfk_2` FOREIGN KEY (`fk.id_city`) REFERENCES `city` (`id_city`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table contact_ex
# ------------------------------------------------------------

DROP TABLE IF EXISTS `contact_ex`;

CREATE TABLE `contact_ex` (
  `fk.id_contact` varchar(30) DEFAULT NULL,
  `fk.id_social` varchar(30) DEFAULT NULL,
  `value` varchar(255) NOT NULL DEFAULT '',
  `active` enum('0','1') NOT NULL DEFAULT '0',
  `notes` varchar(100) DEFAULT '',
  KEY `fk.id_contact` (`fk.id_contact`),
  KEY `fk.id_social` (`fk.id_social`),
  CONSTRAINT `contact_ex_ibfk_1` FOREIGN KEY (`fk.id_contact`) REFERENCES `contact` (`id_contact`) ON UPDATE CASCADE,
  CONSTRAINT `contact_ex_ibfk_2` FOREIGN KEY (`fk.id_social`) REFERENCES `social` (`id_social`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table contact_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `contact_log`;

CREATE TABLE `contact_log` (
  `fk.id_contact` varchar(30) DEFAULT NULL,
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` enum('0','1') NOT NULL DEFAULT '0',
  `notes` varchar(100) DEFAULT '',
  KEY `fk.id_contact` (`fk.id_contact`),
  CONSTRAINT `contact_log_ibfk_1` FOREIGN KEY (`fk.id_contact`) REFERENCES `contact` (`id_contact`) ON UPDATE CASCADE
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



# Dump of table internal
# ------------------------------------------------------------

DROP TABLE IF EXISTS `internal`;

CREATE TABLE `internal` (
  `id_internal` varchar(30) NOT NULL DEFAULT '',
  `fk.id_contact` varchar(30) DEFAULT NULL,
  `fk.id_branch` varchar(30) DEFAULT NULL,
  `fk.id_internal_group` varchar(30) DEFAULT NULL,
  `registered` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `restricted` varchar(30) DEFAULT NULL,
  `active` enum('0','1') NOT NULL DEFAULT '0',
  `notes` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_internal`),
  KEY `fk.id_contact` (`fk.id_contact`),
  KEY `fk.id_branch` (`fk.id_branch`),
  KEY `fk.id_internal_group` (`fk.id_internal_group`),
  CONSTRAINT `internal_ibfk_1` FOREIGN KEY (`fk.id_contact`) REFERENCES `contact` (`id_contact`) ON UPDATE CASCADE,
  CONSTRAINT `internal_ibfk_2` FOREIGN KEY (`fk.id_branch`) REFERENCES `branch` (`id_branch`) ON UPDATE CASCADE,
  CONSTRAINT `internal_ibfk_3` FOREIGN KEY (`fk.id_internal_group`) REFERENCES `internal_group` (`id_internal_group`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table internal_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `internal_group`;

CREATE TABLE `internal_group` (
  `id_internal_group` varchar(30) NOT NULL DEFAULT '',
  `name` varchar(30) NOT NULL DEFAULT '',
  `active` enum('0','1') NOT NULL DEFAULT '0',
  `notes` varchar(100) DEFAULT '',
  PRIMARY KEY (`id_internal_group`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table internal_module
# ------------------------------------------------------------

DROP TABLE IF EXISTS `internal_module`;

CREATE TABLE `internal_module` (
  `id_internal_module` varchar(30) NOT NULL DEFAULT '',
  `fk.id_internal_module` varchar(30) DEFAULT NULL,
  `fk.id_internal_group` varchar(30) DEFAULT NULL,
  `name` varchar(30) NOT NULL DEFAULT '',
  `handler` varchar(100) DEFAULT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `order` int(11) unsigned DEFAULT NULL,
  `active` enum('0','1') DEFAULT '0',
  `notes` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_internal_module`),
  KEY `fk.id_internal_group` (`fk.id_internal_group`),
  KEY `fk.id_internal_module` (`fk.id_internal_module`),
  CONSTRAINT `internal_module_ibfk_2` FOREIGN KEY (`fk.id_internal_group`) REFERENCES `internal_group` (`id_internal_group`) ON UPDATE CASCADE,
  CONSTRAINT `internal_module_ibfk_3` FOREIGN KEY (`fk.id_internal_module`) REFERENCES `internal_module` (`id_internal_module`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table level
# ------------------------------------------------------------

DROP TABLE IF EXISTS `level`;

CREATE TABLE `level` (
  `id_level` varchar(30) NOT NULL DEFAULT '',
  `name` varchar(30) NOT NULL DEFAULT '',
  `active` enum('0','1') NOT NULL DEFAULT '0',
  `notes` varchar(100) DEFAULT '',
  PRIMARY KEY (`id_level`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table member
# ------------------------------------------------------------

DROP TABLE IF EXISTS `member`;

CREATE TABLE `member` (
  `id_member` varchar(30) NOT NULL DEFAULT '',
  `fk.id_contact` varchar(30) DEFAULT NULL,
  `fk.id_branch` varchar(30) DEFAULT NULL,
  `fk.id_member_group` varchar(30) DEFAULT NULL,
  `registered` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `restricted` varchar(30) DEFAULT NULL,
  `active` enum('0','1') NOT NULL DEFAULT '0',
  `notes` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_member`),
  KEY `fk.id_contact` (`fk.id_contact`),
  KEY `fk.id_branch` (`fk.id_branch`),
  KEY `fk.id_member_group` (`fk.id_member_group`),
  CONSTRAINT `member_ibfk_1` FOREIGN KEY (`fk.id_contact`) REFERENCES `contact` (`id_contact`) ON UPDATE CASCADE,
  CONSTRAINT `member_ibfk_2` FOREIGN KEY (`fk.id_branch`) REFERENCES `branch` (`id_branch`) ON UPDATE CASCADE,
  CONSTRAINT `member_ibfk_3` FOREIGN KEY (`fk.id_member_group`) REFERENCES `member_group` (`id_member_group`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table member_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `member_group`;

CREATE TABLE `member_group` (
  `id_member_group` varchar(30) NOT NULL DEFAULT '',
  `name` varchar(30) NOT NULL DEFAULT '',
  `active` enum('0','1') NOT NULL DEFAULT '0',
  `notes` varchar(100) DEFAULT '',
  PRIMARY KEY (`id_member_group`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table member_module
# ------------------------------------------------------------

DROP TABLE IF EXISTS `member_module`;

CREATE TABLE `member_module` (
  `id_member_module` varchar(30) NOT NULL DEFAULT '',
  `fk.id_member_module` varchar(30) DEFAULT NULL,
  `fk.id_member_group` varchar(30) DEFAULT NULL,
  `name` varchar(30) NOT NULL DEFAULT '',
  `handler` varchar(100) DEFAULT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `order` int(11) unsigned DEFAULT NULL,
  `active` enum('0','1') DEFAULT '0',
  `notes` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_member_module`),
  KEY `fk.id_member_group` (`fk.id_member_group`),
  KEY `fk.id_member_module` (`fk.id_member_module`),
  CONSTRAINT `member_module_ibfk_2` FOREIGN KEY (`fk.id_member_group`) REFERENCES `member_group` (`id_member_group`) ON UPDATE CASCADE,
  CONSTRAINT `member_module_ibfk_3` FOREIGN KEY (`fk.id_member_module`) REFERENCES `member_module` (`id_member_module`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table on_order
# ------------------------------------------------------------

DROP TABLE IF EXISTS `on_order`;

CREATE TABLE `on_order` (
  `id_on_order` varchar(30) NOT NULL DEFAULT '',
  `name` varchar(30) NOT NULL DEFAULT '',
  `active` enum('0','1') NOT NULL DEFAULT '0',
  `notes` varchar(100) DEFAULT '',
  PRIMARY KEY (`id_on_order`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table payment_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `payment_type`;

CREATE TABLE `payment_type` (
  `id_payment_type` varchar(30) NOT NULL DEFAULT '',
  `name` varchar(30) NOT NULL DEFAULT '',
  `active` enum('0','1') NOT NULL DEFAULT '0',
  `color` varchar(100) DEFAULT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `notes` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_payment_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table pos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pos`;

CREATE TABLE `pos` (
  `id_pos` varchar(50) NOT NULL DEFAULT '',
  `datetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `fk.id_internal` varchar(30) DEFAULT NULL,
  `fk.id_purchasing` varchar(30) DEFAULT NULL,
  `fk.id_table` varchar(30) DEFAULT NULL,
  `fk.id_table_before` varchar(30) DEFAULT NULL,
  `fk.id_on_order` varchar(30) DEFAULT NULL,
  `pic` varchar(50) DEFAULT '',
  `visitor_num` int(11) unsigned DEFAULT '1',
  `reason` varchar(20) DEFAULT NULL,
  `active` enum('0','1') NOT NULL DEFAULT '0',
  `notes` varchar(100) DEFAULT NULL,
  `update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_pos`),
  KEY `fk.id_internal` (`fk.id_internal`),
  KEY `fk.id_purchasing` (`fk.id_purchasing`),
  KEY `fk.id_table` (`fk.id_table`),
  KEY `fk.id_table_before` (`fk.id_table_before`),
  KEY `fk.id_on_order` (`fk.id_on_order`),
  CONSTRAINT `pos_ibfk_2` FOREIGN KEY (`fk.id_internal`) REFERENCES `internal` (`id_internal`) ON UPDATE CASCADE,
  CONSTRAINT `pos_ibfk_3` FOREIGN KEY (`fk.id_purchasing`) REFERENCES `purchasing` (`id_purchasing`) ON UPDATE CASCADE,
  CONSTRAINT `pos_ibfk_4` FOREIGN KEY (`fk.id_table`) REFERENCES `table` (`id_table`) ON UPDATE CASCADE,
  CONSTRAINT `pos_ibfk_5` FOREIGN KEY (`fk.id_table_before`) REFERENCES `table` (`id_table`) ON UPDATE CASCADE,
  CONSTRAINT `pos_ibfk_6` FOREIGN KEY (`fk.id_on_order`) REFERENCES `on_order` (`id_on_order`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table pos_bill
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pos_bill`;

CREATE TABLE `pos_bill` (
  `id_pos_bill` varchar(50) NOT NULL DEFAULT '',
  `datetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `fk.id_internal` varchar(30) DEFAULT NULL,
  `fk.id_member` varchar(30) DEFAULT NULL,
  `alternative` varchar(100) DEFAULT NULL,
  `tax_percent` double unsigned DEFAULT '10',
  `tax_amount` double unsigned DEFAULT '0',
  `service_percent` double unsigned DEFAULT '5',
  `service_amount` double unsigned DEFAULT '0',
  `discount_percent` double unsigned DEFAULT '0',
  `discount_amount` double DEFAULT '0',
  `update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` enum('0','1') DEFAULT '0',
  `notes` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_pos_bill`),
  KEY `fk.id_internal` (`fk.id_internal`),
  KEY `fk.id_member` (`fk.id_member`),
  CONSTRAINT `pos_bill_ibfk_1` FOREIGN KEY (`fk.id_internal`) REFERENCES `internal` (`id_internal`) ON UPDATE CASCADE,
  CONSTRAINT `pos_bill_ibfk_2` FOREIGN KEY (`fk.id_member`) REFERENCES `member` (`id_member`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table pos_bill_ex
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pos_bill_ex`;

CREATE TABLE `pos_bill_ex` (
  `id_pos_bill_ex` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fk.id_pos_bill` varchar(50) DEFAULT NULL,
  `fk.id_pos_ex` bigint(20) unsigned DEFAULT NULL,
  `fk.id_product_sale_price` int(11) unsigned DEFAULT NULL,
  `qty` double unsigned NOT NULL DEFAULT '0',
  `complimentary` double unsigned DEFAULT '0',
  `tax_percent` double unsigned DEFAULT '0',
  `tax_amount` double unsigned DEFAULT '0',
  `service_percent` double unsigned DEFAULT '0',
  `service_amount` double unsigned DEFAULT '0',
  `discount_percent` double unsigned DEFAULT '0',
  `discount_amount` double unsigned DEFAULT '0',
  `active` enum('0','1') NOT NULL DEFAULT '1',
  `notes` varchar(100) DEFAULT NULL,
  `update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_pos_bill_ex`),
  KEY `fk.id_pos_bill` (`fk.id_pos_bill`),
  KEY `fk.id_product_sale_price` (`fk.id_product_sale_price`),
  KEY `fk.id_pos_ex` (`fk.id_pos_ex`),
  CONSTRAINT `pos_bill_ex_ibfk_1` FOREIGN KEY (`fk.id_pos_bill`) REFERENCES `pos_bill` (`id_pos_bill`) ON UPDATE CASCADE,
  CONSTRAINT `pos_bill_ex_ibfk_3` FOREIGN KEY (`fk.id_product_sale_price`) REFERENCES `product_sale_price` (`id_product_sale_price`) ON UPDATE CASCADE,
  CONSTRAINT `pos_bill_ex_ibfk_4` FOREIGN KEY (`fk.id_pos_ex`) REFERENCES `pos_ex` (`id_pos_ex`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table pos_bill_pay
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pos_bill_pay`;

CREATE TABLE `pos_bill_pay` (
  `id_pos_bill_pay` varchar(50) NOT NULL DEFAULT '' COMMENT 'MD5(LEFT(UUID(), 8))',
  `fk.id_pos_bill` varchar(100) DEFAULT NULL,
  `value` double unsigned NOT NULL DEFAULT '0',
  `change` double unsigned NOT NULL DEFAULT '0',
  `active` enum('0','1') NOT NULL DEFAULT '1',
  `notes` varchar(100) DEFAULT NULL,
  `update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_pos_bill_pay`),
  KEY `fk.id_pos_bill` (`fk.id_pos_bill`),
  CONSTRAINT `pos_bill_pay_ibfk_1` FOREIGN KEY (`fk.id_pos_bill`) REFERENCES `pos_bill` (`id_pos_bill`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table pos_bill_pay_ex
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pos_bill_pay_ex`;

CREATE TABLE `pos_bill_pay_ex` (
  `id_pos_bill_pay_ex` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fk.id_pos_bill_pay` varchar(50) DEFAULT NULL,
  `fk.id_payment_type` varchar(30) DEFAULT NULL,
  `reference` varchar(100) DEFAULT NULL,
  `value` double unsigned NOT NULL DEFAULT '0',
  `fk.id_bank` varchar(30) DEFAULT NULL,
  `active` enum('0','1') NOT NULL DEFAULT '1',
  `notes` varchar(100) DEFAULT NULL,
  `update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_pos_bill_pay_ex`),
  KEY `fk.id_pos_bill_pay` (`fk.id_pos_bill_pay`),
  KEY `fk.id_payment_type` (`fk.id_payment_type`),
  KEY `fk.id_bank` (`fk.id_bank`),
  CONSTRAINT `pos_bill_pay_ex_ibfk_1` FOREIGN KEY (`fk.id_pos_bill_pay`) REFERENCES `pos_bill_pay` (`id_pos_bill_pay`) ON UPDATE CASCADE,
  CONSTRAINT `pos_bill_pay_ex_ibfk_2` FOREIGN KEY (`fk.id_payment_type`) REFERENCES `payment_type` (`id_payment_type`) ON UPDATE CASCADE,
  CONSTRAINT `pos_bill_pay_ex_ibfk_3` FOREIGN KEY (`fk.id_bank`) REFERENCES `bank` (`id_bank`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table pos_ex
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pos_ex`;

CREATE TABLE `pos_ex` (
  `id_pos_ex` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `datetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `fk.id_pos` varchar(50) DEFAULT NULL,
  `fk.id_product` varchar(30) DEFAULT NULL,
  `modifier` varchar(255) DEFAULT NULL,
  `qty` double unsigned NOT NULL DEFAULT '0',
  `discount` double unsigned NOT NULL DEFAULT '0',
  `void` double unsigned NOT NULL DEFAULT '0',
  `complimentary` double unsigned NOT NULL DEFAULT '0',
  `active` enum('0','1') DEFAULT '0',
  `notes` varchar(255) DEFAULT NULL,
  `update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_pos_ex`),
  KEY `id_parent` (`fk.id_pos`),
  KEY `fk.id_product` (`fk.id_product`),
  CONSTRAINT `pos_ex_ibfk_1` FOREIGN KEY (`fk.id_pos`) REFERENCES `pos` (`id_pos`) ON UPDATE CASCADE,
  CONSTRAINT `pos_ex_ibfk_2` FOREIGN KEY (`fk.id_product`) REFERENCES `product` (`id_product`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table product
# ------------------------------------------------------------

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `id_product` varchar(30) NOT NULL,
  `fk.id_level` varchar(30) DEFAULT NULL,
  `datetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `name` varchar(100) NOT NULL DEFAULT '',
  `recommend` enum('0','1') DEFAULT '0',
  `color` text,
  `picture` text,
  `min_stock` double DEFAULT NULL,
  `max_stock` double DEFAULT NULL,
  `active` enum('0','1') NOT NULL DEFAULT '0',
  `notes` varchar(100) DEFAULT '',
  `update` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY `code` (`id_product`),
  KEY `fk.id_level` (`fk.id_level`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`fk.id_level`) REFERENCES `level` (`id_level`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table product_ex
# ------------------------------------------------------------

DROP TABLE IF EXISTS `product_ex`;

CREATE TABLE `product_ex` (
  `id_product_ex` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `fk.id_product` varchar(30) DEFAULT NULL,
  `fk.id_product_changeof` varchar(30) DEFAULT NULL,
  `fk.id_product_component` varchar(30) DEFAULT NULL,
  `size` double DEFAULT '0',
  `qty` double unsigned NOT NULL DEFAULT '0',
  `fk.id_unit` varchar(30) DEFAULT NULL,
  `cost` double unsigned DEFAULT '0',
  `decrease_size` double DEFAULT '0',
  `decrease_price` double DEFAULT '0',
  `active` enum('0','1') NOT NULL DEFAULT '0',
  `notes` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_product_ex`),
  KEY `fk.id_product` (`fk.id_product`),
  KEY `fk.id_product_changeof` (`fk.id_product_changeof`),
  KEY `fk.id_product_component` (`fk.id_product_component`),
  KEY `fk.id_unit` (`fk.id_unit`),
  CONSTRAINT `product_ex_ibfk_1` FOREIGN KEY (`fk.id_product`) REFERENCES `product` (`id_product`) ON UPDATE CASCADE,
  CONSTRAINT `product_ex_ibfk_2` FOREIGN KEY (`fk.id_product_changeof`) REFERENCES `product` (`id_product`) ON UPDATE CASCADE,
  CONSTRAINT `product_ex_ibfk_3` FOREIGN KEY (`fk.id_product_component`) REFERENCES `product` (`id_product`) ON UPDATE CASCADE,
  CONSTRAINT `product_ex_ibfk_4` FOREIGN KEY (`fk.id_unit`) REFERENCES `unit` (`id_unit`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table product_process_cost
# ------------------------------------------------------------

DROP TABLE IF EXISTS `product_process_cost`;

CREATE TABLE `product_process_cost` (
  `id_product_process_cost` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `fk.id_product` varchar(30) DEFAULT NULL,
  `datetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `qty` double NOT NULL DEFAULT '0',
  `value` double unsigned NOT NULL DEFAULT '0',
  `active` enum('0','1') NOT NULL DEFAULT '0',
  `notes` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_product_process_cost`),
  KEY `fk.id_product` (`fk.id_product`),
  CONSTRAINT `product_process_cost_ibfk_1` FOREIGN KEY (`fk.id_product`) REFERENCES `product` (`id_product`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table product_purchase_price
# ------------------------------------------------------------

DROP TABLE IF EXISTS `product_purchase_price`;

CREATE TABLE `product_purchase_price` (
  `id_product_purchase_price` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `fk.id_product` varchar(30) DEFAULT NULL,
  `datetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `qty` double NOT NULL DEFAULT '0',
  `value` double unsigned NOT NULL DEFAULT '0',
  `active` enum('0','1') NOT NULL DEFAULT '0',
  `notes` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_product_purchase_price`),
  KEY `fk.id_product` (`fk.id_product`),
  CONSTRAINT `product_purchase_price_ibfk_1` FOREIGN KEY (`fk.id_product`) REFERENCES `product` (`id_product`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table product_sale_price
# ------------------------------------------------------------

DROP TABLE IF EXISTS `product_sale_price`;

CREATE TABLE `product_sale_price` (
  `id_product_sale_price` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `fk.id_product` varchar(30) DEFAULT NULL,
  `datetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `qty` double NOT NULL DEFAULT '1',
  `value` double unsigned NOT NULL DEFAULT '0',
  `active` enum('0','1') NOT NULL DEFAULT '0',
  `notes` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_product_sale_price`),
  KEY `fk.id_product` (`fk.id_product`),
  CONSTRAINT `product_sale_price_ibfk_1` FOREIGN KEY (`fk.id_product`) REFERENCES `product` (`id_product`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table purchase
# ------------------------------------------------------------

DROP TABLE IF EXISTS `purchase`;

CREATE TABLE `purchase` (
  `id_purchase` varchar(50) NOT NULL DEFAULT '',
  `datetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `fk.id_internal` varchar(30) DEFAULT NULL,
  `fk.id_purchasing` varchar(30) DEFAULT NULL,
  `fk.id_table` varchar(30) DEFAULT NULL,
  `fk.id_table_before` varchar(30) DEFAULT NULL,
  `fk.id_on_order` varchar(30) DEFAULT NULL,
  `pic` varchar(50) DEFAULT '',
  `visitor_num` int(11) unsigned DEFAULT '1',
  `reason` varchar(20) DEFAULT NULL,
  `active` enum('0','1') NOT NULL DEFAULT '0',
  `notes` varchar(100) DEFAULT NULL,
  `update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_purchase`),
  KEY `fk.id_internal` (`fk.id_internal`),
  KEY `fk.id_purchasing` (`fk.id_purchasing`),
  KEY `fk.id_table` (`fk.id_table`),
  KEY `fk.id_table_before` (`fk.id_table_before`),
  KEY `fk.id_on_order` (`fk.id_on_order`),
  CONSTRAINT `purchase_ibfk_2` FOREIGN KEY (`fk.id_internal`) REFERENCES `internal` (`id_internal`) ON UPDATE CASCADE,
  CONSTRAINT `purchase_ibfk_3` FOREIGN KEY (`fk.id_purchasing`) REFERENCES `purchasing` (`id_purchasing`) ON UPDATE CASCADE,
  CONSTRAINT `purchase_ibfk_4` FOREIGN KEY (`fk.id_table`) REFERENCES `table` (`id_table`) ON UPDATE CASCADE,
  CONSTRAINT `purchase_ibfk_5` FOREIGN KEY (`fk.id_table_before`) REFERENCES `table` (`id_table`) ON UPDATE CASCADE,
  CONSTRAINT `purchase_ibfk_6` FOREIGN KEY (`fk.id_on_order`) REFERENCES `on_order` (`id_on_order`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table purchase_bill
# ------------------------------------------------------------

DROP TABLE IF EXISTS `purchase_bill`;

CREATE TABLE `purchase_bill` (
  `id_purchase_bill` varchar(50) NOT NULL DEFAULT '',
  `datetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `fk.id_internal` varchar(30) DEFAULT NULL,
  `fk.id_member` varchar(30) DEFAULT NULL,
  `alternative` varchar(100) DEFAULT NULL,
  `tax_percent` double unsigned DEFAULT '10',
  `tax_amount` double unsigned DEFAULT '0',
  `service_percent` double unsigned DEFAULT '5',
  `service_amount` double unsigned DEFAULT '0',
  `discount_percent` double unsigned DEFAULT '0',
  `discount_amount` double DEFAULT '0',
  `update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` enum('0','1') DEFAULT '0',
  `notes` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_purchase_bill`),
  KEY `fk.id_internal` (`fk.id_internal`),
  KEY `fk.id_member` (`fk.id_member`),
  CONSTRAINT `purchase_bill_ibfk_1` FOREIGN KEY (`fk.id_internal`) REFERENCES `internal` (`id_internal`) ON UPDATE CASCADE,
  CONSTRAINT `purchase_bill_ibfk_2` FOREIGN KEY (`fk.id_member`) REFERENCES `member` (`id_member`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table purchase_bill_ex
# ------------------------------------------------------------

DROP TABLE IF EXISTS `purchase_bill_ex`;

CREATE TABLE `purchase_bill_ex` (
  `id_purchase_bill_ex` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fk.id_purchase_bill` varchar(50) DEFAULT NULL,
  `fk.id_purchase_ex` bigint(20) unsigned DEFAULT NULL,
  `fk.id_product_sale_price` int(11) unsigned DEFAULT NULL,
  `qty` double unsigned NOT NULL DEFAULT '0',
  `complimentary` double unsigned DEFAULT '0',
  `tax_percent` double unsigned DEFAULT '0',
  `tax_amount` double unsigned DEFAULT '0',
  `service_percent` double unsigned DEFAULT '0',
  `service_amount` double unsigned DEFAULT '0',
  `discount_percent` double unsigned DEFAULT '0',
  `discount_amount` double unsigned DEFAULT '0',
  `active` enum('0','1') NOT NULL DEFAULT '1',
  `notes` varchar(100) DEFAULT NULL,
  `update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_purchase_bill_ex`),
  KEY `fk.id_purchase_bill` (`fk.id_purchase_bill`),
  KEY `fk.id_product_sale_price` (`fk.id_product_sale_price`),
  KEY `fk.id_purchase_ex` (`fk.id_purchase_ex`),
  CONSTRAINT `purchase_bill_ex_ibfk_1` FOREIGN KEY (`fk.id_purchase_bill`) REFERENCES `purchase_bill` (`id_purchase_bill`) ON UPDATE CASCADE,
  CONSTRAINT `purchase_bill_ex_ibfk_3` FOREIGN KEY (`fk.id_product_sale_price`) REFERENCES `product_sale_price` (`id_product_sale_price`) ON UPDATE CASCADE,
  CONSTRAINT `purchase_bill_ex_ibfk_4` FOREIGN KEY (`fk.id_purchase_ex`) REFERENCES `purchase_ex` (`id_purchase_ex`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table purchase_bill_pay
# ------------------------------------------------------------

DROP TABLE IF EXISTS `purchase_bill_pay`;

CREATE TABLE `purchase_bill_pay` (
  `id_purchase_bill_pay` varchar(50) NOT NULL DEFAULT '' COMMENT 'MD5(LEFT(UUID(), 8))',
  `fk.id_purchase_bill` varchar(100) DEFAULT NULL,
  `value` double unsigned NOT NULL DEFAULT '0',
  `change` double unsigned NOT NULL DEFAULT '0',
  `active` enum('0','1') NOT NULL DEFAULT '1',
  `notes` varchar(100) DEFAULT NULL,
  `update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_purchase_bill_pay`),
  KEY `fk.id_purchase_bill` (`fk.id_purchase_bill`),
  CONSTRAINT `purchase_bill_pay_ibfk_1` FOREIGN KEY (`fk.id_purchase_bill`) REFERENCES `purchase_bill` (`id_purchase_bill`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table purchase_bill_pay_ex
# ------------------------------------------------------------

DROP TABLE IF EXISTS `purchase_bill_pay_ex`;

CREATE TABLE `purchase_bill_pay_ex` (
  `id_purchase_bill_pay_ex` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fk.id_purchase_bill_pay` varchar(50) DEFAULT NULL,
  `fk.id_payment_type` varchar(30) DEFAULT NULL,
  `reference` varchar(100) DEFAULT NULL,
  `value` double unsigned NOT NULL DEFAULT '0',
  `fk.id_bank` varchar(30) DEFAULT NULL,
  `active` enum('0','1') NOT NULL DEFAULT '1',
  `notes` varchar(100) DEFAULT NULL,
  `update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_purchase_bill_pay_ex`),
  KEY `fk.id_purchase_bill_pay` (`fk.id_purchase_bill_pay`),
  KEY `fk.id_payment_type` (`fk.id_payment_type`),
  KEY `fk.id_bank` (`fk.id_bank`),
  CONSTRAINT `purchase_bill_pay_ex_ibfk_1` FOREIGN KEY (`fk.id_purchase_bill_pay`) REFERENCES `purchase_bill_pay` (`id_purchase_bill_pay`) ON UPDATE CASCADE,
  CONSTRAINT `purchase_bill_pay_ex_ibfk_2` FOREIGN KEY (`fk.id_payment_type`) REFERENCES `payment_type` (`id_payment_type`) ON UPDATE CASCADE,
  CONSTRAINT `purchase_bill_pay_ex_ibfk_3` FOREIGN KEY (`fk.id_bank`) REFERENCES `bank` (`id_bank`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table purchase_ex
# ------------------------------------------------------------

DROP TABLE IF EXISTS `purchase_ex`;

CREATE TABLE `purchase_ex` (
  `id_purchase_ex` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `datetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `fk.id_purchase` varchar(50) DEFAULT NULL,
  `fk.id_product` varchar(30) DEFAULT NULL,
  `modifier` varchar(255) DEFAULT NULL,
  `qty` double unsigned NOT NULL DEFAULT '0',
  `discount` double unsigned NOT NULL DEFAULT '0',
  `void` double unsigned NOT NULL DEFAULT '0',
  `complimentary` double unsigned NOT NULL DEFAULT '0',
  `active` enum('0','1') DEFAULT '0',
  `notes` varchar(255) DEFAULT NULL,
  `update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_purchase_ex`),
  KEY `id_parent` (`fk.id_purchase`),
  KEY `fk.id_product` (`fk.id_product`),
  CONSTRAINT `purchase_ex_ibfk_1` FOREIGN KEY (`fk.id_purchase`) REFERENCES `purchase` (`id_purchase`) ON UPDATE CASCADE,
  CONSTRAINT `purchase_ex_ibfk_2` FOREIGN KEY (`fk.id_product`) REFERENCES `product` (`id_product`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table purchasing
# ------------------------------------------------------------

DROP TABLE IF EXISTS `purchasing`;

CREATE TABLE `purchasing` (
  `id_purchasing` varchar(30) NOT NULL DEFAULT '',
  `name` varchar(30) NOT NULL DEFAULT '',
  `active` enum('0','1') NOT NULL DEFAULT '0',
  `notes` varchar(100) DEFAULT '',
  PRIMARY KEY (`id_purchasing`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;



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



# Dump of table room
# ------------------------------------------------------------

DROP TABLE IF EXISTS `room`;

CREATE TABLE `room` (
  `id_room` varchar(30) NOT NULL DEFAULT '',
  `name` varchar(30) NOT NULL DEFAULT '',
  `active` enum('0','1') NOT NULL DEFAULT '0',
  `notes` varchar(100) DEFAULT '',
  PRIMARY KEY (`id_room`)
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



# Dump of table supplier
# ------------------------------------------------------------

DROP TABLE IF EXISTS `supplier`;

CREATE TABLE `supplier` (
  `id_supplier` varchar(30) NOT NULL DEFAULT '',
  `fk.id_contact` varchar(30) DEFAULT NULL,
  `fk.id_branch` varchar(30) DEFAULT NULL,
  `fk.id_supplier_group` varchar(30) DEFAULT NULL,
  `registered` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `restricted` varchar(30) DEFAULT NULL,
  `active` enum('0','1') NOT NULL DEFAULT '0',
  `notes` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_supplier`),
  KEY `fk.id_contact` (`fk.id_contact`),
  KEY `fk.id_branch` (`fk.id_branch`),
  KEY `fk.id_supplier_group` (`fk.id_supplier_group`),
  CONSTRAINT `supplier_ibfk_1` FOREIGN KEY (`fk.id_contact`) REFERENCES `contact` (`id_contact`) ON UPDATE CASCADE,
  CONSTRAINT `supplier_ibfk_2` FOREIGN KEY (`fk.id_branch`) REFERENCES `branch` (`id_branch`) ON UPDATE CASCADE,
  CONSTRAINT `supplier_ibfk_3` FOREIGN KEY (`fk.id_supplier_group`) REFERENCES `supplier_group` (`id_supplier_group`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table supplier_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `supplier_group`;

CREATE TABLE `supplier_group` (
  `id_supplier_group` varchar(30) NOT NULL DEFAULT '',
  `name` varchar(30) NOT NULL DEFAULT '',
  `active` enum('0','1') NOT NULL DEFAULT '0',
  `notes` varchar(100) DEFAULT '',
  PRIMARY KEY (`id_supplier_group`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table supplier_module
# ------------------------------------------------------------

DROP TABLE IF EXISTS `supplier_module`;

CREATE TABLE `supplier_module` (
  `id_supplier_module` varchar(30) NOT NULL DEFAULT '',
  `fk.id_supplier_module` varchar(30) DEFAULT NULL,
  `fk.id_supplier_group` varchar(30) DEFAULT NULL,
  `name` varchar(30) NOT NULL DEFAULT '',
  `handler` varchar(100) DEFAULT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `order` int(11) unsigned DEFAULT NULL,
  `active` enum('0','1') DEFAULT '0',
  `notes` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_supplier_module`),
  KEY `fk.id_supplier_group` (`fk.id_supplier_group`),
  KEY `fk.id_supplier_module` (`fk.id_supplier_module`),
  CONSTRAINT `supplier_module_ibfk_2` FOREIGN KEY (`fk.id_supplier_group`) REFERENCES `supplier_group` (`id_supplier_group`) ON UPDATE CASCADE,
  CONSTRAINT `supplier_module_ibfk_3` FOREIGN KEY (`fk.id_supplier_module`) REFERENCES `supplier_module` (`id_supplier_module`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table table
# ------------------------------------------------------------

DROP TABLE IF EXISTS `table`;

CREATE TABLE `table` (
  `id_table` varchar(30) NOT NULL DEFAULT '',
  `fk.id_room` varchar(30) NOT NULL DEFAULT '',
  `name` varchar(30) NOT NULL DEFAULT '',
  `capacity` int(11) unsigned DEFAULT '1',
  `active` enum('0','1') NOT NULL DEFAULT '0',
  `notes` varchar(100) DEFAULT '',
  PRIMARY KEY (`id_table`),
  KEY `fk.id_room` (`fk.id_room`),
  CONSTRAINT `table_ibfk_1` FOREIGN KEY (`fk.id_room`) REFERENCES `room` (`id_room`) ON UPDATE CASCADE
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
