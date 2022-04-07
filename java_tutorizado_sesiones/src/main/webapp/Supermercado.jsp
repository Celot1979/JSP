<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<html>
<style type="text/css">
.titcentrado {
	text-align: center;
}
</style>

<body bgcolor="#99CC66">
<h1 class="titcentrado">Carro de la compra (supuesto)</h1>
<form name="Formulario_Compra" action="Supermercado.jsp">
 
  <p>Artículos a comprar:</p>
  <p>
    <label>
      <input type="checkbox" name="articulos" value="agua " >
      Agua </label>
    <br>
    <label>
      <input type="checkbox" name="articulos" value="leche" >
      Leche </label>
    <br>
     <label>
      <input type="checkbox" name="articulos" value="pan" >
      Pan </label>
    <br>
     <label>
      <input type="checkbox" name="articulos" value="mazanas" >
      Manzanas </label>
    <br>
     <label>
      <input type="checkbox" name="articulos" value="carne" >
      Carne </label>
      <br>
       <label>
      <input type="checkbox" name="articulos" value="pescado" >
      Pescado </label>
  </p>
  <p>
    <input type="submit" name="button" id="button" value="Enviar">
    <br>
  </p>
</form>

<!-- CREACIÓN DE SESIONES DENTRO DE UNA APLICACIÓN WEB CREADA ON JSP 

     PARA EL EJEMPLO CREAMOS UN SUPERMERCADO RUDIMENTARIO PARA COMPROBAR 
     
     CÓDIGO DE CREACIÓN Y GUARDADO DE SESIÓN                         -->
    
<h3>Carro de la compra virtual</h3>
<ul>
<%
/*
   2º Paso. Creamos un ArrayLsit que contendrá y mantendrá la sesión abierta de los articulos anteriormente escogidos.
*/

 ArrayList<String> listaAlimentos = (ArrayList<String>)session.getAttribute("misAlimentos");
/*
   4º Paso. El programa sigues el flujo de arriba a bajo. Es decir, sólo entrará en el siguiente condicional
   si es la 1º vez que inciamos la sesión ( que se entra en la plantilla html).
   
   Su condicional es que si el ArrayList está vacia, inicie la sesión y guarde en el ArrayList los primeros 
   productos guardados.

*/
 if(listaAlimentos == null){
	 listaAlimentos = new  ArrayList<String> ();
	 session.setAttribute("misAlimentos", listaAlimentos);
 }
 /*
   1º Paso. Creamos un Array para evaluar que productos nos llegan desde el formulario.
   
 */
 String [] alimentos = request.getParameterValues("articulos");
   /*
     3º Paso. Creamos un condicional con el parámetro a evaluar de si el array - alimentos-  está vacio.
     Si no está vacio es porque anteriomente ya ha habido implementación de productos; por tanto,
     ya está abierta la sesión y en ArrayList hay productos, así que nada más hay que añadir los nuevos.
 
   */
 if(alimentos != null){
	 for(String alimentoAlCarro : alimentos){
		 listaAlimentos.add(alimentoAlCarro);
		// out.println("<li>" + alimentoAlCarro + "</li>");
	 }
 }
     /*
     5º Paso. Ralizamos un bucle - for each - para poder imprimir en el servidor la lista completa.
   */
 for(String alimento : listaAlimentos){
	 out.println("<li>" + alimento + "</li>");
 }



%>
</ul>
</body>

</html>