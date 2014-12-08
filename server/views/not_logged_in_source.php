<style>
	.wrapper {
		margin-top: 80px;
		margin-bottom: 80px;
	}

	.form-signin {
		max-width: 380px;
		padding: 15px 35px 45px;
		margin: 0 auto;
		background-color: #fff;
		border: 1px solid rgba(0,0,0,0.1);
		background-image: url("./res/img/bg.png");
		background-repeat: repeat;

	.form-signin-heading,
	.form-control {
		position: relative;
		height: auto;
	@include box-sizing(border-box);

	&:focus {
		z-index: 2;
	}
	}

	input[type="text"] {
		margin-bottom: -1px;
		border-bottom-left-radius: 0;
		border-bottom-right-radius: 0;
	}

	input[type="password"] {
		margin-bottom: 20px;
		border-top-left-radius: 0;
		border-top-right-radius: 0;
	}
	}

	input {
		padding: 10px !important;
		border-radius: 0px !important;
	}

	input[type=submit] {
		margin-top: 20px !important;
		border-radius: 0px !important;
	}

	label {
		margin-top: 10px;
		color: #717171 !important;
		font-size: small !important;
	}

	.message {
		text-align: right;
	}

	.message label {
		color: crimson !important;
		font-style: italic;
		font-size   : 11px !important;
		text-shadow : 1px 1px 0 rgba(256, 256, 256, 1.0);
	}
</style>
<script>
	if (window.localStorage.ceramicAppTheme) {
		$('link[theme]').attr('href', './bower/bootswatch/' + window.localStorage.ceramicAppTheme + '/bootstrap.min.css');
	} else {
		window.localStorage.ceramicAppTheme = $('link[theme]').attr('theme');
	}
</script>