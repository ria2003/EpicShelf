<%@page import="com.entity.Cart"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBconnect"%>
<%@page import="com.DAO.CartDAOImp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page import="com.entity.User"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta charset="ISO-8859-1">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Charm:wght@400;700&family=Pattaya&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
	rel="stylesheet">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Charm:wght@400;700&family=Pattaya&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
	rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- Popper.js -->
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<!-- Bootstrap JS -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>

<title>Edit Address</title>
<%@include file="all_components/allCss.jsp"%>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	width: 100%;
	background: url("imgs/admin.jpg");
	background-repeat: no-repeat;
	background-size: cover;
	overflow-x: hidden;
	font-family: "Poppins", serif;
}
</style>
</head>
<body>

	<%@include file="navbar.jsp"%>
	
	<c:if test="${not empty userObj} ">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	
	<div class="container d-flex justify-content-center align-items-start" 
     style="min-height: 50vh; margin-top: 40px; margin-bottom:40px">
    <div class="card" style="max-width: 600px;">
        <div class="card-body" style="padding: 2rem;">
            <h5 class="text-center text-dark mb-4">Edit Address</h5>
            <form class="row g-3">
  <div class="col-md-6">
    <label for="inputAddress" class="form-label">Address</label>
    <input type="text" class="form-control" id="inputAddress" required>
  </div>
  <div class="col-md-6">
    <label for="inputLand" class="form-label">Landmark</label>
    <input type="text" class="form-control" id="inputLand" required>
  </div>
  <div class="col-md-6">
    <label for="inputCity" class="form-label">City</label>
    <input type="text" class="form-control" id="inputCity" required>
  </div>
  <div class="col-md-4">
    <label for="inputState" class="form-label">State</label>
    <input type="text" class="form-control" id="inputState" required>
  </div>
  <div class="col-md-2">
    <label for="inputZip" class="form-label">Zip</label>
    <input type="number" class="form-control" id="inputZip" required>
  </div>
  
  <div class="d-grid">
    <button type="submit" class="btn btn-success">Update</button>
  </div>
</form>
        </div>
    </div>
</div>

<%@include file="footer.jsp"%>


</body>
</html>