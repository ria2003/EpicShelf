<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Reset Password</title>
<%@include file="all_components/allCss.jsp"%>
<style>
    .img {
        background: url("imgs/loginbg.jpg");
        width: 100%;
        background-repeat: no-repeat;
        background-size: cover;
        position: relative;
    }
    
    .card {
        background-color: white;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }
    
    .reg {
	color: #1c1c54;
	font-size: 14px;
	font-weight: bold;
	text-decoration: none;
}

.reg:hover {
	text-decoration: underline;
	cursor: pointer;
	color: #1c1c54
}
    
</style>
</head>
<body>
    <%@include file="navbar.jsp"%>
    <div class="img">
        <div class="container d-flex justify-content-center align-items-start"
            style="min-height: 70vh; padding: 45px">
            <div class="card"
                style="width: 100%; max-width: 420px; padding: 20px">
                <div class="card-body">
                    <h4 class="text-center">Reset Password</h4>
                    
                    <c:if test="${not empty failedMsg}">
                        <p class="text-center text-danger">${failedMsg}</p>
                        <c:remove var="failedMsg" scope="session"/>
                    </c:if>
                    
                    <c:if test="${not empty successMsg}">
                        <p class="text-center text-success">${successMsg}</p>
                        <c:remove var="successMsg" scope="session"/>
                    </c:if>
                    
                    <form action="resetPassword" method="post">
                        <div class="mb-3">
                            <label for="email" class="form-label">Email address</label>
                            <input type="email" class="form-control" id="email" 
                                   name="email" required>
                        </div>
                        
                        <div class="mb-3">
                            <label for="password" class="form-label">New Password</label>
                            <input type="password" class="form-control" id="password" 
                                   name="password" required>
                        </div>
                        
                        <div class="d-grid gap-2">
                            <button type="submit" class="btn btn-success">
                                Reset Password
                            </button>
                            <a href="login.jsp" class="reg text-center">Back to Login</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    
    <%@include file="footer.jsp"%>
</body>
</html>