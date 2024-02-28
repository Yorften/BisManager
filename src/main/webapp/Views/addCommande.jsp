<%@page import='Controler.JDBC.MYSQL.SQLCommande'%>
<%@page import='Models.Classes.Produit_Commande'%>
<%@page import='Models.Classes.Produit'%>
<%@page import='Models.Classes.Client'%>
<%@page import='Models.Classes.Commande'%>
<%@page import='Controler.JDBC.MYSQL.SQLProduit'%>
<%@page import='Controler.JDBC.MYSQL.SQLClinet'%>
<%@page import='Controler.JDBC.MYSQL.SqlConnection'%>
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
<title>Ajouter Commande</title>
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
	List<Produit> list1 = SQLProduit.getListOfProduits();

	List<Client> list2 = SQLClinet.getListOfClients();

	List<Commande> cmd = SQLCommande.getListOfCommandes();

	Commande cmd1 = null;
	if (session.getAttribute("cmd1") != null) {
		cmd1 = (Commande) session.getAttribute("cmd1");
	}
	%>

	<jsp:include page="/./tamplates/Dashboard.jsp"></jsp:include>

	<div class="container-fluid">

		<input type="hidden" id="status"
			value="<%=request.getAttribute("status")%>">
		<%
		if (session.getAttribute("cmd1") != null) {
		%>
		<div class="alert alert-danger d-flex align-items-center" role="alert">
			<i class="fa-solid fa-triangle-exclamation"></i>   
			<div> vous avez une commande que vous avez laissé incomplète !
					complétez-la ou <a href='addCommandeServlet'> supprimez-la</a></div>
		</div>	
		<%
		}
		%>
		<div class="row">
			<div class="col-sm-5">
				<div class="card my-3 border-left-secondary">
					<div class="card-header py-3 fw-bold fs-5">Ajouter un produit au
						panier</div>
					<div class="card-body">
						<form action="addCommandeServlet" method="post">
							<input type="hidden" name="status" value="add_produit">
							<div class="row  mr-5 mt-2">
								<div class="col-3 ml-3">
									<label for="inputPassword2" class="fw-bold">Produits</label>
								</div>
								<div class="col">
									<select name="id_Produit1" class="selectpicker" required>
										<%
										for (Produit P : list1) {
										%>
										<option value="<%=P.getId_Produit()%>"><%=P.getId_Produit()%>
											-
											<%=P.getDesegnation()%></option>
										<%
										}
										%>
									</select>
								</div>
							</div>
							<div class="row  mr-5 mt-2 mb-3">
								<div class="col-3 ml-3">
									<label for="inputPassword2" class="fw-bold">Quantité</label>
								</div>
								<div class="col">
									<input name='Quantité_cmd' type="number" min="1"
										class="form-control " id="inputPassword2"
										placeholder="Quantité cmd" required>
								</div>
							</div>
							<button type="submit" class="btn btn-success mb-3">Ajouter</button>

						</form>


					</div>
				</div>
				<div class="shadow-lg  ">
					<!-- start of card 1-->
					<div class="card my-3 border-left-secondary">
						<div class="card-header py-3 fw-bold fs-5">Commande</div>
						<div class="card-body">
							<Form action="addCommandeServlet" method="post">
								<input type="hidden" name="status" value="add_Commande">
								<div class="row  mr-5 mt-2">
									<div class="col-3 ml-3">
										<label for="inputPassword2" class="fw-bold">Adresse</label>
									</div>
									<div class="col">
										<input name='Addresse_Cmd' type="text" class="form-control"
											id="inputPassword2" placeholder="Adresse de commande"
											required>
									</div>
								</div>
								<div class="row  mr-5 mt-2">
									<div class="col-3 ml-3">
										<label for="inputPassword2" class="fw-bold">Date</label>
									</div>
									<div class="col">
										<input name='Date_cmd' id="startDate" class="form-control"
											type="date" required> <span id="startDateSelected"></span>
									</div>
								</div>
								<div class="row  mr-5 mt-2">
									<div class="col-3 ml-3">
										<label for="inputPassword2" class="fw-bold">Client</label>
									</div>
									<div class="col">
										<select name='id_Client' class="selectpicker" required>
											<%
											for (Client C : list2) {
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
								<div class="row  mr-5 mt-2 mb-3">
									<div class="col-3 ml-3">
										<label for="inputPassword2" class="fw-bold">Validé ?</label>
									</div>
									<div class="col">
										<select name='validation' class="selectpicker" required>
											<option value="true" style="color: green;">OUI</option>
											<option value="false" style="color: red;">NO</option>
										</select>
									</div>
								</div>
								<button type="submit" class="btn btn-success mb-3">Ajouter</button>
								<button type="reset" class="btn btn-dark mb-3">Annuler</button>
								
							</Form>

						</div>
					</div>
				</div>
			</div>
			<!-- end of card 1 -->
			<!-- start of card 2 -->
			<div class="col-sm-7">
				<div class="shadow-lg ">

					<div class="card my-3 border-left-secondary">
						<div class="card-header fw-bold fs-5">Panier de produits</div>
						<div class="card-body">

							<div class="table-responsive">
								<table class="table " style="max-width: 100%">
									<thead>
										<tr>
											<th scope="col">Produit</th>
											<th scope="col">Prix unitaire</th>
											<th scope="col">Quantité</th>
											<th scope="col">TVA(%)</th>
											<th scope="col">action</th>
										</tr>
									</thead>
									<tbody>
										<%
										if (cmd1 != null) {
										%>
										<%
										for (Produit_Commande p : cmd1.getProd_Cmd()) {
										%>
										<tr>
											<td scope="row"><%=p.getProduit_cmd().getId_Produit()%>
												- <%=p.getProduit_cmd().getDesegnation()%></td>
											<td scope="row"><%=p.getProduit_cmd().getPrix()%></td>
											<td scope="row"><%=p.getProduit_cmd().getQuantite()%></td>
											<td scope="row"><%=p.getProduit_cmd().getTVA()%></td>
											<td scope="row">
												<form action=addCommandeServlet method="post">
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
		if (status == "Produit_is_Emty") {
			swal("Désolé!", "Vous devez ajouter un produit au moins!", "error")
					.then(function() {
						window.location = "addCommande";
					});
		}
		if (status == "Produit_is_added") {
			swal("Terminé!", "Le produit a été ajouté au panier!", "success")
					.then(function() {
						window.location = "addCommande";
					});
		}
		if (status == "Quantity_not_available") {
			swal("Désol\u00e9!",
					"la quntit\u00e9 est faible, choisissez plus bas !",
					"error").then(function() {
				window.location = "addCommande";
			});
		}
		if (status == "Produit_is_already_in_commanded") {
			swal("Désolé!", "produit déjà ajouté à votre panier de vente!",
					"warning").then(function() {
				window.location = "addCommande";
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