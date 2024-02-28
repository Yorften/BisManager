<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Connexion</title>
<link rel="icon" href="images/Icon.png" type="image/png">
<link rel="stylesheet" href="alert/dist/sweetalert.css">
<!-- Font Icon -->
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">

<!-- font awesome  -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.2/css/all.css"
	integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr"
	crossorigin="anonymous">

<!-- Main css -->
<link rel="stylesheet" href="css/style.css">
</head>
<body>

	<input type="hidden" id="status"
		value="<%=request.getAttribute("status")%>">

	<div class="main">

		<!-- Sing in  Form -->
		<section class="sign-in">
			<div class="container">
				<div class="signin-content">
					<div class="">
						<figure>
							<img src="images/logo/Logo5.png" alt="Bis Manager"
								class="img-fluid">
							<p class="fs-1 pl-3">Votre meilleur outil pour gérer et organiser
								votre entreprise !</p>
						</figure>

					</div>

					<div class="signin-form mt-5">
						<h2 class="form-title">Connexion</h2>
						<form method="post"  action="login" class="register-form"
							id="login-form">
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text" id="basic-addon1"><i
										class="fas fa-user"></i></span>
								</div>
								<input name="username" type="text" value=""
									class="input form-control" id="username" placeholder="Username"
									aria-label="Username" aria-describedby="basic-addon1" />
							</div>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text" id="basic-addon1"><i
										class="fas fa-lock"></i></span>
								</div>
								<input name="password" type="password" value=""
									class="input form-control" id="password" placeholder="password"
									required aria-label="password" aria-describedby="basic-addon1" />
								<div class="input-group-append">
									<span class="input-group-text" onclick="password_show_hide();">
										<i class="fas fa-eye" id="show_eye"></i> <i
										class="fas fa-eye-slash d-none" id="hide_eye"></i>
									</span>
								</div>
							</div>
							<div class="form-group">
								<input type="checkbox" name="remember-me" id="remember-me"
									class="agree-term" /> <label for="remember-me"
									class="label-agree-term"><span><span></span></span>Remember
									me</label><br>
									<!-- <a href="ResetPassword" >Forget paswword</a>-->
							</div>
							<div class="form-group form-button">
								<input type="submit" name="signin" id="signin"
									class="form-submit" value="Log in" />
							</div>

						</form>
						<div class="social-login"></div>
					</div>
				</div>
			</div>
		</section>

	</div>

	<!-- JS -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="js/main.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

	<!-- Sweet Alert -->
	<script src="SweetAlert/sweetalert.min.js"></script>

	<script type="text/javascript">
		var status = document.getElementById("status").value;
		if (status == "failed") {
			swal("Désolé!",
					"Nom d'utilisateur ou mot de passe est incorrect ", "error");
		}
		if (status == "Invalidusr") {
			swal("désolé!", "Fill in your username ", "error");
		}
		if (status == "Invalidpwd") {
			swal("désolé!", "Fill in your password ", "error");
		}
		if (status == "noActive") {
			swal("désolé!",
					"Votre compte n'est pas encore activé ", "error");
		}
	</script>
	<!-- script for hide/show password -->
	<script>
		function password_show_hide() {
			var x = document.getElementById("password");
			var show_eye = document.getElementById("show_eye");
			var hide_eye = document.getElementById("hide_eye");
			hide_eye.classList.remove("d-none");
			if (x.type === "password") {
				x.type = "text";
				show_eye.style.display = "none";
				hide_eye.style.display = "block";
			} else {
				x.type = "password";
				show_eye.style.display = "block";
				hide_eye.style.display = "none";
			}
		}
	</script>
</body>
</html>