<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registro</title>
</head>
<body>
<%@ page import = "java.sql.*" %>
<%@ page import = "org.apache.commons.codec.digest.*" %>

<%

String nombre = request.getParameter("nombre");
String apellido = request.getParameter("apellido");
String email = request.getParameter("email");
String usuario = request.getParameter("usuario");
String contrasena = request.getParameter("contra");


try{
	Class.forName("org.postgresql.Driver");
}catch(ClassNotFoundException ex){
	 System.out.println("Error al registrar el driver de PostgreSQL: " + ex);
}

Connection miConexion = java.sql.DriverManager.getConnection("jdbc:postgresql://localhost:5433/Web","postgres","1234");

PreparedStatement miPr = miConexion.prepareStatement("SELECT * FROM operador WHERE usuario = ? ", ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
miPr.setString(1,usuario);
ResultSet miRs = miPr.executeQuery();

if(miRs.absolute(1)) out.println("Usuario Resgistrado");

else{
Statement miSt = miConexion.createStatement();
String insSql ="INSERT INTO  operador (nombre,apellido,email,usuario,contrasena) VALUES('"+nombre+"','"+apellido+"','"+email+"','"+usuario+"','"+contrasena+"')";
miSt.executeUpdate(insSql);
out.println("Usuario registrado con éxito");

}
%>
</body>
</html>