<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
if (session.getAttribute("name") == null) {
	response.sendRedirect("login.jsp");
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ajouter client</title>
<link rel="icon" href="images/Icon.png" type="image/png">
<!-- Compiled and minified CSS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

<!-- Compiled and minified JavaScript -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
<!-- Compiled and minified icons -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">



</head>
<body>
	<jsp:include page="/./tamplates/Dashboard.jsp"></jsp:include>


	<div class="container-fluid">

		<input type="hidden" id="status"
			value="<%=request.getAttribute("status")%>">

		<div class="card my-3">
			<div class="card-header py-3 fw-bold fs-4">Ajouter un client</div>
			<div class="card-body">
				<Form action="AddClientServlet" method="post">
					<div class="row">
						<div class="input-field col s6">
							<i class="material-icons prefix">account_circle</i> <input
								name='Prenom' id="Prenom" type="text" class="validate" required>
							<label for="Prenom">Prenom</label>
						</div>
						<div class="input-field col s6">
							<i class="material-icons prefix">account_circle</i> <input
								name='Nom' id="Nom" type="text" class="validate" required>
							<label for="Nom">Nom</label>
						</div>
					</div>

					<div class="row">
						<div class="input-field col s6">
							<i class="material-icons prefix">email</i> <input name='email'
								id="email" type="email" class="validate" required> <label
								for="email">Email</label>
						</div>
						<div class="input-field col s6">
							<i class="material-icons prefix">code</i> <input
								name='Code_Postal' id="Code_Postal" type="number"
								class="validate" required> <label for="Code_Postal">Code
								Postal</label>
						</div>
					</div>
					<div class="row">
						<div class="input-field col s6">
							<i class="material-icons prefix">location_on</i> <input
								name='adresse' id="adresse" type="text" class="validate"
								required> <label for="adresse">Addresse</label>
						</div>
						<div class="input-field col s6">
							<i class="material-icons prefix">flag</i> <input name='Pays'
								id="Pays" type="text" class="validate" required> <label
								for="Pays">Pay</label>
						</div>
					</div>
					<div class="row">
						<div class="input-field col s6">
							<i class="material-icons prefix">location_city</i> <input
								name='ville' id="ville" type="text" class="validate" required>
							<label for="ville">Ville</label>
						</div>
						<div class="input-field col s6">
							<i class="material-icons prefix">phone</i> <input name='Tel'
								id="Tel" type="tel" data-length="12" class="validate" required>
							<label for="Tel">Telephone</label>
						</div>
					</div>
					<button type="submit" class="btn btn-success mb-3">Ajouter</button>
					<button type="reset" class="btn btn-dark mb-3">Annuler</button>
					
				</Form>
			</div>
		</div>


	</div>

	<!-- Footer -->
	<footer class="sticky-footer bg-white">
		<div class="container my-auto">
			<div class="copyright text-center my-auto">
				<span>Copyright &copy; BisManager 2021</span>
			</div>
		</div>
	</footer>
	<!-- End of Footer -->




	<script src="SweetAlert/sweetalert.min.js"></script>
	<script type="text/javascript">
		var status = document.getElementById("status").value;
		if (status == "success") {
			swal("Terminé!", "Le client a été ajouté!", "success").then(
					function() {
						window.location = "addClient";
					});
		}
		if (status == "failed") {
			swal("Désolé!", "L'opération a échoué!", "error").then(function() {
				window.location = "addClient";
			});
		}
	</script>

</body>
</html>