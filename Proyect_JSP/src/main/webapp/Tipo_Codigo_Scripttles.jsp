<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Scriptlets</title>
</head>
<body>
  <h1> Ejemplo de Scriptlets</h1>
  <%
  	  for(int i =0;i < 10; i++){
  		  out.println("vuelta de bucle nº:" + i +"<br>");
  		  out.print("\n");
  		  
  	  }
  %>
</body>
</html>