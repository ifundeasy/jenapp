<?php

$app = new \Slim\Slim();

$app->get('/', function () use ($app) {
	$app->response->headers->set('Content-Type', 'application/json');
    echo json_encode(array(
        "text" => "Hello World!"
    ));
});

$app->group('/api/:table(/)', function () use ($app) {
	$app->post('/', function ($table) use ($app) {
		$app->response->headers->set('Content-Type', 'application/json');

		$file = __DIR__."/api/tablePost.php";
		$connect = new mysqli(DB_HOST, DB_USER, DB_PASS, DB_NAME);

		require $file;

		return $main($app, $connect, $table);
	});
    $app->get('/', function ($table) use ($app) {
	    $app->response->headers->set('Content-Type', 'application/json');

        $file = __DIR__."/api/tableGet.php";
        $connect = new mysqli(DB_HOST, DB_USER, DB_PASS, DB_NAME);
        
        require $file;
        
        return $main($app, $connect, $table);
    });
	$app->get('/:value(/)', function ($table, $value) use ($app) {
		$app->response->headers->set('Content-Type', 'application/json');

		$file = __DIR__."/api/tableGetId.php";
		$connect = new mysqli(DB_HOST, DB_USER, DB_PASS, DB_NAME);

		require $file;

		return $main($app, $connect, $table, $value);
	});
    $app->put('/:field/:value(/)', function ($table, $field, $value) use ($app) {
	    $app->response->headers->set('Content-Type', 'application/json');

        $file = __DIR__."/api/tablePutId.php";
        $connect = new mysqli(DB_HOST, DB_USER, DB_PASS, DB_NAME);

        require $file;

        return $main($app, $connect, $table, $field, $value);
    });
    $app->delete('/:field/:value(/)', function ($table, $field, $value) use ($app) {
	    $app->response->headers->set('Content-Type', 'application/json');

        $file = __DIR__."/api/tableDeleteId.php";
        $connect = new mysqli(DB_HOST, DB_USER, DB_PASS, DB_NAME);

        require $file;

        return $main($app, $connect, $table, $field, $value);
    });
});

$app->group('/custom/:name(/)', function () use ($app) {
    $app->get('/', function ($name) use ($app){
	    $app->response->headers->set('Content-Type', 'application/json');

	    $file = __DIR__."/api/customGet.php";
	    $connect = new mysqli(DB_HOST, DB_USER, DB_PASS, DB_NAME);

	    require $file;

	    return $main($app, $connect, $name);
    });
});