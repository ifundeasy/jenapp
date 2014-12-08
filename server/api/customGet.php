<?php

$main = function ($app, $connect, $name) {
	$message = array();
	$message['success'] = false;
	$message['data'] = "";
	$message['total'] = 0;
	$message['query'] = "?";
	$message['params'] = $app->request->get();

	if (!$connect->set_charset("utf8")) {
		$message['data'] = $connect->error;
	}

	if (!$connect->connect_errno) {
		$data = array();
		$name = $connect->real_escape_string($name);
		$queryx = "SELECT * FROM `_` WHERE id = '$name';";

		if ($resultx = $connect->query($queryx)) {
			if($resultx->num_rows) {
				while ($objx = $resultx->fetch_object()) {
					$datax[] = $objx;
				}
				$query = $datax[0]->query;
				foreach (array_unique($message['params']) as $key => $row) {
					$key = $connect->real_escape_string($key);
					$row = $connect->real_escape_string($row);
					$query = preg_replace("/[$]$key/", "'".$row."'", $query);
				}

				if ($result = $connect->query($query)) {
					while ($obj = $result->fetch_object()) {
						$data[] = $obj;
					}

					$message['success'] = true;
					$message['query'] = $query;
					$message['data'] = $data;
					$message['total'] = count($data);
				} else {
					$message['data'] = "Error processing data!";
				}
			} else {
				$message['data'] = "Incorrect custom api name!";
			}
		} else {
			$message['data'] = "You have no MySQL custom API table, contact Administrator!";
		}
	} else {
		$message['data'] = "Database connection problem.";
	}

	echo json_encode(array(
		"success" => $message['success'],
		"total" => $message['total'],
		"data" => $message['data'],
		"query" => $message['query'], //todo : hapus!
		"params" => $message['params'] //todo : hapus!
	));
};