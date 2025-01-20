<%@page import="com.entity.Books"%>
<%@page import="com.DAO.BooksDAOImp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page import="com.entity.BookDetails"%>
<%@ page import="com.DB.DBconnect"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: Edit Books</title>
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

				<form action="../edit_book" method="post"
					enctype="multipart/form-data">
					<h5 class="text-center mb-4">Edit Book</h5>

					<%
					int id = Integer.parseInt(request.getParameter("id"));
					BooksDAOImp dao = new BooksDAOImp(DBconnect.getConn());
					Books b = dao.getBookById(id);
					%>

					<input type="hidden" name="id" value="<%=b.getBookId()%>">
					<input type="hidden" name="oldCoverImg"
						value="<%=b.getCover()%>">

					<div class="mb-3">
						<label for="bname" class="form-label">Book Name</label> <input
							type="text" class="form-control" id="bookName"
							required="required" name="bookName" value="<%=b.getTitle()%>">
					</div>

					<div class="mb-3">
						<label for="author" class="form-label">Author</label> <input
							type="text" class="form-control" id="author" required="required"
							name="author" value="<%=b.getAuthor()%>">
					</div>
					
					<div class="mb-3">
						<label for="description" class="form-label">Description</label> <textarea
							class="form-control" id="description" required="required"
							name="description"><%=b.getDescription()%></textarea>
					</div>

					<div class="mb-3">
						<label for="price" class="form-label">Price</label> <input
							type="number" class="form-control" id="price" required="required"
							name="price" value="<%=b.getPrice()%>">
					</div>

					<div class="mb-3">
						<label for="inputState" class="form-label">Category</label> <select
							id="inputState" name="category" class="form-control">
							<option selected><%=b.getCategory()%></option>
							<option value="Fiction">Fiction</option>
							<option value="Science">Science</option>
							<option value="Biography">Biography</option>
							<option value="Kids">Kids</option>
							<option value="Old">Old</option>
						</select>
					</div>

					<div class="mb-3">
						<label for="inputState" class="form-label">Status</label> <select
							id="inputState" name="status" class="form-control">
							
							<%
							if ("Active".equals(b.getStatus())) {
							%>
							<option selected><%=b.getStatus()%></option>
							<option value="Out of Stock">Out of Stock</option>
							<%
							} else {
							%>
							<option selected><%=b.getStatus()%></option>
							<option value="Active">Active</option>
							<%
							}
							%>
						</select>
					</div>

					<div class="mb-4">

						<label for="fileUpload" class="form-label">Upload New
							Cover (optional)</label> <input type="file" class="form-control-file"
							id="fileUpload" name="coverImg"> <input type="hidden"
							name="coverImg" value="<%=b.getCover()%>">
					</div>


					<div class="d-grid">
						<button type="submit" class="btn btn-success">Edit</button>
					</div>

				</form>
			</div>
		</div>
	</div>

</body>
</html>