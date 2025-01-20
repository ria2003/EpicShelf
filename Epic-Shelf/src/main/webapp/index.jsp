<%@page import="com.entity.Books"%>
<%@page import="com.DAO.BooksDAOImp"%>
<%@page import="com.entity.User"%>
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

.back-img {
	background: url("imgs/b.png");
	height: 40vh;
	width: 100%;
	background-repeat: no-repeat;
	background-size: cover;
	position: relative;
	top: 3px;
}

.back-img::before {
	content: "";
	position: absolute;
	top: 0;
	left: 0;
	height: 100%;
	width: 100%;
	background-color: rgba(0, 0, 0, 0.5);
	z-index: 1;
}

.quote {
	color: white;
	position: absolute;
	z-index: 2;
	top: 30%;
	padding: 10px 20px;
	left: 50%;
	transform: translateX(-50%);
	font-family: "Charm", cursive;
	font-weight: 700;
	font-style: normal;
	font-size: 44px;
	top: 30%;
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

.carousel-custom .carousel-inner {
	display: flex;
	overflow: hidden;
}

.carousel-custom .carousel-item {
	display: flex;
	width: 100%;
	gap: 20px;
	justify-content: space-between;
	position: relative;
	transition: opacity 0.6s ease-in-out;
}

.carousel-custom .carousel-item.fade {
	opacity: 0;
}

.carousel-custom .carousel-item.active {
	opacity: 1;
}

.carousel-custom .image-container {
	flex: 0 0 calc(16.666% - 20px);
	text-align: center;
	margin-bottom: 20px;
	position: relative;
}

.carousel-custom .image-container img {
	width: 100%;
	height: 160px;
	object-fit: cover;
	margin-bottom: 10px;
	border-radius: 50%;
}

.carousel-custom .carousel-control-prev, .carousel-custom .carousel-control-next
	{
	position: absolute;
	top: 40%;
	transform: translateY(-50%);
	width: 40px;
	height: 40px;
	background-color: rgba(0, 0, 0, 0.5);
	border-radius: 50%;
	z-index: 10;
}

.carousel-custom .carousel-control-prev {
	left: 10px;
}

.carousel-custom .carousel-control-next {
	right: 10px;
}
/* toast */
#toast {
	min-width: 300px;
	position: fixed;
	bottom: 30px;
	left: 50%;
	margin-left: -125px;
	background: #333;
	padding: 10px;
	color: white;
	text-align: center;
	z-index: 1;
	font-size: 18px;
	visibility: hidden;
	box-shadow: 0px 0px 100px #000;
}

#toast.display {
	visibility: visible;
	animation: fadeIn 0.5, fadeOut 0.5s 2.5s;
}

