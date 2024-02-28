
<%@page import='Controler.JDBC.MYSQL.SQLCommande'%>
<%@page import='Models.Classes.Produit_Commande'%>
<%@page import='Models.Classes.Produit'%>
<%@page import='Models.Classes.Client'%>
<%@page import='Models.Classes.Commande'%>
<%@page import='Controler.JDBC.MYSQL.SQLProduit'%>
<%@page import='Controler.JDBC.MYSQL.SQLClinet'%>
<%@page import='java.sql.*'%>
<%@page import='java.util.*'%>
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
<title>Modifier Commande</title>
<link rel="icon" href="images/Icon.png" type="image/png">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/css/bootstrap-select.min.css">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css"
	integrity="sha512-YWzhKL2whUzgiheMoBFwW8CKV4qpHQAEuvilg9FAn5VJUDwKZZxkJNuGM4XkWuk94WCrrwslk8yWNGmY1EduTA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

</head>
<body>

	<%
	List<Produit> Prod_list = SQLProduit.getListOfProduits();

	List<Client> Client_list = SQLClinet.getListOfClients();
	if ((Commande) session.getAttribute("cmd") == null) {
		response.sendRedirect("viewCommande");
	}
	Commande cmd = (Commande) session.getAttribute("cmd");
	%>
	<jsp:include page="/./tamplates/Dashboard.jsp"></jsp:include>
	<div class="container-fluid">
		<input type="hidden" id="status"
			value="<%=request.getAttribute("status")%>">
		<h4>Modifier la commande</h4>
		<hr>		
		<div class="row">
			<div class="col-sm-5">
				<div class="shadow-lg  ">
					<!-- start of card 1-->
					<form action="editCommandeServlet" method="post">
						<input type="hidden" name="status" value="add_cmd">
						<div class="card border-left-info">
							<ul class="list-group list-group-flush">
								<li class="list-group-item">
									<div class="row  mr-5 mt-2">
										<div class="col-3 ml-3">
											<label for="inputPassword2" class="fw-bold">Numéro</label>
										</div>
										<div class="col">
											<input name='Id_cmd' type="text"
												class="form-control disabled" id="inputPassword2"
												placeholder="id Commande" value='<%=cmd.getId_cmd()%>'
												readonly>
										</div>
									</div>
								</li>
								<li class="list-group-item">
									<div class="row  mr-5 mt-2">
										<div class="col-3 ml-3">
											<label for="inputPassword2" class="fw-bold">Adresse</label>
										</div>
										<div class="col">
											<input name='Addresse_Cmd' type="text" class="form-control"
												id="inputPassword2" placeholder="Adresse de commande"
												value='<%=cmd.getAddresse_Cmd()%>' required>
										</div>
									</div>
								</li>
								<li class="list-group-item">
									<div class="row  mr-5 mt-2">
										<div class="col-3 ml-3">
											<label for="inputPassword2" class="fw-bold">Date</label>
										</div>
										<div class="col ">
											<input name='Date_cmd' id="startDate" class="form-control"
												type="date" value='<%=cmd.getDate_cmd()%>' required>
											<span id="startDateSelected"></span>
										</div>
									</div>
								</li>
								<li class="list-group-item">
									<div class="row  mr-5 mt-2">
										<input type="hidden" name="state" value="2">
										<div class="col-3 ml-3">
											<label for="inputPassword2" class="fw-bold">Client</label>
										</div>
										<div class="col">
											<select name='id_Client' class="selectpicker" required>
												<%
												for (Client C : Client_list) {
												%>
												<option value="<%=C.getId_Client()%>"><%=C.getId_Client()%>
													-
													<%=C.getNom()%></option>
												<%
												}
												%>
											</select>
										</div>
									</div>
								</li>
								<li class="list-group-item"><div class="row  mr-5 mt-2">
										<div class="col-3 ml-3">
											<label for="inputPassword2" class="fw-bold">Validé ?</label>
										</div>
										<div class="col">
											<select name='validation' class="selectpicker" required>
												<option value="true" style="color: green;">OUI</option>
												<option value="false" style="color: red;">NO</option>
											</select>
										</div>
									</div></li>
								<li class="list-group-item">
									<div class="row  mr-5">
										<div class="col ml-2 ">
											<button type="submit" class="btn btn-outline-success ">Modifier</button>
											<button type="reset" class="btn btn-outline-dark ">Annuler</button>										
											
										</div>
									</div>
								</li>
							</ul>
						</div>
					</form>
				</div>
			</div>

			<!-- end of card 1 -->

			<div class="col-sm-7">
				<div class="shadow-lg ">
					<!-- start of card add product -->
					<div class="shadow-lg  ">
						<div class="card border-left-info">
							<ul class="list-group list-group-flush">
								<li class="list-group-item">
									<div class='row  mt-3'>
										<form action="editCommandeServlet" method="post">
											<input type="hidden" name="status" value="add_produit">
											<div class="row ">
												<div class="col">
													<select name="id_Produit1" class="selectpicker" required>
														<%
														for (Produit P : Prod_list) {
														%>
														<option value="<%=P.getId_Produit()%>"><%=P.getId_Produit()%>
															-
															<%=P.getDesegnation()%></option>
														<%
														}
														%>
													</select>
												</div>
												<div class="col">
													<input name='Quantité_cmd' type="number" min="1"
														class="form-control " id="inputPassword2"
														placeholder="Quantité cmd" required>
												</div>
												<div class="col">
													<button type="submit" class="btn btn-outline-success mb-3">Ajouter
														produit</button>
												</div>
											</div>
										</form>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<!-- end of card add product -->
				<!-- start of card list product -->
				<div class="shadow-lg ">
					<div class="card my-3 border-left-info">
						<div class="card-body">

							<div class="table-responsive">
								<table class="table " style="max-width: 100%">
									<thead>
										<tr>
											<th scope="col">Produit</th>
											<th scope="col">Prix unitaire</th>
											<th scope="col">Quantité</th>
											<th scope="col"></th>
										</tr>
									</thead>
									<tbody>
										<%
										for (Produit_Commande p : cmd.getProd_Cmd()) {
										%>
										<tr>
											<td scope="row"><%=p.getProduit_cmd().getDesegnation()%></td>
											<td scope="row"><%=p.getProduit_cmd().getPrix()%></td>
											<td scope="row"><%=p.getProduit_cmd().getQuantite()%></td>
											<td scope="row">
												<form action=editCommandeServlet method="post">
													<input type="hidden" name='status' value='delete_Commande'>
													<input type="hidden" name='id_Produit'
														value='<%=p.getProduit_cmd().getId_Produit()%>'>
													<button type="submit" class="btn btn-outline-danger btn-sm">
														<i class="fa-solid fa-trash-arrow-up"></i>
													</button>
												</form>
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
			<!-- end of card list product -->
		</div>
		<!-- end of row -->
	</div>
	<!-- end of content page -->






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
		if (status == "added") {
			swal("Terminé!", "Le produit a été ajouté au panier!", "success")
					.then(function() {
						window.location = "editCommande";
					});
		}
		if (status == "Produit_is_already_in_commanded") {
			swal("Désolé!", "Produit déjà ajouté à votre panier de vente!",
					"warning").then(function() {
				window.location = "editCommande";
			});
		}
		if (status == "Produit_removed_from_commande") {
			swal("Terminé!", "Le produit a été retiré de la commande!",
					"success").then(function() {
				window.location = "editCommande";
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