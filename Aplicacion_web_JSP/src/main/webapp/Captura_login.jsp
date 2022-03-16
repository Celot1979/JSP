<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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


//MPORTANTE: Se debe de registar el driver de conexión con la BBDD antes de comenzar el proyecto.
try{
	Class.forName("org.postgresql.Driver");
}catch(ClassNotFoundException ex){
	 System.out.println("Error al registrar el driver de PostgreSQL: " + ex);
}
try{
//Conectamos a la BBDD - Creamos el objeto que nos permitirá conectar.
Connection miConexion = java.sql.DriverManager.getConnection("jdbc:postgresql://localhost:5433/proyecto_web_jsp","postgres","1234");
//Creamos una consulta preparada
PreparedStatement miPr = miConexion.prepareStatement("SELECT * FROM usuarios WHERE usuario = ? AND contrasena =?", ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
miPr.setString(1,usuario);
miPr.setString(2,contra);



// Ejecutamos la consulta preparada

ResultSet miRs = miPr.executeQuery();

// Vamor a realizar un condicional para saber si existen o no el usuario en la BBDD
if(miRs.absolute(1)) out.println("Login correcto");
else out.println("No existe el usuario");
}catch(Exception e){
	 System.out.println("Error al registrar el driver de PostgreSQL: " + e);
}
%>
</body>
</html>