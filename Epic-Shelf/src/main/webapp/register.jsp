<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
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
	
<title>Register</title>
<%@include file="all_components/allCss.jsp"%>
<style>
	.img{
	background: url("imgs/loginbg.jpg");
	width: 100%;
	background-repeat: no-repeat;
	background-size: cover;
	position: relative;}
</style>
</head>
<body>
	<%@include file="navbar.jsp"%>

	<div class="img">

		<div
			class="container d-flex justify-content-center align-items-center"
			style="min-height: 105vh">
			<div class="card m-3"
				style="width: 100%; max-width: 450px; padding-left: 5px; padding-right: 5px">
				<div class="card-body">
					<form action="register" method="post">
						<h5 class="text-center mb-4">Register Here</h5>
						
						<c:if test="${not empty successMsg}" >
							<p class="text-center text-success">${sucessMsg}</p>
							<c:remove var="successMsg" scope="session"/>
						</c:if>
						
						<c:if test="${not empty failedMsg}" >
							<p class="text-center text-danger">${failedMsg}</p>
							<c:remove var="failedMsg" scope="session" />
						</c:if>

						<div class="mb-3">
							<label for="name" class="form-label">Name</label> <input
								type="text" class="form-control" id="name" required="required" name="name">
						</div>

						<div class="mb-3">
							<label for="email" class="form-label">Email Address</label> <input
								type="email" class="form-control" id="email" required="required" name="email">
						</div>

						<div class="mb-3">
							<label for="contact" class="form-label">Contact No</label> <input
								type="number" class="form-control" id="contact" required="required" name="contact">
						</div>

						<div class="mb-3">
							<label for="password" class="form-label">Password</label> <input
								type="password" class="form-control" id="password" required="required" name="password">
						</div>

						<div class="mb-3">
							<label for="cpassword" class="form-label">Confirm
								Password</label> <input type="password" class="form-control"
								id="cpassword" required="required" name="cpassword">
						</div>

						<div class="mb-3 form-check">
							<input type="checkbox" class="form-check-input"
								id="exampleCheck1" required="required" name="chk"> <label class="form-check-label"
								for="exampleCheck1">Agree terms and conditions</label>
						</div>

						<div class="d-grid">
							<button type="submit" class="btn btn-success">Submit</button>
						</div>
					</form>
				</div>
			</div>
		</div>

	</div>



	<%@include file="footer.jsp"%>

</body>
</html>