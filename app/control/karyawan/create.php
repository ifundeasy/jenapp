<?php
	session_start();
	require_once("../app_connection.php");
	if (isset($_SESSION['user_login']) AND $_SESSION['user_login'] == 1) {
		$user_name 		= $db_connection->real_escape_string($_POST['InputUsername']);
		$user_pass 		= password_hash($db_connection->real_escape_string($_POST['InputPassword']), PASSWORD_DEFAULT);
		$first_name 	= $db_connection->real_escape_string($_POST['InputNamaDepan']);
		$last_name 		= $db_connection->real_escape_string($_POST['InputNamaBelakang']);
		$email 			= $db_connection->real_escape_string($_POST['InputEmail']);
		$date_of_birth 	= $db_connection->real_escape_string($_POST['InputTgLahir']);
		$gender 		= $db_connection->real_escape_string($_POST['InputGender']);
		$notes 			= $db_connection->real_escape_string($_POST['InputCatatan']);
		$rand 			= $user_name.substr(md5(microtime()),rand(0,26),3);

		$sql = "INSERT INTO contact (`id_contact`, `pin`, `user_name`, `user_pass`, `first_name`, `last_name`, `alias`, `registered`, `date_of_birth`, `genre`, `blood`, `picture`, `allow_access`, `notes`)values ('".$rand."', '', '".$user_name."', '".$user_pass."', '".$first_name."', '".$last_name."', '', now(), '".$date_of_birth."', '".$gender."', '', '', '', '', 1, '".$notes."')";
		$result = $db_connection->query($sql);
		echo $sql;
	} else {
		
	}

?>