<?php

$main = function ($app, $connect, $table) {
	$message = array();
	$message['success'] = false;
	$message['data'] = "";
	$message['query'] = "";
	$message['total'] = 1;
	$message['form-data'] = $app->request->post();

	foreach ($message['form-data'] as $key => $row){
		$x = preg_replace("/fk_/", "fk.", $key);
		unset($message['form-data'][$key]);
		$message['form-data'][$x] = $row;
	}

	if (!$connect->set_charset("utf8")) {
		$message['data'] = $connect->error;
	}

	if (!$connect->connect_errno) {
		$data = array();
		$table = $connect->real_escape_string($table);

		if ($table !== '_') {
			$fields = "";
			$values = "";

			$message['form-data']['active'] = '1';

			foreach ($message['form-data'] as $key => $row) {
				$key = $connect->real_escape_string($key);
				$row = $connect->real_escape_string($row);
				$fields .= "`$key`,";
				$values .= "'$row',";
				$data[] = $fields;
			}
			$fields = "(".substr($fields, 0, -1).")";
			$values = "(".substr($values, 0, -1).")";
			$query = "INSERT INTO `$table` $fields VALUES $values;";

			$message['query'] = $query;
			if ($result = $connect->query($query)) {
				$message['success'] = true;
			} else {
				$message['data'] = $connect->error;
			}

		} else {
			$message['data'] = "You can't inserting to this table!";
		}
	} else {
		$message['data'] = "Database connection problem.";
	}

	$connect->close();
	echo json_encode(array(
		"success" => $message['success'],
		"total" => $message['total'],
		"data" => $message['data'],
		"query" => $message['query'], //todo : hapus!
		"form-data" => $message['form-data']
	));
};