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
<div class="container-fluid">
	<div class="row">
		<div class="col">
			<nav class="navbar navbar-expand-sm bg-info navbar-light">
				<ul class="navbar-nav">
					<li class="nav-item active"><a class="nav-link"
						href="index.jsp"><h5><b>Bienvenido a Viajes</b></h5></a>
					</li>
				</ul>
				<form style='margin-left: 40%;' role="form" method="POST"
					action="ValidarUsuario" class="form-inline">
					<div class="row">
					<div class="input-group col-4">
					
						<input type="text" class="form-control"
							id="usuario" name="usuario" placeholder="Usuario" autofocus
							required="required">
					</div>
					<div class="input-group col-4" >
					
						<input class="form-control"
							type="password" id="password" name="password"
							placeholder="Password" required="required">
					</div>

					<button type="submit" class="btn btn-primary col-2">
						<i class="fa fa-sign-in"></i> Enviar
					</button>
					</div>
				</form>
			</nav>
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
