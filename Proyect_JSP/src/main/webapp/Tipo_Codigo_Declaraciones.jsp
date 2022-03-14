<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Declaraciones</title>
</head>
<body>
<h1>Declaraciones</h1>

<%!

	int resultado;

	public int suma(int num1,int num2){
		resultado = num1 + num2;
		return resultado;
	}
	public int restar(int num1,int num2){
		resultado = num1 - num2;
		return resultado;
	}
	public int multiplicar(int num1,int num2){
		resultado = num1 * num2;
		return resultado;
	}
	public int dividir(int num1,int num2){
		resultado = num1 / num2;
		return resultado;
	}

%>

El resultado de la suma es: <%= suma(8,9) %>
<br>
El resultado de la resta es: <%= restar(8,9) %>
<br>
El resultado de la multiplicación es: <%=  multiplicar(8,9) %>
<br>
El resultado de la división es: <%= dividir(8,9) %>
</body>
</html>