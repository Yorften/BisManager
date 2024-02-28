<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Modifer Fournisseur</title>
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

	<!-- Import pages  -->
	<%@page import='Controler.Servlets.Fournisseur.UpdateFournisseur'%>
	<%@page import='Models.Classes.Fournisseur'%>
	<%@page import='Controler.JDBC.MYSQL.SQLFournisseur'%>
	<%@page import='java.sql.*'%>

	<%
	String id_fournisseur = request.getParameter("id_fournisseur");
	Fournisseur F = SQLFournisseur.getFournisseur(Integer.parseInt(id_fournisseur));
	%>


	<!-- including the page index  -->
	<jsp:include page="/./tamplates/Dashboard.jsp"></jsp:include>


	<div class="container-fluid">


		<div class="card">
			<div class="card-header">Modifier les inforamtions du fournisseur</div>
			<div class="card-body">
				<Form action="UpdateFournisseur" method="post">
					<div class="form-floating mb-3">
						<input type="hidden" name='Id_fournisseur' class="form-control"
							id="floatingInput" value="<%=F.getId_fournisseur()%>">
					</div>
					<div class="row">
						<div class="input-field col s4">
							<i class="material-icons prefix">account_circle</i> <input
								name='Prenom' id="Prenom" type="text" class="validate" required
								value="<%=F.getPrenom()%>"> <label for="Prenom">Prenom</label>
						</div>
						<div class="input-field col s4">
							<i class="material-icons prefix">account_circle</i> <input
								name='Nom' id="Nom" type="text" class="validate" required
								value="<%=F.getNom()%>"> <label for="Nom">Nom</label>
						</div>
						<div class="input-field col s4">
							<i class="material-icons prefix">business</i> <input
								name='Entreprise' id="Entreprise" type="text" class="validate"
								required value="<%=F.getEntreprise()%>"> <label
								for="Entreprise">Entreprise</label>
						</div>
					</div>

					<div class="row">
						<div class="input-field col s6">
							<i class="material-icons prefix">email</i> <input name='email'
								id="email" type="email" class="validate" required
								value="<%=F.getEmail()%>"> <label for="email">Email</label>
						</div>
						<div class="input-field col s6">
							<i class="material-icons prefix">monetization_on</i> <input
								name='capital' id="capital" type="number" class="validate"
								required value="<%=F.getCapital()%>"> <label
								for="capital">Capital</label>
						</div>
					</div>
					<div class="row">
						<div class="input-field col s6">
							<i class="material-icons prefix">location_on</i> <input
								name='adresse' id="adresse" type="text" class="validate"
								required value="<%=F.getAdresse()%>"> <label
								for="adresse">Addresse</label>
						</div>
						<div class="input-field col s6">
							<i class="material-icons prefix">flag</i> <input name='pays'
								id="pays" type="text" class="validate" required
								value="<%=F.getPays()%>"> <label for="pays">Pay</label>
						</div>
					</div>
					<div class="row">
						<div class="input-field col s6">
							<i class="material-icons prefix">phone</i> <input name='fax'
								id="fax" type="text" class="validate" required
								value="<%=F.getFax()%>"> <label for="fax">Fax</label>
						</div>
						<div class="input-field col s6">
							<i class="material-icons prefix">smartphone</i> <input name='Tel'
								id="Tel" type="tel" data-length="12" class="validate" required
								value="<%=F.getTel()%>"> <label for="Tel">Telephone</label>
						</div>
					</div>
					<div class="row  mr-5 mt-2">
						<div class="col ml-4 mt-4">
							<button type="submit" class="btn btn-outline-success mb-3">Modifier</button>						
							<button type="reset" class="btn btn-outline-dark mb-3">Annuler</button>
							<button type="button" class="btn btn-outline-primary mb-3"
								name="back" onclick="history.back()">Retourner</button>
						</div>
					</div>
				</Form>
			</div>
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



</body>
</html>