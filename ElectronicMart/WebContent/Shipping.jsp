<%@ page import="com.ElectronicMart.Bean.cartItem"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="com.ElectronicMart.dao.ShoppingCart"%>
<%@page import="com.ElectronicMart.Bean.EProduct"%>
<%@page import="com.ElectronicMart.dao.ProductDao"%>
<%@page import="com.ElectronicMart.Bean.EUser"%>
<%@page errorPage="Login.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Address</title>
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
						int cartValue=(int)session.getAttribute("cartValue");
						String email = u.getEmail();
						session.setAttribute("email", email);
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

<div class="shipping-page">
     <div class="row">
     <div class="col-12 mt-3 mb-3" style="padding:0 200px;">
     <%
     double totalValue=(double)session.getAttribute("totalAmount");
     %>
     
     <form action="addressRegister" method="post" style="background-color:#e6e6ff; padding:10px">
     <div class="totalAmount">
     <span style="font-size:25px;">Total amount :<b><%=totalValue %></b></span>
     <input type="hidden" class="form-control" value="<%=totalValue %>" name="total">
     </div><br>
     <input type="hidden" value="<%=u.getEmail()%>" class="form-control" name="myEmail">
     <p>Please Enter your address for delivery</p>
  <div class="form-group">
    <label for="inputAddress">Address</label>
    <input type="text" class="form-control" id="inputAddress" name="address" required>
  </div>
  <div class="form-row">
    <div class="form-group col-md-4">
      <label for="inputCity">City</label>
      <input type="text" class="form-control" id="inputCity" name="city" required>
    </div>
    <div class="form-group col-md-4">
      <label for="inputState">State</label>
      <input type="text" class="form-control" id="inputAddress" placeholder="" name="state" required>
    </div>
  </div>
  
  <div class="form-row">
    <div class="form-group col-md-4">
      <label for="inputState">Contact no.</label>
      <input type="text" class="form-control" id="inputAddress" placeholder="" name="contact" required>
    </div>
    <div class="form-group col-md-4">
      <label for="inputZip">Zip code</label>
      <input type="text" class="form-control" id="inputZip" name="zip" required>
    </div>
  </div>
  
  <button type="submit" class="btn btn-primary">Proceed to Checkout</button>
  
</form>
     
     
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