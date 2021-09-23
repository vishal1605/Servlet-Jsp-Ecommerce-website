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
<style>
.captcha-container {
	min-width: 30%;
	max-width: 30%;
	display: flex;
	flex-direction: column;
	font-family: 'poppins', sans-serif;
}

.header {
	background: #037AE2;
	color: #FFF;
	font-size: 1.5rem;
	width: 100%;
	text-align: center;
	padding: 10px;
}

.securityCode {
	width: 100%;
	height: 170px;
	background-color: black;
	background-position: center;
	background-size: cover;
	background-repeat: no-repeat;
	position: relative;
}

.securityCode #code {
	text-align: center;
	line-height: 170px;
	color: #FFF;
	font-family: "Montserrat";
	font-size: 4vw;
	font-weight: bold;
	letter-spacing: 10px;
	user-select: none;
}

.securityCode .icons {
	position: absolute;
	bottom: 0;
	right: 10px;
}

.securityCode .icons .fas {
	font-size: 1.5rem;
	color: white;
	padding: 10px 5px;
	cursor: pointer;
	transition: 0.2s ease;
}

.securityCode .icons .fas:hover {
	color: #037AE2;
}

.userInput {
	width: 100%;
	padding: 15px;
	display: flex;
	justify-content: center;
	background-color: skyblue;
}

.userInput input {
	border-radius: 20px 0 0 20px;
	outline: none;
	border: 1px solid gray;
	border-right: none;
	padding: 9px;
	width: 60%;
	font-size: 1rem;
}

.btn1 {
	border: none;
	outline: none;
	background: #037AE2;
	padding: 9px;
	font-size: 1rem;
	color: #fff;
	border-radius: 0 20px 20px 0;
	cursor: pointer;
	transition: 0.15s ease;
}

.btn:hover {
	background: #036cc9;
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
			<h2>Please complete security check for order proceed</h2>
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


				<div class="captcha-container">
						<div class="header">Security Check</div>
						<div class="securityCode">
							<p id="code"><</p>
							<div class="icons">
								 <span class="changeText"> <i class="fas fa-sync-alt"></i>
								</span>
							</div>
						</div>
						<div class="userInput">
							<input type="text" placeholder="Type the text here" required="required">
							<button type="button" class="btn1" onclick="myFunction()">Submit</button>
						</div>
				</div>



			</div>

		</div>
		<div class="text-center mb-3">
			<button type="button" class="btn btn-primary">
				<a href="Welcome.jsp?category=all" style="text-decoration: none; color: white">Order
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
	<script type="text/javascript">
        window.history.forward();
        function noBack() {
            window.history.forward();
        }
    </script>
	<script>
    const changeTextBtn = document.querySelector('.changeText') ;
    const readTextBtn = document.querySelector('.readText') ;
    const code = document.querySelector('#code') ;
    const input = document.querySelector('.userInput input') ;
    const submitBtn = document.querySelector('.btn1') ;

    changeTextBtn.addEventListener('click' , () => {
        code.textContent = createCaptcha() ;
    }) ;
    window.addEventListener('load' , () => {
        code.textContent = createCaptcha() ;
    }) ;

    function createCaptcha()  {
        let letters = ['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z',
        'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z', '0','1','2','3','4','5','6','7','8','9'];
        let a = letters[Math.floor(Math.random() * letters.length)] ;
        let b = letters[Math.floor(Math.random() * letters.length)] ;
        let c = letters[Math.floor(Math.random() * letters.length)] ;
        let d = letters[Math.floor(Math.random() * letters.length)] ;
        let e = letters[Math.floor(Math.random() * letters.length)] ;
        let f = letters[Math.floor(Math.random() * letters.length)] ;
        let g = letters[Math.floor(Math.random() * letters.length)] ;
        let code = a + b + c + d + e + f + g ;
        return code ;
    } 
    submitBtn.addEventListener('click',() => {
        	let val = input.value ;	
        if(val === code.textContent) {
        	alert('Valid input !') ;
        	window.location.href = "Confirmation.jsp";
        }
        else {
            alert('invalid input !') ;
        }
       
    }) 
    readTextBtn.addEventListener('click', () => {
        let text = code.textContent ;
        responsiveVoice.speak(text,{rate:0.8});
    })
    
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