<%@page import="controlador.Acciones"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Comprobación</title>
</head>
<body>
<!--  Importación del paquete java.sql con todos sus clases y métodos. Así se
// evita tener que interponerlo antes de instaciaar algún objeto que lleve clases o métodos
// de este paquete-->
<%@ page import = "java.sql.*" %>


<%
// En estás variables recogemos la información que viene del formulario

String usuario = request.getParameter("usuario");
String contra = request.getParameter("contra");


Acciones dos = new Acciones();
dos.Comprobar_Usuario(usuario, contra);
dos.setUsuario(usuario);
String datos = (String)dos.getUsuario().toString();

java.util.ArrayList<String> Datos= new java.util.ArrayList<String>();
if(dos.controlar() == 1){
	
	response.sendRedirect("http://localhost:8007/Session/vista/Menu.html");
    Datos.add(datos);
    
    for( String elem : Datos){
    	System.out.println(elem);
    }
	
}else{
	response.sendRedirect("http://localhost:8007/Session/vista/Log_2.html");
	
}

%>



</body>
</html>