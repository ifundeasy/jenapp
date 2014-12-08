<?php
	require_once($_SERVER['DOCUMENT_ROOT']."/zen/server/config/db.php");
	$db_connection = new mysqli(DB_HOST, DB_USER, DB_PASS, DB_NAME);
?>