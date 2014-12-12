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

## Falih views
CREATE 
ALGORITHM=UNDEFINED 
DEFINER=`root`@`localhost` 
SQL SECURITY DEFINER 
VIEW `internal_karyawan` AS 
SELECT
  `a`.`id_internal` AS `id`,
  `b`.`first_name` AS `nama_depan`,
  `b`.`last_name` AS `nama_belakang`,
  `c`.`name` AS `cabang`,
  `d`.`name` AS `grup`,
  `a`.`active`
FROM
  (
    (
      (
        `internal` `a`
        RIGHT JOIN `contact` `b` ON (
          (
            `a`.`fk.id_contact` = `b`.`id_contact`
          )
        )
      )
      LEFT JOIN `branch` `c` ON (
        (
          `a`.`fk.id_branch` = `c`.`id_branch`
        )
      )
    )
    LEFT JOIN `internal_group` `d` ON (
      (
        `a`.`fk.id_internal_group` = `d`.`id_internal_group`
      )
    )
  ) ;
  CREATE 
ALGORITHM=UNDEFINED 
DEFINER=`root`@`localhost` 
SQL SECURITY DEFINER 
VIEW `view_outlet` AS 
SELECT
  a.id_member AS `id`,
  b.first_name AS `nama_outlet`,
  a.notes,
  a.active
FROM
  member AS a
JOIN contact AS b ON a.`fk.id_contact` = b.id_contact
WHERE
  a.`fk.id_member_group` = 'outlet' ;
  CREATE 
ALGORITHM=UNDEFINED 
DEFINER=`root`@`localhost` 
SQL SECURITY DEFINER 
VIEW `view_supplier` AS 
SELECT
  a.id_supplier,
  b.first_name,
  a.`fk.id_branch`,
  c.`name`,
  a.notes,
  a.active
FROM
  supplier AS a
JOIN contact AS b ON a.`fk.id_contact` = b.id_contact
JOIN supplier_group AS c ON a.`fk.id_supplier_group` = c.id_supplier_group ;
## --------------------------------------------------------------------------------------------------------------------------------------------------
## --------------------------------------------------------------------------------------------------------------------------------------------------

# Custom api get product_ex clean
INSERT INTO `_` (`id`, `query`, `active`, `notes`)
VALUES
	('purchase', 'SELECT DISTINCT(X.`fk.id_purchase`) AS \'id_purchase\' FROM (\n    SELECT\n        purchase_ex.`id_purchase_ex`, purchase_ex.`datetime`, purchase_ex.`fk.id_purchase`, purchase_ex.`fk.id_product`,\n        purchase_ex.`modifier`,\n        IF(ISNULL(purchase_ex.`qty` - purchase_bill_ex_.`sum_qty`), purchase_ex.`qty`, (purchase_ex.`qty` - purchase_bill_ex_.`sum_qty`))  AS \'qty\',\n        IF(ISNULL(purchase_bill_ex_.`sum_qty`), 0, purchase_bill_ex_.`sum_qty`)  AS \'sum_qty\',\n        purchase_ex.`fk.id_product_purchase_price`, purchase_ex.`discount`, purchase_ex.`void`, purchase_ex.`complimentary`, purchase_ex.`active`, purchase_ex.`notes`,\n        product.name AS \'name_product\', product_purchase_price.`value`AS \'harga_beli\'\n    FROM purchase_ex\n    LEFT JOIN product ON purchase_ex.`fk.id_product` = product.`id_product`\n    LEFT JOIN product_purchase_price ON purchase_ex.`fk.id_product_purchase_price` = product_purchase_price.`id_product_purchase_price`\n    LEFT JOIN (SELECT *, sum(`qty`) AS \'sum_qty\' FROM purchase_bill_ex WHERE `active` = \'1\' GROUP BY `fk.id_purchase_ex`, `fk.id_product_purchase_price`) AS purchase_bill_ex_\n        ON purchase_ex.`id_purchase_ex` = purchase_bill_ex_.`fk.id_purchase_ex`\n    WHERE purchase_ex.`active` = \'1\'\n) AS X JOIN purchase ON purchase.`id_purchase` = X.`fk.id_purchase` WHERE purchase.`pic` = $id_supplier AND X.`qty` > 0 ORDER BY X.`fk.id_purchase`;', '0', 'clean join with product & product_purchase_price'),
	('purchase_ex', 'SELECT X.* FROM (\n    SELECT\n        purchase_ex.`id_purchase_ex`, purchase_ex.`datetime`, purchase_ex.`fk.id_purchase`, purchase_ex.`fk.id_product`,\n        purchase_ex.`modifier`,\n        IF(ISNULL(purchase_ex.`qty` - purchase_bill_ex_.`sum_qty`), purchase_ex.`qty`, (purchase_ex.`qty` - purchase_bill_ex_.`sum_qty`))  AS \'qty\',\n        IF(ISNULL(purchase_bill_ex_.`sum_qty`), 0, purchase_bill_ex_.`sum_qty`)  AS \'sum_qty\',\n        purchase_ex.`fk.id_product_purchase_price`, purchase_ex.`discount`, purchase_ex.`void`, purchase_ex.`complimentary`, purchase_ex.`active`, purchase_ex.`notes`,\n        product.name AS \'name_product\', product_purchase_price.`value`AS \'harga_beli\'\n    FROM purchase_ex\n    LEFT JOIN product ON purchase_ex.`fk.id_product` = product.`id_product`\n    LEFT JOIN product_purchase_price ON purchase_ex.`fk.id_product_purchase_price` = product_purchase_price.`id_product_purchase_price`\n    LEFT JOIN (SELECT *, sum(`qty`) AS \'sum_qty\' FROM purchase_bill_ex WHERE `active` = \'1\' GROUP BY `fk.id_purchase_ex`, `fk.id_product_purchase_price`) AS purchase_bill_ex_\n        ON purchase_ex.`id_purchase_ex` = purchase_bill_ex_.`fk.id_purchase_ex`\n    WHERE purchase_ex.`fk.id_purchase` = $id_purchase AND purchase_ex.`active` = \'1\' AND !isNULL(purchase_ex.`fk.id_purchase`)\n) AS X WHERE X.`qty` > 0 ORDER BY X.`fk.id_purchase`;', '0', 'join with product & product_purchase_price');
