<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import='Controler.Servlets.Fournisseur.DeleteFournisseur'%>
<%@page import='Models.Classes.Fournisseur'%>
<%@page import='Controler.JDBC.MYSQL.SQLFournisseur'%>
<%@page import='Controler.JDBC.MYSQL.SqlConnection'%>
<%@page import='java.sql.*'%>
<%@page import='java.util.*'%>
<%
if (session.getAttribute("name") == null) {
	response.sendRedirect("login.jsp");
}
%>
<!DOCTYPE html>
<head>
<link rel="icon" href="images/Icon.png" type="image/png">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.0.1/css/bootstrap.min.css">
<link
	href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap5.min.css">
<link
	href="https://cdn.datatables.net/buttons/2.2.2/css/buttons.bootstrap5.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link
	href="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js">
<title>afficher Fournisseurs</title>
</head>

<body>


	<!-- including the page index  -->
	<jsp:include page="/./tamplates/Dashboard.jsp"></jsp:include>


	<div class="container-fluid"></div>


	<input type="hidden" id="status"
		value="<%=request.getAttribute("status")%>">

	<div class="card my-3 px-0" style="width: auto">
		<div class="card-header fw-bold fs-5">List des fournissuers</div>
		<div class="card-body">
			<div class="container-fluid mx-0 px-0 ">
				<div class="table-responsive">
					<table id="example" class="table" style="max-width: 100%">
						<thead>
							<tr>
								<th>#</th>
								<th>Nom</th>
								<th>Prénom</th>
								<th>Entreprise</th>
								<th>Email</th>
								<th>Capital</th>
								<th>Tel</th>
								<th>Fax</th>
								<th>Adresse</th>
								<th>Pays</th>
								<th>Action</th>
							</tr>
						</thead>
						<%
						List<Fournisseur> list = SQLFournisseur.getListOfFournisseurs();
						%>
						<tbody>
							<%
							for (Fournisseur F : list) {
							%>
							<tr>
								<td><%=F.getId_fournisseur()%></td>
								<td><%=F.getNom()%></td>
								<td><%=F.getPrenom()%></td>
								<td><%=F.getEntreprise()%></td>
								<td><%=F.getEmail()%></td>
								<td><%=F.getCapital()%></td>
								<td><%=F.getTel()%></td>
								<td><%=F.getFax()%></td>
								<td><%=F.getAdresse()%></td>
								<td><%=F.getPays()%></td>
								<td>
									<div class="d-flex justify-content-center">

										<a class="btn btn-outline-primary btn-sm mr-2"
											href="editFournisseur?id_fournisseur=<%=F.getId_fournisseur()%>"
											role="button" data-bs-toggle="tooltip"
											data-bs-placement="top" title='Modifier'> <i
											class="fa-solid fa-pen-to-square"></i>
										</a> <a onclick="confirmation(event)"
											class="btn btn-outline-danger btn-sm"
											href="DeleteFournisseur?id_fournisseur=<%=F.getId_fournisseur()%>"
											role="button" title="supprimer"> <i
											class="fa-solid fa-trash-arrow-up"></i>
										</a>
									</div>

								</td>
							</tr>
							<%
							}
							%>
						</tbody>
						<tfoot>
							<tr>
								<th>#</th>
								<th>Nom</th>
								<th>Prénom</th>
								<th>Entreprise</th>
								<th>Email</th>
								<th>Capital</th>
								<th>Tel</th>
								<th>Fax</th>
								<th>Adresse</th>
								<th>Pays</th>
								<th>Action</th>
							</tr>
						</tfoot>
					</table>
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


	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<script
		src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
	<script
		src="https://cdn.datatables.net/1.11.5/js/dataTables.bootstrap5.min.js"></script>
	<script
		src="https://cdn.datatables.net/buttons/2.2.2/js/dataTables.buttons.min.js"></script>
	<script
		src="https://cdn.datatables.net/buttons/2.2.2/js/buttons.bootstrap5.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
	<script
		src="https://cdn.datatables.net/buttons/2.2.2/js/buttons.html5.min.js"></script>
	<script
		src="https://cdn.datatables.net/buttons/2.2.2/js/buttons.print.min.js"></script>
	<script
		src="https://cdn.datatables.net/buttons/2.2.2/js/buttons.colVis.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
	<script>
		$(document).ready(
				function() {
					var table = $('#example').DataTable({
						lengthChange : false,
						buttons : [ 'copy', 'excel', 'pdf', 'colvis' ]
					});

					table.buttons().container().appendTo(
							'#example_wrapper .col-md-6:eq(0)');
				});
	</script>

	<script src="SweetAlert/sweetalert.min.js"></script>
	<script type="text/javascript">
		var status = document.getElementById("status").value;
		if (status == "success") {
			swal("Terminé!", "Fournisseur a été supprimé !", "success")
					.then(
							function() {
								window.location = "viewFournisseur";
							});
		}
		if (status == "failed") {
			swal("Désolé!", "l'opération a échoué!", "error")
					.then(
							function() {
								window.location = "viewFournisseur";
							});
		}
	</script>
</body>