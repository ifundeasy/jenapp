<?php

$main = function ($app, $connect, $table, $value) {
	$message = array();
	$message['success'] = false;
	$message['data'] = "";
	$message['total'] = 0;

	if (!$connect->set_charset("utf8")) {
		$message['data'] = $connect->error;
	}

	if (!$connect->connect_errno) {
		$data = array();
		$table = $connect->real_escape_string($table);
		$value = $connect->real_escape_string($value);
		$queryx = "SHOW INDEX FROM `$table` WHERE Key_name = 'PRIMARY' ;";
		$primaryKey = null;

		if ($resultx = $connect->query($queryx)) {
			while ($objx = $resultx->fetch_object()) {
				$primaryKey = $objx->Column_name;
			}

			if(!$primaryKey) {
				$resulty = $connect->query("DESCRIBE `$table`;");
				while ($objy = $resulty->fetch_object()) {
					$primaryKey[] = $objy;
				}

				$primaryKey = $primaryKey[0]->Field;
			}

			$query = "SELECT * FROM `$table` WHERE `$primaryKey` = '$value' AND `active` = '1';";
			if ($result = $connect->query($query)) {
				while ($obj = $result->fetch_object()) {
					$data[] = $obj;
				}

				$message['success'] = true;
				$message['data'] = $data;
				$message['total'] = intval($connect->query("SELECT count(*) as total FROM `$table` WHERE `active` = '1'")->fetch_object()->total);
			} else {
				$message['data'] = "Error getting data!";
			}
		} else {
			$message['data'] = "Incorrect table name!";
		}
	} else {
		$message['data'] = "Database connection problem.";
	}

	$connect->close();
	echo json_encode(array(
		"success" => $message['success'],
		"total" => $message['total'],
		"data" => $message['data']
	));
};