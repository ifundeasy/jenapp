<?php
$hash = password_hash($_POST['user_pass'], PASSWORD_DEFAULT);
echo $hash;
?>