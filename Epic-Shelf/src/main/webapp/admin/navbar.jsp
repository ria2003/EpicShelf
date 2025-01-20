<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page import="com.entity.User"%>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>


<div class="sticky-navbar" style="box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);">
	<div class="container-fluid p-3 search">
		<div class="row">
			<div class="col-md-3 d-flex align-items-center">
				<img src="../imgs/logo.png" width="200">
			</div>
			<div class="col-md-6 mt-2">
				<h5 class="text-center">Admin Dashboard</h5>
			</div>
			<div class="col-md-3 d-flex align-items-center justify-content-end">
				<c:if test="${not empty userObj }">
					<a href="home.jsp" class="btn btn-dark"
						style="margin-right: 10px;"><i class="fa-solid fa-user"></i>
						${userObj.name}</a>
				</c:if>
				<c:if test="${empty userObj }">
					<a href="../googleLogin.jsp" class="btn btn-dark"
						style="margin-right: 10px;"><i class="fa-solid fa-user"></i>Login</a>
					<a href="../googleLogin.jsp" class="btn btn-dark"
						style="margin-left: 10px;">Register</a>
				</c:if>

			</div>
		</div>
	</div>
</div>





