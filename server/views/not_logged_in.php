<div class="wrapper">
	<div class="form-signin">
		<h2 class="form-signin-heading" style="color: black;">Please login</h2>
		<form method="post" action="./" name="loginform">
			<label>Username</label>
			<input type="text" class="form-control" name="user_name" placeholder="nama pengguna" required="" autofocus="" />
			<label>Password</label>
			<input type="password" class="form-control" name="user_pass" placeholder="kata sandi" required=""/>
			<input type="submit" class="btn btn-lg btn-primary btn-block" name="login" value="Log in" />
		</form>
		<div class="message">
			<label>
				<?php
				// show potential errors / feedback (from login object)
				if (isset($login)) {
					if ($login->errors) {
						foreach ($login->errors as $error) {
							echo $error;
						}
					}
					if ($login->messages) {
						foreach ($login->messages as $message) {
							echo $message;
						}
					}
				}
				?>
			</label>
		</div>
	</div>
</div>
<?php include("not_logged_in_source.php"); ?>