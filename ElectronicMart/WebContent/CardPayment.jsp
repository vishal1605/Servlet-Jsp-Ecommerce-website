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
<title>UPI payment</title>
<script src="https://www.google.com/recaptcha/api.js" async defer></script>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/welcome.css">
<link rel="stylesheet" href="css/all.css">
<style>
.upi-page{
}
</style>
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
		<%
						response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
						response.setHeader("Pragma", "no-cache");
						response.setHeader("Expires", "0");

						EUser u = (EUser) session.getAttribute("currentUser");
						if (u == null) {
							response.sendRedirect("Login.jsp");

						}
						
						double totalValue=(double)session.getAttribute("totalAmount");
						double myTotals = u.getTotal();
						String myAddress=u.getAddress();
						if((myAddress.isBlank()) || (totalValue!=myTotals)){
							response.sendRedirect("Welcome.jsp");
						}
						String email = u.getEmail();
						session.setAttribute("email", email);
						%>
		<div class="text-center">
			<h2>Please enter your card details carefully for order proceed</h2>
		</div>
		<div class="row">
			<div class="col d-flex justify-content-center p-5">
				<%
					PrintWriter out1 = response.getWriter();
					double total = 0;
					int totalItem = 0;
					String userEmail = request.getParameter("cartEmail");
					ShoppingCart dao = new ShoppingCart();
					List<cartItem> list = dao.getAllCart(userEmail);
					%>

				<table class="table table-borderless mt-3 mb-3">

					<tbody>
						<%
							for (cartItem cart : list) {
							%>

						<tr class="">
							<td><img alt="" src="images/<%=cart.getCimage()%>"
								style="Width: 150px; height: auto;"></td>
							<td><%=cart.getCname()%></td>
							<td><%=cart.getCprice()%></td>

						</tr>
						<%
							}
							%>
						<tr class="">
							<td></td>
							<td><b>Total</b></td>
							<td><b><%=u.getTotal()%></b></td>


						</tr>
					</tbody>
				</table>


			</div>

		</div>
		<div class="row">
		<div class="col d-flex justify-content-center mb-5">
		<form action="ConfirmationCard.jsp" style="width:400px; height:auto; border:1px solid black; padding:5px 15px; background-color:#e6e6ff">
  <div class="form-group">
    <label for="inputAddress">Card number</label>
    <input type="text" class="form-control" id="inputAddress" placeholder="1234-567-5489-6214" required>
  </div>
  <div class="form-group">
    <label for="inputAddress2">Recipt name</label>
    <input type="text" class="form-control" id="inputAddress2" placeholder="Rajbahadur Yadav" required>
  </div>
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputCity">Month</label>
      <select id="inputState" class="form-control">
        <option selected>Choose...</option>
        <option>1</option>
        <option>2</option>
        <option>3</option>
        <option>4</option>
        <option>5</option>
        <option>6</option>
        <option>7</option>
        <option>8</option>
        <option>9</option>
        <option>10</option>
        <option>11</option>
        <option>12</option>
        
      </select>
    </div>
    <div class="form-group col-md-4">
      <label for="inputState">Year</label>
      <select id="inputState" class="form-control">
        <option selected>Choose...</option>
        <option>2022</option>
        <option>2023</option>
        <option>2024</option>
        <option>2025</option>
        <option>2026</option>
        <option>2027</option>
        <option>2028</option>
        <option>2029</option>
        <option>2030</option>
        <option>2031</option>
        <option>2032</option>
        <option>2033</option>
        <option>2034</option>
        <option>2035</option>
        <option>2036</option>
        <option>2037</option>
      </select>
    </div>
    <div class="form-group">
      <label for="inputZip">CVV code</label>
      <input type="text" class="form-control" id="inputZip" placeholder="CVV" required>
    </div>
    <div class="form-group">
      <label for="inputZip">Total Amount</label>
      <input value="<%=u.getTotal() %>" class="form-control" id="inputZip" placeholder="CVV" readonly="readonly" style="font-weight:bold;">
    </div>
  </div>
  
  <button type="submit" class="btn btn-primary">Confirm payment</button>
</form>		
</div>
</div>
		<div class="text-center mb-3">
			<button type="button" class="btn btn-primary">
				<a href="Welcome.jsp" style="text-decoration: none; color: white">Order
					cancel</a>
			</button>
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
	<!-- <script type="text/javascript">
        window.history.forward();
        function noBack() {
            window.history.forward();
        }
    </script> -->



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