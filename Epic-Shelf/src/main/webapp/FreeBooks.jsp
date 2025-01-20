<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.DAO.FreeBooksDAOImp"%>
<%@ page import="com.entity.FreeBooks"%>
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
<title>Free Books - EpicShelf</title>
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
}

.author, .cat {
	margin: 2px;
	font-family: "Poppins", serif;
	font-weight: 400;
	font-style: normal;
	font-size: 13px;
}

.download-btn {
	background-color: #28a745;
	color: white;
	transition: background-color 0.3s ease;
}

.download-btn:hover {
	background-color: #218838;
	color: white;
}
</style>
</head>
<body>
	<%@include file="navbar.jsp"%>

	<div class="container" style="margin-bottom: 50px;">
		<h5 class="text-center" style="margin-bottom: 30px; margin-top: 15px">Free
			Books</h5>
		<div class="row g-5">

			<%
			FreeBooksDAOImp dao = new FreeBooksDAOImp(DBconnect.getConn());
			List<FreeBooks> list = dao.getAllFreeBooks();
			for (FreeBooks b : list) {
			%>

			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="book1" src="books/<%=b.getPhotoName()%>"
							style="width: 150px; height: 200px; border-radius: 5px"
							class="img-thumblin">
						<p class="name"><%=b.getBookName()%></p>
						<p class="author"><%=b.getAuthor()%></p>
						<p class="cat">
							Category:
							<%=b.getCategory()%></p>
						<div class="col" style="margin-top: 10px">
							<a href="view-pdf.jsp?bid=<%=b.getId()%>"
								class="btn btn-success" style="width: 120px"> <i
								class="fa-solid fa-book-open"></i> Read
							</a>
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