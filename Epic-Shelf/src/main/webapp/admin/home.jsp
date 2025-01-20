<%@page import="com.DAO.UserDAOImp"%>
<%@page import="com.DAO.UserDAO"%>
<%@page import="com.DB.DBconnect"%>
<%@page import="com.DAO.OrderDAOImp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: Home</title>
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
html, body {
	height: 100%;
	margin: 0;
	font-family: "Poppins", serif;
}

.page-container {
	display: flex;
	flex-direction: column;
	min-height: 100vh;
}

.content-wrap {
	flex: 1 0 auto;
	display: flex;
}

.sidebar {
	position: fixed;
	top: 70px; /* Adjust based on navbar height */
	left: 0;
	width: 220px;
	height: calc(100% - 70px);
	background-color: #198754;
	overflow-y: auto;
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

.sidebar a:hover {
	cursor: pointer;
	background-color: white;
	color: black;
	transition: 0.5s;
	background-color: white;
}

.main-content {
	margin-left: 220px; /* Same as sidebar width */
	padding: 30px;
	width: calc(100% - 220px);
}

.dashboard-boxes {
	display: flex;
	justify-content: center;
	gap: 60px;
}

.box {
	height: 180px;
	width: 280px;
	border-radius: 20px;
	box-shadow: 1px 1px 8px rgba(0, 10, 67, 0.4);
	padding: 20px;
	display: flex;
	align-items: center;
	justify-content: space-around;
	cursor: pointer;
	transition: transform 0.3s ease-in-out;
	background-color: #198754;
}

.box:hover {
	transform: scale(1.08);
}

.box img {
	height: 55px;
	color: white;
}

.box .text {
	color: white;
}

.topic {
	font-size: 14px;
	font-weight: 400;
	letter-spacing: 1px;
}

.topic-heading {
	font-size: 35px;
	letter-spacing: 3px;
}

.dashboard-table {
	width: 100%;
	margin: 20px auto 0;
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
		top: 0;
	}
	.main-content {
		margin-left: 0;
		width: 100%;
	}
	.dashboard-boxes {
		flex-wrap: wrap;
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
				<div class="dashboard-boxes">
					<div class="box box1">

						<%
						OrderDAOImp orderDao = new OrderDAOImp(DBconnect.getConn());
						int totalOrders = orderDao.getOrderCount();
						UserDAO userDao = new UserDAOImp(DBconnect.getConn());
						int totalUsers = userDao.getRegisteredCount();
						double totalSales= orderDao.getTotalSales();
						%>
						
						

						<div class="text">
							<h2 class="topic-heading"><%=totalUsers%></h2>
							<h2 class="topic">Total Users</h2>
						</div>
						<img src="../imgs/users.png" alt="users" />
					</div>

					<div class="box box2">
						<div class="text">
							<h2 class="topic-heading"><%=totalOrders%></h2>
							<h2 class="topic">Total Orders</h2>
						</div>
						<img src="../imgs/stack.png" alt="orders" />
					</div>

					<div class="box box3">
						<div class="text">
							<h2 class="topic-heading"><%=totalSales%>k</h2>
							<h2 class="topic">Total Sales</h2>
						</div>
						<img src="../imgs/sales.png" alt="sales" />
					</div>
				</div>

				
			</div>
		</div>

		<%@ include file="footer.jsp"%>
	</div>
</body>
</html>