
<%@page import="controlador.Acciones"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Datos del formulario</title>
<style>
h1{
text-align:center;
color:#62BFD0;


}
body{
	
	 background-repeat: no-repeat;
     background-attachment: fixed; 
     background-size: cover;
}

table{
    opacity: .7;
	background:#2BFFEC;
	padding:10px;
	border:solid 2px #2B4C7D;
	margin:auto;
}

td{
	padding:5px 0;
}

</style>
</head>
<body>
<%@ page import = "java.sql.*" %>


<%

String nombre = request.getParameter("nombre");
String apellido = request.getParameter("apellido");
String email = request.getParameter("email");
String usuario = request.getParameter("usuario");
String contrasena = request.getParameter("contra");

Acciones uno = new Acciones();
uno.resgistrar(nombre, apellido, email, usuario, contrasena);

if(uno.controlar() == 1){
	
	response.sendRedirect("http://localhost:8007/Session/vista/Usuario_registrado_Repetido.html");
	
}else{
	response.sendRedirect("http://localhost:8007/Session/vista/Usuario_Registrado.html");

}
%>
</body>
</html>