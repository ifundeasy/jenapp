<?php

$main = function ($app, $connect, $table) {
	require_once __DIR__."/urlQuery.php";

    $message = array();
    $message['success'] = false;
	$message['data'] = "";
	$message['total'] = 0;
    $message['params'] = $urlQuery($connect, $app->request->get(), $connect->real_escape_string($table));

    if (!$connect->set_charset("utf8")) {
        $message['data'] = $connect->error;
    }
    
    if (!$connect->connect_errno) {
        $data = array();
        $table = $connect->real_escape_string($table);
        $query = $message['params']['sqldata'];

        if ($result = $connect->query($query)) {
            while ($obj = $result->fetch_object()) {
                $data[] = $obj;
            }
            
            $message['success'] = true;
            $message['data'] = $data;
            $message['total'] = intval($connect->query($message['params']['sqltotal'])->fetch_object()->total);
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
		"data" => $message['data'],
		"params" => $message['params'], //todo : hapus!
    ));
};