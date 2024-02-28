<%@page import="java.time.LocalDate"%>
<%@page import="Models.Classes.Produit_Fournisseur"%>
<%@page import="Models.Classes.Produit_Commande"%>
<%@page import="Controler.JDBC.MYSQL.SQLFournisseur"%>
<%@page import='Models.Classes.Produit'%>
<%@page import='Models.Classes.Fournisseur'%>
<%@page import='Controler.JDBC.MYSQL.SQLProduit'%>
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
<title>Commande Details</title>
<link rel="icon" href="images/Icon.png" type="image/png">
</head>
<body>


	<%
	int id_fournisseur = Integer.parseInt(request.getParameter("id_fournisseur"));
	Fournisseur F = SQLFournisseur.getProduitFournisseur(id_fournisseur);
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
						<%=F.getId_fournisseur()%></div>
					<div class="col-md-2">Date : <%=LocalDate.now() %></div>
					<div class="col-md-3">
						Total TTC :
						<%=F.getTotalMontant()%></div>
					<div class="col-md-2">
						Validé :
						<%
					    if (F.CommandeAchateValidtion()) {
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
						<a class="btn btn-outline-success btn-sm mr-1"
							href="#" role="button"> <i
							class="fa-solid fa-plus "></i> Facture
						</a> <a class="btn btn-outline-danger btn-sm "
							href="DeleteProduitsFourniServlet?id_fournisseur=<%=F.getId_fournisseur()%>"
							role="button"> <i class="fa-solid fa-trash-can"></i>
							Supprimer
						</a>
					</div>
				</div>

				<div class="row">
					<div class="col-sm-4">
						<div class="shadow-lg  ">
							<!-- start of card 1-->
							<div class="card my-3">
								<div class="card-header">Fourniseeur</div>
								<div class="card-body">

									<div class="table-responsive">
										<table class="table table-flip-scroll" style="max-width: 100%">
											<tr>
												<th scope="col">id Fournisseur</th>
												<td scope="row"><%=F.getId_fournisseur()%></td>
											</tr>
											<tr>
												<th scope="col">Nom et Prenom</th>
												<td scope="row"><%=F.getNom()%> <%=F.getPrenom()%></td>
											</tr>
											<tr>
												<th scope="col">Capital</th>
												<td scope="row"><%=F.getCapital()%> MAD</td>
											</tr>
											<tr>
												<th scope="col">Email</th>
												<td scope="row"><%=F.getEmail()%></td>
											</tr>
											<tr>
												<th scope="col">Adresse</th>
												<td scope="row"><%=F.getAdresse()%></td>
											</tr>
											<tr>
												<th scope="col">Pay</th>
												<td scope="row"><%=F.getPays()%></td>
											</tr>
											<tr>
												<th scope="col">tel</th>
												<td scope="row"><%=F.getTel()%></td>
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
								<div class="card-header">Produits Commandés</div>
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
													<th scope="col"></th>
												</tr>
											</thead>
											<tbody>
												<%
												for (Produit_Fournisseur P : F.getProd_Four()) {
												%>
												<tr>
													<td scope="row"><%=P.getProduits_Fourni().getDesegnation()%></td>
													<td scope="row"><%=P.getProduits_Fourni().getPrix()%></td>
													<td scope="row"><%=P.getProduits_Fourni().getQuantite()%></td>
													<td scope="row"><%=P.getProduits_Fourni().getPrix_Total()%></td>
													<td scope="row"><%=P.getProduits_Fourni().getTVA()%></td>
													<td scope="row"><%=P.getProduits_Fourni().getPrix_Total() * (1 + (P.getProduits_Fourni().getTVA() / 100))%>
													</td>
													<td scope="row">
														<div class="d-flex justify-content-center">
															<%
															if (P.isValide()) {
															%>
															<form action='EditProduitFournisseur' method='post'>
																<input type="hidden" name="id_fournisseur"
																	value="<%=P.getIdent_Fournisseur().getId_fournisseur()%>">
																<input type="hidden" name="status" value="valid">
																<input type="hidden" name="id_Produit"
																	value="<%=P.getProduits_Fourni().getId_Produit()%>">
																<input type="hidden" name="validation" value="true">
																<button class="btn btn-outline-success btn-sm mr-2"
																	type='submit' title='supprimer'>
																	<i class="fa-solid fa-check" style="color: #006400;"></i>
																</button>
															</form>
															<%
															} else {
															%>
															<form action='EditProduitFournisseur' method='post'>
																<input type="hidden" name="id_fournisseur"
																	value="<%=P.getIdent_Fournisseur().getId_fournisseur()%>">
																<input type="hidden" name="status" value="not-valid">
																<input type="hidden" name="id_Produit"
																	value="<%=P.getProduits_Fourni().getId_Produit()%>">
																<input type="hidden" name="validation" value="false">
																<button class="btn btn-outline-danger btn-sm mr-2"
																	type='submit' title='supprimer'>
																	<i class="fa-solid fa-x" style="color: #FF0000;"></i>
																</button>
															</form>
															<%
															}
															%>
															<form action='EditProduitFournisseur' method='post'>
																<input type="hidden" name="id_fournisseur"
																	value="<%=P.getIdent_Fournisseur().getId_fournisseur()%>">
																<input type="hidden" name="status" value="supprimer">
																<input type="hidden" name="id_Produit"
																	value="<%=P.getProduits_Fourni().getId_Produit()%>">
																<button class="btn btn-outline-dark btn-sm mr-2"
																	type='submit' title='supprimer'>
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
		<!-- end of Main Card -->
	</div>
	<!-- end of content page -->

	</div>
	<!-- Footer -->
	<footer class="sticky-footer bg-white">
		<div class="container my-auto">
			<div class="copyright text-center my-auto">
				<span>Copyright &copy; Your Website 2021</span>
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
		if (status == "validation_changed") {
			swal("Terminé!", "Validation changé avec success!", "success");
		}
		if (status == "Produit_removed") {
			swal("Terminé!", "Produit a été supprimer!", "success");
		}
	</script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>
</html>