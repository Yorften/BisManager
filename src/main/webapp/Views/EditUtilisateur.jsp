<%@page import='Controler.JDBC.MYSQL.SQLUser'%>
<%@page import='Models.Classes.User'%>
<%@page import='java.sql.*'%>
<%@page import='java.util.*'%>
<%@page import="Models.Classes.Produit_Commande"%>
<%@page import="Controler.JDBC.MYSQL.SQLFournisseur"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
if (session.getAttribute("name") == null) {
	response.sendRedirect("login.jsp");
}
if (session.getAttribute("name").equals("User")) {
	response.sendRedirect("/./errorPages/403.jsp");
}
%>

<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="images/Icon.png" type="image/png">
<meta charset="ISO-8859-1">
<title>Modifier Utilisateur</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/css/bootstrap-select.min.css">


</head>
<body>

	<%
	User user = SQLUser.getUserById(Integer.parseInt(request.getParameter("id_user")));
	%>

	<jsp:include page="/./tamplates/Dashboard.jsp"></jsp:include>


	<div class="container-fluid">

		<input type="hidden" id="status"
			value="<%=request.getAttribute("status")%>">

		<div class="jumbotron d-flex justify-content-center">
			<div class="container-fluid d-flex justify-content-center">
				<div class="card my-2  border-secondary">
					<div class="card-body text-info">
						<div class="d-flex main-content">
							<div class="content-text p-4">
								<h3>Modifier l'utilisateur</h3>
								<hr>
								<form action="UpdateUserServlet" method="post">
									<input type="hidden" value='<%=user.getId_user()%>'
										name='id_user' />
									<div class="row  mr-5 mt-2">
										<div class="col-3 ml-3">
											<label for="inputPassword2" class="visually-hidden">Nom d'utilisateur</label>
										</div>
										<div class="col">
											<input name='UserName' type="text" class="form-control"
												value='<%=user.getUserName()%>' id="inputPassword2"
												placeholder="UserName">
										</div>
									</div>
									<div class="row  mr-5 mt-2">
										<div class="col-3 ml-3">
											<label for="inputPassword2" class="visually-hidden">Mot de passe</label>
										</div>
										<div class="col">
											<input name="Password" type="password" class="form-control"
												value='<%=user.getPassword()%>' id="inputPassword2"
												placeholder="Password">
										</div>
									</div>
									<div class="row  mr-5 mt-2">
										<div class="col-3 ml-3">
											<label for="inputPassword2" class="visually-hidden">Email</label>
										</div>
										<div class="col">
											<input name='Email' type="email" class="form-control"
												value='<%=user.getEmail()%>' id="inputPassword2"
												placeholder="Email">
										</div>
									</div>
									<div class="row  mr-5 mt-2">
										<div class="col-3 ml-3">
											<label for="inputPassword2" class="visually-hidden">Active</label>
										</div>
										<div class="col ">
											<div class="form-check">
												<input class="form-check-input" type="radio" name="Active"
													id="exampleRadios1" value="true" checked> <label
													class="form-check-label" for="exampleRadios1"> OUI
												</label>
											</div>
											<div class="form-check">
												<input name="Active" class="form-check-input" type="radio"
													id="exampleRadios2" value="false"> <label
													class="form-check-label" for="exampleRadios2"> NO</label>
											</div>
										</div>
									</div>
									<div class="row  mr-5 mt-2">
										<div class="col-2 ml-3">
											<label for="inputPassword2" class="visually-hidden">Role</label>
										</div>
										<div class="col">
											<select name="Role" class="selectpicker">
												<option>Administrateur</option>
												<option>Employé(e)</option>
											</select>

										</div>
									</div>
									<div class="row  mr-5 mt-2">
										<div class="col ml-4 mt-4">
											<button type="submit" class="btn btn-outline-success mb-3">Modifier</button>
											<button type="reset" class="btn btn-outline-dark mb-3" onclick="history.back()">Annuler</button>
										</div>
									</div>
								</form>
							</div>
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


	<!-- Latest compiled and minified JavaScript -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/js/bootstrap-select.min.js"></script>

	<!-- (Optional) Latest compiled and minified JavaScript translation files -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/js/i18n/defaults-*.min.js"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>
</html>