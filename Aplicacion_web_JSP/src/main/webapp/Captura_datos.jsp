<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Captura_datos</title>
</head>
<body>
<!-- Importación del paquete java.sql con todos sus clases y métodos. Así se 

	 evita tener que interponerlo antes de instaciaar algún objeto que lleve clases o métodos
	 
     de este paquete-->
     
<%@ page import = "java.sql.*" %>
<!--Debemos importar el paquete / librería que codifica  las contraseñas
    
    Que luego viajará codificada a la BBDD
    
-->
<%@ page import = "org.apache.commons.codec.digest.*" %>
<%
// En estás variables recogemos la información que viene del formulario

String nombre = request.getParameter("nombre");
String apellido = request.getParameter("apellido");
String usuario = request.getParameter("usuario");
String contra = request.getParameter("contra");

// Creamos está variable para implementar el método encargado 
// de cifrar la contraseña.

String contraEnc = DigestUtils.md5Hex(contra);
String pais = request.getParameter("pais");
String tecno = request.getParameter("tecnologias");

//IMPORTANTE: Se debe de registar el driver de conexión con la BBDD antes de comenzar el proyecto.

try{
	Class.forName("org.postgresql.Driver");
}catch(ClassNotFoundException ex){
	 System.out.println("Error al registrar el driver de PostgreSQL: " + ex);
}

//Conectamos a la BBDD - Creamos el objeto que nos permitirá conectar.

Connection miConexion = java.sql.DriverManager.getConnection("jdbc:postgresql://localhost:5433/proyecto_web_jsp","postgres","1234");



//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//---------------------COMPROBACIÓN DE USUARIO REPETIDO --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*
A continuación se implementará código para evitar que un usuario pueda
logearse con el mismo usario. 
*/
// Se crea una consulta preparada para comprobar en la BBDD si hay un usuarios

PreparedStatement miPr = miConexion.prepareStatement("SELECT * FROM usuarios WHERE usuario = ? ", ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
miPr.setString(1,usuario);

// Ejecutamos la consulta preparada

ResultSet miRs = miPr.executeQuery();


// Vamor a realizar un condicional para saber si existen o no el usuario en la BBDD

if(miRs.absolute(1)) out.println("Usuario Resgistrado");


/*
  En el else insertaremos el código que teníamos hasta ahora, para que si no está
  repetido el usuario, siga la acción con normalidad.
*/


else{
	
	
//Si no existe usuario - comprobación del if, se inserta el nuevo registro
//Creamos el objeto Statement que es el que realmente realiza la conexión

Statement miSt = miConexion.createStatement();


// Instrucción SQL

String insSql ="INSERT INTO usuarios (nombre,apellido,usuario,contrasena,pais,tecnologia) VALUES('"+nombre+"','"+apellido+"','"+usuario+"','"+contraEnc+"','"+pais+"','"+tecno+"')";


// Ejecutamos la Sentencia SQL

miSt.executeUpdate(insSql);
out.println("Usuario registrado con éxito");

}


//----------------------- FINAL DE CÓDIGO USUARIO REPETIDO -------------------------------------------------------------------------------------------------------
%>
</body>
</html>