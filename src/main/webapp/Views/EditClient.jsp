<%@page import='Controler.Servlets.Client.UpdateClient'%>
<%@page import='Models.Classes.Client'%>
<%@page import='Controler.JDBC.MYSQL.SQLClinet'%>
<%@page import='java.sql.*'%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="images/Icon.png" type="image/png">
<meta charset="ISO-8859-1">
<title>Modifier Client</title>
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


	<%
	String id_Client = request.getParameter("id_Client");
	Client C = SQLClinet.getClient(Integer.parseInt(id_Client));
	%>


	<!-- including the page index  -->
	<jsp:include page="/./tamplates/Dashboard.jsp"></jsp:include>


	<div class="container-fluid">

		<div class="container">
			<div class="card">
				<div class="card-header">Modifier les inforamtions de client</div>
				<div class="card-body">
					<div class="container">
						<Form action="UpdateClient" method="post">

							<input type="hidden" name='id_Client' class="form-control"
								id="floatingInput" value="<%=C.getId_Client()%>">
							<div class="row">
								<div class="input-field col s6">
									<i class="material-icons prefix">account_circle</i> <input
										name='Prenom' id="Prenom" type="text" class="validate"
										required value="<%=C.getPrenom()%>"> <label
										for="Prenom">Prenom</label>
								</div>
								<div class="input-field col s6">
									<i class="material-icons prefix">account_circle</i> <input
										name='Nom' id="Nom" type="text" class="validate" required
										value="<%=C.getNom()%>"> <label for="Nom">Nom</label>
								</div>
							</div>

							<div class="row">
								<div class="input-field col s6">
									<i class="material-icons prefix">email</i> <input name='email'
										id="email" type="email" class="validate" required
										value="<%=C.getEmail()%>"> <label for="email">Email</label>
								</div>
								<div class="input-field col s6">
									<i class="material-icons prefix">code</i> <input
										name='Code_Postal' id="Code_Postal" type="number"
										class="validate" required value="<%=C.getCode_Postal()%>">
									<label for="Code_Postal">Code Postal</label>
								</div>
							</div>
							<div class="row">
								<div class="input-field col s6">
									<i class="material-icons prefix">location_on</i> <input
										name='adresse' id="adresse" type="text" class="validate"
										required value="<%=C.getAdresse()%>"> <label
										for="adresse">Addresse</label>
								</div>
								<div class="input-field col s6">
									<i class="material-icons prefix">flag</i> <input name='Pays'
										id="Pays" type="text" class="validate" required
										value="<%=C.getPays()%>"> <label for="Pays">Pay</label>
								</div>
							</div>
							<div class="row">
								<div class="input-field col s6">
									<i class="material-icons prefix">location_city</i> <input
										name='ville' id="ville" type="text" class="validate" required
										value="<%=C.getVille()%>"> <label for="ville">Ville</label>
								</div>
								<div class="input-field col s6">
									<i class="material-icons prefix">phone</i> <input name='Tel'
										id="Tel" type="tel" data-length="12" class="validate" required
										value="<%=C.getTel()%>"> <label for="Tel">Telephone</label>
								</div>
							</div>
							<div class="row  mr-5 mt-2">
								<div class="col ml-4 mt-4">
									<button type="submit" class="btn btn-outline-success mb-3 float-start">Modifier</button>
									<button type="reset" class="btn btn-outline-dark mb-3 float-start">Annuler</button>
									<button type="button" class="btn btn-outline-primary mb-3 float-end"
										name="back" onclick="history.back()">Retourner</button>
								</div>
							</div>
						</Form>
					</div>
				</div>
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