<%@page import="com.entity.Books"%>
<%@page import="com.DAO.BooksDAOImp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.entity.BookDetails"%>
<%@ page import="com.entity.User"%>
<%@ page import="com.DB.DBconnect"%>
<%@ page import="java.util.List"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
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
<style type="text/css">
body {
	font-family: "Poppins", serif;
	font-weight: 400;
	font-style: normal;
	margin: 0px;
	background-color: #f5faf7
}

.crd-ho {
	background-color: white;
	transition: transform 0.3s ease-in-out;
	box-shadow: 1px 1px 8px rgba(0, 10, 67, 0.4);
}

.crd-ho:hover {
	cursor: pointer;
	transform: scale(1.07);
}

.name {
	margin-top: 10px;
	margin-bottom: 0px;
	font-family: "Poppins", serif;
	font-weight: 400;
	font-style: normal;
	font-size: 13px;
	font-family: "Poppins", serif;
}

.author, .cat {
	margin: 2px;
	font-family: "Poppins", serif;
	font-weight: 400;
	font-style: normal;
	font-size: 13px;
	font-family: "Poppins", serif;
}

.btn-view {
	margin-top: 0px;
	margin-bottom: 10px;
}


</style>
</head>
<body>
	<%@include file="navbar.jsp"%>

	<%
	User u = (User) session.getAttribute("userObj");
	%>

	<div class="container" style="margin-bottom: 50px;">
		<!-- <h5 class="text-center" style="margin-bottom: 30px; margin-top:15px"></h5>  -->
		<div class="row g-5 mt-1">

			<%
			String ch=request.getParameter("ch");
			BooksDAOImp dao1 = new BooksDAOImp(DBconnect.getConn());
			List<Books> list1 = dao1.getBookBySearch(ch);
			for (Books b : list1) {
			%>

			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="book1" src="uploads/<%=b.getCover()%>"
							style="width: 150px; height: 200px; border-radius: 5px"
							class="img-thumblin">
						<p class="name"><%=b.getTitle()%></p>
						<p class="author"><%=b.getAuthor()%></p>
						<p class="cat">
							Category:
							<%=b.getCategory()%></p>
						<div class="col" style="margin-top: 10px">
							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm ml-2"
								style="width: 60px"><i class="fa-solid fa-cart-plus"></i></a>

							<%
							} else {
							%>
							<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>"
								class="btn btn-danger btn-sm ml-2" style="width: 60px"><i
								class="fa-solid fa-cart-plus"></i></a>
							<%
							}
							%>
							<a href="viewBooks.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ml-1" style="width: 60px"><i
								class="fa-solid fa-eye"></i></a> <a href=""
								class="btn btn-danger btn-sm ml-1" style="width: 70px"><%=b.getPrice()%>
								<i class="fa-solid fa-indian-rupee-sign"></i></a>
						</div>
					</div>
				</div>
			</div>

			<%
			}
			%>

		</div>
	</div>

	<%@include file="footer.jsp"%>
</body>
</html>