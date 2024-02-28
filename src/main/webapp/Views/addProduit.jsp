<%@page import='Models.Classes.Fournisseur'%>
<%@page import='Models.Classes.Produit'%>
<%@page import='Models.Classes.Categorie'%>
<%@page import='Controler.JDBC.MYSQL.SQLCategorie'%>
<%@page import='Controler.JDBC.MYSQL.SQLProduit'%>
<%@page import='Controler.JDBC.MYSQL.SqlConnection'%>
<%@page import='java.sql.*'%>
<%@page import='java.util.*'%>
<%@page import="Controler.JDBC.MYSQL.SQLFournisseur"%>
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
<title>Ajouter un produit</title>
<link rel="icon" href="images/Icon.png" type="image/png">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>


</head>
<body>

	<%
	List<Fournisseur> list = SQLFournisseur.getListOfFournisseurs();
	List<Categorie> list2 = SQLCategorie.getListOfCategories();
	%>

	<jsp:include page="/./tamplates/Dashboard.jsp"></jsp:include>


	<div class="container-fluid">

		<input type="hidden" id="status"
			value="<%=request.getAttribute("status")%>">
		<div class="card">
			<div class="card-header">Ajouter un produit</div>
			<div class="card-body">
				<Form action="addProduitServlet" method="post">
					<div class="row">
						<div class="col">
							<div class="form-floating mb-3">
								<input type="text" name='desegnation' class="form-control"
									id="floatingInput" required> <label for="floatingInput">Désignation</label>
							</div>
						</div>
						<div class="row">
							<div class="col-10 col-md-8">
								<div class="form-floating mb-3">
									<select name='categorie' class="form-select"
										aria-label="Default select example" id="floatingInput"
										required>
										<%
										for (Categorie C : list2) {
										%>
										<option value="<%=C.getDesignation()%>"><%=C.getDesignation()%></option>
										<%
										}
										%>
									</select> <label for="floatingInput"> Catégorie</label>
								</div>
							</div>
							<div class="col-6 col-md-4">
								<div class="form-floating mt-1">
									<button class="btn btn-lg btn-outline-dark  mr-2" id="submit"
										data-toggle="modal" data-target="#exampleModalCenter">
										<i class="fa-solid fa-pen-to-square"> </i> Catérgories
									</button>
								</div>
							</div>
						</div>
					</div>
					<div class="row  ">
						<div class="col">
							<div class="form-floating mb-3">
								<select name='id_fournisseur' class="form-select"
									aria-label="Default select example" id="floatingInput" required>
									<%
									for (Fournisseur F : list) {
									%>
									<option value="<%=F.getId_fournisseur()%>"><%=F.getId_fournisseur()%>
										-
										<%=F.getNom()%></option>
									<%
									}
									%>
								</select> <label for="floatingInput"> Fournisseur</label>
							</div>
						</div>
						<div class="col">
							<div class="form-floating mb-3">
								<input type="date" name='date' class="form-control"
									id="floatingInput" required> <label for="floatingInput">
									Date</label><span id="startDateSelected"></span>
							</div>
						</div>
					</div>
					<div class="form-floating mb-3">
						<input type="text" name='prix' class="form-control"
							id="floatingInput" required> <label for="floatingInput">
							PRIX UNITAIRE</label>
					</div>
					<div class="form-floating mb-3">
						<input type="number" min="1" name='quantite' class="form-control"
							id="floatingInput" required> <label for="floatingInput">
							Quantité</label>
					</div>

					<div class="form-floating mb-3">
						<input type="text" name='TVA' class="form-control"
							id="floatingInput" required> <label for="floatingInput">
							TVA %</label>
					</div>

				
					<button type="submit" class="btn btn-success mb-3">Ajouter</button>
					<button type="reset" class="btn btn-dark mb-3">Annuler</button>
				</Form>



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

	<div class="modal fade" id="exampleModalCenter" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-lg  modal-dialog-centered"
			role="document">
			<div class="modal-content rounded-2">
				<div class="modal-body justify-content-center ">


					<div class=" justify-content-center">
						<div class="content-text p-4">
							<div class="row">
								<div class="col-10">
									<h3>Ajouter une catégories</h3>
								</div>
								<div class="col ">
									<button type="button" class="btn  btn-outline-secondary"
										data-dismiss="modal">Fermer</button>
								</div>
							</div>
							<hr>
							<form action="addCategorieServlet" method="post">
								<div class="row  ">
									<div class="col-2 ">
										<label for="inputPassword2" class="fw-bold fs-6 mt-2 ml-4">Catégorie</label>
									</div>
									<div class="col-7">
										<input name='Categorie' type="text" class="form-control"
											id="inputPassword2" placeholder="Designation" required>
									</div>
									<div class="col ml-5">
										<button type="submit" class="btn  btn-outline-success mb-3">Ajouter</button>

									</div>
								</div>
							</form>

							<div class="table-responsive">
								<table class="table " style="max-width: 90%">
									<thead>
										<tr>
											<th scope="col">Desegnation</th>
											<th scope="col">Quntite Produits</th>
											<th scope="col">Action</th>
										</tr>
									</thead>
									<tbody>
										<%
										for (Categorie C : list2) {
										%>
										<tr>
											<td scope="row"><%=C.getDesignation()%></td>
											<td scope="row"><%=SQLCategorie.CategorieProduitsQuantite(C.getDesignation())%></td>
											<td scope="row">
												<div class="d-flex justify-content-center">
													<form action='DeleteCategorieServlet' method='post'>
														<input type="hidden" name="Categorie"
															value="<%=C.getDesignation()%>">
														<button class="btn btn-outline-danger btn-sm"
															type='submit' value="supprimer">
															<i class="fa-solid fa-trash-arrow-up"></i>Supprimer
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
		</div>
	</div>

	<script src="SweetAlert/sweetalert.min.js"></script>
	<script type="text/javascript">
		var status = document.getElementById("status").value;
		if (status == "success") {
			swal("Terminé!", "Le produit a été ajouté!", "success").then(
					function() {
						window.location = "addProduit";
					});
		}
		if (status == "addedC") {
			swal("Terminé!", "Categorie a été ajouté!", "success").then(
					function() {
						window.location = "addProduit";
					});
		}
		if (status == "failed") {
			swal("Désolé!", "Categorie déja existé!", "warning").then(
					function() {
						window.location = "addProduit";
					});
		}
		if (status == "Deleted") {
			swal("Terminé!", "Categorie a été supprimé!", "success").then(
					function() {
						window.location = "addProduit";
					});
		}
	</script>

</body>
</html>