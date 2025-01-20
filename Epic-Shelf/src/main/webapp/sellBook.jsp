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

<title>Sell Book</title>
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


	<c:if test="${empty userObj} ">
		<c:redirect url="googleLogin.jsp"></c:redirect>
	</c:if>

	<div class="container d-flex justify-content-center align-items-start"
		style="min-height: 60vh; margin-top: 40px; margin-bottom:40px">
		<div class="card"
			style="width: 100%; max-width: 420px; padding-left: 10px; padding-right: 5px; padding-bottom: 5px">
			<div class="card-body">
				<form action="addOldBooks" method="post" enctype="multipart/form-data">
				
					<h5 class="text-center mb-4">Sell Old Book</h5>
					
					<input type="hidden" value="${userObj.email}" name="email">
					<input type="hidden" value="${userObj.name}" name="name">

					<c:if test="${not empty successOldMsg }">
						<p class="text-center text-success">${successOldMsg}</p>
						<c:remove var="successOldMsg" scope="session" />
					</c:if>

					<c:if test="${not empty failedOldMsg }">
						<h6 class="text-center text-danger">${failedOldMsg}</h6>
						<c:remove var="failedOldMsg" scope="session" />
					</c:if>
					
					

					<div class="mb-3">
						<label for="bookName" class="form-label">Book Name</label> <input
							type="text" class="form-control" id="bookName"
							required="required" name="bookName">
					</div>

					<div class="mb-3">
						<label for="author" class="form-label">Author</label> <input
							type="text" class="form-control" id="author" required="required"
							name="author">
					</div>
					
					<div class="mb-3">
						<label for="author" class="form-label">Author</label> <textarea class="form-control" id="description" required="required"
							name="description"></textarea>
					</div>

					<div class="mb-3">
						<label for="price" class="form-label">Price</label> <input
							type="number" class="form-control" id="price" required="required"
							name="price">
					</div>

					<div class="mb-4">
						<label for="fileUpload" class="form-label">Upload Cover</label> <input
							type="file" class="form-control-file" id="fileUpload"
							required="required" name="coverImg">
					</div>

					<div class="d-grid">
						<button type="submit" class="btn btn-success">Sell</button>
					</div>

				</form>
			</div>
		</div>
	</div>
	
	<%@include file="footer.jsp"%>
</body>
</html>