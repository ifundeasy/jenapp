<?php

$main = function ($app, $connect, $table, $field, $value) {
	$message = array();
	$message['success'] = false;
	$message['data'] = "";
	$message['total'] = 0;
	$message['params'] = [];
	//$message['params'] = $app->request->delete();

	if (!$connect->set_charset("utf8")) {
		$message['data'] = $connect->error;
	}

	if (!$connect->connect_errno) {
		$data = array();
		$delete = array();
		$table = $connect->real_escape_string($table);

		if ($table !== '_') {
			$field = $connect->real_escape_string($field);
			$value = $connect->real_escape_string($value);
			$queryx = "SELECT * FROM `$table` WHERE `$field` = '$value' AND `active`='1';";

			if ($resultx = $connect->query($queryx)) {
				if($resultx->num_rows) {
					while ($objx = $resultx->fetch_object()) {
						$delete[] = $objx;
					}

					$message['params'] = $delete;
					$message['total'] = $resultx->num_rows;

					$query = "UPDATE `$table` SET `active`='0' WHERE `$field` = '$value' AND `active`='1';";

					foreach ($message['params'] as $key => $row) {
						$data[$key] = array(
							"row" => $row
						);
						if ($result = $connect->query($query)) {
							$data[$key]['success'] = true;
						} else {
							$data[$key]['error'] = $connect->error;
							$data[$key]['success'] = false;
						}
					}

					$message['success'] = (count(array_filter($data, function($el) {
							return $el['success'] == true;
						})) == count($data));

					$message['data'] = $data;
				} else {
					$message['data'] = "Your data $field = $value on $table is doesn't exist!";
				}
			} else {
				$message['data'] = "Your URL have incorrect table, field, or value!";
			}
		} else {
			$message['data'] = "You can't remove this table!";
		}
	} else {
		$message['data'] = "Database connection problem.";
	}

	$connect->close();
	echo json_encode(array(
		"success" => $message['success'],
		"total" => $message['total'],
		"data" => $message['data'],
		"params" => $message['params'],
	));
};