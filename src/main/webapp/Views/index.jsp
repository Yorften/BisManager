<%@page import='Controler.statics.*'%>
<%@page import='Models.Classes.*'%>
<%@page import='Controler.JDBC.MYSQL.*'%>
<%@page import='java.sql.*'%>
<%@page import='java.util.*'%>
<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
if (session.getAttribute("name") == null) {
	response.sendRedirect("login.jsp");
}
%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Accuile</title>
<link rel="icon" href="images/Icon.png" type="image/png">
<!-- bootstrap 4 cards -->
<link rel="stylesheet" type="text/css"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="https://pixinvent.com/stack-responsive-bootstrap-4-admin-template/app-assets/css/bootstrap-extended.min.css">
<link rel="stylesheet" type="text/css"
	href="https://pixinvent.com/stack-responsive-bootstrap-4-admin-template/app-assets/fonts/simple-line-icons/style.min.css">
<link rel="stylesheet" type="text/css"
	href="https://pixinvent.com/stack-responsive-bootstrap-4-admin-template/app-assets/css/colors.min.css">
<link rel="stylesheet" type="text/css"
	href="https://pixinvent.com/stack-responsive-bootstrap-4-admin-template/app-assets/css/bootstrap.min.css">
<link
	href="https://fonts.googleapis.com/css?family=Montserrat&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">

<!-- Custom fonts for this template-->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="css/sb-admin-2.min.css" rel="stylesheet">
<!--Chart.js JS CDN-->
<script
	src="https://cdn.jsdelivr.net/npm/chart.js@3.7.1/dist/chart.min.js"></script>

</head>

