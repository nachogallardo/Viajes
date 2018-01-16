<%@page import="es.altair.dao.ViajesDaoImp"%>
<%@page import="java.util.ArrayList"%>
<%@page import="es.altair.bean.Viajes"%>
<%@page import="java.util.List"%>
<%@page import="es.altair.dao.ViajesDao"%>
<html>
<head>
<title>Viajes</title>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css">

<!-- Stylesheets -->
<link rel="stylesheet" href="fonts/font-awesome.min.css">
</head>
<body>
<%
ViajesDao vDao= new ViajesDaoImp();
List<Viajes> viajes=new ArrayList<Viajes>();
viajes=vDao.listarTodosViajes();
%>
<div class="row">
			<div class="col-12">
				<nav class="navbar navbar-expand-sm bg-info navbar-light">
					<div class="col-md-9">
						<form role="form" method="POST" action="ValidarUsuario"
							class="form-inline">
							<div class="row">
								<div class="input-group col-md-4">

									<input type="text" class="form-control" id="usuario"
										name="usuario" placeholder="Usuario" autofocus
										required="required">
								</div>
								<div class="input-group col-md-4">

									<input class="form-control" type="password" id="password"
										name="password" placeholder="Contraseña" required="required">
								</div>

								<button type="submit" class="btn btn-sm btn-warning col-3">
									<i class="fa fa-sign-in"></i> Iniciar Sesion
								</button>
							</div>
						</form>

					</div>

					<div class="col-md-3">
						<button type="button" class="btn btn-sm btn-outline-dark"><i class="fa fa-sign-out"></i>Cerrar Sesion</button>
					</div>
				</nav>
			</div>
		</div>
	<div class="container-fluid">
		
		<br>
		<div class="row">
			<div class="col-md-9">
				<%
				for(Viajes v : viajes){
				%>
				<div><%=v.getNombre() %></div>
				<%} %>
			</div>
			<div class="col-md-3">
				<div class="card border-primary rounded-0">
					<div class="card-header p-0">
						<div class="bg-primary text-white text-center py-2">
							<h3>
								<i class="fa fa-address-card"></i> Registrar
							</h3>
						</div>
					</div>
					<div class="card-body p-3">

						<!--Body-->
						<form role="form" method="POST" action="ValidarUsuario"
							class="form-check">
							<div class="form-group">
								<div class="input-group">
									<div class="input-group-addon bg-light">
										<i class="fa fa-user text-primary"></i>
									</div>
									<input type="text" class="form-control"
										id="inlineFormInputGroupUsername" placeholder="Nombre">
								</div>
							</div>
							<div class="form-group">
								<div class="input-group mb-2 mb-sm-0">
									<div class="input-group-addon bg-light">
										<i class="fa fa-envelope text-primary"></i>
									</div>
									<input type="text" class="form-control"
										id="inlineFormInputGroupUsername" placeholder="Email">
								</div>
							</div>
							<div class="form-group">
								<div class="input-group mb-2 mb-sm-0">
									<div class="input-group-addon bg-light">
										<i class="fa fa-key prefix text-primary"></i>
									</div>
									<input type="password" class="form-control"
										id="inlineFormInputGroupUsername" placeholder="contraseña">
								</div>
							</div>
							<div class="form-group">
								<div class="input-group mb-2 mb-sm-0">
									<div class="input-group-addon bg-light">
										<i class="fa fa-key prefix text-primary"></i>
									</div>
									<input type="password" class="form-control"
										id="inlineFormInputGroupUsername"
										placeholder="repite contraseña">
								</div>
							</div>
							<div class="form-group">
								<div class="input-group mb-2 mb-sm-0">
									<div class="input-group-addon bg-light">
										<i class="fa fa-phone text-primary"></i>
									</div>
									<input type="number" class="form-control"
										id="inlineFormInputGroupUsername" placeholder="telefono">
								</div>
							</div>
							<div class="form-group">
								<div class="input-group mb-2 mb-sm-0">
									<div class="input-group-addon bg-light">
										<i class="fa fa-home text-primary"></i>
									</div>
									<input type="text" class="form-control"
										id="inlineFormInputGroupUsername" placeholder="direccion">
								</div>
							</div>
							<button type="submit"
								class="btn btn-primary btn-block rounded-0 py-2">
								<i class="fa fa-sign-in"></i> Enviar
							</button>
						</form>
					</div>

				</div>
			</div>
		</div>
	</div>

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="js/jquery-3.2.1.slim.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>
