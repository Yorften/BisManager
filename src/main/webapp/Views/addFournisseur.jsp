<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
if (session.getAttribute("name") == null) {
	response.sendRedirect("login.jsp");
}
%>

<!DOCTYPE html >
<html>
<head>
<meta charset="utf-8" />
<meta charset="ISO-8859-1">
<title>Ajouter un fournisseur</title>
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
		<div class="card">
			<div class="card-header py-3 fw-bold fs-4">Ajouter un fournisseur</div>
			<div class="card-body">
				<Form class='needs-validation' action="fournisseur" method="post">
					<div class="row">
						<div class="input-field col s4">
							<i class="material-icons prefix">account_circle</i> <input
								name='Prenom' id="Prenom" type="text" class="validate" required>
							<label for="Prenom">Prenom</label>
						</div>
						<div class="input-field col s4">
							<i class="material-icons prefix">account_circle</i> <input
								name='Nom' id="Nom" type="text" class="validate" required>
							<label for="Nom">Nom</label>
						</div>
						<div class="input-field col s4">
							<i class="material-icons prefix">business</i> <input
								name='Entreprise' id="Entreprise" type="text" class="validate"
								required> <label for="Entreprise">Entreprise</label>
						</div>
					</div>

					<div class="row">
						<div class="input-field col s6">
							<i class="material-icons prefix">email</i> <input name='email'
								id="email" type="email" class="validate" required> <label
								for="email">Email</label>
						</div>
						<div class="input-field col s6">
							<i class="material-icons prefix">monetization_on</i> <input
								name='capital' id="capital" type="number" class="validate"
								required> <label for="capital">Capital</label>
						</div>
					</div>
					<div class="row">
						<div class="input-field col s6">
							<i class="material-icons prefix">location_on</i> <input
								name='adresse' id="adresse" type="text" class="validate"
								required> <label for="adresse">Addresse</label>
						</div>
						<div class="input-field col s6">
							<i class="material-icons prefix">flag</i> <input name='pays'
								id="pays" type="text" class="validate" required> <label
								for="pays">Pay</label>
						</div>
					</div>
					<div class="row">
						<div class="input-field col s6">
							<i class="material-icons prefix">phone</i> <input name='fax'
								id="fax" type="text" class="validate" required> <label
								for="fax">Fax</label>
						</div>
						<div class="input-field col s6">
							<i class="material-icons prefix">smartphone</i> <input name='Tel'
								id="Tel" type="tel" data-length="12" class="validate" required>
							<label for="Tel">Telephone</label>
						</div>
					</div>
					<button type="submit" class="btn btn-success mb-3">Ajouter</button>
					<button type="reset" class="btn btn-dark mb-3">Annuler</button>
				</Form>




			</div>
			<!-- End of Page Wrapper -->
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


		<!-- End of Content Wrapper -->


		<!-- Scroll to Top Button-->
		<a class="scroll-to-top rounded" href="#page-top"> <i
			class="fas fa-angle-up"></i>
		</a>
	</div>
	<!-- Load jQuery from CDN so can run demo immediately -->
	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script src="js/select-country/countrySelect.js"></script>
	<script>
		$("#country_selector").countrySelect({
			// defaultCountry: "jp",
			// onlyCountries: ['us', 'gb', 'ch', 'ca', 'do'],
			// responsiveDropdown: true,
			preferredCountries : [ 'ma', 'gb', 'us' ]
		});
	</script>

	<script src="SweetAlert/sweetalert.min.js"></script>
	<script type="text/javascript">
		var status = document.getElementById("status").value;
		if (status == "success") {
			swal("Terminé!", "Le fournisseur a été ajouté!", "success").then(function() {
				window.location = "addFournisseur";
			});
		}
	</script>

</body>
</html>