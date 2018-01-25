<!DOCTYPE html>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="es.altair.dao.ViajesDaoImp"%>
<%@page import="es.altair.dao.ViajesDao"%>
<%@page import="es.altair.bean.Viajes"%>
<html lang="en">
<head>
<script>
	function comprobarClave() {
		clave1 = document.getElementById("clave").value;
		clave2 = document.getElementById("clave1").value;
		boton = document.getElementById("btnRegistrar");
		claves = document.getElementById("claveDistinta");
		if (clave1 == clave2) {
			claves.innerHTML = "";
			boton.disabled = false;
		} else {
			claves.innerHTML = "Las contraseñas tienen que ser iguales";
			boton.disabled = true;
		}
	}
</script>
<meta charset="utf-8">

<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<meta name="description" content="">

<meta name="author" content="">

<link rel="icon" href="images/favicon.ico">

<title>Viajes</title>

<!-- Bootstrap core CSS -->
<link href="dist/css/bootstrap.min.css" rel="stylesheet">

<!--Fonts-->
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- Icons -->
<link href="css/font-awesome.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/style.css" rel="stylesheet">
</head>
<body>
	<%
		ViajesDao vDao = new ViajesDaoImp();
		List<Viajes> viajes = new ArrayList<Viajes>();
		viajes = vDao.listarTodosViajes();
	%>
	<div class="container-fluid" id="wrapper">
		<div class="row">
			<nav
				class="sidebar col-xs-12 col-sm-4 col-lg-3 col-xl-2 bg-faded sidebar-style-1">
				
				
				<div style="height: 5%;" class="row"></div>
				<h1 class="site-title">
					 <em class="fa fa-rocket"></em>Inicie Sesion
				</h1>
				<form role="form" method="POST" action="ValidarUsuario"
					class="form-check">
					<div class="row">
						<div class="input-group col-md-12">

							<input type="text" class="form-control" id="usuario"
								name="usuario" placeholder="Usuario" autofocus
								required="required">
						</div>

						<div class="col-12"></div>
						<div class="input-group col-md-12">

							<input class="form-control" type="password" id="password"
								name="password" placeholder="Contraseña" required="required">
						</div>
						
						<div class="col-12"></div>
						<button type="submit" class="btn btn-md btn-info col-12">
							<i class="fa fa-sign-in"></i> Iniciar Sesion
						</button>
						<%
							String fallo = request.getParameter("fallo");
							if (fallo != null) {
						%>
						<div style="color: black;"
							class="alert alert-warning alert-dismissable form-control">
							<button type="button" class="close" data-dismiss="alert"
								aria-hidden="true">x</button>
							<strong>Info!</strong>
							<%=fallo%>
						</div>
						<%
							}
						%>
					</div>
				</form>




			</nav>

			<div
				class="col-xs-12 col-sm-8 offset-sm-4 col-lg-9 offset-lg-3 col-xl-10 offset-xl-2 pt-3 pl-4">
				<header class="page-header row justify-center">
					<div class="col-md-6 col-lg-8">
						<h1 class="float-left text-center text-md-left">Bienvenido a
							la pagina de viajes</h1>
					</div>

					<div
						class="dropdown user-dropdown col-md-6 col-lg-4 text-center text-md-right">
					</div>
				</header>


				<div class="row">
					<div class="col-md-8">
						<div class="row">
						<%
							for (Viajes v : viajes) {
						%>
						<div class="col-md-6">
						<div class="card" style="width: 18rem;height: 30rem;">
							<img alt="Portada" src="jsp/image.jsp?imag=<%=v.getIdViaje()%>"
								class="img-thumbnail" width="286" height="186">
								<br>
							<div class="card-body">
								<h5 class="card-title"><%=v.getNombre()%></h5>
								<p class="card-text"><%=v.getDescripcion()%></p>
							</div>
							</div>
						</div>

						<%
							}
						%>
					</div>
					</div>
					<div class="col-md-4">

						<div class="card border-primary rounded-0">
							<div class="card-header p-0">
								<div class="bg-primary text-white text-center py-2">
									<h3>
										<i class="fa fa-address-card"></i> Registrar
									</h3>

								</div>
							</div>
							<div class="card-body p-3">
								<%
									String error = request.getParameter("mensaje");
									if (error != null) {
								%>
								<div style="color: black;"
									class="alert alert-warning alert-dismissable">
									<button type="button" class="close" data-dismiss="alert"
										aria-hidden="true">x</button>
									<strong>Info!</strong>
									<%=error%>
								</div>
								<%
									}
								%>
								<!--Body-->
								<form role="form" method="POST" action="RegistrarUsuario"
									class="form-check">
									<div class="form-group">
										<div class="input-group">
											<div class="input-group-addon bg-light">
												<i class="fa fa-user text-primary"></i>
											</div>
											<input type="text" name="nombre" required="required"
												class="form-control" id="inlineFormInputGroupUsername"
												placeholder="Nombre">
										</div>
									</div>
									<div class="form-group">
										<div class="input-group mb-2 mb-sm-0">
											<div class="input-group-addon bg-light">
												<i class="fa fa-envelope text-primary"></i>
											</div>
											<input type="text" name="email" required="required"
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
												name="contrasenia" class="form-control"
												id="inlineFormInputGroupUsername" placeholder="contraseña">
										</div>
									</div>
									<div class="form-group">
										<div class="input-group mb-2 mb-sm-0">
											<div class="input-group-addon bg-light">
												<i class="fa fa-key prefix text-primary"></i>
											</div>
											<input type="password" id="clave1" required="required"
												onblur="comprobarClave()" class="form-control"
												id="inlineFormInputGroupUsername"
												placeholder="repite contraseña">

										</div>
									</div>
									<p id="claveDistinta" style="color: red; font-size: 12px;"></p>
									<div class="form-group">
										<div class="input-group mb-2 mb-sm-0">
											<div class="input-group-addon bg-light">
												<i class="fa fa-phone text-primary"></i>
											</div>
											<input type="number" name="telefono" required="required"
												class="form-control" id="inlineFormInputGroupUsername"
												placeholder="telefono">
										</div>
									</div>
									<div class="form-group">
										<div class="input-group mb-2 mb-sm-0">
											<div class="input-group-addon bg-light">
												<i class="fa fa-home text-primary"></i>
											</div>
											<input type="text" name="direccion" class="form-control"
												id="inlineFormInputGroupUsername" required="required"
												placeholder="direccion">
										</div>
									</div>
									<button type="submit" id="btnRegistrar"
										class="btn btn-primary btn-block rounded-0 py-2">
										<i class="fa fa-sign-in"></i> Enviar
									</button>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="js/jquery-3.2.1.min.js"></script>
	<script src="dist/js/bootstrap.min.js"></script>

	<script src="js/chart.min.js"></script>
	<script src="js/chart-data.js"></script>
	<script src="js/easypiechart.js"></script>
	<script src="js/easypiechart-data.js"></script>
	<script src="js/bootstrap-datepicker.js"></script>
	<script src="js/custom.js"></script>
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