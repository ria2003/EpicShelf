<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page import="com.entity.User"%>
<!-- Bootstrap JS and Popper.js -->
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>




<div class="sticky-navbar"
	style="box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);">
	<div class="container-fluid free-books" id="free">
		<h6 class="pt-1">
			Free e-books!!! <a class="click" href="FreeBooks.jsp">Click
				here</a>
		</h6>
	</div>

	<div class="container-fluid search">
		<div class="row">
			<div class="col-md-3 d-flex align-items-center">
				<img src="imgs/logo.png" width="180">
			</div>
			<div class="col-md-6 d-flex align-items-center">
				<form class="d-flex w-100" action="allBooks.jsp" method="post">
					<input class="form-control me-2" type="search" placeholder="Search" 
						aria-label="Search" name="ch">
					<button class="btn btn-custom" type="submit">
						<i class="fa-solid fa-magnifying-glass"></i> Search
					</button>
				</form>
			</div>

			<c:if test="${not empty userObj }">
				<div class="col-md-3 d-flex align-items-center justify-content-end">
					<div class="dropdown position-static me-4" style="width: 50px">
						<a class="btn btn-custom2 dropdown-toggle" href="#" role="button"
							id="dropdownMenuLink" data-bs-toggle="dropdown"
							aria-expanded="false"> <img src="imgs/profile.png"
							style="width: 32px; height: 32px; border-radius: 50%; object-fit: cover;">
						</a>
						<ul class="dropdown-menu dropdown-menu-end"
							aria-labelledby="dropdownMenuLink">
							<li><h6 class="text-dark text-center">Hello,
									${userObj.name}!</h6></li>
									
							<li><a class="dropdown-item" href="sellBook.jsp"><i
									class="fa-solid fa-book-open-reader"></i> Sell Old Book</a></li>
							<li><a class="dropdown-item" href="soldBooks.jsp"><i
									class="fa-solid fa-book"></i> Sold Books</a></li>
							<li><a class="dropdown-item" href="orders.jsp"><i
									class="fa-solid fa-box-open"></i> Orders </a></li>
							<li><a class="dropdown-item" href="logout"><i
									class="fa-solid fa-arrow-left"></i> Logout</a></li>
						</ul>
					</div>


					<a href="cart.jsp" class="cart"><img src="imgs/cart.png"
						style="width: 32px; height: 32px;"></a>
				</div>
			</c:if>

			<c:if test="${empty userObj }">
				<div class="col-md-3 d-flex align-items-center justify-content-end">
					<a href="googleLogin.jsp" class="btn btn-custom"><i
						class="fa-solid fa-right-to-bracket"></i> Login </a> 
				</div>
			</c:if>



		</div>
	</div>


</div>

<nav class="navbar navbar-expand-lg navbar-dark"
	style="background-color: #198754; z-index: 1">
	<div class="container-fluid">
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="index.jsp"><i
						class="fa-solid fa-house"></i> Home</a></li>
				<li class="nav-item"><a class="nav-link active"
					href="recentBooks.jsp"><i class="fa-solid fa-book-open"></i>
						New Arrivals</a></li>
				<li class="nav-item"><a class="nav-link active"
					href="fictionBooks.jsp"><i class="fa-solid fa-book-open"></i>
						Fiction</a></li>
				<li class="nav-item"><a class="nav-link active"
					href="scienceBooks.jsp"><i class="fa-solid fa-book-open"></i>
						Science</a></li>
				<li class="nav-item"><a class="nav-link active"
					href="biographyBooks.jsp"><i class="fa-solid fa-book-open"></i>
						Biography</a></li>
				<li class="nav-item"><a class="nav-link active"
					href="kidsBooks.jsp"><i class="fa-solid fa-book-open"></i> Kids</a></li>
				<li class="nav-item"><a class="nav-link active"
					href="oldBooks.jsp"><i class="fa-solid fa-book-open"></i> Re-sale</a></li>
			</ul>

			<form class="d-flex ms-auto navbar-buttons">
				<a class="btn btn-light me-2" href="requestBook.jsp" style="width:150px">
					Request a Book
				</a>
			</form>



		</div>
	</div>
</nav>





<script>
	document
			.addEventListener(
					'DOMContentLoaded',
					function() {
						var freeElement = document.getElementById("free");
						if (freeElement) {
							setInterval(
									function() {
										freeElement.style.color = (freeElement.style.color === 'white' || freeElement.style.color === '') ? 'yellow'
												: 'white';
									}, 250);
						}
					});
</script>