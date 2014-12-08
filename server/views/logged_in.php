<div id="wrapper">
	<!-- Sidebar -->
	<div id="sidebar-wrapper">
		<ul class="sidebar-nav">
			<!--<li class="sidebar-brand"><a>Module</a></li>-->
			<li class="divider" togo="home-page"><a id="home-page">Home</a></li>
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
				<a id="brand" class="navbar-brand" href="#">Company</a>
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
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
							<?php
								$contact_id = $_SESSION['id_contact'];
								$fullname = $_SESSION['first_name'].' '.$_SESSION['last_name'];
								echo "<span id='contact' contact=$contact_id>".ucwords($fullname).'</span>';
							?>
							<span class="caret"></span></a>
						<ul theme class="dropdown-menu" role="menu">
							<li class="dropdown-header">Now</li>
							<li><a>Profile</a></li>
							<li class="divider"></li>
							<li>
								<a id="logout">Logout</a>
								<form method="post" action="./" style="display: none;">
									<input id="logout" type="submit" name="logout" value="Logout">
								</form>
							</li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
	</nav>

	<div id="content" class="container">
		<!---->
	</div>
</div>
<footer class="footer">
	<div class="container">
		<div class="text-right">copyright of helloworld, 2014.</div>
	</div>
</footer>