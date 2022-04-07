<%@page import="controlador.Acciones"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Menu</title>
<link rel="stylesheet" type="text/css" href="../vista/Estilo.css" media="screen" />

</head>
<body>
<%@ page import = "java.sql.*" %>
<div id="header">
			<ul class="nav">
				<li><a href="../vista/Inicio.html" title="Registrate">Inicio</a></li>

				<li><a href="Servicios.html">Servicios</a>
					<ul>
						<li><a href="">Submenu1</a></li>
						<li><a href="">Submenu2</a></li>
						<li><a href="">Submenu3</a></li>
						<li><a href="">Submenu4</a>
							<ul>
								<li><a href="">Submenu1</a></li>
								<li><a href="">Submenu2</a></li>
								<li><a href="">Submenu3</a></li>
								<li><a href="">Submenu4</a></li>
							</ul>
						</li>
					</ul>
				</li>
				
				
				
				<li><a href="">Acerca de</a>
					<ul>
						<li><a href="">Submenu1</a></li>
						<li><a href="">Submenu2</a></li>
						<li><a href="">Submenu3</a></li>
						<li><a href="">Submenu4</a></li>
					</ul>
				</li>
				<li><a href="">Contacto</a></li>
			</ul>
		</div>
		<br>
		


<br>

<%

//En estás variables recogemos la información que viene del formulario
Acciones dos = new Acciones();
dos.Escuchar();




%>

 
	
		
	

</body>
</body>
</html>