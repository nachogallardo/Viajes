<%@page import="es.altair.bean.Usuarios"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Perfil de Administrador</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="../css/bootstrap.min.css">

<!-- Stylesheets -->
<link rel="stylesheet" href="../fonts/font-awesome.min.css">
</head>
<body>
	
	<%
		if (session.getAttribute("usuLogeado") == null || session.isNew()) {
			response.sendRedirect("../index.jsp?mensaje=Inicie sesión");
		} else {
	%>
	<div class="row">
		<div class="col-12">
			<nav class="navbar navbar-expand-sm bg-info navbar-light">
			<div class="col-md-8">
				<b>Bienvenido <%=((Usuarios)session.getAttribute("usuLogeado")).getNombre()%></b>			
			</div>
			<div class="col-md-2">
				<button type="submit" class="btn btn-md btn-info">
					 <i class="fa fa-user" aria-hidden="true"></i> Editar Usuario
				</button>
			</div>
			<div class="col-md-2">
			<a href="../CerrarSesion">
				<button type="submit" class="btn btn-md btn-info">
					<i class="fa fa-sign-in"></i> Cerrar Sesion
				</button>
				</a>
			</div>
			</nav>
		</div>
	</div>



	<%
		}
	%>
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="../js/jquery-3.2.1.slim.min.js"></script>
	<script src="../js/popper.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
</body>
</html>