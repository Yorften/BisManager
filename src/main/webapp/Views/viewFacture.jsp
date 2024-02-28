<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import='Models.Classes.Facture'%>
<%@page import='Controler.JDBC.MYSQL.SQLFacture'%>
<%@page import='Controler.JDBC.MYSQL.SqlConnection'%>
<%@page import='java.sql.*'%>
<%@page import='java.util.*'%>
<%@page import='javax.servlet.*,javax.servlet.*'%>
<%@taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>


<%
if (session.getAttribute("name") == null) {
	response.sendRedirect("login.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>listes de factures</title>
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
</head>
</head>
<body>

	<!-- including the page index  -->
	<jsp:include page="/./tamplates/Dashboard.jsp"></jsp:include>


	<div class="container-fluid">



		<input type="hidden" id="status"
			value="<%=request.getAttribute("status")%>">


		<div class="card my-3 px-0" style="width: auto">
			<div class="card-header fw-bold fs-5">List des factures</div>
			<div class="card-body">
				<div class="table-responsive">
					<table id="example" class="table  table-bordered "
						style="max-width: 100%">
						<thead>
							<tr>
								<th>Facture</th>
								<th>Commande</th>
								<th>Client</th>
								<th>Adresse</th>
								<th>Date</th>
								<th>Total-TTC</th>
								<th>Action</th>

							</tr>
						</thead>

						<%
						List<Facture> list = SQLFacture.getListOfFactures();
						request.setAttribute("list", list);
						%>

						<tbody>
							<c:forEach var='C' items='${list}'>
								<tr>
									<td>${C.getId_facture()}</td>
									<td>${C.getCmd().getId_cmd() }</td>
									<td>${C.getCmd().getClient().getNom()}</td>
									<td>${C.getCmd().getAddresse_Cmd()}</td>
									<td>${C.getCmd().getDate_cmd()}</td>
									<td>${C.getCmd().getMontant()}</td>
									<td>
										<div class="d-flex justify-content-center">
											<a class="btn btn-outline-success btn-sm mr-2"
												href="Facture?id_facture=${C.getId_facture()}"
												role="button" title="Details"> <i
												class="fa-solid fa-eye"></i>
											</a> 
											<form action='DeleteFactureServlet' method='post'>
												<input type="hidden" name="id_Facture"
													value="${C.getId_facture()}">
												<button class="btn btn-outline-danger btn-sm mr-2" type='submit' title='supprimer'>
													<i class="fa-solid fa-trash-arrow-up"></i>
												</button>
											</form>
										</div>
									</td>
								</tr>
							</c:forEach>
						</tbody>
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



	<!-- data tables cdn -->
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
		if (status == "deleted") {
			swal("Done!", "facture a été supprimé!", "success")
					.then(
							function() {
								window.location = "viewFacture";
							});
		}
	</script>

</body>
</html>