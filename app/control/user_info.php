<?php
	session_start();
	echo json_encode(array(
		$_SESSION['id_contact'],
		$_SESSION['user_name'],
		$_SESSION['first_name'],
		$_SESSION['last_name']
	));
?>