<!DOCTYPE html>
<html lang="en" app="ceramic">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Ceramic</title>

	<link theme="paper" rel="stylesheet" href="./bower/bootswatch/paper/bootstrap.min.css">
	<link rel="stylesheet" href="./res/css/simple-sidebar.css">
	<link id="customStyles" rel="stylesheet" href="./res/css/app.css">
	<script type="text/javascript" src="./bower/jquery/dist/jquery.min.js"></script>
	<script type="text/javascript" src="./bower/underscore/underscore-min.js"></script>
	<script type="text/javascript" src="./bower/backbone/backbone.js"></script>
	<script type="text/javascript" src="./bower/bootstrap/dist/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="./lib/jquery-watch.min.js"></script>
	<script type="text/javascript" src="./lib/titlecase.js"></script>
</head>
<body> <!--style="padding-top: 83px;"-->
<div id="wrapper">
	<!-- Sidebar -->
	<div id="sidebar-wrapper">
		<ul class="sidebar-nav">
			<!--<li class="sidebar-brand"><a>Module</a></li>-->
			<li class="divider" togo="home-page"><a id="home-page">Home</a></li>
			<li class="divider">Master</li>
			<li togo="coa-page"><a id="coa-page">Coa</a></li>
			<li togo="contact-page"><a id="contact-page">Contact</a></li>
			<li togo="product-page"><a>Product</a></li>
			<li class="divider">Purchasing</li>
			<li togo="purchasing-quotation-page"><a>Quotation</a></li>
			<li togo="purchasing-order-page"><a>Order</a></li>
			<li togo="purchasing-billing-page"><a>Billing</a></li>
			<li togo="purchasing-payment-page"><a>Payment</a></li>
			<li togo="purchasing-return-page"><a>Return</a></li>
			<li class="divider">Selling</li>
			<li togo="selling-quotation-page"><a>Quotation</a></li>
			<li togo="selling-order-page"><a>Order</a></li>
			<li togo="selling-billing-page"><a>Billing</a></li>
			<li togo="selling-payment-page"><a>Payment</a></li>
			<li togo="selling-return-page"><a>Return</a></li>
			<li class="divider">Report</li>
			<li togo="selling-hutang-page"><a>Hutang</a></li>
			<li togo="selling-piutang-page"><a>Piutang</a></li>
			<li togo="selling-stock #1-page"><a>Stock #1</a></li>
			<li togo="selling-stock #2-page"><a>Stock #2</a></li>
		</ul>
	</div>

	<nav class="navbar navbar-default navbar-fixed-top" role="navigation"> <!--mode="fixed"-->
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a id="brand" class="navbar-brand" href="#">Ceramic</a>
			</div>
			<div id="navbar" class="navbar-right navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">Theme <span class="caret"></span></a>
						<ul theme class="dropdown-menu" role="menu">
							<li class="dropdown-header">Now</li>
							<li active=""><a>Separated link</a></li>
							<li class="divider"></li>
							<?php
								$path = './bower/bootswatch/';
								$results = scandir($path);

								foreach ($results as $result) {
									if ($result === '.' or $result === '..' or $result === 'fonts') continue;
									$text = ucwords($result);
									if (is_dir($path . '/' . $result)) {
										echo "<li name='$result'><a>$text</a></li>";
									}
								}
							?>
						</ul>
					</li>
				</ul>
			</div>
		</div>
	</nav>

	<div id="content" class="container">
		<!---->
	</div>

	<footer style="margin-top: 50px;"><hr></footer>

</div>
<script type="text/javascript" src="./app.js"></script>
<script>
	if (window.localStorage.ceramicAppTheme) {
		$('link[theme]').attr('href', "./bower/bootswatch/" + window.localStorage.ceramicAppTheme + "/bootstrap.min.css");
	} else {
		window.localStorage.ceramicAppTheme = $('link[theme]').attr('theme');
	}
</script>
</body>
</html>