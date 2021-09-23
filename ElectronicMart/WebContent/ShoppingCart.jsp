<%@ page import="com.ElectronicMart.Bean.cartItem"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="com.ElectronicMart.dao.ShoppingCart"%>
<%@page import="com.ElectronicMart.Bean.EProduct"%>
<%@page import="com.ElectronicMart.dao.ProductDao"%>
<%@page import="com.ElectronicMart.Bean.EUser"%>
<%@page errorPage="Login.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Shopping cart</title>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/welcome.css">
<link rel="stylesheet" href="css/all.css">
</head>
<body>
	<div class="container-fluid">
		<%
		String loggedinMsg = (String) session.getAttribute("already-login");
		if (loggedinMsg != null) {
		%>
		<div id="alert" class="alert alert-danger text-center" role="alert">
			<b><%=loggedinMsg%></b>
		</div>
		<%
		session.removeAttribute("already-login");
		}
		%>
		<div class="nav-bar">
			<div class="row">
				<div class="col-12">
					<div class="header-bar">
						<div class="logo">
							<img src="images/Capture-1.png" alt="">

						</div>
						<div class="search-bar">
							<div class="search">
								<input type="text"
									placeholder="Search for smartphone, laptop..." id="search">

							</div>
							<div class="btn1">
								<button type="submit">
									<i class="fa fa-search"></i>
								</button>

							</div>

						</div>
						<%
						response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
						response.setHeader("Pragma", "no-cache");
						response.setHeader("Expires", "0");

						EUser u = (EUser) session.getAttribute("currentUser");
						if (u == null) {
							response.sendRedirect("Login.jsp");

						}
						String email = u.getEmail();

						ShoppingCart dao = new ShoppingCart();
						List<cartItem> list = dao.getAllCart(email);
						int cartValue=list.size();
						session.setAttribute("cartValue", cartValue);
				
						%>

						<div class="menu-bar">
							<ul id="Menu1">
								<li><a href="Welcome.jsp?category=all">Home</a></li>
								<li><a href="Welcome.jsp?category=all">Catogeries<i class="fa fa-caret-down"></i></a>
									<div class="dropdown-content">
										<ul id="menu2">
											<li><a href="#">smartphones</a></li>
											<li><a href="#">Smartwatchs</a></li>
											<li><a href="#">Headphones</a></li>
											<li><a href="#">Laptops</a></li>
										</ul>
									</div></li>
								<li><a href="#">About us</a></li>
								<li><a href="#">Contact</a></li>
								<li><a href="#"><i class='fa fa-user'>&nbsp;&nbsp;<%=u.getUserName()%></i></a>
									<div class="dropdown-content">
										<ul id="menu2">
											<li><a href="Dashboard.jsp">Dashboard</a></li>
											<li><a href="Orders.jsp">Order History</a></li>
											<li><a href="Logout">Logout</a></li>

										</ul>
									</div></li>
								<li><a href="ShoppingCart.jsp?cartEmail=<%=u.getEmail()%>"><i
										class='fa fa-shopping-cart'></i><sup style="font-size:20px;"><b>(<%=cartValue %>)</b></sup></a></li>

							</ul>
						</div>
						<span class="menu-icon" onclick="menutoggle()"><i
							class="fas fa-bars"></i></span>
					</div>
				</div>
			</div>
		</div>

		<!-- =======================================================CartProduct===================================================== -->
		<%

		String notIncDec = (String) session.getAttribute("notIncDec");
		if (notIncDec != null) {
		%>
		<div id="alert" class="alert alert-danger text-center" role="alert">
			<b><%=notIncDec%></b>
		</div>
		<%
		session.removeAttribute("notIncDec");
		}
		
		String decMsg = (String) session.getAttribute("DecMsg");
		if (decMsg != null) {
		%>
		<div id="alert" class="alert alert-success text-center" role="alert">
			<b><%=decMsg%></b>
		</div>
		<%
		session.removeAttribute("DecMsg");
		}
		
		String incMsg = (String) session.getAttribute("IncMsg");
		if (incMsg != null) {
		%>
		<div id="alert" class="alert alert-success text-center" role="alert">
			<b><%=incMsg%></b>
		</div>
		<%
		session.removeAttribute("IncMsg");
		}
		
		String cartDeleteMsg = (String) session.getAttribute("cartDelete");
		if (cartDeleteMsg != null) {
		%>
		<div id="alert" class="alert alert-success text-center" role="alert">
			<b><%=cartDeleteMsg%></b>
		</div>
		<%
		session.removeAttribute("cartDelete");
		}
		%>
		<div class="ShoppingCart mt-3">
			<div class="row">
				<div class="col-12">
					<%
					PrintWriter out1 = response.getWriter();
					double total = 0;
					int totalItem = 0;
					String msg = "Cart is empty! Please add product";
					boolean ans = list.isEmpty();
					if (ans == true) {
					%>
					<div id="" class="alert alert-danger text-center" role="alert"
						style="margin-bottom: 15px;">
						<b><%=msg%></b>
					</div>

					<%
					request.removeAttribute("msg");
					} else {
					%>
					<table class="table table-borderless mt-3 mb-3">
						<thead>
							<tr class="text-center">
								<th>Product</th>
								<th>Name</th>
								<th>Price</th>
								<th>Quantity</th>
								<th>Subtotal</th>
							</tr>
						</thead>
						<tbody>
							<%
							for (cartItem cart : list) {
							%>

							<tr class="text-center">
								<td><img alt="" src="images/<%=cart.getCimage()%>"
									style="Width: 150px; height: auto;"></td>
								<td><%=cart.getCname()%></td>
								<td><%=cart.getCprice()%></td>
								<td><a href="UpdateCartQuantity?did=<%=cart.getCid()%>&quantity=<%=cart.getCquantity()%>&button=inc&price=<%=cart.getCprice()%>&subTotal=<%=cart.getCsubtotal()%>">
								<i class="fas fa-plus-square"></i></a><span style="padding:0 7px; font-size:20px"><b><%=cart.getCquantity() %></b></span>
								<a href="UpdateCartQuantity?did=<%=cart.getCid()%>&quantity=<%=cart.getCquantity()%>&button=dec&price=<%=cart.getCprice()%>&subTotal=<%=cart.getCsubtotal()%>">
								<i class="fas fa-minus-square"></i></a></td>
								<td><%=cart.getCsubtotal()%></td>
								<td><a href="DeleteCart?did=<%=cart.getCid()%>"><i
										class="fas fa-trash-alt" style="font-size: 25px;"></i></a></td>

							</tr>

							<%
							total = total + cart.getCsubtotal();
							totalItem = totalItem + cart.getCquantity();
							session.setAttribute("totalAmount", total);
							}%>
							<tr class="text-center">
								<th></th>
								<th></th>
								<th></th>
								<th><b>Total quantity&nbsp;:</b>&nbsp;<%=totalItem%></th>
								<th><b>Total&nbsp;:</b>&nbsp;<%=total%></th>
								<th><button class="btn" style="background-color: #0bf7b8;">
										<a href="CheckAddressCondition" style="color: white; text-decoration: none; font-size: 17px;">Checkout</a>
									</button></th>
							</tr>
							<%}
							%>


						</tbody>

					</table>

					<div class="text-center mb-3">
						<button class="btn btn-primary">
							<a href="Welcome.jsp?category=all" style="color: white; text-decoration: none; font-size: 22px;">Continue
								Shopping</a>

						</button>
						
					</div>
				</div>


			</div>

		</div>
		<!-- ==================================================Footer-bar============================================================================= -->


		<div class="footer-bar">
			<div class="row">
				<div class="col-3 p-3 text-center">
					<h3 style="color: white;">Download Our App</h3>
					<p style="color: rgb(27, 20, 20);">Download App for Android and
						ios mobile phone.</p>
					<div class="app-logo">
						<img src="images/play-store.png" alt=""> <img
							src="images/app-store.png" alt="">
					</div>
				</div>
				<div class="col-3 p-3 text-center">
					<img id="img-logo" src="images/Capture-1.png" alt="">
					<p id="logo-para">
						Our purpose is to sustainably make the pleasure <br> and
						benifits of Sports accessible to the many.
					</p>
				</div>
				<div class="col-3 p-3 text-center">
					<h3 style="color: white;">Useful Links</h3>
					<ul>
						<li>Coupons</li>
						<li>Blog Post</li>
						<li>Return Policy</li>
						<li>Join Affiliate</li>
					</ul>
				</div>
				<div class="col-3 p-3 text-center">
					<h3 style="color: white;">Follow us</h3>
					<ul class="icons">
						<li><a href=""><i class="fab fa-facebook-f"></i></a></li>
						<li><a href=""><i class="fab fa-instagram"></i></a></li>
						<li><a href=""><i class="fab fa-twitter"></i></a></li>
						<li><a href=""><i class="fab fa-linkedin-in"></i></a></li>
					</ul>
				</div>
			</div>
		</div>

	</div>

	<!-- =========================================================For Alert message After register=================================================================== -->
	<script type="text/javascript">
		setTimeout(function() {

			// Closing the alert
			$('#alert').alert('close');
		}, 8000);
	</script>


	<!-- ===================================================================Bootstrap js========================================================================================= -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
		crossorigin="anonymous"></script>


</body>
</html>