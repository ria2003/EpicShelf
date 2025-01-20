<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: Add Books</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Charm:wght@400;700&family=Pattaya&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
	rel="stylesheet">
<%@ include file="allCss.jsp"%>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	width: 100%;
	background: url("../imgs/admin.jpg");
	background-repeat: no-repeat;
	background-size: cover;
	overflow-x: hidden;
	font-family: "Poppins", serif;
}

.reg {
	color: #1c1c54;
	font-size: 14px;
	font-weight: bold;
	text-decoration: none
}

.reg:hover {
	text-decoration: underline;
	cursor: pointer;
	color: #1c1c54
}

.sidebar {
	margin: 0;
	padding: 0;
	width: 220px;
	background-color: #198754;
	position: fixed;
	height: 100%;
	overflow: auto;
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
	z-index: 1000;
}

.sidebar a {
	display: block;
	color: white;
	padding: 16px;
	text-decoration: none;
	font-size: 16px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1)
}

.sidebar a:hover:not(.active) {
	background-color: white;
	color: black;
}

@media screen and (max-width: 700px) {
	.sidebar {
		width: 100%;
		height: auto;
		position: relative;
	}
	.sidebar a {
		float: left;
	}
	div.content {
		margin-left: 0;
	}
}

@media screen and (max-width: 400px) {
	.sidebar a {
		text-align: center;
		float: none;
	}
}
</style>
</head>
<body>
	<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true"
			style="z-index: 9000000">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-body">
						<div class="text-center">
							<h5>Do you want to logout?</h5>
							<button type="button" class="btn btn-danger"
								data-bs-dismiss="modal" style="width: 100px; margin: 5px;">Close</button>
							<a href="../logout" type="button" class="btn btn-dark text-white"
								style="width: 100px; margin: 5px;">Logout</a>
						</div>
					</div>
				</div>
			</div>
		</div>

	<%@ include file="navbar.jsp"%>

	<c:if test="${empty userObj}">
		<c:redirect url="../googleLogin.jsp" />
	</c:if>

	<div class="sidebar">
		<a href="home.jsp"><i class="fa-solid fa-house"></i> Home</a> <a
			href="addBook.jsp"><i class="fa-solid fa-square-plus"></i> Add
			Books</a> <a href="allBooks.jsp"><i class="fa-solid fa-book"></i> All
			Books</a> <a href="orders.jsp"><i class="fa-solid fa-box-open"></i>
			Orders</a> <a data-bs-toggle="modal" data-bs-target="#exampleModal"
					class="logout"><i class="fa-solid fa-right-from-bracket"></i>
					Logout</a>
	</div>
	<div class="container d-flex justify-content-center align-items-start"
		style="min-height: 60vh; margin: 40px auto 40px 220px;">
		<div class="card"
			style="width: 100%; max-width: 420px; padding-left: 10px; padding-right: 5px; padding-bottom: 5px">
			<div class="card-body">

				<form action="../import_books" method="post"
					enctype="multipart/form-data">
					<h5 class="text-center mb-4">Import Books</h5>

					<c:if test="${not empty successImpMsg }">
						<p class="text-center text-success">${successImpMsg}</p>
						<c:remove var="successImpMsg" scope="session" />
					</c:if>

					<c:if test="${not empty failedImpMsg }">
						<h6 class="text-center text-danger">${failedImpMsg}</h6>
						<c:remove var="failedImpMsg" scope="session" />
					</c:if>

					<div class="mb-4">
						<label for="excelFile" class="form-label">Upload Excel
							File</label> <input type="file" class="form-control-file" id="excelFile"
							name="excelFile" accept=".xlsx, .xls" required>
					</div>
					<div class="d-grid">
						<button type="submit" class="btn btn-success">Import</button>
					</div>
				</form>






			</div>
		</div>
	</div>

</body>
</html>