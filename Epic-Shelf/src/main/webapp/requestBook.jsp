<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Request a Book</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <%@include file="all_components/allCss.jsp"%>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            width: 100%;
            font-family: "Poppins", sans-serif;
            min-height: 100vh;
            background: url("imgs/admin.jpg");
            background-repeat: no-repeat;
            background-size: cover;
            overflow-x: hidden;
        }
        .main-content {
            min-height: calc(100vh - 140px);
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 40px 20px;
        }
        .card {
            width: 100%;
            max-width: 420px;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
            border: none;
            border-radius: 10px;
            margin: 0 auto;
            background: rgba(255, 255, 255, 0.95);
        }
        .form-label {
            font-weight: 500;
            color: #333;
        }
        .btn-primary {
            background-color: #198754;
            border: none;
            padding: 10px;
            font-weight: 500;
        }
        .btn-primary:hover {
            background-color: #146c43;
        }
        .success-message {
            color: #198754;
            text-align: center;
            margin-bottom: 15px;
        }
        .error-message {
            color: #dc3545;
            text-align: center;
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
    <%@include file="navbar.jsp"%>
    
    <div class="main-content">
        <div class="container">
            <div class="card">
                <div class="card-body p-4">
                    <form action="request_book" method="post">
                        <h4 class="text-center mb-4">Request a Book</h4>
                        
                        <c:if test="${not empty successMsg}">
                            <div class="success-message">
                                ${successMsg}
                                <c:remove var="successMsg" scope="session" />
                            </div>
                        </c:if>
                        
                        <c:if test="${not empty failedMsg}">
                            <div class="error-message">
                                ${failedMsg}
                                <c:remove var="failedMsg" scope="session" />
                            </div>
                        </c:if>

                        <div class="mb-3">
                            <label for="bookTitle" class="form-label">Book Title*</label>
                            <input type="text" class="form-control" id="bookTitle" name="bookTitle" required>
                        </div>

                        <div class="mb-3">
                            <label for="author" class="form-label">Author Name*</label>
                            <input type="text" class="form-control" id="author" name="author" required>
                        </div>

                        <div class="mb-3">
                            <label for="quantity" class="form-label">Quantity*</label>
                            <input type="number" class="form-control" id="quantity" name="quantity" min="1" required>
                        </div>

                        <div class="mb-3">
                            <label for="email" class="form-label">Email Address*</label>
                            <input type="email" class="form-control" id="email" name="email" required>
                        </div>

                        <div class="mb-4">
                            <label for="contact" class="form-label">Contact Number*</label>
                            <input type="tel" class="form-control" id="contact" name="contact" required>
                        </div>

                        <div class="mb-3">
                            <label for="additionalNotes" class="form-label">Additional Notes</label>
                            <textarea class="form-control" id="additionalNotes" name="additionalNotes" rows="3"></textarea>
                        </div>

                        <div class="d-grid">
                            <button type="submit" class="btn btn-primary">Submit Request</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <%@include file="footer.jsp"%>
</body>
</html>