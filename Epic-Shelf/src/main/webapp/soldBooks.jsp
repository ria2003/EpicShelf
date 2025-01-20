<%@page import="com.entity.Books"%>
<%@page import="com.DAO.BooksDAOImp"%>
<%@page import="com.entity.Cart"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBconnect"%>
<%@page import="com.DAO.CartDAOImp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page import="com.entity.User"%>
<%@ page import="com.entity.BookDetails"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

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

<title>Sold Books</title>
<%@include file="all_components/allCss.jsp"%>

<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	width: 100%;
	overflow-x: hidden;
	font-family: "Poppins", serif;
	min-height: 100vh;
	display: flex;
	flex-direction: column;
}

main {
	flex: 1 0 auto;
}

footer {
	margin-top: auto;
}
</style>
</head>
<body>
	<%@include file="navbar.jsp"%>

	<c:if test="${not empty successMsg}">
		<div class="alert alert-success" role="alert">${successMsg}</div>
		<c:remove var="successMsg" scope="session" />
	</c:if>

	<c:if test="${not empty failedMsg}">
		<div class="alert alert-danger" role="alert">${failedMsg}</div>
		<c:remove var="failedMsg" scope="session" />
	</c:if>


	<main>
		<div class="container" style="margin-top: 20px; margin-bottom: 20px">
			<h5 class="text-center mb-4">Sold Books</h5>

			<div class="table-responsive">
				<table class="table table-striped">
					<thead class="bg-dark text-light">
						<tr>
							<th scope="col">Book</th>
							<th scope="col">Title</th>
							<th scope="col">Author</th>
							<th scope="col">Price</th>
							<th scope="col">Delete</th>
						</tr>
					</thead>
					<tbody>

						<%
						User u = (User) session.getAttribute("userObj");
						String email = u.getEmail();
						BooksDAOImp dao = new BooksDAOImp(DBconnect.getConn());
						List<Books> list = dao.getSoldBooks(email, "Old");
						for (Books b : list) {
						%>
						<tr>
							<th><img src="uploads/<%=b.getCover()%>" width="40px"></th>
							<td><%=b.getTitle()%></td>
							<td><%=b.getAuthor()%></td>
							
							<td><%=b.getPrice()%></td>
							<td><a
								href="deleteSoldBook?em=<%=b.getEmail()%>&&id=<%=b.getBookId()%>"
								style="display: flex; align-items: center;"><img
									src="imgs/remove.png" width="20px"></a></td>

						</tr>

						<%
						}
						%>
					</tbody>
				</table>
			</div>
		</div>
	</main>

	<%@include file="footer.jsp"%>

</body>
</html>