## --------------------------------------------------------------------------------------------------------------------------------------------------
## --------------------------------------------------------------------------------------------------------------------------------------------------

# Return tables (sales & purchase)
-- Create syntax for TABLE 'purchase_return'
CREATE TABLE `purchase_return` (
  `id_purchase_return` VARCHAR(50) NOT NULL DEFAULT '',
  `datetime` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
  `fk.id_internal` VARCHAR(30) NOT NULL DEFAULT '',
  `fk.id_supplier` VARCHAR(50) DEFAULT NULL,
  `active` ENUM('0','1') NOT NULL DEFAULT '0',
  `notes` VARCHAR(100) DEFAULT NULL,
  `update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_purchase_return`),
  KEY `fk.id_internal` (`fk.id_internal`),
  KEY `fk.id_supplier` (`fk.id_supplier`),
  CONSTRAINT `purchase_return_ibfk_1` FOREIGN KEY (`fk.id_internal`) REFERENCES `internal` (`id_internal`) ON UPDATE CASCADE,
  CONSTRAINT `purchase_return_ibfk_2` FOREIGN KEY (`fk.id_supplier`) REFERENCES `supplier` (`id_supplier`) ON UPDATE CASCADE
) ENGINE=INNODB DEFAULT CHARSET=latin1;