<body id="page-top">
	<%
	List<Categorie> catergories = SQLCategorie.getListOfCategories();
	%>

	<!-- Page Wrapper -->
	<div id="wrapper">



		<!-- Sidebar -->
		<ul class="navbar-nav bg-gradient-dark sidebar sidebar-dark accordion"
			id="accordionSidebar">

			<!-- Sidebar - Brand -->
			<a
				class="sidebar-brand d-flex align-items-center justify-content-center"
				href="Home">
				<div class="sidebar-brand-icon rotate-n-15">
					<i class="fa-solid fa-business-time"></i>
				</div>
				<div class="sidebar-brand-text mx-3">
					BIS<sub>manager</sub>
				</div>
			</a>

			<!-- Divider -->
			<hr class="sidebar-divider my-0">

			<!-- Nav Item - Dashboard -->
			<li class="nav-item active"><a class="nav-link" href="Home">
					<i class="fas fa-fw fa-tachometer-alt"></i> <span>Tableau de
						bord</span>
			</a></li>

			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- Heading -->
			<div class="sidebar-heading">Parameters</div>

			<!-- Nav Item - Fournisseur Collapse Menu -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseTwo"
				aria-expanded="true" aria-controls="collapseTwo"> <i
					class="fa-solid fa-truck"></i> <span>Fournisseurs</span>
			</a>
				<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
					data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<a class="collapse-item" href="viewFournisseur"><i
							class="fa-solid fa-bars-staggered"></i> listes Fournisseur</a> <a
							class="collapse-item" href="addFournisseur"><i
							class="fa-solid fa-circle-plus"></i> Ajouter Fournisseurs</a>
					</div>
				</div></li>

			<!-- Nav Item - Client Collapse Menu -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseClient"
				aria-expanded="true" aria-controls="collapseUtilities"> <i
					class="fa-solid fa-users"></i> <span>Clients</span>
			</a>
				<div id="collapseClient" class="collapse"
					aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">Custom Clients:</h6>
						<a class="collapse-item" href="ViewClients"><i
							class="fa-solid fa-bars-staggered"></i> Listes clients</a> <a
							class="collapse-item" href="addClient"><i
							class="fa-solid fa-user-plus"></i> Ajouter clients</a>
					</div>
				</div></li>

			<!-- Nav Item - Commandes Collapse Menu -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseCommande"
				aria-expanded="true" aria-controls="collapseUtilities"> <i
					class="bi bi-boxes fa-lg"></i> <span>Commandes</span>
			</a>
				<div id="collapseCommande" class="collapse"
					aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">Custom Commandes:</h6>
						<a class="collapse-item" href="viewCommande"><i
							class="fa-solid fa-bars-staggered"></i> Listes commandes</a> <a
							class="collapse-item" href="addCommande"><i
							class="fa-solid fa-cart-plus"></i> Ajouter commandes</a>
						<h6 class="collapse-header">Custom Factures:</h6>
						<a class="collapse-item" href="viewFacture"><i
							class="fa-solid fa-file-invoice"></i> Listes factures</a>
					</div>
				</div></li>

			<!-- Nav Item - Produit Collapse Menu -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseProduit"
				aria-expanded="true" aria-controls="collapseUtilities"> <i
					class="fas fa-box"></i> <span>Produits</span>
			</a>
				<div id="collapseProduit" class="collapse"
					aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">Custom Produits:</h6>
						<a class="collapse-item" href="viewProduit"><i
							class="fa-solid fa-bars-staggered"></i> Listes produits</a> <a
							class="collapse-item" href="addProduit"><i
							class="fa-solid fa-plus"></i> Ajouter produits</a>
					</div>
				</div></li>



			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- Heading -->
			<div class="sidebar-heading">Société</div>

			<!-- Nav Item - inforamtions about the web application and the company using it -->

			<li class="nav-item"><a class="nav-link" href="informations">
					<i class="fa-solid fa-circle-info"></i> <span>Informations</span>
			</a></li>

			<!-- Nav Item - Charts -->
			<li class="nav-item"><a class="nav-link" href="Utilisateurs">
					<i class="fa-solid fa-user"></i> <span>Utilisateurs</span>
			</a></li>


			<!-- Divider -->
			<hr class="sidebar-divider d-none d-md-block">

			<!-- Sidebar Toggler (Sidebar) -->
			<div class="text-center d-none d-md-inline">
				<button class="rounded-circle border-0" id="sidebarToggle"></button>
			</div>

		</ul>
		<!-- End of Sidebar -->



		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->

			<div id="content">

				<!-- Topbar -->
				<nav
					class="navbar navbar-expand navbar-light bg-light topbar mb-4 static-top shadow">

					<!-- Sidebar Toggle (Topbar) -->
					<button id="sidebarToggleTop"
						class="btn btn-link d-md-none rounded-circle mr-3">
						<i class="fa fa-bars"></i>
					</button>

					<!-- Topbar Search -->
					<form
						class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
						<div class="input-group">
							<input type="text" class="form-control bg-light border-0 small"
								placeholder="Search for..." aria-label="Search"
								aria-describedby="basic-addon2">
							<div class="input-group-append">
								<button class="btn btn-primary" type="button">
									<i class="fas fa-search fa-sm"></i>
								</button>
							</div>
						</div>
					</form>

					<!-- Topbar Navbar -->
					<ul class="navbar-nav ml-auto">

						<!-- Nav Item - Search Dropdown (Visible Only XS) -->
						<li class="nav-item dropdown no-arrow d-sm-none"><a
							class="nav-link dropdown-toggle" href="#" id="searchDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <i class="fas fa-search fa-fw"></i>
						</a> <!-- Dropdown - Messages -->
							<div
								class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
								aria-labelledby="searchDropdown">
								<form class="form-inline mr-auto w-100 navbar-search">
									<div class="input-group">
										<input type="text"
											class="form-control bg-light border-0 small"
											placeholder="Search for..." aria-label="Search"
											aria-describedby="basic-addon2">
										<div class="input-group-append">
											<button class="btn btn-primary" type="button">
												<i class="fas fa-search fa-sm"></i>
											</button>
										</div>
									</div>
								</form>
							</div></li>

						<div class="topbar-divider d-none d-sm-block"></div>

						<!-- Nav Item - User Information -->
						<li class="nav-item dropdown no-arrow"><a
							class="nav-link dropdown-toggle" href="#" id="userDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <span
								class="mr-2 d-none d-lg-inline text-gray-600  small"><%=session.getAttribute("name")%>
							</span> <img class="img-profile rounded-circle"
								src="img/undraw_profile.svg">
						</a> <!-- Dropdown - User Information -->
							<div
								class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
								aria-labelledby="userDropdown">
								<a class="dropdown-item" href="Home"> <i
									class="fas fa-house fa-sm fa-fw mr-2 text-gray-400"></i> Table
									de bord
								</a> <a class="dropdown-item" href="Utilisateurs"> <i
									class="fas fa-user-group fa-sm fa-fw mr-2 text-gray-400"></i>Utlisateurs
								</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="#" data-toggle="modal"
									data-target="#logoutModal"> <i
									class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
									Déconnexion
								</a>
							</div></li>

					</ul>

				</nav>
				<!-- End of Topbar -->


				<!-- Begin Page Content -->

				<div class="container-fluid">

					<!-- Page Heading -->

					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800">tableau de bord</h1>
						<a href="#"
							class="d-none d-sm-inline-block btn btn-sm btn-primary  shadow-sm">
							<i class="fa-solid fa-calendar-days mr-3"></i> <%=LocalDate.now()%></a>
					</div>

					<div class="row">
						<!-- Fournisseur Card  -->
						<div class="col-xl-3 col-sm-6 col-12">
							<div class="card border-left-danger">
								<div class="card-content">
									<div class="card-body">
										<div class="media d-flex">
											<div class="media-body text-left">
												<h3 class="danger"><%=SQLFournisseur.getListOfFournisseurs().size()%></h3>
												<span>Fournisseurs</span>
											</div>
											<div class="align-self-center">
												<i class="fa-solid fa-truck danger font-large-2 float-right"></i>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- Clients Card  -->
						<div class="col-xl-3 col-sm-6 col-12">
							<div class="card border-left-success">
								<div class="card-content">
									<div class="card-body">
										<div class="media d-flex">
											<div class="media-body text-left">
												<h3 class="success"><%=SQLClinet.getListOfClients().size()%></h3>
												<span> Clients</span>
											</div>
											<div class="align-self-center">
												<i class="icon-user success font-large-2 float-right"></i>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- Produits Card  -->
						<div class="col-xl-3 col-sm-6 col-12">
							<div class="card border-left-warning">
								<div class="card-content">
									<div class="card-body">
										<div class="media d-flex">
											<div class="media-body text-left">
												<h3 class="warning"><%=SQLProduit.getListOfProduits().size()%></h3>
												<span>Produits</span>
											</div>
											<div class="align-self-center">
												<i class="fa fa-box warning font-large-2 float-right"></i>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- Commande Card  -->
						<div class="col-xl-3 col-sm-6 col-12">
							<div class="card border-left-info">
								<div class="card-content">
									<div class="card-body">
										<div class="media d-flex">
											<div class="media-body text-left">
												<h3 class="primary"><%=SQLCommande.getListOfCommandes().size()%></h3>
												<span>Commandes</span>
											</div>
											<div class="align-self-center">
												<i class="fa fa-cart-plus primary font-large-2 float-right"></i>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- start of row -->
					<div class="row">
						<!-- Donut Chart -->
						<div class="col-xl-8 col-lg-7">
							<div class="card shadow mb-4">
								<!-- Card Header - Dropdown -->
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-primary">Achates /
										Ventes</h6>
								</div>
								<!-- Card Body -->
								<div class="card-body">
									<div>
										<canvas id="myChart"></canvas>
									</div>
									<hr>

								</div>
							</div>
						</div>
						<div class="col-xl-4 col-lg-5">
							<div class="card shadow mb-4">
								<!-- Card Header - Dropdown -->
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-primary">Les
										catégories disponibles</h6>
								</div>
								<!-- Card Body -->
								<div class="card-body">
									<canvas id="pie-chart"></canvas>
									<hr>
								</div>
							</div>
						</div>
						<!-- end of row -->
					</div>


					<!-- End of Main Content -->
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


			<!-- Scroll to Top Button-->
			<a class="scroll-to-top rounded" href="#page-top"> <i
				class="fas fa-angle-up"></i>
			</a>

		</div>

		<!-- Logout Modal-->
		<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Prêts à partir
							?</h5>
						<button class="close" type="button" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body">Sélectionnez "Déconnexion" ci-dessous
						si vous êtes prêt à terminer votre session actuelle..</div>
					<div class="modal-footer">
						
						<form action='logout' method='post'>
							<button type='submit' class="btn btn-primary">Déconnexion</button>
						</form>
						<button class="btn btn-secondary" type="button"
							data-dismiss="modal">annuler</button>
					</div>
				</div>
			</div>
		</div>
		<!--End of Logout Modal-->

	</div>


	<!--  -->
	<script>
		var ctx = document.getElementById('myChart').getContext('2d');
		var myChart = new Chart(ctx, {
			type : 'bar',
			data : {
				labels : [ "janvier", "février", "mars", "avril", "mai",
						"juin", "juillet", "août", "septembre", "octobre",
						"novembre", "décembre" ],					
				datasets : [ {
					data : [ 
						<%=GetStatics.getVentesbyMonth(1)%>,
						<%=GetStatics.getVentesbyMonth(2)%>,
						<%=GetStatics.getVentesbyMonth(3)%>,
						<%=GetStatics.getVentesbyMonth(4)%>,
						<%=GetStatics.getVentesbyMonth(5)%>,
						<%=GetStatics.getVentesbyMonth(6)%>,
						<%=GetStatics.getVentesbyMonth(7)%>,
						<%=GetStatics.getVentesbyMonth(8)%>,
						<%=GetStatics.getVentesbyMonth(9)%>,
						<%=GetStatics.getVentesbyMonth(10)%>,
						<%=GetStatics.getVentesbyMonth(11)%>,
						<%=GetStatics.getVentesbyMonth(12)%>,
					],
					label : "Ventes en MAD",
					borderColor : "rgb(62,149,205)",
					backgroundColor : "rgb(62,149,205,0.1)",
					borderWidth : 2
				}, {
					data : [
					    <%=GetStatics.getAchatesbyMonth(1)%>,
						<%=GetStatics.getAchatesbyMonth(2)%>,
						<%=GetStatics.getAchatesbyMonth(3)%>,
						<%=GetStatics.getAchatesbyMonth(4)%>,
						<%=GetStatics.getAchatesbyMonth(5)%>,
						<%=GetStatics.getAchatesbyMonth(6)%>,
						<%=GetStatics.getAchatesbyMonth(7)%>,
						<%=GetStatics.getAchatesbyMonth(8)%>,
						<%=GetStatics.getAchatesbyMonth(9)%>,
						<%=GetStatics.getAchatesbyMonth(10)%>,
						<%=GetStatics.getAchatesbyMonth(11)%>,
						<%=GetStatics.getAchatesbyMonth(12)%>, 
						],
					label : "Achates en MAD",
					borderColor : "rgb(196,88,80)",
					backgroundColor : "rgb(196,88,80,0.1)",
					borderWidth : 2
				} ]
			},
			
		});
	</script>



	<!-- this script is for pie_charts -->
	<script>	
    new Chart(document.getElementById("pie-chart"), {
    type: 'pie',
    data: {
      labels: [	<%for (Categorie C : catergories) {%>
                '<%=C.getDesignation()%>',
                   <%}%>   				
                   ],
      datasets: [{
        label: "Qantité",
        backgroundColor: [
                  <%for (Categorie C : catergories) {%>
        	      "#" +Math.floor(Math.random()*16777215).toString(16)+"",
        	      <%}%>   		
        	              ],
        data: [ 
        <%for (Categorie C : catergories) {%>
        <%=C.getQuntite_Produit()%>,
        <%}%> 
              ]
        }]
    },
    options: {
      title: {
        display: true,
        text: 'les catégories disponibles'           
      }
    }
});
</script>

	<!-- Bootstrap core JavaScript-->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/4.6.1/js/bootstrap.bundle.min.js"></script>
	<!-- Core plugin JavaScript-->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
	<!-- Custom scripts for all pages-->
	<script src="js/sb-admin-2.min.js"></script>

</body>

</html>