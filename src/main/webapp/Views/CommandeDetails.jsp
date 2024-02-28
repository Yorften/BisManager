<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="Models.Classes.Produit_Commande"%>
<%@page import="Controler.JDBC.MYSQL.SQLFournisseur"%>
<%@page import='Controler.JDBC.MYSQL.SQLCommande'%>
<%@page import='Models.Classes.Produit'%>
<%@page import='Models.Classes.Client'%>
<%@page import='Models.Classes.Commande'%>
<%@page import='Controler.JDBC.MYSQL.SQLProduit'%>
<%@page import='Controler.JDBC.MYSQL.SQLClinet'%>
<%@page import='Controler.JDBC.MYSQL.SqlConnection'%>
<%@page import='java.sql.*'%>
<%@page import='java.util.*'%>
<%
if (session.getAttribute("name") == null) {
	response.sendRedirect("login.jsp");
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Commande Details</title>
<link rel="icon" href="images/Icon.png" type="image/png">
</head>
<body>

	<%
	int id_cmd = Integer.parseInt(request.getParameter("id_cmd"));
	Commande cmd = SQLCommande.getCommandeDetails(id_cmd);
	%>
	<jsp:include page="/./tamplates/Dashboard.jsp"></jsp:include>

	<div class="container-fluid">

		<input type="hidden" id="status"
			value="<%=request.getAttribute("status")%>">

		<div class="card my-3">
			<div class="card-header">Commande details</div>
			<div class="card-body">

				<div class="row">
					<div class="col-md-3 ">
						Commande N°
						<%=cmd.getId_cmd()%></div>
					<div class="col-md-2">
						Date :<%=cmd.getDate_cmd()%></div>
					<div class="col-md-3">
						Total TTC :
						<%=cmd.getMontant()%></div>
					<div class="col-md-2">
						Validé :
						<%
					if (cmd.isValidtion()) {
					%>
						<i class="fa-solid fa-check" style="color: #006400;"></i>
						<%
						} else {
						%>
						<i class="fa-solid fa-x" style="color: #FF0000;"></i>
						<%
						}
						%>
					</div>
					<div class="row -md-2  ">
						<form method="post" action='AddFactureServlet'>
							<input type='hidden' name='id_cmd' value='<%=cmd.getId_cmd()%>'>
							<button type="submit" class="btn btn-outline-success btn-sm mr-1">
								<i class="fa-solid fa-plus "></i> Facture
							</button>
						</form>
						<form method="post" action='DeleteCommandeServlet'>
							<input type='hidden' name='id_cmd' value='<%=cmd.getId_cmd()%>'>
							<button type="submit" class="btn btn-outline-danger btn-sm mr-1">
								<i class="fa-solid fa-trash-can"></i> Supprimer
							</button>
						</form>
					</div>
				</div>

				<div class="row">
					<div class="col-sm-4">
						<div class="shadow-lg  ">
							<!-- start of card 1-->
							<div class="card my-3">
								<div class="card-header">Client</div>
								<div class="card-body">

									<div class="table-responsive">
										<table class="table table-flip-scroll" style="max-width: 100%">
											<tr>
												<th scope="col">id Client</th>
												<td scope="row"><%=cmd.getClient().getId_Client()%></td>
											</tr>
											<tr>
												<th scope="col">Nom et Prenom</th>
												<td scope="row"><%=cmd.getClient().getNom()%> <%=cmd.getClient().getPrenom()%></td>
											</tr>
											<tr>
												<th scope="col">Code Postal</th>
												<td scope="row"><%=cmd.getClient().getCode_Postal()%></td>
											</tr>
											<tr>
												<th scope="col">Email</th>
												<td scope="row"><%=cmd.getClient().getEmail()%></td>
											</tr>
											<tr>
												<th scope="col">Adresse</th>
												<td scope="row"><%=cmd.getClient().getAdresse()%></td>
											</tr>
											<tr>
												<th scope="col">ville</th>
												<td scope="row"><%=cmd.getClient().getVille()%></td>
											</tr>
											<tr>
												<th scope="col">tel</th>
												<td scope="row"><%=cmd.getClient().getTel()%></td>
											</tr>
										</table>
									</div>

								</div>
							</div>
						</div>
					</div>
					<!-- end of card 1 -->
					<!-- start of card 2 -->
					<div class="col-sm-8">
						<div class="shadow-lg ">

							<div class="card my-3">
								<div class="card-header">Produits commandés</div>
								<div class="card-body">

									<div class="table-responsive">
										<table class="table " style="max-width: 100%">
											<thead>
												<tr>
													<th scope="col">Produit</th>
													<th scope="col">Prix unitaire</th>
													<th scope="col">Quantité</th>
													<th scope="col">Sous-Total</th>
													<th scope="col">TVA(%)</th>
													<th scope="col">Sous-TTC</th>
												</tr>
											</thead>
											<tbody>
												<%
												for (Produit_Commande PC : cmd.getProd_Cmd()) {
												%>
												<tr>
													<td scope="row"><%=PC.getProduit_cmd().getDesegnation()%></td>
													<td scope="row"><%=PC.getProduit_cmd().getPrix()%></td>
													<td scope="row"><%=PC.getProduit_cmd().getQuantite()%></td>
													<td scope="row"><%=PC.getProduit_cmd().getPrix_Total()%></td>
													<td scope="row"><%=PC.getProduit_cmd().getTVA()%></td>
													<td scope="row"><%=PC.getProduit_cmd().getPrix_Total() * (1 + (PC.getProduit_cmd().getTVA() / 100))%>
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
		<!-- end of Main Card -->
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
		if (status == "success") {
			swal("Terminé!", "Commande a été Ajouté!", "success");
		}
		if (status == "duplication") {
			swal("désolé!", "la commande a déjà une facture!", "info");
		}
		if (status == "command_not_valid") {
			swal("désolé!", "la commande n'est pas validé !", "info");
		}
	</script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>
</html>