-- Create syntax for TABLE 'purchase_return_ex'
CREATE TABLE `purchase_return_ex` (
  `id_purchase_return_ex` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `datetime` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
  `fk.id_purchase_return` VARCHAR(50) DEFAULT NULL,
  `fk.id_purchase_bill_ex` BIGINT(20) UNSIGNED DEFAULT NULL,
  `modifier` VARCHAR(255) DEFAULT NULL,
  `qty` DOUBLE UNSIGNED NOT NULL DEFAULT '0',
  `discount` DOUBLE UNSIGNED NOT NULL DEFAULT '0',
  `void` DOUBLE UNSIGNED NOT NULL DEFAULT '0',
  `complimentary` DOUBLE UNSIGNED NOT NULL DEFAULT '0',
  `tax_percent` DOUBLE UNSIGNED DEFAULT '0',
  `tax_amount` DOUBLE UNSIGNED DEFAULT '0',
  `service_percent` DOUBLE UNSIGNED DEFAULT '0',
  `service_amount` DOUBLE UNSIGNED DEFAULT '0',
  `discount_percent` DOUBLE UNSIGNED DEFAULT '0',
  `discount_amount` DOUBLE UNSIGNED DEFAULT '0',
  `active` ENUM('0','1') DEFAULT '0',
  `notes` VARCHAR(255) DEFAULT NULL,
  `update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_purchase_return_ex`),
  KEY `fk.id_purchase_return` (`fk.id_purchase_return`),
  KEY `fk.id_purchase_bill_ex` (`fk.id_purchase_bill_ex`),
  CONSTRAINT `purchase_return_ex_ibfk_1` FOREIGN KEY (`fk.id_purchase_return`) REFERENCES `purchase_return` (`id_purchase_return`) ON UPDATE CASCADE,
  CONSTRAINT `purchase_return_ex_ibfk_2` FOREIGN KEY (`fk.id_purchase_bill_ex`) REFERENCES `purchase_bill_ex` (`id_purchase_bill_ex`) ON UPDATE CASCADE
) ENGINE=INNODB DEFAULT CHARSET=latin1;

-- Create syntax for TABLE 'pos_return'
CREATE TABLE `pos_return` (
  `id_pos_return` VARCHAR(50) NOT NULL DEFAULT '',
  `datetime` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
  `fk.id_internal` VARCHAR(30) NOT NULL DEFAULT '',
  `fk.id_member` VARCHAR(50) DEFAULT NULL,
  `active` ENUM('0','1') NOT NULL DEFAULT '0',
  `notes` VARCHAR(100) DEFAULT NULL,
  `update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_pos_return`),
  KEY `fk.id_internal` (`fk.id_internal`),
  KEY `fk.id_member` (`fk.id_member`),
  CONSTRAINT `pos_return_ibfk_1` FOREIGN KEY (`fk.id_internal`) REFERENCES `internal` (`id_internal`) ON UPDATE CASCADE,
  CONSTRAINT `pos_return_ibfk_2` FOREIGN KEY (`fk.id_member`) REFERENCES `member` (`id_member`) ON UPDATE CASCADE
) ENGINE=INNODB DEFAULT CHARSET=latin1;

-- Create syntax for TABLE 'pos_return_ex'
CREATE TABLE `pos_return_ex` (
  `id_pos_return_ex` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `datetime` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
  `fk.id_pos_return` VARCHAR(50) DEFAULT NULL,
  `fk.id_pos_bill_ex` BIGINT(20) UNSIGNED DEFAULT NULL,
  `modifier` VARCHAR(255) DEFAULT NULL,
  `qty` DOUBLE UNSIGNED NOT NULL DEFAULT '0',
  `discount` DOUBLE UNSIGNED NOT NULL DEFAULT '0',
  `void` DOUBLE UNSIGNED NOT NULL DEFAULT '0',
  `complimentary` DOUBLE UNSIGNED NOT NULL DEFAULT '0',
  `tax_percent` DOUBLE UNSIGNED DEFAULT '0',
  `tax_amount` DOUBLE UNSIGNED DEFAULT '0',
  `service_percent` DOUBLE UNSIGNED DEFAULT '0',
  `service_amount` DOUBLE UNSIGNED DEFAULT '0',
  `discount_percent` DOUBLE UNSIGNED DEFAULT '0',
  `discount_amount` DOUBLE UNSIGNED DEFAULT '0',
  `active` ENUM('0','1') DEFAULT '0',
  `notes` VARCHAR(255) DEFAULT NULL,
  `update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_pos_return_ex`),
  KEY `fk.id_pos_return` (`fk.id_pos_return`),
  KEY `fk.id_pos_bill_ex` (`fk.id_pos_bill_ex`),
  CONSTRAINT `pos_return_ex_ibfk_1` FOREIGN KEY (`fk.id_pos_return`) REFERENCES `pos_return` (`id_pos_return`) ON UPDATE CASCADE,
  CONSTRAINT `pos_return_ex_ibfk_2` FOREIGN KEY (`fk.id_pos_bill_ex`) REFERENCES `pos_bill_ex` (`id_pos_bill_ex`) ON UPDATE CASCADE
) ENGINE=INNODB DEFAULT CHARSET=latin1;
## --------------------------------------------------------------------------------------------------------------------------------------------------
## --------------------------------------------------------------------------------------------------------------------------------------------------