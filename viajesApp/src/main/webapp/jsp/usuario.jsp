<!DOCTYPE html>
<%@page import="es.altair.dao.ViajesDaoImp"%>
<%@page import="es.altair.dao.ViajesDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="es.altair.bean.Viajes"%>
<%@page import="es.altair.bean.Usuarios"%>
<html lang="en">
<head>
<meta charset="utf-8">

<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<meta name="description" content="">

<meta name="author" content="">

<link rel="icon" href="images/favicon.ico">

<title>Usuario</title>

<!-- Bootstrap core CSS -->
<link href="../dist/css/bootstrap.min.css" rel="stylesheet">

<!--Fonts-->
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- Icons -->
<link href="../css/font-awesome.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="../css/style.css" rel="stylesheet">
</head>
<body>
	<%
		if (session.getAttribute("usuLogeado") == null || session.isNew()) {
			response.sendRedirect("../index.jsp?mensaje=Inicie sesi�n");
		} else {
			List<Viajes> viajes = new ArrayList<Viajes>();
			ViajesDao vDao = new ViajesDaoImp();
			viajes = vDao.listarTodosViajes();
	%>

	<div class="container-fluid" id="wrapper">
		<div class="row">
			<nav
				class="sidebar col-xs-12 col-sm-4 col-lg-3 col-xl-2 bg-faded sidebar-style-1">
				<h1 class="site-title">
					<a href="../index.jsp"><em class="fa fa-rocket"></em> Viajes</a>
				</h1>

				<a href="#menu-toggle" class="btn btn-default" id="menu-toggle"><em
					class="fa fa-bars"></em></a>

				<ul class="nav nav-pills flex-column sidebar-nav">
					<li class="nav-item"><a class="nav-link active"
						href="usuario.jsp"><em class="fa fa-user-circle mr-1"></em>
							Principal <span class="sr-only">(current)</span></a></li>
					<li class="nav-item"><a class="nav-link"
						href="editarPerfil.jsp"><em class="fa fa-cog mr-1"></em>
							Editar Perfil</a></li>
					<li class="nav-item"><a class="nav-link"
						href="gestionarViajes.jsp"><em class="fa fa-plane mr-1"></em>
							Gestionar Viajes</a></li>

				</ul>

				<a href="../CerrarSesion" class="logout-button"><em
					class="fa fa-power-off"></em> Cerrar Sesion</a>
			</nav>

			<main
				class="col-xs-12 col-sm-8 offset-sm-4 col-lg-9 offset-lg-3 col-xl-10 offset-xl-2 pt-3 pl-4">
			<header class="page-header row justify-center">
				<div class="col-md-6 col-lg-8">
					<h1 class="float-left text-center text-md-left">
						Bienvenido
						<%=((Usuarios) session.getAttribute("usuLogeado")).getNombre()%></h1>
						
				</div>

				<div
					class="dropdown user-dropdown col-md-6 col-lg-4 text-center text-md-right">
					<a class="btn btn-stripped dropdown-toggle"
						href="https://example.com" id="dropdownMenuLink"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">


						<div class="username mt-1">
							<h4 class="mb-1"><%=((Usuarios) session.getAttribute("usuLogeado")).getNombre()%></h4>

							<h6 class="text-muted">Opciones</h6>
						</div>
					</a>

					<div class="dropdown-menu dropdown-menu-right"
						style="margin-right: 1.5rem;" aria-labelledby="dropdownMenuLink">
						<a class="dropdown-item" href="editarPerfil.jsp"><em
							class="fa fa-cog mr-1"></em> Editar Perfil</a> <a
							class="dropdown-item" href="../CerrarSesion"><em
							class="fa fa-power-off mr-1"></em> Cerrar Sesion</a> <a
							class="dropdown-item" href="gestionarViajes.jsp"><em
							class="fa fa-plane mr-1"></em> Gestionar Viajes</a>
					</div>
				</div>
			</header>
			<div class="row">
			
				<div class="col-md-12 col-xs-12 col-sm-12 col-lg-12">
					<div class="row">
						<%
							for (Viajes v : viajes) {
						%>
						<div class="col-md-6">
							<div class="card" style="width: 16rem; height: 15;">
								<img alt="Portada" src="image.jsp?imag=<%=v.getIdViaje()%>"
									class="img-thumbnail" width="280" height="180"> <br>
								<div class="card-body">
									<h5 class="card-title"><%=v.getNombre()%>

									</h5>
								</div>
								<a href="../ComprarViaje?idViaje=<%=v.getIdViaje()%>&idUsuario=<%=((Usuarios) session.getAttribute("usuLogeado")).getIdUsuario()%>">
								<button style="width: 16rem;" class="btn-success">
									<%=v.getPrecio()%><i class="fa fa-eur" aria-hidden="true"></i>
									Comprar <i class="fa fa-cart-plus" aria-hidden="true"></i>									
								</button>
								</a>


					</div>
				</div>
			
			<%} %>
			
			
			</div>
		</div>







		<%
			}
		%>

	</div>









	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="../js/jquery-3.2.1.min.js"></script>
	<script src="../dist/js/bootstrap.min.js"></script>

	<script src="../js/chart.min.js"></script>
	<script src="../js/chart-data.js"></script>
	<script src="../js/easypiechart.js"></script>
	<script src="../js/easypiechart-data.js"></script>
	<script src="../js/bootstrap-datepicker.js"></script>
	<script src="../js/custom.js"></script>
	<script>
		window.onload = function() {
			var chart1 = document.getElementById("line-chart").getContext("2d");
			window.myLine = new Chart(chart1).Line(lineChartData, {
				responsive : true,
				scaleLineColor : "rgba(0,0,0,.2)",
				scaleGridLineColor : "rgba(0,0,0,.05)",
				scaleFontColor : "#c5c7cc"
			});
		};
	</script>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js"
		integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb"
		crossorigin="anonymous"></script>
</body>
</html>
