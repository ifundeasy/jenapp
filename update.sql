DELETE FROM `_` WHERE `id` = 'harga';
INSERT INTO `_` (`id`, `query`, `active`, `notes`)
VALUES
	('harga', 'SELECT\n    a.id_product, a.name, b.name AS \'type\',\n    c.value AS \"product_purchase_price\", c.`id_product_purchase_price` AS \'id_product_purchase_price\',\n    d.value AS \"product_sale_price\", d.`id_product_sale_price` AS \'id_product_sale_price\'\nFROM product AS a\rJOIN `level` AS b ON a.`fk.id_level` = b.`id_level`\rLEFT JOIN (\r    SELECT * FROM (\r        SELECT * FROM product_purchase_price WHERE active = \'1\' ORDER BY `datetime` DESC, `value` DESC\r    ) AS x GROUP BY `fk.id_product`\r) AS c ON a.`id_product` = c.`fk.id_product`\nLEFT JOIN (\r    SELECT * FROM (\r        SELECT * FROM product_sale_price WHERE active = \'1\' ORDER BY `datetime` DESC, `value` DESC\r    ) AS y GROUP BY `fk.id_product`\r) AS d ON a.`id_product` = d.`fk.id_product`\nWHERE a.`active` = \'1\'\nORDER BY `type`, b.`name`;', '0', 'harga jual & harga beli');