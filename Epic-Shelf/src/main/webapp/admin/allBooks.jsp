<%@page import="com.entity.Books"%>
<%@page import="com.DAO.BooksDAOImp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page import="java.util.List"%>
<%@ page import="com.entity.BookDetails"%>
<%@ page import="com.DB.DBconnect"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin: All Books</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Charm:wght@400;700&family=Pattaya&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<%@ include file="allCss.jsp"%>
<style>
body {
	font-family: 'Poppins', serif;
	margin: 0;
	height: 100%;
}

.page-container {
	display: flex;
	flex-direction: column;
	min-height: 100vh;
}

.content-wrap {
	flex: 1 0 auto;
	display: flex;
	overflow: hidden;
}

.sidebar {
	position: fixed;
	top: 70px;
	left: 0;
	width: 220px;
	height: calc(100% - 70px);
	background-color: #198754;
	overflow-y: auto;
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
}

.sidebar a {
	color: white;
	padding: 16px;
	display: block;
	text-decoration: none;
	font-size: 16px;
}

.sidebar a:hover {
	background-color: white;
	color: black;
}

.main-content {
	margin-left: 220px;
	padding: 20px;
	width: 100%;
	box-sizing: border-box;
}

.table-container {
	width: 100%;
	overflow-x: auto;
}

.table {
	width: 100%;
	table-layout: auto;
	margin: 0 auto;
}

.table img {
	width: 50px;
	height: 50px;
	object-fit: cover;
}

.thead-custom {
	background-color: #198754;
	color: white;
}

@media screen and (max-width: 768px) {
	.sidebar {
		width: 100%;
		height: auto;
		position: relative;
	}
	.sidebar a {
		text-align: center;
	}
	.main-content {
		margin-left: 0;
		width: 100%;
	}
	.table img {
		width: 40px;
		height: 40px;
	}
	.table th, .table td {
		font-size: 12px;
	}
}
</style>
</head>
<body>
	<div class="page-container">
	
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

		<div class="content-wrap">
			<div class="sidebar">
				<a href="home.jsp"><i class="fa-solid fa-house"></i> Home</a> <a
					href="addBook.jsp"><i class="fa-solid fa-square-plus"></i> Add
					Books</a> <a href="allBooks.jsp"><i class="fa-solid fa-book"></i>
					All Books</a> <a href="orders.jsp"><i class="fa-solid fa-box-open"></i>
					Orders</a> <a data-bs-toggle="modal" data-bs-target="#exampleModal"
					class="logout"><i class="fa-solid fa-right-from-bracket"></i>
					Logout</a>
			</div>

			<div class="main-content">

				<c:if test="${not empty successMsg }">
					<p class="text-center text-success">${successMsg}</p>
					<c:remove var="successMsg" scope="session" />
				</c:if>

				<c:if test="${not empty failedMsg }">
					<h6 class="text-center text-danger">${failedMsg}</h6>
					<c:remove var="failedMsg" scope="session" />
				</c:if>

				<div class="table-container">
					<table
						class="table table-bordered  table-responsive table-custom mt-1">
						<thead class="thead-custom">
							<tr>
								<th scope="col" class="id">ID</th>
								<th scope="col" class="img">Image</th>
								<th scope="col" class="name">Book Name</th>
								<th scope="col" class="author">Author</th>
								<th scope="col" class="cat">Category</th>
								<th scope="col" class="price">Price</th>
								<th scope="col" class="stat">Status</th>
								<th scope="col" class="action">Action</th>
							</tr>
						</thead>
						<tbody>
							<%
							BooksDAOImp dao1 = new BooksDAOImp(DBconnect.getConn());
							List<Books> list1 = dao1.getAllBooks();
							for (Books b : list1) {
							%>
							<tr>
								<td><%=b.getBookId()%>
								<td><img alt="" src="../uploads/<%=b.getCover()%>"
									style="width: 50px; height: 50px;"></td>
								<td><%=b.getTitle()%></td>
								<td><%=b.getAuthor()%></td>
								<td><%=b.getCategory()%></td>
								<td><%=b.getPrice()%></td>
								<td><%=b.getStatus()%></td>
								<td><a href="editBook.jsp?id=<%=b.getBookId()%>"
									class="btn btn-sm btn-success" style="width: 40px"><i
										class="fa-solid fa-pen"></i></a> <a
									href="../delete?id=<%=b.getBookId()%>"
									class="btn btn-sm btn-danger" style="width: 40px"><i
										class="fa-solid fa-trash"></i></a></td>
							</tr>
							<%
							}
							%>
						</tbody>
					</table>
				</div>
			</div>
		</div>

		<%@ include file="footer.jsp"%>
	</div>



</body>
</html>