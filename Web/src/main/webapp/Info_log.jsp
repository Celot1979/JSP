<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Info_Lo</title>
</head>
<body>
	<%@ page import = "java.sql.*" %>


<%

String usuario = request.getParameter("usuario");
String contra = request.getParameter("contra");



try{
	Class.forName("org.postgresql.Driver");
}catch(ClassNotFoundException ex){
	 System.out.println("Error al registrar el driver de PostgreSQL: " + ex);
}
try{

Connection miConexion = java.sql.DriverManager.getConnection("jdbc:postgresql://localhost:5433/Web","postgres","1234");
//Creamos una consulta preparada
PreparedStatement miPr = miConexion.prepareStatement("SELECT * FROM operador WHERE usuario = ? AND contrasena =?", ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
miPr.setString(1,usuario);
miPr.setString(2,contra);
ResultSet miRs = miPr.executeQuery();

if(miRs.absolute(1)) out.println("Login correcto");
else out.println("No existe el usuario");
}catch(Exception e){
	 System.out.println("Error al registrar el driver de PostgreSQL: " + e);
}


%>
</body>
</html>