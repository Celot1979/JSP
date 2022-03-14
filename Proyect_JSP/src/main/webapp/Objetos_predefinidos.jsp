<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Objetos Predefinidos</title>
</head>
<body>
	
	<h1>Objetos Predefinidos JSP</h1>
	
	Petición datos del navegador: <%= request.getHeader("User-Agent") %>
	<br>
	Petición idioma del usuario: <%=request.getLocale() %>
	<br>
	Petición dirección local  del usuario: <%=request.getLocalAddr() %>
	<br>
	 Petición info servidor:<%=request.getLocalName() %>
	 
	 <br>
	Petición del puertos usado por el usuario: <%=request.getLocalPort() %>
	 <br>
	Petición saber la cookie que ocupará el programa:<%=request.getCookies() %>
	
	
	
	
</body>
</html>