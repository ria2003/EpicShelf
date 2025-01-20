<%@page import="com.DAO.OrderDAOImp"%>
<%@page import="com.entity.Orders"%>
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
<title>Admin: Orders</title>
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
	font-family: "Poppins", serif;
}

.thead-custom {
	background-color: #198754;
	color: white;
}

.id {
	width: 30px;
}

table {
	border-radius: 10%;
}

table td {
	font-size: 14px;
}

.action {
	width: 142px;
}

td a {
	width: 60px;
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
		<c:redirect url="../login.jsp" />
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

	<table class="table table-bordered table-custom"
		style="margin-left: 240px; margin-top: 20px; margin-right: 0px; width: 182vh">
		<thead class="thead-custom">
			<tr>
				<th scope="col" class="id">Order ID</th>
				<th scope="col">Name</th>
				<th scope="col">Email</th>
				<th scope="col">Address</th>
				<th scope="col">Contact</th>
				<th scope="col">Book</th>
				<th scope="col">Title</th>
				<th scope="col">Author</th>
				<th scope="col">Price</th>
				<th scope="col">Payment Type</th>
			</tr>
		</thead>
		<tbody>

			<%
			OrderDAOImp dao1 = new OrderDAOImp(DBconnect.getConn());
			List<Orders> blist = dao1.getAllOrders();
			for (Orders b : blist) {
			%>

			<tr>
				<th scope="row"><%=b.getOrderId() %></th>
				<td><%=b.getUsername() %></td>
				<td><%=b.getEmail() %></td>
				<td><%=b.getFullAdd() %></td>
				<td><%=b.getContact() %></td>
				<td><img src="../uploads/<%=b.getPhotoName() %>" width="30px"></td>
				<td><%=b.getTitle() %></td>
				<td><%=b.getAuthor() %></td>
				<td><%=b.getPrice() %></td>
				<td><%=b.getPayment() %></td>
			</tr>
			<%
			}
			%>

		</tbody>
	</table>


</body>
</html>