<?php
	session_start();
	require_once("../app_connection.php");
	if (isset($_SESSION['user_login']) AND $_SESSION['user_login'] == 1) {
		$user_name = $db_connection->real_escape_string($_GET['InputUsername']);
		$sql = "SELECT user_name FROM contact WHERE user_name = '" . $user_name . "';";
		$result = $db_connection->query($sql);
		if ($result->num_rows == 1) {
			echo "Username telah terdaftar.";
		} else {
			echo null;
		}
	} else {
		echo "Terjadi kesalahan sistem.";
	}
?>