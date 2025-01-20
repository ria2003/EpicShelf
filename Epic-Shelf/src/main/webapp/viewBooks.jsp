<%@page import="com.DAO.BooksDAOImp"%>
<%@page import="com.entity.Books"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.entity.BookDetails"%>
<%@ page import="com.DB.DBconnect"%>
<%@ page import="com.entity.User"%>

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
<title>EpicShelf</title>
<%@include file="all_components/allCss.jsp"%>
<style>
body {
	font-family: "Poppins", serif;
	font-weight: 400;
	font-style: normal;
	margin: 0px;
	background-color: #f5faf7;
}

.container-wrapper {
	display: flex;
	justify-content: center;
	width: 100%;
	padding: 2rem 0;
	box-shadow: 1px 1px 8px rgba(0, 10, 67, 0.4);
}

.book-container {
	max-width: 1200px;
	width: 90%;
	box-shadow: 1px 1px 8px rgba(0, 10, 67, 0.4);
}

.text-center {
	text-align: center;
}

.book-info-row {
	display: flex;
	justify-content: center;
}

.features-row {
	display: flex;
	justify-content: center;
	gap: 0px;
	margin-top: 15px;
}

.price-button {
	display: flex;
	justify-content: center;
	margin-top: 10px;
}

.seller-info {
	text-align: center;
}
</style>
</head>
<body>
	<%@include file="navbar.jsp"%>

	<%
	User u = (User) session.getAttribute("userObj");
	int bid = Integer.parseInt(request.getParameter("bid"));
	BooksDAOImp dao = new BooksDAOImp(DBconnect.getConn());
	Books b = dao.getBookById(bid);
	%>

	<%
	if ("Old".equals(b.getCategory())) {
	%>

	<div class="container-wrapper">
		<div class="book-container">
			<div class="book-info-row">
				<div class="col-md-6 text-center p-4 border bg-white"
					style="width: 30%; border-right: none; display: flex; align-items: center; justify-content: center;">
					<img src="uploads/<%=b.getCover()%>"
						style="width: 200px; border-radius: 5px"><br>
				</div>

				<div class="col-md-6 text-center p-4 border bg-white"
					style="width: 70%">
					<h4 class="mt-1" style="text-decoration: underline"><%=b.getTitle()%></h4>
					<hr>
					<h6 class="mt-3" style="text-align: left">
						Author:
						<%=b.getAuthor()%></h6>
					<h6 style="text-align: left">
						Description:
						<p><%=b.getDescription()%>
					</h6>
					<h6 class="mt-2" style="text-align: left">
						Category:
						<%=b.getCategory()%></h6>
					<hr>

					<div class="seller-info mt-3">
						<h6 class="text-danger">
							<i class="fa-solid fa-phone"></i> Contact the Publisher
						</h6>
						<h6 class="mt-3" style="text-align: left">
							<i class="fa-solid fa-user"></i> Publisher's Name:
							<%=b.getEmail()%>

						</h6>
						<h6 class="mt-2 mb-4" style="text-align: left">
							<i class="fa-solid fa-envelope"></i> Email:
							<%=b.getEmail()%>
						</h6>

					</div>

					<div class="price-button mt-4">
						<a href="" class="btn btn-success mb-3"
							style="width: 220px; margin-right: 15px">Price: <%=b.getPrice()%>
							<i class="fa-solid fa-indian-rupee-sign"></i>
						</a> <a href="index.jsp" class="btn btn-danger mb-3"
							style="width: 220px;"><i class="fa-solid fa-arrow-left"></i>
							Continue Shopping </a>
					</div>


					<div
						style="display: flex; justify-content: space-around; align-items: center;">
						<div class="text-dark text-center"
							style="width: 20%; padding: 0px;">
							<i class="fa-solid fa-star fa-sm"></i>
							<p style="margin-top: 5px; font-size: 13px; margin-bottom: 0">Premium
								quality</p>
						</div>
						<div class="text-dark text-center"
							style="width: 20%; padding: 5px;">
							<i class="fas fa-money-bill-wave fa-sm"></i>
							<p style="margin-top: 5px; font-size: 13px; margin-bottom: 0">On
								time delivery</p>
						</div>
						<div class="text-dark text-center"
							style="width: 20%; padding: 5px;">
							<i class="fas fa-truck-moving fa-sm"></i>
							<p style="margin-top: 5px; font-size: 13px; margin-bottom: 0">Free
								shipping</p>
						</div>
						<div class="text-dark text-center"
							style="width: 20%; padding: 5px;">
							<i class="fas fa-undo-alt fa-sm"></i>
							<p style="margin-top: 5px; font-size: 13px; margin-bottom: 0">Easy
								returns</p>
						</div>
						<div class="text-dark text-center"
							style="width: 20%; padding: 5px;">
							<i class="fa-solid fa-lock fa-sm"></i>
							<p style="margin-top: 5px; font-size: 13px; margin-bottom: 0">Secure
								payment</p>
						</div>
					</div>


				</div>
			</div>
		</div>
	</div>

	<%
	}

	else {
	%>


	<div class="container-wrapper">
		<div class="book-container">
			<div class="book-info-row">
				<div class="col-md-6 text-center p-4 border bg-white"
					style="width: 30%; border-right: none; display: flex; align-items: center; justify-content: center;">
					<img src="uploads/<%=b.getCover()%>"
						style="width: 200px; border-radius: 5px"><br>
				</div>


				<div class="col-md-6 text-center p-4 border bg-white"
					style="width: 70%">
					<h4 class="mt-3" style="text-decoration: underline"><%=b.getTitle()%></h4>
					<hr>
					<h6 class="mt-3" style="text-align: left">
						Author:
						<%=b.getAuthor()%></h6>
					<h6 class="mt-3" style="text-align: left">
						Description:
						<%=b.getDescription()%></h6>
					<h6 class="mt-3" style="text-align: left">
						Category:
						<%=b.getCategory()%></h6>
					<h6 class="text-success mt-3" style="text-align: left">
						Status:
						<%=b.getStatus()%></h6>

					<%
					if (u == null) {
					%>

					<div class="price-button mt-4">
						<a href="index.jsp" class="btn btn-danger"
							style="width: 220px; margin-right: 15px"><i
							class="fa-solid fa-arrow-left"></i> Continue Shopping </a> <a href=""
							class="btn btn-danger" style="width: 220px">Price: <%=b.getPrice()%>
							<i class="fa-solid fa-indian-rupee-sign"></i>
						</a>
					</div>

					<%
					} else {
					%>

					<div class="price-button mt-4">
						<a href="index.jsp" class="btn btn-danger"
							style="width: 220px; margin-right: 15px"><i
							class="fa-solid fa-arrow-left"></i> Continue Shopping </a> <a
							href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>"
							class="btn btn-success" style="width: 220px; margin-right: 15px"><i
							class="fa-solid fa-cart-plus"></i> Add to Cart </a> <a href=""
							class="btn btn-danger" style="width: 220px">Price: <%=b.getPrice()%>
							<i class="fa-solid fa-indian-rupee-sign"></i>
						</a>
					</div>

					<%
					}
					%>


					<div
						style="display: flex; justify-content: space-around; align-items: center; margin-top: 15px">
						<div class="text-dark text-center"
							style="width: 20%; padding: 5px;">
							<i class="fa-solid fa-star fa-sm"></i>
							<p style="margin-top: 5px; font-size: 13px; margin-bottom: 0">Premium
								quality</p>
						</div>
						<div class="text-dark text-center"
							style="width: 20%; padding: 5px;">
							<i class="fas fa-money-bill-wave fa-sm"></i>
							<p style="margin-top: 5px; font-size: 13px; margin-bottom: 0">On
								time delivery</p>
						</div>
						<div class="text-dark text-center"
							style="width: 20%; padding: 5px;">
							<i class="fas fa-truck-moving fa-sm"></i>
							<p style="margin-top: 5px; font-size: 13px; margin-bottom: 0">Free
								shipping</p>
						</div>
						<div class="text-dark text-center"
							style="width: 20%; padding: 5px;">
							<i class="fas fa-undo-alt fa-sm"></i>
							<p style="margin-top: 5px; font-size: 13px; margin-bottom: 0">Easy
								returns</p>
						</div>
						<div class="text-dark text-center"
							style="width: 20%; padding: 5px;">
							<i class="fa-solid fa-lock fa-sm"></i>
							<p style="margin-top: 5px; font-size: 13px; margin-bottom: 0">Secure
								payment</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%
	}
	%>

	<%@include file="footer.jsp"%>
</body>
</html>