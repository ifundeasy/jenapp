# ubah custom sql;
DELETE FROM `_` WHERE `id` = 'harga';
INSERT INTO `_` (`id`, `query`, `active`, `notes`)
VALUES
	('harga', 'SELECT\n    a.id_product, a.name, b.name AS \'type\',\n    c.value AS \"product_purchase_price\", c.`id_product_purchase_price` AS \'id_product_purchase_price\',\n    d.value AS \"product_sale_price\", d.`id_product_sale_price` AS \'id_product_sale_price\'\nFROM product AS a\rJOIN `level` AS b ON a.`fk.id_level` = b.`id_level`\rLEFT JOIN (\r    SELECT * FROM (\r        SELECT * FROM product_purchase_price WHERE active = \'1\' ORDER BY `datetime` DESC, `value` DESC\r    ) AS x GROUP BY `fk.id_product`\r) AS c ON a.`id_product` = c.`fk.id_product`\nLEFT JOIN (\r    SELECT * FROM (\r        SELECT * FROM product_sale_price WHERE active = \'1\' ORDER BY `datetime` DESC, `value` DESC\r    ) AS y GROUP BY `fk.id_product`\r) AS d ON a.`id_product` = d.`fk.id_product`\nWHERE a.`active` = \'1\'\nORDER BY `type`, b.`name`;', '0', 'harga jual & harga beli');
## --------------------------------------------------------------------------------------------------------------------------------------------------
## --------------------------------------------------------------------------------------------------------------------------------------------------

# tambah data group member;
INSERT INTO `zen`.`member_group` (`id_member_group`, `name`, `active`, `notes`) VALUES ('outlet', 'Outlet', '1', '');
INSERT INTO `zen`.`member_group` (`id_member_group`, `name`, `active`, `notes`) VALUES ('konsinyasi', 'Konsinyasi', '1', '');
## --------------------------------------------------------------------------------------------------------------------------------------------------
## --------------------------------------------------------------------------------------------------------------------------------------------------

# ubah struktur tabel pos_ex, purchase_ex, purchase_bill;
DROP TABLE IF EXISTS `pos_ex`;
CREATE TABLE `pos_ex` (
  `id_pos_ex` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `datetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `fk.id_pos` varchar(50) DEFAULT NULL,
  `fk.id_product` varchar(30) DEFAULT NULL,
  `modifier` varchar(255) DEFAULT NULL,
  `qty` double unsigned NOT NULL DEFAULT '0',
  `fk.id_product_sale_price` int(10) unsigned DEFAULT NULL,
  `discount` double unsigned NOT NULL DEFAULT '0',
  `void` double unsigned NOT NULL DEFAULT '0',
  `complimentary` double unsigned NOT NULL DEFAULT '0',
  `active` enum('0','1') DEFAULT '0',
  `notes` varchar(255) DEFAULT NULL,
  `update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_pos_ex`),
  KEY `id_parent` (`fk.id_pos`),
  KEY `fk.id_product` (`fk.id_product`),
  KEY `fk.id_product_sale_price` (`fk.id_product_sale_price`),
  CONSTRAINT `pos_ex_ibfk_3` FOREIGN KEY (`fk.id_product_sale_price`) REFERENCES `product_sale_price` (`id_product_sale_price`) ON UPDATE CASCADE,
  CONSTRAINT `pos_ex_ibfk_1` FOREIGN KEY (`fk.id_pos`) REFERENCES `pos` (`id_pos`) ON UPDATE CASCADE,
  CONSTRAINT `pos_ex_ibfk_2` FOREIGN KEY (`fk.id_product`) REFERENCES `product` (`id_product`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `purchase_ex`;

CREATE TABLE `purchase_ex` (
  `id_purchase_ex` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `datetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `fk.id_purchase` varchar(50) DEFAULT NULL,
  `fk.id_product` varchar(30) DEFAULT NULL,
  `modifier` varchar(255) DEFAULT NULL,
  `qty` double unsigned NOT NULL DEFAULT '0',
  `fk.id_product_purchase_price` int(11) unsigned DEFAULT NULL,
  `discount` double unsigned NOT NULL DEFAULT '0',
  `void` double unsigned NOT NULL DEFAULT '0',
  `complimentary` double unsigned NOT NULL DEFAULT '0',
  `active` enum('0','1') DEFAULT '0',
  `notes` varchar(255) DEFAULT NULL,
  `update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_purchase_ex`),
  KEY `id_parent` (`fk.id_purchase`),
  KEY `fk.id_product` (`fk.id_product`),
  KEY `fk.id_product_purchase_price` (`fk.id_product_purchase_price`),
  CONSTRAINT `purchase_ex_ibfk_3` FOREIGN KEY (`fk.id_product_purchase_price`) REFERENCES `product_purchase_price` (`id_product_purchase_price`) ON UPDATE CASCADE,
  CONSTRAINT `purchase_ex_ibfk_1` FOREIGN KEY (`fk.id_purchase`) REFERENCES `purchase` (`id_purchase`) ON UPDATE CASCADE,
  CONSTRAINT `purchase_ex_ibfk_2` FOREIGN KEY (`fk.id_product`) REFERENCES `product` (`id_product`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `purchase_bill`;

CREATE TABLE `purchase_bill` (
  `id_purchase_bill` varchar(50) NOT NULL DEFAULT '',
  `datetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `fk.id_internal` varchar(30) DEFAULT NULL,
  `fk.id_supplier` varchar(30) DEFAULT NULL,
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
  KEY `fk.id_member` (`fk.id_supplier`),
  CONSTRAINT `purchase_bill_ibfk_2` FOREIGN KEY (`fk.id_supplier`) REFERENCES `supplier` (`id_supplier`) ON UPDATE CASCADE,
  CONSTRAINT `purchase_bill_ibfk_1` FOREIGN KEY (`fk.id_internal`) REFERENCES `internal` (`id_internal`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
## --------------------------------------------------------------------------------------------------------------------------------------------------
## --------------------------------------------------------------------------------------------------------------------------------------------------