<%@page import="calculos.calculos_m"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>Separación de código de JSP</h1>



El resultado de la suma es: <%= calculos_m.suma(8, 9) %>
<br>
El resultado de la resta es:<%= calculos_m.restar(15, 3) %>
<br>
El resultado de la multiplicación es:<%= calculos_m.multiplicar(30, 127) %>
<br>
El resultado de la división es:<%= calculos_m.dividir(9999,333) %>
</body>
</html>