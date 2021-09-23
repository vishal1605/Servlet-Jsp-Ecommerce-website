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
<title>Cash on delivery</title>
<script src="https://www.google.com/recaptcha/api.js" async defer></script>
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
			<h2><i class="fas fa-check-square" Style="background-color:white; color:green;"></i>&nbsp;Your Order has been placed</h2>
			<h4>Payment : Cash on delivery</h4>
			<h4>Total amount to pay : <%=u.getTotal() %></h4>
		</div>
		<div class="row">
			<div class="col d-flex justify-content-center p-5">
				<%
					PrintWriter out1 = response.getWriter();
					double total = 0;
					int totalItem = 0;
					ShoppingCart dao = new ShoppingCart();
					List<cartItem> list = dao.getAllCart(email);
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
		<div class="text-center mb-3">
		<h4>Thank you for shopping with us</h4><br/>
			<button type="button" class="btn btn-primary">
				<a href="HistoryServlet" style="text-decoration: none; color: white">Coninue shopping</a>
			</button>
		</div>

		
	</div>

	<script type="text/javascript">
		setTimeout(function() {

			// Closing the alert
			$('#alert').alert('close');
		}, 8000);
	</script>
	<script type="text/javascript">
        window.history.forward();
        function noBack() {
            window.history.forward();
        }
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