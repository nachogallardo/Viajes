<%@page import="es.altair.dao.ViajesDaoImp"%>
<%@page import="java.util.ArrayList"%>
<%@page import="es.altair.bean.Viajes"%>
<%@page import="java.util.List"%>
<%@page import="es.altair.dao.ViajesDao"%>
<html>
<head>
<script>
function comprobarClave(){ 
   	clave1 = document.getElementById("clave").value; 
   	clave2 = document.getElementById("clave1").value;  
   	boton = document.getElementById("btnRegistrar");
   	claves = document.getElementById("claveDistinta");
   	if (clave1 == clave2) {  	   	
   		claves.innerHTML="";
   		boton.disabled=false;
   	}
   	else {   		
   		claves.innerHTML="Las contraseñas tienen que ser iguales";
      	boton.disabled=true;
      	}
  	
} 
</script>
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
<body style="background-image: url('images/images.png');">
	<%
		ViajesDao vDao = new ViajesDaoImp();
		List<Viajes> viajes = new ArrayList<Viajes>();
		viajes = vDao.listarTodosViajes();
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
									name="usuario" placeholder="Usuario"  autofocus
									required="required">
							</div>
							<div class="input-group col-md-4">

								<input class="form-control" type="password" id="password"
									name="password" placeholder="Contraseña" required="required">
							</div>

							<button type="submit" class="btn btn-sm btn-warning col-3">
								<i class="fa fa-sign-in"></i> Iniciar Sesion
							</button>
							<%
								String fallo = request.getParameter("fallo");
								if (fallo != null) {
							%>
							<div class="alert alert-warning alert-dismissable form-control">
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

				</div>

				<div class="col-md-3"></div>
			</nav>
		</div>
	</div>
	<div class="container-fluid">

		<br>
		<div class="row">
			<div class="col-md-9">
				<div class="row">
					<%
						for (Viajes v : viajes) {
					%>
					<div class="col-sm-2">
						<img alt="Portada" src="jsp/image.jsp?imag=<%=v.getIdViaje()%>"
							class="img-thumbnail" width="200" height="200">
					</div>
					<div class="col-sm-10">
						<div class="card">
							<div class="card-body">
								<h5 class="card-title"><%=v.getNombre()%></h5>

								<p class="card-text"><%=v.getDescripcion()%></p>
							</div>
						</div>
						<br>
						<br>
					</div>



					<%
						}
					%>
				</div>
			</div>
			<div class="col-md-3">
				<div class="card border-primary rounded-0">
					<div class="card-header p-0">
						<div class="bg-primary text-white text-center py-2">
							<h3>
								<i class="fa fa-address-card"></i> Registrar
							</h3>
							<%
								String error = request.getParameter("mensaje");
								if (error != null) {
							%>
							<div class="alert alert-warning alert-dismissable">
								<button type="button" class="close" data-dismiss="alert"
									aria-hidden="true">x</button>
								<strong>Info!</strong>
								<%=error%>
							</div>
							<%
								}
							%>
						</div>
					</div>
					<div class="card-body p-3">

						<!--Body-->
						<form role="form" method="POST" action="RegistrarUsuario"
							class="form-check">
							<div class="form-group">
								<div class="input-group">
									<div class="input-group-addon bg-light">
										<i class="fa fa-user text-primary"></i>
									</div>
									<input type="text" name="nombre" required="required" class="form-control"
										id="inlineFormInputGroupUsername" placeholder="Nombre">
								</div>
							</div>
							<div class="form-group">
								<div class="input-group mb-2 mb-sm-0">
									<div class="input-group-addon bg-light">
										<i class="fa fa-envelope text-primary"></i>
									</div>
									<input type="text" name="email" required="required" class="form-control"
										id="inlineFormInputGroupUsername" placeholder="Email">
								</div>
							</div>
							<div class="form-group">
								<div class="input-group mb-2 mb-sm-0">
									<div class="input-group-addon bg-light">
										<i class="fa fa-key prefix text-primary"></i>
									</div>
									<input type="password" id="clave" required="required" name="contrasenia" class="form-control"
										id="inlineFormInputGroupUsername" placeholder="contraseña">
								</div>
							</div>
							<div class="form-group">
								<div class="input-group mb-2 mb-sm-0">
									<div class="input-group-addon bg-light">
										<i class="fa fa-key prefix text-primary"></i>
									</div>
									<input type="password" id="clave1" required="required" onblur="comprobarClave()" class="form-control"
										id="inlineFormInputGroupUsername"
										placeholder="repite contraseña">
																				
								</div>
							</div>
							<p id="claveDistinta" style="color: red;font-size: 12px;"></p>
							<div class="form-group">
								<div class="input-group mb-2 mb-sm-0">
									<div class="input-group-addon bg-light">
										<i class="fa fa-phone text-primary"></i>
									</div>
									<input type="number" name="telefono" required="required" class="form-control"
										id="inlineFormInputGroupUsername" placeholder="telefono">
								</div>
							</div>
							<div class="form-group">
								<div class="input-group mb-2 mb-sm-0">
									<div class="input-group-addon bg-light">
										<i class="fa fa-home text-primary"></i>
									</div>
									<input type="text" name="direccion" class="form-control"
										id="inlineFormInputGroupUsername" required="required" placeholder="direccion">
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

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="js/jquery-3.2.1.slim.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>
