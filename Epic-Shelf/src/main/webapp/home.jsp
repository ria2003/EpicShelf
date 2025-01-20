<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User: Home</title>
</head>
<body>
	<h1>User: Home</h1>
	<c:if test="${not empty userObj }">
		<h5>Name:${userObj.name}</h5>
		<h5>Email:${userObj.email}</h5>
	</c:if>

</body>
</html>