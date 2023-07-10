<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Spring Proyect Demo 3</title>
<link rel="stylesheet" href="./styles/loggin.css">
</head>
<body>
<div class="cabecera">        
	<div class="cab1"></div> 
	<div class="cap2"></div>
</div>
<form:form action="./logginprocess" method="POST">
	<div><p class="title">Spring Demo Proyect 7-1</p></div>
	<div>
		<label>Usuario:</label>
		<input type="text" name="username" required/>
	</div>
	<div>
		<label>Password:</label>
		<input type="password" name="password" required/>
	</div>
	<div>
		<input type="submit" value="ENTRAR"/>
	</div> 
	<c:if test="${param.error != null}"><div><p class="error">Usuario o contraseña no válidos</p></div></c:if>
	<c:if test="${param.logout != null}"><div><p class="logout">Sesión de usuario cerrada</p></div></c:if>
	<div><p><a class="ayuda" href="./ayuda" target="_blank">Ayuda</a></p></div>
</form:form>
<br/>
<br/>

</body>
</html>