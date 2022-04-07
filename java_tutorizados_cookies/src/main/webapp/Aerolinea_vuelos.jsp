<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
String ciudad_favorita =" aún no se ha seleccionado la ciudad";
// Lee la cookie de la petición hecha desde navegador
	
	Cookie[] lasCookies = request.getCookies();

//Buscar la cookie de la ciudad favorita

	if(lasCookies != null){
		for(Cookie c_temp : lasCookies){
			if("seleccionVuelos.ciudad_favorita".equals(c_temp.getName())){
				ciudad_favorita = c_temp.getValue();
				break;
			}
		}
	}





%>
<p> Vuelos a <%= ciudad_favorita %></p>
</body>
</html>