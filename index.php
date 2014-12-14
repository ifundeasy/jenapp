<!DOCTYPE html>
<html lang="en" app="ceramic">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
	<meta http-equiv="Pragma" content="no-cache" />
	<meta http-equiv="Expires" content="0" />
	<title>Company</title>

	<link theme="paper" rel="stylesheet" href="./bower/bootswatch/paper/bootstrap.min.css">
	<link rel="stylesheet" href="./lib/DataTables-1.10.4/examples/resources/bootstrap/3/dataTables.bootstrap.css">
	<link rel="stylesheet" href="./lib/bootstrap-duallistbox/dist/bootstrap-duallistbox.min.css">
	<link rel="stylesheet" href="./lib/bootstrap-datepicker/css/datepicker3.css">
	<link rel="stylesheet" href="./res/css/simple-sidebar.css">
	<link id="customStyles" rel="stylesheet" href="./res/css/app.css">

	<script type="text/javascript" src="./bower/jquery/dist/jquery.min.js"></script>
	<script type="text/javascript" src="./bower/underscore/underscore-min.js"></script>
	<script type="text/javascript" src="./bower/backbone/backbone.js"></script>
	<script type="text/javascript" src="./bower/bootstrap/dist/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="./lib/DataTables-1.10.4/media/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="./lib/DataTables-1.10.4/examples/resources/bootstrap/3/dataTables.bootstrap.js"></script>
	<script type="text/javascript" src="./lib/bootstrap-duallistbox/dist/jquery.bootstrap-duallistbox.min.js"></script>
	<script type="text/javascript" src="./lib/jquery.autocomplete.min.js"></script>
	<script type="text/javascript" src="./lib/dateformat.js"></script>
	<script type="text/javascript" src="./lib/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
	<script type="text/javascript" src="./lib/jquery-watch.min.js"></script>
	<script type="text/javascript" src="./lib/titlecase.js"></script>
</head>
<body>
<?php
	/**
	 * A simple, clean and secure PHP Login Script / MINIMAL VERSION
	 * For more versions (one-file, advanced, framework-like) visit http://www.php-login.net
	 *
	 * Uses PHP SESSIONS, modern password-hashing and salting and gives the basic functions a proper login system needs.
	 *
	 * @author Panique
	 * @link https://github.com/panique/php-login-minimal/
	 * @license http://opensource.org/licenses/MIT MIT License
	 */

	/**
	 * header('Cache-Control: no-cache, no-store, must-revalidate'); // HTTP 1.1.
	 * header('Pragma: no-cache'); // HTTP 1.0.
	 * header('Expires: 0'); // Proxies.
	 */

	if (version_compare(PHP_VERSION, '5.3.7', '<')) {
		exit("Sorry, Simple PHP Login does not run on a PHP version smaller than 5.3.7 !");
	} else if (version_compare(PHP_VERSION, '5.5.0', '<')) {
		require_once("./server/libraries/password_compatibility_library.php");
	}

	require_once("./server/config/db.php");
	require_once("./server/classes/Login.php");

	$login = new Login();

	if ($login->isUserLoggedIn() == true) {
		unset($_SERVER['allowed']);
		include("./server/views/logged_in.php");
		echo "<script type='text/javascript' src='./app.js'></script>";
	} else {
		include("./server/views/not_logged_in.php");
	}
?>
</body>
</html>