<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
    <meta name="google-signin-scope" content="profile email">
    <meta name="google-signin-client_id" content="509453706533-08pvfk6tuj8e0glonotab0l910h03sqf.apps.googleusercontent.com">
    <script src="https://accounts.google.com/gsi/client" async defer></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
    <title>Login</title>
    <%@include file="all_components/allCss.jsp"%>
    <style>
        body {
            background: url('imgs/loginbg.jpg') no-repeat center center fixed;
            background-size: cover;
            min-height: 100vh;
            position: relative;
        }
        
        .login-container {
            max-width: 400px;
            margin: 50px auto;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
            background-color: rgba(255, 255, 255, 1);
            backdrop-filter: blur(5px);
        }
        
        .login-header {
            text-align: center;
        }
        
        .login-header h2 {
            color: #333;
            font-family: 'Poppins', sans-serif;
            font-weight: 600;
            margin-bottom: 10px;
        }
        
        .login-header p {
            color: #666;
            font-size: 16px;
        }
        
        .google-btn-wrapper {
            display: flex;
            justify-content: center;
            margin: 20px;
        }
        
        .divider {
            text-align: center;
            margin: 20px 0;
            position: relative;
        }
        
        .divider::before {
            content: "";
            position: absolute;
            top: 50%;
            left: 0;
            right: 0;
            height: 1px;
            background-color: #e0e0e0;
            z-index: 1;
        }
        
        .container {
            min-height: calc(100vh - 140px);
            display: flex;
            align-items: center;
        }

        .signup-text {
            text-align: center;
            margin-top: 15px;
            padding-top: 15px;
            border-top: 1px solid #e0e0e0;
        }

        .signup-text p {
            color: #666;
            font-size: 14px;
            margin-bottom: 0;
        }

        .signup-text a {
            color: #4285f4;
            text-decoration: none;
            font-weight: 500;
        }

        .signup-text a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <%@include file="navbar.jsp"%>
    
    <div class="container">
        <div class="login-container">
            <div class="login-header">
                <h2>Welcome Back!</h2>
                <p>Please sign in to continue</p>
            </div>
            
            <div class="google-btn-wrapper">
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
            
            <div class="divider"></div>
            
            <div class="text-center mt-4">
                <p class="text-muted" style="margin-block-end:0px; font-size:14px">
                    By signing in, you agree to our Terms of Service and Privacy Policy
                </p>
            </div>

            <div class="signup-text">
                <p>Don't have an account? <a href="https://accounts.google.com/signup" target="_blank">Create one</a></p>
            </div>
        </div>
    </div>

    <script>
        function handleCredentialResponse(response) {
            var xhr = new XMLHttpRequest();
            xhr.open('POST', 'googleLogin');
            xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
            xhr.onload = function() {
                if (xhr.status === 200) {
                    try {
                        var responseData = JSON.parse(xhr.responseText);
                        if (responseData.redirect) {
                            window.location.href = responseData.redirect;
                        }
                    } catch (e) {
                        console.error('Error parsing response:', e);
                    }
                } else {
                    console.error('Google Sign-In failed');
                }
            };
            xhr.send('idtoken=' + response.credential);
        }
    </script>

    <div style="margin-bottom: 0px; padding-bottom: 0px;">
        <%@include file="footer.jsp"%>
    </div>
</body>
</html>