@
keyframes fadeIn {from { bottom:0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@
keyframes fadeOut {form { bottom:30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}
}
/* toast */
</style>
</head>

<body>



	<%@include file="navbar.jsp"%>

	<%
	User u = (User) session.getAttribute("userObj");
	%>
	
	<c:if test="${not empty addCart }">
		<div id="toast">${addCart}</div>

		<script type="text/javascript">
		showToast();
		function showToast(content) {
		    const toast = document.getElementById("toast");
		    toast.classList.add("display");
		    toast.innerHTML = "${addCart}"; // Use the content dynamically
		    setTimeout(() => {
		        toast.classList.remove("display");
		    }, 2000);
		}

		</script>
		
		<c:remove var="addCart" scope="session"/>
	</c:if>

	<div class="container-fluid back-img">
		<p class="text-center quote">Epic tales, infinite possibilities!</p>
	</div>

	<!-- Start Recent Books -->

	<div class="container">
		<h5 class="text-center" style="margin: 30px">New Arrivals</h5>
		<div class="row g-5">

			<%
			BooksDAOImp dao1 = new BooksDAOImp(DBconnect.getConn());
			List<Books> list1 = dao1.getRecentBook();
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
							<a href="googleLogin.jsp" class="btn btn-danger btn-sm ml-2"
								style="width: 60px"><i class="fa-solid fa-cart-plus"></i></a>
							<%
							} else {
							%>
							<a href="cart?bid=<%=b.getBookId() %>&&uid=<%=u.getId() %>"
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

			<div class="text-center">
				<a href="recentBooks.jsp" class="btn btn-success btn-sm btn-view"
					style="width: 100px">View All</a>
			</div>
		</div>
	</div>

	<!-- End Recent Books -->

	<hr>

	<!-- Start Fiction -->

	<div class="container">
		<h5 class="text-center" style="margin: 30px">Fiction</h5>
		<div class="row g-5">

			<%
			BooksDAOImp dao2 = new BooksDAOImp(DBconnect.getConn());
			List<Books> list2 = dao2.getFictionBook();
			for (Books b : list2) {
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
							<a href="googleLogin.jsp" class="btn btn-danger btn-sm ml-2" style="width: 60px"><i
								class="fa-solid fa-cart-plus"></i></a> 
								
							<%
							} else {
							%>
							<a href="cart?bid=<%=b.getBookId() %>&&uid=<%=u.getId() %>"
								class="btn btn-danger btn-sm ml-2" style="width: 60px"><i
								class="fa-solid fa-cart-plus"></i></a>
							<%
							}
							%>
							
							<a
								href="viewBooks.jsp?bid=<%=b.getBookId()%>"
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

			<div class="text-center">
				<a href="fictionBooks.jsp" class="btn btn-success btn-sm btn-view"
					style="width: 100px">View All</a>
			</div>
		</div>
	</div>

	<!-- End Fiction -->

	<hr>

	<!-- Start Science -->

	<div class="container">
		<h5 class="text-center" style="margin: 30px">Science</h5>
		<div class="row g-5">

			<%
			BooksDAOImp dao3 = new BooksDAOImp(DBconnect.getConn());
			List<Books> list3 = dao3.getScienceBook();
			for (Books b : list3) {
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
							<a href="googleLogin.jsp" class="btn btn-danger btn-sm ml-2" style="width: 60px"><i
								class="fa-solid fa-cart-plus"></i></a> 
								
							<%
							} else {
							%>
							<a href="cart?bid=<%=b.getBookId() %>&&uid=<%=u.getId() %>"
								class="btn btn-danger btn-sm ml-2" style="width: 60px"><i
								class="fa-solid fa-cart-plus"></i></a>
							<%
							}
							%>
							 <a
								href="viewBooks.jsp?bid=<%=b.getBookId()%>"
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

			<div class="text-center">
				<a href="scienceBooks.jsp" class="btn btn-success btn-sm btn-view"
					style="width: 100px">View All</a>
			</div>
		</div>
	</div>

	<!-- End Science -->

	<hr>

	<!-- Start Biography -->

	<div class="container">
		<h5 class="text-center" style="margin: 30px">Biography</h5>
		<div class="row g-5">

			<%
			BooksDAOImp dao4 = new BooksDAOImp(DBconnect.getConn());
			List<Books> list4 = dao4.getBiographyBook();
			for (Books b : list4) {
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
							<a href="googleLogin.jsp" class="btn btn-danger btn-sm ml-2" style="width: 60px"><i
								class="fa-solid fa-cart-plus"></i></a> 
								
							<%
							} else {
							%>
							<a href="cart?bid=<%=b.getBookId() %>&&uid=<%=u.getId() %>"
								class="btn btn-danger btn-sm ml-2" style="width: 60px"><i
								class="fa-solid fa-cart-plus"></i></a>
							<%
							}
							%>
							 <a
								href="viewBooks.jsp?bid=<%=b.getBookId()%>"
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

			<div class="text-center">
				<a href="biographyBooks.jsp" class="btn btn-success btn-sm btn-view"
					style="width: 100px">View All</a>
			</div>
		</div>
	</div>

	<!-- End Biography -->

	<hr>

	<!-- Start Kids -->

	<div class="container">
		<h5 class="text-center" style="margin: 30px">Kids</h5>
		<div class="row g-5">

			<%
			BooksDAOImp dao5 = new BooksDAOImp(DBconnect.getConn());
			List<Books> list5 = dao5.getKidsBook();
			for (Books b : list5) {
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
							<a href="googleLogin.jsp" class="btn btn-danger btn-sm ml-2" style="width: 60px"><i
								class="fa-solid fa-cart-plus"></i></a> 
								
							<%
							} else {
							%>
							<a href="cart?bid=<%=b.getBookId() %>&&uid=<%=u.getId() %>"
								class="btn btn-danger btn-sm ml-2" style="width: 60px"><i
								class="fa-solid fa-cart-plus"></i></a>
							<%
							}
							%>
							 <a
								href="viewBooks.jsp?bid=<%=b.getBookId()%>"
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

			<div class="text-center">
				<a href="kidsBooks.jsp" class="btn btn-success btn-sm btn-view"
					style="width: 100px">View All</a>
			</div>
		</div>
	</div>

	<!-- End Kids -->

	<hr>

	<!-- Start Old Books -->

	<div class="container">
		<h5 class="text-center" style="margin: 30px">Old Books</h5>
		<div class="row g-5">


			<%
			BooksDAOImp dao6 = new BooksDAOImp(DBconnect.getConn());
			List<Books> list6 = dao6.getOldBook();
			for (Books b : list6) {
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
							<a href="googleLogin.jsp" class="btn btn-danger btn-sm ml-2" style="width: 60px"><i
								class="fa-solid fa-cart-plus"></i></a> 
								
							<%
							} else {
							%>
							<a href="cart?bid=<%=b.getBookId() %>&&uid=<%=u.getId() %>"
								class="btn btn-danger btn-sm ml-2" style="width: 60px"><i
								class="fa-solid fa-cart-plus"></i></a>
							<%
							}
							%>
							<a href="viewBooks.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ml-1" style="width: 70px"><i
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


			<div class="text-center">
				<a href="oldBooks.jsp" class="btn btn-success btn-sm btn-view"
					style="width: 100px">View All</a>
			</div>
		</div>
	</div>

	<!-- End Old Books -->

	<hr>

	<div class="container mt-1"
		style="background-color: white; padding: 1px 40px; margin-bottom: 20px">

		<h5 class="text-center" style="margin: 25px">Featured Authors</h5>

		<div id="imageCarousel"
			class="carousel carousel-custom slide carousel-fade"
			data-bs-ride="carousel" data-bs-interval="2000">
			<div class="carousel-inner">
				<!-- First Slide (First 6 Images) -->
				<div class="carousel-item active">
					<div class="image-container">
						<img src="authors/alicewalker.png" alt="Image 1">
						<p>Alice Walker</p>
						<button class="carousel-control-prev" type="button"
							data-bs-target="#imageCarousel" data-bs-slide="prev">
							<span class="carousel-control-prev-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Previous</span>
						</button>
					</div>
					<div class="image-container">
						<img src="authors/alifshafak.png" alt="Image 2">
						<p>Elif Shafak</p>
					</div>
					<div class="image-container">
						<img src="authors/brianevenson.png" alt="Image 3">
						<p>Brian Evenson</p>
					</div>
					<div class="image-container">
						<img src="authors/jerryjenkins.png" alt="Image 4">
						<p>Jerry Jenkins</p>
					</div>
					<div class="image-container">
						<img src="authors/jkrowling.png" alt="Image 5">
						<p>JK Rowling</p>
					</div>
					<div class="image-container">
						<img src="authors/rachelkushner.png" alt="Image 11">
						<p>Rachel Kushner</p>
						<button class="carousel-control-next" type="button"
							data-bs-target="#imageCarousel" data-bs-slide="next">
							<span class="carousel-control-next-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Next</span>
						</button>
					</div>
				</div>

				<!-- Second Slide (Next 6 Images) -->
				<div class="carousel-item">
					<div class="image-container">
						<img src="authors/kazuoishiguro.png" alt="Image 7">
						<p>Kazuo Ishiguro</p>
						<button class="carousel-control-prev" type="button"
							data-bs-target="#imageCarousel" data-bs-slide="prev">
							<span class="carousel-control-prev-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Previous</span>
						</button>
					</div>
					<div class="image-container">
						<img src="authors/khaledhossieni.png" alt="Image 8">
						<p>Khaled Hossieni</p>
					</div>
					<div class="image-container">
						<img src="authors/marilynnerobinson.png" alt="Image 9">
						<p>Marilynne Robinson</p>
					</div>
					<div class="image-container">
						<img src="authors/michaelchabon.png" alt="Image 10">
						<p>Michael Chabon</p>
					</div>
					<div class="image-container">
						<img src="authors/rachelkushner.png" alt="Image 11">
						<p>Rachel Kushner</p>
					</div>
					<div class="image-container">
						<img src="authors/stephenking.png" alt="Image 12">
						<p>Stephen King</p>
						<button class="carousel-control-next" type="button"
							data-bs-target="#imageCarousel" data-bs-slide="next">
							<span class="carousel-control-next-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Next</span>
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>


	<%@include file="footer.jsp"%>
</body>
</html>