<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id"
	content="509453706533-08pvfk6tuj8e0glonotab0l910h03sqf.apps.googleusercontent.com">
<script src="https://accounts.google.com/gsi/client" async defer></script>

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

<title>Login</title>
<%@include file="all_components/allCss.jsp"%>
<style>
.img {
	background: url("imgs/loginbg.jpg");
	width: 100%;
	background-repeat: no-repeat;
	background-size: cover;
	position: relative;
}

.reg {
	color: #1c1c54;
	font-size: 14px;
	font-weight: bold;
	text-decoration: none
}

.reg:hover {
	text-decoration: underline;
	cursor: pointer;
	color: #1c1c54
}

.footer {
	
}
</style>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<div class="img">

		<div class="container d-flex justify-content-center align-items-start"
			style="min-height: 70vh; padding: 45px">
			<div class="card"
				style="width: 100%; max-width: 420px; padding-left: 10px; padding-right: 5px">
				<div class="card-body">
					<form action="login" method="post">
						<h5 class="text-center mb-3">Login Here</h5>

						<c:if test="${not empty failedMsg }">
							<h6 class="text-center text-danger">${failedMsg}</h6>
							<c:remove var="failedMsg" scope="session" />
						</c:if>

						<c:if test="${not empty successMsg }">
							<h6 class="text-center text-success">${successMsg}</h6>
							<c:remove var="successMsg" scope="session" />
						</c:if>

						<div class="mb-3">
							<label for="email" class="form-label">Email Address</label> <input
								type="email" class="form-control" id="email" required="required"
								name="email">
						</div>

						<div class="mb-3">
							<label for="password" class="form-label">Password</label> <input
								type="password" class="form-control" id="password"
								required="required" name="password">
						</div>

						<div class="d-grid">
							<button type="submit" class="btn btn-success">Submit</button>
						</div>
						
						<div class="mt-3 d-flex justify-content-center">
                            <div id="g_id_onload"
                                data-client_id="509453706533-08pvfk6tuj8e0glonotab0l910h03sqf.apps.googleusercontent.com"
                                data-callback="handleCredentialResponse">
                            </div>
                            <div class="g_id_signin"
                                data-type="standard"
                                data-size="large"
                                data-theme="outline"
                                data-text="sign_in_with"
                                data-shape="rectangular"
                                data-logo_alignment="left">
                            </div>
                        </div>


						<div class="mt-3 text-center">
							<a href="register.jsp" class="reg">Click here to Register</a> <br>
							<a href="ForgotPassword.jsp" class="reg">Forgot Password?</a>
						</div>
					</form>
				</div>
			</div>
		</div>


	</div>


	<div style="margin-bottom: 0px; padding-bottom: 0px;">
		<%@include file="footer.jsp"%>
	</div>

	<script>
    function handleCredentialResponse(response) {
        // Send the token to your server
        var xhr = new XMLHttpRequest();
        xhr.open('POST', 'googleLogin');
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        xhr.onload = function() {
            if (xhr.status === 200) {
                window.location.href = 'index.jsp';
            } else {
                console.error('Google Sign-In failed');
            }
        };
        xhr.send('idtoken=' + response.credential);
    }
    </script>


</body>
</html>