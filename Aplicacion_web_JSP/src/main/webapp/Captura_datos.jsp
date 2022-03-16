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
String nombre = request.getParameter("nombre");
String apellido = request.getParameter("apellido");
String usuario = request.getParameter("usuario");
String contra = request.getParameter("contra");
String pais = request.getParameter("pais");
String tecno = request.getParameter("tecnologias");

//MPORTANTE: Se debe de registar el driver de conexión con la BBDD antes de comenzar el proyecto.
try{
	Class.forName("org.postgresql.Driver");
}catch(ClassNotFoundException ex){
	 System.out.println("Error al registrar el driver de PostgreSQL: " + ex);
}
try{
//Conectamos a la BBDD - Creamos el objeto que nos permitirá conectar.
Connection miConexion = java.sql.DriverManager.getConnection("jdbc:postgresql://localhost:5433/proyecto_web_jsp","postgres","1234");
//Creamos el objeto Statement que es el que realmente realiza la conexión
Statement miSt = miConexion.createStatement();
// Instrucción SQL
String insSql ="INSERT INTO usuarios (nombre,apellido,usuario,contrasena,pais,tecnologia) VALUES('"+nombre+"','"+apellido+"','"+usuario+"','"+contra+"','"+pais+"','"+tecno+"')";

// Ejecutamos la Sentencia SQL
miSt.executeUpdate(insSql);
out.println("Usuario registrado con éxito");
}catch(Exception e){
	 System.out.println("Error al registrar el driver de PostgreSQL: " + e);
}
%>
</body>
</html>