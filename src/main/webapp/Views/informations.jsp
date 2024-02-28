<%@page import="Controler.JDBC.MYSQL.SQLinformations"%>
<%@page import="Models.Classes.Produit_Commande"%>
<%@page import="Controler.JDBC.MYSQL.SQLFournisseur"%>
<%@page import="Models.Classes.informations"%>
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
<title>Ma socitété</title>
<link rel="icon" href="images/Icon.png" type="image/png">
</head>
<body>
	<jsp:include page="/./tamplates/Dashboard.jsp"></jsp:include>

	<div class="container-fluid">

		<input type="hidden" id="status"
			value="<%=request.getAttribute("status")%>">

		<div class="row">
			<div class="col-sm-5">
				<div class="shadow-lg  ">
					<!-- start of card 1-->
					<div class="card my-3 border-left-dark">
						<div class="card-header">Logo</div>
						<div class="card-body"></div>

						<img src="images/logo/logo1.png"
							class="rounded mx-auto d-block img-thumbnail" alt="...">
						<form method="post" action='addLogo' enctype="multipart/form-data">
							<div class="mb-2 mr-5 ml-2 mt-4">
								<div class="custom-file">
									<input type="file" id='file' name='image' class="form-control"
							id="floatingInput">
								</div>
							</div>
							<div class="mb-2 mr-5 ml-2">
								<button class="btn btn-outline-info btn-sm mr-3">
									<i class="fa-solid fa-screwdriver-wrench"></i> changer
								</button>
							</div>
						</form>
					</div>
				</div>
			</div>
			<!-- end of card 1 -->
			<!-- start of card 2 -->
			<div class="col-sm-7">
				<div class="shadow-lg ">

					<div class="card my-3 border-left-dark">
						<div class="card-header">
							<div class="row">
								<div class="col ">Information d'entreprise</div>
								<div class="col d-flex justify-content-end">
									<button type="button"
										class="btn btn-outline-primary btn-sm mr-2" id="submit"
										data-toggle="modal" data-target="#exampleModalCenter"
										role="button">
										<i class="fa-solid fa-pen-to-square"></i> Modifier
									</button>
								</div>
							</div>
						</div>
						<div class="card-body">
							<%
							informations info = SQLinformations.getinfos();
							%>
							<div class="table-responsive">
								<table class="table " style="max-width: 100%">
									<tr>
										<th scope="col">Nom</th>
										<!--  <td scope="row"><s%=info.getNom()%></td>-->
										<td scope="row">Bis Manager</td>
									</tr>
									<tr>
										<th scope="col">Adresse</th>
										<!-- <td scope="row"><s%=info.getAdresse()%></td> -->
										<td scope="row">26, Rue Ibn Habous Bd Yaacoub El Mansour-20100</td>
									</tr>
									<tr>
										<th scope="col">Raison Sociale</th>
										<!--  <td scope="row"><s%=info.getRaison()%></td>-->
										<td scope="row">EURL</td>
									</tr>
									<tr>
										<th scope="col">Capital</th>
										<!--  <td scope="row"><s%=info.getCapiltal()%> DHs</td>-->
										<td scope="row">500000 DHs</td>
									</tr>
									<tr>
										<th scope="col">E-mail</th>
										<!--  <td scope="row"><s%=info.getEmail()%></td>-->
										<td scope="row">Bis@manager.com</td>
									</tr>
									<tr>
										<th scope="col">Tel</th>
										<!--  <td scope="row"><s%=info.getTel()%></td>-->
										<td scope="row">0526321154</td>
									</tr>
									<tr>
										<th scope="col">Fax</th>
										<!--  <td scope="row"><s%=info.getFax()%></td>-->
										<td scope="row">555-352-8755</td>
									</tr>

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
							<h3>Modifier les informations</h3>
							<p>Ces informations concernant l'organisation qui utilise
								cette application</p>

							<form action="Updateinfo" method="post">
								<div class="row  mr-5 mt-2">
									<div class="col-3 ml-3">
										<label for="inputPassword2" class="visually-hidden"><strong>Nom</strong></label>
									</div>
									<div class="col">
										<input name='Nom' type="text" class="form-control"
											id="inputPassword2" placeholder="Nom de Votre Organization"
											required value="Bis Manager">
									</div>
								</div>
								<div class="row  mr-5 mt-2">
									<div class="col-3 ml-3">
										<label for="inputPassword2" class="visually-hidden"><strong>Adresse</strong></label>
									</div>
									<div class="col">
										<input name="Adresse" type="text" class="form-control"
											id="inputPassword2" placeholder="Adresse" required
											value="26, Rue Ibn Habous Bd Yaacoub El Mansour-20100">
									</div>
								</div>
								<div class="row  mr-5 mt-2">
									<div class="col-3 ml-3">
										<label for="inputPassword2" class="visually-hidden"><strong>Raison
											Sociale</strong></label>
									</div>
									<div class="col">
										<input name='Raison_Sociale' type="text" class="form-control"
											id="inputPassword2" placeholder="Raison Sociale" required
											value="EURL">
									</div>
								</div>
								<div class="row  mr-5 mt-2">
									<div class="col-3 ml-3">
										<label for="inputPassword2" class="visually-hidden"><strong>Capital</strong></label>
									</div>
									<div class="col">
										<input name='Capital' type="number" class="form-control"
											id="inputPassword2" placeholder="Capital en MAD" required
											value="500000"> 
									</div>
								</div>
								<div class="row  mr-5 mt-2">
									<div class="col-3 ml-3">
										<label for="inputPassword2" class="visually-hidden"><strong>E-mail</strong></label>
									</div>
									<div class="col">
										<input name="Email" type="email" class="form-control"
											id="inputPassword2" placeholder="Votre Email" required
											value="Bis@manager.com">
									</div>
								</div>
								<div class="row  mr-5 mt-2">
									<div class="col-3 ml-3">
										<label for="inputPassword2" class="visually-hidden"><strong>Tel</strong>
										</label>
									</div>
									<div class="col">
										<input name='tel' type="tel" class="form-control"
											id="inputPassword2" placeholder="votre numéro de téléphone"
											required value="0526321154">
									</div>
								</div>
								<div class="row  mr-5 mt-2">
									<div class="col-3 ml-3">
										<label for="inputPassword2" class="visually-hidden "><strong>Fax</strong></label>
									</div>
									<div class="col">
										<input name='fax' type="tel" class="form-control"
											id="inputPassword2" placeholder="votre Fax" required
											value="555-352-8755">
									</div>
								</div>


								<div class="row  mr-5 mt-2">
									<div class="col ml-4 mt-4">
										<button type="submit" class="btn btn-success mb-3">Enregistrer</button>
										<button type="reset" class="btn btn-dark mb-3" data-dismiss="modal">Annuler</button>
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
			swal("Done!", "Commande Ajouter!", "success").then(function() {
				window.location = "informations";
			});
		}
		if (status == "infoUpdated") {
			swal("terminer!", "informations Ajouter!", "success").then(
					function() {
						window.location = "informations";
					});
		}
		if (status == "infoError") {
			swal("Desolé!", "error dans l'informations !", "error").then(
					function() {
						window.location = "informations";
					});
		}
	</script>




	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>
</html>