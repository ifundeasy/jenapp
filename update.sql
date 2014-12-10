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

## Falih's views
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

