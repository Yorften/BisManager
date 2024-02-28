<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Erreur 403</title>
<!-- Custom styles for this page-->
<style type="text/css">
html, body {
	height: 100%;
}

.container {
	height: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
}
</style>
<link href="../css/sb-admin-2.min.css" rel="stylesheet">
</head>
<body>


	<!-- this page is only for 500 error handling -->

	<div class="container">
		<!-- 404 Error Text -->
		<div class="text-center ">
			<div class="error mx-auto" data-text="403">403</div>
			<p class="lead text-gray-800 mb-5">Interdit</p>
			<p class="text-gray-500 mb-0">
				Désolé! Vous n'avez pas le droit d'accéder à cette page !
			</p>
			 
			<a href="http://localhost:8080/BisManager/Home">&larr; Retour à la page d'accueil</a>
		</div>

	</div>

</body>



</html>