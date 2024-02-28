<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import='Controler.Servlets.Client.DeleteClientServlet'%>
<%@page import='Models.Classes.Client'%>
<%@page import='Controler.JDBC.MYSQL.SQLClinet'%>
<%@page import='Controler.JDBC.MYSQL.SqlConnection'%>
<%@page import='java.sql.*'%>
<%@page import='java.util.*'%>
<%@page import='javax.servlet.*,javax.servlet.*'%>
<%@taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
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
<title>affichage des client</title>


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
<link rel="stylesheet" href="css/style_index.css" />
</head>
</head>
<body>

	<!-- including the page index  -->
	<jsp:include page="/./tamplates/Dashboard.jsp"></jsp:include>


	<div class="container-fluid">





		<input type="hidden" id="status"
			value="<%=request.getAttribute("status")%>">



		<div class="card my-3 px-0" style="width: auto">
			<div class="card-header  fw-bold fs-5">List des clients</div>
			<div class="card-body">
				<div class="table-responsive">
					<table id="example" class="table " style="max-width: 100%">
						<thead>
							<tr>
								<th>#</th>
								<th>Nom</th>
								<th>Prenom</th>
								<th>CodePostal</th>
								<th>Email</th>
								<th>Adresse</th>
								<th>Pays</th>
								<th>ville</th>
								<th>tel</th>
								<th>Action</th>

							</tr>
						</thead>

						<%
						List<Client> list = SQLClinet.getListOfClients();
						request.setAttribute("list", list);
						%>

						<tbody>
							<c:forEach var='C' items='${list}'>
								<tr>
									<td>${C.getId_Client()}</td>
									<td>${C.getNom() }</td>
									<td>${C.getPrenom()}</td>
									<td>${C.getCode_Postal()}</td>
									<td>${C.getEmail()}</td>
									<td>${C.getAdresse()}</td>
									<td>${C.getPays()}</td>
									<td>${C.getVille()}</td>
									<td>${C.getTel()}</td>
									<td>
										<div class="d-flex justify-content-center">

											<a class="btn btn-outline-primary btn-sm mr-2"
												href="editClient?id_Client=${C.getId_Client()}"
												role="button"> <i class="fa-solid fa-pen-to-square"></i>
											</a>
											<form action='Delete_Client' method='post'>
												<input type="hidden" name="id_Client"
													value="${C.getId_Client()}">
												<button type='submit' class="btn btn-outline-danger btn-sm mr-2">
													<i class="fa-solid fa-trash-arrow-up"></i>
												</button>


											</form>
										</div>
									</td>
								</tr>
							</c:forEach>
						</tbody>
						<tfoot>
							<tr>
								<th>#</th>
								<th>Nom</th>
								<th>Prenom</th>
								<th>CodePostal</th>
								<th>Email</th>
								<th>Adresse</th>
								<th>Pays</th>
								<th>ville</th>
								<th>tel</th>
								<th>Action</th>
							</tr>
						</tfoot>
					</table>
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
		if (status == "success") {
			swal("Terminé!", "client a été supprimé!", "success")
					.then(
							function() {
								window.location = "ViewClients";
							});
		}
		if (status == "edited") {
			swal("Terminé!", "Client a été modifé!", "success")
					.then(
							function() {
								window.location = "ViewClients";
							});
		}
	</script>

</body>
</html>