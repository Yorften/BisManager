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
if (session.getAttribute("name").equals("Employé(e)")) {	
	response.sendRedirect("errorPages/403.jsp");
}
%>

<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="images/Icon.png" type="image/png">
<meta charset="ISO-8859-1">
<title>Utilisateurs</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/css/bootstrap-select.min.css">


</head>
<body>

	<%
	List<User> LUsers = SQLUser.getListOfUsers();
	%>

	<jsp:include page="/./tamplates/Dashboard.jsp"></jsp:include>


	<div class="container-fluid">

		<input type="hidden" id="status"
			value="<%=request.getAttribute("status")%>">



		<div class="row">
			<div class="col-sm-5">
				<div class="shadow-lg  ">
					<!-- start of card 1-->
					<div class="card my-3">
						<div class="card-header">Ajouter un utilisateur</div>
						<div class="card-body"></div>
						<form action="addUserServlet" method="post">
							<div class="row  mr-5 mt-2">
								<div class="col-3 ml-3">
									<label for="inputPassword2" class="visually-hidden">Nom d'utilisateur</label>
								</div>
								<div class="col">
									<input name='UserName' type="text" class="form-control"
										id="inputPassword2" placeholder="Nom d'utilisateur" required>
								</div>
							</div>
							<div class="row  mr-5 mt-2">
								<div class="col-3 ml-3">
									<label for="inputPassword2" class="visually-hidden">Mot de passe</label>
								</div>
								<div class="col">
									<input name="Password" type="password" class="form-control"
										id="inputPassword2" placeholder="Mot de passe" required>
								</div>
							</div>
							<div class="row  mr-5 mt-2">
								<div class="col-3 ml-3">
									<label for="inputPassword2" class="visually-hidden">Email</label>
								</div>
								<div class="col">
									<input name='Email' type="email" class="form-control"
										id="inputPassword2" placeholder="Email" required>
								</div>
							</div>
							<div class="row  mr-5 mt-2">
								<div class="col-3 ml-3">
									<label for="inputPassword2" class="visually-hidden">Active</label>
								</div>
								<div class="col ">
									<div class="form-check">
										<input class="form-check-input" type="radio" name="Active"
											id="exampleRadios1" value="true" checked required> <label
											class="form-check-label" for="exampleRadios1"> OUI </label>
									</div>
									<div class="form-check">
										<input name="Active" class="form-check-input" type="radio"
											id="exampleRadios2" value="false" required> <label
											class="form-check-label" for="exampleRadios2"> NO</label>
									</div>
								</div>
							</div>
							<div class="row  mr-5 mt-2">
								<div class="col-3 ml-3">
									<label for="inputPassword2" class="visually-hidden">Role</label>
								</div>
								<div class="col ">
									<select name="Role" class="selectpicker" required>
										<option>Administrateur</option>
										<option>Employé(e)</option>
									</select>
								</div>
							</div>
							<div class="row  mr-5 mt-2">
								<div class="col ml-4 mt-4">
									<button type="submit" class="btn btn-success mb-3">Enregistrer</button>
									<button type="reset" class="btn btn-dark mb-3">Annuler</button>
									
								</div>
							</div>
						</form>

					</div>
				</div>
			</div>
			<!-- end of card 1 -->
			<!-- start of card 2 -->
			<div class="col-sm-7">
				<div class="shadow-lg ">

					<div class="card my-3">
						<div class="card-header">Informations</div>
						<div class="card-body">

							<div class="table-responsive">
								<table class="table " style="max-width: 100%">
									<thead>
										<tr>
											<th scope="col">#</th>
											<th scope="col">Utilisateur</th>
											<th scope="col">Active</th>
											<th scope="col">Role</th>
											<th scope="col">Action</th>
										</tr>
									</thead>
									<tbody>
										<%
										for (User LU : LUsers) {
										%>
										<tr>
											<td scope="row"><%=LU.getId_user()%></td>
											<td scope="row"><%=LU.getUserName()%></td>
											<td scope="row">
												<%
												if (LU.isActive()) {
												%> <i class="fa-solid fa-check" style="color: #006400;"></i>
												<%
												} else {
												%> <i class="fa-solid fa-x" style="color: #FF0000;"></i> <%
 }
 %>
											</td>
											<td scope="row"><%=LU.getRole()%></td>
											<td scope="row">
												<div class="d-flex justify-content-center">
													<a class="btn btn-outline-primary btn-sm mr-2" id="submit"														
														href="editUtilisateur?id_user=<%=LU.getId_user()%>" role="button">
														<i class="fa-solid fa-pen-to-square"></i>
													</a>
													<form action='DeleteUserServlet' method='post'>
														<input type="hidden" name="id_user"
															value="<%=LU.getId_user()%>">
														<button type='submit'
															class="btn btn-outline-dark btn-sm mr-2">
															<i class="fa-solid fa-trash-arrow-up"></i>
														</button>
													</form>
												</div>
											</td>
										</tr>
										<%
										}
										%>
									</tbody>
								</table>
							</div>

						</div>
					</div>
				</div>
			</div>
			<!-- end of card 2 -->
		</div>
		<!-- end of row -->
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

	<!-- Modal -->
	<div class="modal fade" id="exampleModalCenter" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-md  modal-dialog-centered"
			role="document">
			<div class="modal-content rounded-0">
				<div class="modal-body py-0">


					<div class="d-flex main-content">
						<div class="content-text p-4">
							<h3>Mpdifier l'utilisateur</h3>
							<hr>
							<form action="addUserServlet" method="post">
								<div class="row  mr-5 mt-2">
									<div class="col-3 ml-3">
										<label for="inputPassword2" class="visually-hidden">Nom d'utilisateur</label>
									</div>
									<div class="col">
										<input name='UserName' type="text" class="form-control"
											id="inputPassword2" placeholder="Nom d'utilisateur">
									</div>
								</div>
								<div class="row  mr-5 mt-2">
									<div class="col-3 ml-3">
										<label for="inputPassword2" class="visually-hidden">Mot de passe</label>
									</div>
									<div class="col">
										<input name="Password" type="password" class="form-control"
											id="inputPassword2" placeholder="Mot de passe">
									</div>
								</div>
								<div class="row  mr-5 mt-2">
									<div class="col-3 ml-3">
										<label for="inputPassword2" class="visually-hidden">Email</label>
									</div>
									<div class="col">
										<input name='Email' type="email" class="form-control"
											id="inputPassword2" placeholder="Email">
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
												class="form-check-label" for="exampleRadios1"> OUI </label>
										</div>
										<div class="form-check">
											<input name="Active" class="form-check-input" type="radio"
												id="exampleRadios2" value="false"> <label
												class="form-check-label" for="exampleRadios2"> NO</label>
										</div>
									</div>
								</div>
								<div class="row  mr-5 mt-2">
									<div class="col-3 ml-3">
										<label for="inputPassword2" class="visually-hidden">Role</label>
									</div>
									<div class="col ">
										<select name="Role" class="selectpicker">
											<option>Administrateur</option>
											<option>Employé(e)</option>
										</select>

									</div>
								</div>
								<div class="row  mr-5 mt-2">
									<div class="col ml-4 mt-4">
										<button type="reset" class="btn btn-outline-dark mb-3">Annuler</button>
										<button type="submit" class="btn btn-success mb-3">Ajouter</button>
									</div>
								</div>
							</form>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>



	<script src="SweetAlert/sweetalert.min.js"></script>
	<script type="text/javascript">
		var status = document.getElementById("status").value;
		if (status == "success") {
			swal("Terminé!", "L'utilisateur a été supprimé!", "success")
					.then(
							function() {
								window.location = "Utilisateurs";
							});
		}
		if (status == "added") {
			swal("Terminé!", "L'utilisateur a été ajouté !", "success")
					.then(
							function() {
								window.location = "Utilisateurs";
							});
		}
		if (status == "updated") {
			swal("Terminé!", "L'utilisateur a été Modifié avac success !", "success")
					.then(
							function() {
								window.location = "Utilisateurs";
							});
		}
	</script>

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