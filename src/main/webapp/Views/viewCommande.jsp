<%@page import="java.time.LocalDate"%>
<%@page import="Models.Classes.Produit_Fournisseur"%>
<%@page import='Controler.JDBC.MYSQL.SQLProduit_Fournisseur'%>
<%@page import='Controler.JDBC.MYSQL.SQLCommande'%>
<%@page import='Controler.JDBC.MYSQL.SQLFournisseur'%>
<%@page import='Models.Classes.Fournisseur'%>
<%@page import='Models.Classes.Commande'%>
<%@page import='java.sql.*'%>
<%@page import='java.util.*'%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
if (session.getAttribute("name") == null) {
	response.sendRedirect("login.jsp");
}
%><!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Afficher Commandes</title>
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
<!-- Data table css -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.0.1/css/bootstrap.min.css">
<link
	href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap5.min.css">
<link
	href="https://cdn.datatables.net/buttons/2.2.2/css/buttons.bootstrap5.min.css">


</head>
<body>



	<input type="hidden" id="status"
		value="<%=request.getAttribute("status")%>">
	<%
	List<Commande> list_Cmd = SQLCommande.getListOfCommandes();
	%>
	<%
	List<Fournisseur> Prod_fourni = SQLProduit_Fournisseur.getListOfFourni_Fournisseur();
	%>

	<jsp:include page="/./tamplates/Dashboard.jsp"></jsp:include>


	<div class="card ">
		<div class="card-header  text-center fw-bold fs-5">List des commandes</div>
		<div class="card-body">
			<div class="d-grid gap-2 d-md-flex justify-content-md-end">
				<a class="btn btn-outline-success btn-sm " href="addCommande"
					role="button"><i class="fa-regular fa-plus"></i> Ajouter
					une commande</a>
			</div>

			<div class="row">

				<!-- achats card -->

				<div class="col-sm-6">
					<div class="shadow-lg  bg-body ">
						<div class="card border-bottom-secondary">
							<div class="card-header fw-bold fs-5">
								<div class="row">
									<div class="col-md-11">Ventes</div>
									<div class="col-6 col-md-1">
										<div class="badge bg-info text-wrap fs-5" style="width: auto;">
											<%=list_Cmd.size()%>
										</div>
									</div>
								</div>
							</div>
							<div class="card-body">
								<div class="table-responsive">
									<table id="example1" class="table " style="max-width: 100%">
										<thead>
											<tr>
												<th scope="col">#</th>
												<th scope="col">Date</th>
												<th scope="col">Client</th>
												<th scope="col">Valide</th>
												<th scope="col">Action</th>
											</tr>
										</thead>

										<tbody>
											<%
											for (Commande CL : list_Cmd) {
											%>
											<tr>
												<td scope="row"><%=CL.getId_cmd()%></td>
												<td scope="row"><%=CL.getDate_cmd()%></td>
												<td scope="row"><%=CL.getClient().getNom()%></td>
												<td scope="row">
													<%
													if (CL.isValidtion()) {
													%> <i class="fa-solid fa-check" style="color: #006400;"></i>
													<%
													} else {
													%> <i class="fa-solid fa-x" style="color: #FF0000;"></i> <%
 }
 %>
												</td>

												<td scope="row"><a
													class="btn btn-outline-success btn-sm "
													href="CommandeDetails?id_cmd=<%=CL.getId_cmd()%>"
													role="button">details</a> <a
													class="btn btn-outline-secondary btn-sm"
													href="editCommandeServlet?id_cmd=<%=CL.getId_cmd()%>"
													role="button"><i class="fa-solid fa-pen-to-square"></i></a>
													<a class="btn btn-outline-danger btn-sm"
													href="DeleteCommandeServlet?id_cmd=<%=CL.getId_cmd()%>"
													role="button"><i class="fa-solid fa-trash-arrow-up"></i></a>
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
				<!--end of card achats  -->

				<!-- Ventes card -->

				<div class="col-sm-6">
					<div class="shadow-lg  bg-body ">
						<div class="card border-bottom-secondary">
							<div class="card-header fw-bold fs-5">
								<div class="row">
									<div class="col-md-11">Achats</div>
									<div class="col-6 col-md-1">

										<div class="badge bg-info text-wrap fs-5" style="width: auto;">
											<%=Prod_fourni.size()%>
										</div>
									</div>
								</div>

							</div>
							<div class="card-body">
								<div class="table-responsive">
									<table id="example2" class="table " style="max-width: 100%">
										<thead>
											<tr>
												<th scope="col">#</th>
												<th scope="col">Date</th>
												<th scope="col">Fournisseur</th>
												<th scope="col">Valide</th>
												<th scope="col">Action</th>
											</tr>
										</thead>
										<tbody>
											<%
											for (Fournisseur F : Prod_fourni) {
											%>
											<tr>
												<td scope="row"><%=F.getId_fournisseur()%></td>
												<td scope="row"><%=LocalDate.now()%></td>
												<td scope="row"><%=F.getNom()%></td>
												<td scope="row">
													<%
													if (F.CommandeAchateValidtion()) {
													%> <i class="fa-solid fa-check" style="color: #006400;"></i>
													<%
													} else {
													%> <i class="fa-solid fa-x" style="color: #FF0000;"></i> <%
 }
 %>
												</td>
												<td scope="row"><a
													class="btn btn-outline-success btn-sm "
													href="achatesDetails?id_fournisseur=<%=F.getId_fournisseur()%>"
													data-bs-target="#staticBackdrop">details</a> <a
													class="btn btn-outline-secondary btn-sm" href="#"
													role="button"><i class="fa-solid fa-pen-to-square"></i></a>
													<a class="btn btn-outline-danger btn-sm"
													href="DeleteProduitsFourniServlet?id_fournisseur=<%=F.getId_fournisseur()%>"
													role="button"><i class="fa-solid fa-trash-arrow-up"></i></a>
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
				<!--end of card Ventes  -->
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

	<!-- Modal -->
	<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">Modal title</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body"></div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Understood</button>
				</div>
			</div>
		</div>
	</div>


	<script src="SweetAlert/sweetalert.min.js"></script>
	<script type="text/javascript">
		var status = document.getElementById("status").value;
		if (status == "success") {
			swal("Termin\u00e9!", "Commande vente a \u00e9t\u00e9 supprim\u00e9!",
					"success").then(function() {
				window.location = "viewCommande";
			});
		}
		if (status == "ajoute") {
			swal("Termin\u00e9!", "La facture a \u00e9t\u00e9 ajout\u00e9e!", "success")
					.then(function() {
						window.location = "viewFacture";
					});
		}
		if (status == "Ach_Deleted") {
			swal("Termin\u00e9!", "Commande achat a \u00e9t\u00e9  supprim\u00e9!",
					"success").then(function() {
				window.location = "viewCommande";
			});
		}
		if (status == "cmd_edited") {
			swal(
					"T\ermin\u00e9!",
					"Votre commande a \u00e9t\u00e9 \u00e9dit\u00e9e avec succ\u00e9s!",
					"success").then(function() {
				window.location = "viewCommande";
			});
		}
		if (status == "edit_failed") {
			swal("D\u00e9sol\u00e9!",
					"Votre commande n'a pas pu \u00e9tre mise \u00E0 jour!", "error")
					.then(function() {
						window.location = "viewCommande";
					});
		}
	</script>




	<!-- data tables cdn -->
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<script
		src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
	<script
		src="https://cdn.datatables.net/1.11.5/js/dataTables.bootstrap5.min.js"></script>
	<script>
		$(document).ready(function() {
			$('#example1').DataTable({
				lengthChange : false,
			});
		});
		$(document).ready(function() {
			$('#example2').DataTable({
				lengthChange : false,
			});
		});
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