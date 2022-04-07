<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
// Leer la información que viene del formulario

	String ciudad_favorita = request.getParameter("ciudad_favorita");


// Crear  la coockie y guardar la información del formulario

	Cookie miCookie = new Cookie("seleccionVuelos.ciudad_favorita", ciudad_favorita);

// Establecer la vida de la cookie
	
	miCookie.setMaxAge(365*24*60*60);


// Guardar ó enviar la coockie al ordenador del usuario

	response.addCookie(miCookie);

	
%>

Ver Vuelos: <a href = "Aerolinea_vuelos.jsp"> click aquí</a>
</body>
</html>