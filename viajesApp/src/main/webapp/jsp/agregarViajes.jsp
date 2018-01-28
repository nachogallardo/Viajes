<!DOCTYPE html>
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
			response.sendRedirect("../index.jsp?mensaje=Inicie sesión");
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
					<li class="nav-item"><a class="nav-link"
						href="editarPerfilAdmin.jsp"><em class="fa fa-cog mr-1"></em>
							Editar Perfil</a></li>
					<li class="nav-item"><a class="nav-link active"
						href="agregarViajes.jsp"><em class="fa fa-plane mr-1"></em>
							Agregar Viajes</a></li>
					<li class="nav-item"><a class="nav-link"
						href="borrarViajes.jsp"><em class="fa fa-plane mr-1"></em>
							Borrar Viajes</a></li>

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
						href="#" id="dropdownMenuLink"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">


						<div class="username mt-1">
							<h4 class="mb-1"><%=((Usuarios) session.getAttribute("usuLogeado")).getNombre()%></h4>

							<h6 class="text-muted">Opciones</h6>
						</div>
					</a>

					<div class="dropdown-menu dropdown-menu-right"
						style="margin-right: 1.5rem;" aria-labelledby="dropdownMenuLink">
						<a class="dropdown-item" href="editarPerfilAdmin.jsp"><em
							class="fa fa-cog mr-1"></em> Editar Perfil</a> <a
							class="dropdown-item" href="../CerrarSesion"><em
							class="fa fa-power-off mr-1"></em> Cerrar Sesion</a> <a
							class="dropdown-item" href="gestionarViajes.jsp"><em
							class="fa fa-plane mr-1"></em> Gestionar Viajes</a>
					</div>
				</div>

				<div class="clear"></div>
			</header>
			<div class="card border-primary rounded-0">
				<div class="card-header p-0">
					<div class="bg-warning text-white text-center py-2">
						<h3>
							<i class="fa fa-rocket"></i> Agregar Viajes
						</h3>
					</div>
				</div>
				<div class="card-body p-3">
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
					<!--Body-->
					<form role="form" enctype="multipart/form-data" method="POST" action="../AgregarViaje"
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
									<i class="fa fa-comment-o text-primary"></i>
								</div>
								<textarea name="descripcion" required="required"
									class="form-control" id="inlineFormInputGroupUsername"
									placeholder="Introduce la descripcion"></textarea>
							</div>
						</div>
				
				<div class="form-group">
					<div class="input-group mb-2 mb-sm-0">
						<div class="input-group-addon bg-light">
							<i class="fa fa-euro text-primary"></i>
						</div>
						<input type="number" name="precio" required="required"
							class="form-control" id="inlineFormInputGroupUsername"
							placeholder="Introduce el precio">
					</div>
				</div>
				<div class="form-group">
					<div class="input-group mb-2 mb-sm-0">
						<div class="input-group-addon bg-light">
							<i class="fa fa-file-image-o text-primary"></i>
						</div>
						<input type="file"
								class="form-control" id="portada" name="portada" required="required">
					</div>
				</div>
				<button type="submit" id="btnRegistrar"
					class="btn btn-danger btn-block rounded-0 py-2">
					<i class="fa fa-plus"></i> Agregar
				</button>
				</form>
			</div>
		</div>

		<%
			}
		%>

	</div>
	</div>