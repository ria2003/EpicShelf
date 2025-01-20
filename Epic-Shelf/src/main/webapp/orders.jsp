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
	
<style>
    .table {
        margin-bottom: 0;
        white-space: nowrap;
    }
    
    .table td {
        max-width: 200px;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
    }
    
    .table thead th {
        background-color: #343a40;
        color: white;
        font-weight: 500;
        padding: 12px 8px;
    }
    
    .table tbody td {
        padding: 12px 8px;
        vertical-align: middle;
    }
    
    .container-fluid {
        max-width: 98%;
        margin: 0 auto;
    }
    
    h5 {
        font-weight: 600;
        color: #343a40;
        margin: 20px 0;
    }
    
    .img-fluid {
        object-fit: contain;
        height: auto;
    }
</style>

<title>Orders</title>
<%@include file="all_components/allCss.jsp"%>
</head>
<body>

	<c:if test="${empty userObj }" >
		<c:redirect url="googleLogin.jsp"></c:redirect>
	</c:if>

	<%@include file="navbar.jsp"%>

	<div class="container-fluid px-4">
    <h5 class="text-center my-4">Your Orders</h5>
    <div class="table-responsive">
        <table class="table table-striped mt-2">
            <thead class="bg-dark text-light">
                <tr class="text-nowrap">
                    <th scope="col" style="width: 5%">Book</th>
                    <th scope="col" style="width: 15%">Title</th>
                    <th scope="col" style="width: 15%">Author</th>
                    <th scope="col" style="width: 25%">Address</th>
                    <th scope="col" style="width: 10%">Contact</th>
                    <th scope="col" style="width: 10%">Quantity</th>
                    <th scope="col" style="width: 10%">Sub-total</th>
                    <th scope="col" style="width: 10%">Total</th>
                </tr>
            </thead>
            <tbody>
                <%
                User u = (User) session.getAttribute("userObj");
                OrderDAOImp dao1 = new OrderDAOImp(DBconnect.getConn());
                List<Orders> blist = dao1.getBook(u.getEmail());
                for (Orders o : blist) {
                %>
                <tr>
                    <td><img src="uploads/<%=o.getPhotoName()%>" class="img-fluid" style="max-width: 50px;"></td>
                    <td class="align-middle"><%=o.getTitle()%></td>
                    <td class="align-middle"><%=o.getAuthor()%></td>
                    <td class="align-middle"><%=o.getFullAdd()%></td>
                    <td class="align-middle"><%=o.getContact()%></td>
                    <td class="align-middle"><%=o.getQuantity()%></td>
                    <td class="align-middle"><%=o.getSubtotal()%> <i class="fa-solid fa-indian-rupee-sign"></i></td>
                    <td class="align-middle"><%=o.getPrice()%> <i class="fa-solid fa-indian-rupee-sign"></i></td>
                </tr>
                <%
                }
                %>
            </tbody>
        </table>
    </div>
</div>



</body>
</html>