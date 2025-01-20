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

<title>Cart</title>
<%@include file="all_components/allCss.jsp"%>
</head>
<body>

	<%@include file="navbar.jsp"%>


	<c:if test="${empty userObj }">
		<c:redirect url="googleLogin.jsp"></c:redirect>
	</c:if>



	<div class="container-fluid mt-2 mb-1">

		<c:if test="${not empty successRemoveMsg}">
			<div class="alert alert-success text-center" role="alert">${successRemoveMsg}</div>
			<c:remove var="successRemoveMsg" scope="session" />
		</c:if>

		<c:if test="${not empty failedRemoveMsg}">
			<div class="alert alert-danger text-center" role="alert">${failedRemoveMsg}</div>
			<c:remove var="failedRemoveMsg" scope="session" />
		</c:if>

		<c:if test="${not empty successOrderMsg}">
			<div class="alert alert-success text-center" role="alert">${successOrderMsg}</div>
			<c:remove var="successOrderMsg" scope="session" />
		</c:if>

		<c:if test="${not empty failedOrderMsg}">
			<div class="alert alert-danger text-center" role="alert">${failedOrderMsg}</div>
			<c:remove var="failedOrderMsg" scope="session" />
		</c:if>




		<div class="row p-2">
			<div class="col-md-7">
				<div class="card bg-white">
					<div class="card-body">

						<input type="hidden" value="${userObj.id}" name="id"> <a
							href="index.jsp" style="text-decoration: none; color: #828282;"><img
							src="imgs/arrow.png" width="20px" style="margin-right: 5px">Continue
							Shopping</a>
						<hr>
						<h5 class=" text-dark">Your Selected Books</h5>
						<hr>
						<table class="table table-striped" style="margin-bottom: 0">
							<thead>
								<th>Book</th>
								<th>Title</th>
								<th>Author</th>
								<th>Quantity</th>
								<th>Price</th>
								<th></th>
							</thead>
							<tbody>

								<%
								User user = (User) session.getAttribute("userObj");

								CartDAOImp dao = new CartDAOImp(DBconnect.getConn());
								List<Cart> cart = dao.getBookByUser(user.getId());
								Double totalPrice = 0.00;
								for (Cart c : cart) {
									totalPrice += c.getSubtotal();
								%>




								<tr>
									<td scope="row" style="width: 50px;"><img
										src="uploads/<%=c.getPhotoName()%> " height="50px"></td>
									<td scope="row"><%=c.getBookName()%></td>
									<td><%=c.getAuthor()%></td>

									<td><input type="number" class="form-control"
										name="quantity" id="quantity_<%=c.getCid()%>"
										value="<%=c.getQuantity()%>" min="1"
										onchange="updateQuantity('<%=c.getCid()%>', this.value)"
										style="width: 60px;"></td>

									<td><span id="price_<%=c.getCid()%>"
										data-price="<%=c.getPrice()%>"><%=c.getPrice()%></span></td>


									<td><a
										href="removeBook?bid=<%=c.getBid()%>&&uid=<%=c.getUid()%>&&cid=<%=c.getCid()%>"
										style="display: flex; align-items: center;"><img
											src="imgs/remove.png" width="20px"></a></td>
								</tr>
								<%
								}
								%>
								<tr>
									<td style="font-weight: 700; font-size: 18px; border: none">Total
									</td>
									<td style="font-weight: 700; font-size: 18px; border: none">Price</td>
									<td style="font-weight: 700; font-size: 18px; border: none"></td>
									<td style="font-weight: 700; font-size: 18px; border: none"></td>
									<td style="font-weight: 700; font-size: 18px; border: none">
										<span id="cartTotal"><%=totalPrice%></span> <i
										class="fa-solid fa-indian-rupee-sign"></i>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>


			<div class="col-md-5">
				<div class="card">
					<div class="card-body">
						<h5 class="text-center text-dark">Shipping Details</h5>
						<hr>
						<form action="orders" method="post" class="row g-3" id="orderForm">
							<input type="hidden" value="${userObj.id }" name="id"> <input
								type="hidden" name="razorpay_payment_id" value=""> <input
								type="hidden" name="razorpay_order_id" value=""> <input
								type="hidden" name="razorpay_signature" value="">

							<div class="col-md-6">
								<label for="name" class="form-label">Name</label> <input
									type="text" class="form-control" id="name"
									value="${userObj.name }" name="name" required
									readonly="readonly">
							</div>
							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Email</label> <input
									type="email" class="form-control" id="inputEmail4" name="email"
									value="${userObj.email }" required readonly="readonly">
							</div>
							<div class="col-6">
								<label for="mob" class="form-label">Mobile No</label> <input
									type="number" class="form-control" id="mob" name="contact"
									required>
							</div>
							<div class="col-6">
								<label for="inputAddress2" class="form-label">Address</label> <input
									type="text" class="form-control" name="address" required
									id="inputAddress2">
							</div>
							<div class="col-6">
								<label for="landmark" class="form-label">Landmark</label> <input
									type="text" class="form-control" required name="landmark"
									id="landmark">
							</div>
							<div class="col-md-6">
								<label for="inputCity" class="form-label">City</label> <input
									type="text" class="form-control" required name="city"
									id="inputCity">
							</div>
							<div class="col-md-6">
								<label for="inputState" class="form-label">State</label> <input
									type="text" class="form-control" required name="state"
									id="inputState">
							</div>
							<div class="col-md-6">
								<label for="inputZip" class="form-label">Zip</label> <input
									type="text" class="form-control" required name="pincode"
									id="inputZip">
							</div>
							<div class="col-md-12">
								<label for="inputPay" class="form-label">Payment Type</label> <select
									id="inputPay" class="form-select" name="payment">
									<option value="selected" selected>Choose...</option>
									<option value="cod">Cash On Delivery</option>
									<option value="online">Online</option>
								</select>
							</div>



							<div class="text-center">
								<button type="submit" class="btn btn-warning"
									style="width: 200px; margin-right: 5px;">Order Now</button>
								<a href="index.jsp" class="btn btn-success"
									style="width: 200px; margin-left: 5px;">Continue Shopping</a>
								
							</div>
						</form>
						
						
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	
	<script src="https://checkout.razorpay.com/v1/checkout.js"></script>
	
	<script>
		function updateQuantity(cartId, quantity) {
			const priceElement = $("#price_" + cartId);
			const basePrice = parseFloat(priceElement.data('price'));
			const totalPrice = basePrice * quantity;

			$.ajax({
				url : 'updateCartQuantity',
				method : 'POST',
				data : {
					cartId : cartId,
					quantity : quantity,
					price : basePrice
				},
				success : function(response) {
					if (response === 'success') {
						priceElement.text(totalPrice.toFixed(2));
						updateCartTotal();
					}
				}
			});
		}

		function updateCartTotal() {
			let total = 0;
			$("input[name='quantity']").each(function() {
				const cartId = $(this).attr("id").split("_")[1];
				const quantity = parseInt($(this).val());
				const price = parseFloat($("#price_" + cartId).data('price'));
				total += price * quantity;
			});
			$("#cartTotal").text(total.toFixed(2));
		}
		
		
		// Handle form submission
	    document.getElementById('orderForm').addEventListener('submit', function(e) {
	        e.preventDefault();
	        
	        const formData = new FormData(this);
	        const paymentMethod = formData.get('payment');
	        
	        if (paymentMethod === 'selected') {
	            alert('Please select a payment method');
	            return;
	        }
	        
	        if (paymentMethod === 'online') {
	            initializeRazorpayPayment();
	        } else {
	            this.submit(); // Submit form normally for COD
	        }
	    });

	    function initializeRazorpayPayment() {
	        const cartTotal = parseFloat(document.getElementById('cartTotal').textContent) * 100;
	        const contactNumber = document.getElementById('mob').value;
	        const userName = document.getElementById('name').value;
	        const userEmail = document.getElementById('inputEmail4').value;

	        fetch('OrderCreation', {
	            method: 'GET'
	        })
	        .then(response => response.text())
	        .then(orderId => {
	            const options = {
	                key: 'rzp_test_7SrJ2IWTH0c0Iz',
	                amount: cartTotal,
	                currency: 'INR',
	                name: 'EpicShelf',
	                description: 'Book Purchase',
	                order_id: orderId,
	                prefill: {
	                    name: userName,
	                    email: userEmail,
	                    contact: contactNumber
	                },
	                handler: function(response) {
	                    document.querySelector('input[name="razorpay_payment_id"]').value = response.razorpay_payment_id;
	                    document.querySelector('input[name="razorpay_order_id"]').value = response.razorpay_order_id;
	                    document.querySelector('input[name="razorpay_signature"]').value = response.razorpay_signature;
	                    document.getElementById('orderForm').submit();
	                },
	                theme: {
	                    color: '#3399cc'
	                }
	            };
	            
	            const rzp = new Razorpay(options);
	            rzp.on('payment.failed', function(response) {
	                alert('Payment failed. Please try again.');
	                console.error('Payment failed:', response.error);
	            });
	            rzp.open();
	        })
	        .catch(error => {
	            console.error('Error:', error);
	            alert('Payment initialization failed. Please try again.');
	        });
	    }
		
		
	</script>


</body>

<%@include file="footer.jsp"%>
</html>