<?php

require 'vendor/autoload.php';
require 'config/db.php';
require 'routing.php';

//$_ENV['SLIM_MODE'] = 'production';

$app->run();