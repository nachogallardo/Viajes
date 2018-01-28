<!DOCTYPE html>
<%@page import="org.hibernate.boot.model.source.internal.hbm.AbstractEntitySourceImpl"%>
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
					<li class="nav-item"><a class="nav-link"
						href="administrador.jsp"><em class="fa fa-user-circle mr-1"></em>
							Editar Usuarios <span class="sr-only">(current)</span></a></li>
					<li class="nav-item"><a class="nav-link active"
						href="editarPerfilAdmin.jsp"><em class="fa fa-cog mr-1"></em>
							Editar Perfil</a></li>
					<li class="nav-item"><a class="nav-link"
						href="agregarViajes.jsp"><em class="fa fa-plane mr-1"></em>
							Agregar Viajes</a></li>
					<li class="nav-item"><a class="nav-link"
						href="borrarViajes.jsp"><em class="fa fa-plane mr-1"></em>
							Borrar Viajes</a></li>

				</ul>

				<a href="../CerrarSesion" class="logout-button"><em class="fa fa-power-off"></em>
					Cerrar Sesion</a>
			</nav>

			<main
				class="col-xs-12 col-sm-8 offset-sm-4 col-lg-9 offset-lg-3 col-xl-10 offset-xl-2 pt-3 pl-4">
			<header class="page-header row justify-center">
				<div class="col-md-6 col-lg-8">
					<h1 class="float-left text-center text-md-left">Bienvenido <%=((Usuarios) session.getAttribute("usuLogeado")).getNombre()%></h1>
				</div>

				<div
					class="dropdown user-dropdown col-md-6 col-lg-4 text-center text-md-right">
					<a class="btn btn-stripped dropdown-toggle"
						href="#" id="dropdownMenuLink"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">


						<div class="username mt-1">
							<h4 class="mb-1"><%=((Usuarios) session.getAttribute("usuLogeado")).getNombre()%></h4>

							<h6 class="text-muted">Opciones</h6>
						</div>
					</a>

					<div class="dropdown-menu dropdown-menu-right"
						style="margin-right: 1.5rem;" aria-labelledby="dropdownMenuLink">
						<a class="dropdown-item" href="editarPerfil.jsp"><em
							class="fa fa-cog mr-1"></em> Editar Perfil</a> <a class="dropdown-item" href="../CerrarSesion"><em
							class="fa fa-power-off mr-1"></em> Cerrar Sesion</a>
							<a class="dropdown-item" href="gestionarViajes.jsp"><em
							class="fa fa-plane mr-1"></em> Gestionar Viajes</a>
					</div>
					
					
					
					
					
				</div>

				<div class="clear"></div>
			</header>
			<div style="margin-left: 15%;" class="col-md-6">
			<div class="bg-success text-white text-center py-2">
									<h3>
										<i class="fa fa-address-card"></i> Editar
									</h3>

								</div>
								<br>
								<%
									String info = request.getParameter("info");
									if (info != null) {
								%>
								<div style="color: black;"
									class="alert alert-warning alert-dismissable">
									<button type="button" class="close" data-dismiss="alert"
										aria-hidden="true">x</button>
									<strong>Info!</strong>
									<%=info%>
								</div>
								<%
									}
								%>
			<form role="form" method="POST" action="../EditarUsuAdmin"
									class="form-check">
									<input style="display: none;" type="number" name="idUsuario" value="<%=((Usuarios) session.getAttribute("usuLogeado")).getIdUsuario()%>" required="required"
												class="form-control" id="inlineFormInputGroupUsername"
												placeholder="Nombre">
									<div class="form-group">
										<div class="input-group">
											<div class="input-group-addon bg-light">
												<i class="fa fa-user text-primary"></i>
											</div>
											<input type="text" name="nombre" value="<%=((Usuarios) session.getAttribute("usuLogeado")).getNombre()%>" required="required"
												class="form-control" id="inlineFormInputGroupUsername"
												placeholder="Nombre">
										</div>
									</div>
									<div class="form-group">
										<div class="input-group mb-2 mb-sm-0">
											<div class="input-group-addon bg-light">
												<i class="fa fa-envelope text-primary"></i>
											</div>
											<input type="text" value="<%=((Usuarios) session.getAttribute("usuLogeado")).getEmail()%>" name="email" required="required"
												class="form-control" id="inlineFormInputGroupUsername"
												placeholder="Email">
										</div>
									</div>
									<div class="form-group">
										<div class="input-group mb-2 mb-sm-0">
											<div class="input-group-addon bg-light">
												<i class="fa fa-key prefix text-primary"></i>
											</div>
											<input type="password" id="clave" required="required"
												name="nuevaContrasenia" class="form-control"
												id="inlineFormInputGroupUsername" placeholder="nueva contrase�a">
										</div>
									</div>
									<div class="form-group">
										<div class="input-group mb-2 mb-sm-0">
											<div class="input-group-addon bg-light">
												<i class="fa fa-phone text-primary"></i>
											</div>
											<input type="number" value="<%=((Usuarios) session.getAttribute("usuLogeado")).getTelefono()%>" name="telefono" required="required"
												class="form-control" id="inlineFormInputGroupUsername"
												placeholder="telefono">
										</div>
									</div>
									<div class="form-group">
										<div class="input-group mb-2 mb-sm-0">
											<div class="input-group-addon bg-light">
												<i class="fa fa-home text-primary"></i>
											</div>
											<input type="text" value="<%=((Usuarios) session.getAttribute("usuLogeado")).getDireccion()%>" name="direccion" class="form-control"
												id="inlineFormInputGroupUsername" required="required"
												placeholder="direccion">
										</div>
									</div>
									<button type="submit" id="btnRegistrar"
										class="btn btn-info btn-block rounded-0 py-2">
										<i class="fa fa-pencil" aria-hidden="true"></i> Enviar
									</button>
								</form>
								
			</div>
			 <%
 	}
 %>
			
		</div>
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