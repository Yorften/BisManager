<%@page import='Controler.Servlets.Produit.UpdateProduitServlet'%>
<%@page import='Models.Classes.Produit'%>
<%@page import='Controler.JDBC.MYSQL.SQLProduit'%>
<%@page import='java.sql.*'%>
<%@page import='java.util.*'%>
<%@page import='Models.Classes.Categorie'%>
<%@page import='Controler.JDBC.MYSQL.SQLCategorie'%>
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
<title>Modifier Produit</title>
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
	String id_Produit = request.getParameter("id_Produit");
	Produit P = SQLProduit.getProduitById(Integer.parseInt(id_Produit));
	List<Categorie> list2 = SQLCategorie.getListOfCategories();
	%>

	<!-- including the page index  -->
	<jsp:include page="/./tamplates/Dashboard.jsp"></jsp:include>


	<div class="container-fluid">
		<input type="hidden" id="status"
			value="<%=request.getAttribute("status")%>">

		<div class="container">
			<div class="card">
				<div class="card-header">Modifier un produit</div>
				<div class="card-body">

					<Form action="UpdateProduitServlet" method="post">
						<div>
							<input type="hidden" name='id_Produit' class="form-control"
								id="floatingInput" value="<%=P.getId_Produit()%>">
						</div>
						<div class="form-floating mb-3">
							<input type="text" name='desegnation' class="form-control"
								id="floatingInput" value="<%=P.getDesegnation()%>" required>
							<label for="floatingInput"> Desegnation</label>
						</div>
						<div class="row ">
							<div class="col">
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
									</select> <label for="floatingInput"> Categorie</label>
								</div>
							</div>
							<div class="col">
								<div class="form-floating mb-3">
									<input type="date" name='date' value="" class="form-control"
										id="floatingInput" required> <label
										for="floatingInput"> Date</label><span id="startDateSelected"></span>
								</div>
							</div>
						</div>
						<div class="form-floating mb-3">
							<input type="text" name='prix' class="form-control"
								id="floatingInput" value="<%=P.getPrix()%>" required> <label
								for="floatingInput"> PRIX UNiTAIRE</label>
						</div>
						<div class="form-floating mb-3">
							<input type="number" name='quantite' class="form-control"
								id="floatingInput" value="<%=P.getQuantite()%>" required><label
								for="floatingInput"> Quantite</label>
						</div>

						<div class="form-floating mb-3">
							<input type="text" name='TVA' class="form-control"
								id="floatingInput" value="<%=P.getTVA()%>" required> <label
								for="floatingInput"> TVA %</label>
						</div>
						<div class="row  mr-5 mt-2">
							<div class="col ml-4 mt-4">
								<button type="submit" class="btn btn-outline-success mb-3">Modifier</button>
								<button type="reset" class="btn btn-outline-dark mb-3">Annuler</button>

							
							</div>
						</div>
					</Form>
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