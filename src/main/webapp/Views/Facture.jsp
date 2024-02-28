<%@page import="java.time.LocalDate"%>
<%@page import="Models.Classes.Produit_Commande"%>
<%@page import="Models.Classes.Produit"%>
<%@page import="Models.Classes.informations"%>
<%@page import="Controler.JDBC.MYSQL.SQLinformations"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import='Models.Classes.Facture'%>
<%@page import='Controler.JDBC.MYSQL.SQLFacture'%>
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
<meta charset="utf-8" />
<link rel="icon" href="images/Icon.png" type="image/png">
<!-- Custom fonts for this template-->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">



<style>
.invoice-box {
	max-width: 800px;
	margin: auto;
	padding: 30px;
	border: 1px solid #eee;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.15);
	font-size: 16px;
	line-height: 24px;
	font-family: 'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif;
	color: #555;
}

.invoice-box table {
	width: 100%;
	line-height: inherit;
	text-align: left;
}

.invoice-box table td {
	padding: 5px;
	vertical-align: top;
}

.info {
	text-align: right;
}

.invoice-box table tr.top table td {
	padding-bottom: 20px;
}

.invoice-box table tr.top table td.title {
	font-size: 45px;
	line-height: 45px;
	color: #333;
}

.invoice-box table tr.information table td {
	padding-bottom: 40px;
}

.invoice-box table tr.heading td {
	background: #eee;
	border-bottom: 1px solid #ddd;
	font-weight: bold;
}

.invoice-box table tr.details td {
	padding-bottom: 20px;
}

.invoice-box table tr.item td {
	border-bottom: 1px solid #eee;
}

.invoice-box table tr.item.last td {
	border-bottom: none;
}

.invoice-box table tr.total td:nth-child(2) {
	border-top: 2px solid #eee;
	font-weight: bold;
}

@media print {
	.print {
		display: blocked; !
		important width: 100%;
	}
	.no-print {
		display: none;
	}
}
</style>
<script>
	var jsPrintAll = function() {
		setTimeout(function() {
			window.print();
		}, 500);
	}
</script>

<title class="no-print">Facture</title>
</head>
<body style='font-weight: bold;' id="printableArea">


	<%
	int id_facture = Integer.parseInt(request.getParameter("id_facture"));
	Facture F = SQLFacture.getFactureById(id_facture);
	informations info = SQLinformations.getinfos();
	%>

	<div class="container ">
		<div class="invoice-box print">
			<table cellpadding="0" cellspacing="0">
				<tr class="top">
					<td colspan="2">
						<table>
							<tr>
								<td class="title"><img src="images/logo/logo1.png"
									style="width: 80%; max-width: 300px" /></td>

								<td><br>Facture #: <%=F.getId_facture()%><br /> Date:
									<%=LocalDate.now()%> <br /></td>
							</tr>
						</table>
					</td>
				</tr>

				<tr class="information">
					<td colspan="2">
						<table>
							<tr>
								<td class="inline"><%=info.getNom()%><br /><%=info.getAdresse()%><br />
									<%=info.getEmail()%><br><%=info.getTel()%></td>

								<td class="info ">Client : <%=F.getCmd().getClient().getId_Client()%><br />
									Nom et Prénom :<%=F.getCmd().getClient().getNom()%> <%=F.getCmd().getClient().getPrenom()%><br />
									Email : <%=F.getCmd().getClient().getEmail()%> <br />
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr class="heading">
					<td>
						<table class="table" style="max-width: 100%">
							<thead>
								<tr>
									<th scope="col">Produit</th>
									<th scope="col">Prix Unitaire</th>
									<th scope="col">Quntité</th>
									<th scope="col">Total</th>
									<th scope="col">TVA(%)</th>
									<th scope="col">TTC</th>
								</tr>
							</thead>

							<tbody class="mb-5">
								<%
								for (Produit_Commande PC : F.getCmd().getProd_Cmd()) {
								%>
								<tr>
									<td scope="row"><%=PC.getProduit_cmd().getDesegnation()%></td>
									<td scope="row"><%=PC.getProduit_cmd().getPrix()%></td>
									<td scope="row"><%=PC.getProduit_cmd().getQuantite()%></td>
									<td scope="row"><%=PC.getProduit_cmd().getPrix_Total()%></td>
									<td scope="row"><%=PC.getProduit_cmd().getTVA()%></td>
									<td scope="row"><%=PC.getProduit_cmd().getPrix_Total() * (1 + (PC.getProduit_cmd().getTVA() / 100))%>
								</tr>
								<%
								}
								%>
							</tbody>
							<tfoot>
								<tr class="mt-5">
									<th scope="col"></th>
									<th scope="col"></th>
									<th scope="col"></th>
									<th scope="col"></th>
									<th scope="col">TOTAL-TTC</th>
									<th scope="col"><%=F.getCmd().getMontant()%></th>
								</tr>
							</tfoot>

						</table>
					</td>
				</tr>
			</table>
			<div class="card  no-print">
				<div class="row">
					<div class="col">
						<div class="card-body d-flex justify-content-center mr-3">
							<a class="btn btn-outline-info mr-4" href="viewFacture"
								role="button"> <i class="fa-solid fa-arrow-left"></i>
								annuler
							</a>
							<button type="button" class="btn btn-outline-secondary "
								onclick="window.print()">
								<i class="fa-solid fa-print"></i> Imprimer
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--  	<div class="invoice-box no-print">

		<input type="button" onclick="printDiv('printableArea')"
			value="print a div!" />
	</div>
	<script type="text/javascript">
		function printDiv(divName) {
			var printContents = document.getElementById(divName).innerHTML;
			var originalContents = document.body.innerHTML;

			document.body.innerHTML = printContents;

			window.print();

			document.body.innerHTML = originalContents;
		}
	</script> -->

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>
</html>
