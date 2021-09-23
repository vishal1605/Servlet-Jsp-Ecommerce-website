<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/home.css">
<link rel="stylesheet" href="css/all.css">
</head>
<body style="background-color: rgb(48, 164, 156)">
    <div class="container-fluid"> 
        <div class="nav-bar">
        <div class="row">
            <div class="col-12">
                <div class="header-bar">
                  <div class="logo">
                      <img src="images/Capture-1.png" alt="">
    
                  </div>
                  <div class="search-bar">
                      <div class="search">
                        <input type="text" placeholder="Search for smartphone, laptop..." id="search">

                      </div>
                      <div class="btn1">
                        <button type="submit"><i class="fa fa-search"></i></button>

                      </div>
                      
                  </div>
                  
                  <div class="menu-bar">
                      <ul id="Menu1">
                          <li><a href="home.jsp">Home</a></li>
                          <li><a href="#">Catogeries<i class="fa fa-caret-down"></i></a>
                            <div class="dropdown-content">
                                <ul id="menu2">
                                    <li><a href="#">smartphones</a></li>
                                    <li><a href="#">Smartwatchs</a></li>
                                    <li><a href="#">Headphones</a></li>
                                    <li><a href="#">Laptops</a></li>
                                </ul>
                              </div>
                        </li>
                          <li><a href="#">About us</a></li>
                          <li><a href="#">Contact</a></li>
                          <li><a href="Login.jsp"><i class='fa fa-user'></i></a></li>
                          <li><a href="CheckUser"><i class='fa fa-shopping-cart'></i></a></li>

                      </ul>
                  </div>
                  <span class="menu-icon" onclick="menutoggle()"><i class="fas fa-bars"></i></span>
                </div>
            </div>
        </div>
        </div>

    <!-- ===================================================================================Login Page=========================================================================== -->
    <div class="login-bar p-5">
        <div class="row">
            <div class="col-12 d-flex justify-content-center">
               <div class="login-page">
                   <div class="avtar text-center">
                       <img src="images/avatar-2.jpg" alt="">
                   </div>
                   <%
                
                String myId=(String)session.getAttribute("invilid-Id");
                String notUser=(String)session.getAttribute("not-Login");
                HttpSession s = request.getSession();
                String logoutMsg=(String)s.getAttribute("logoutSuccess");
                if(myId!=null)
                {%>
                	<div id="alert" class="alert alert-danger text-center" role="alert">
                  <b><%=myId%></b>
                  </div>
                <%
                 session.removeAttribute("invilid-Id");
                }
                if(notUser!=null)
                {%>
                	<div id="alert" class="alert alert-danger text-center" role="alert">
                  <b><%=notUser%></b>
                  </div>
                <%
                session.removeAttribute("not-Login");
                }
                if(logoutMsg!=null)
                {%>
                	<div id="alert" class="alert alert-success text-center" role="alert">
                  <b><%=logoutMsg%></b>
                  </div>
                <%
                session.removeAttribute("logoutSuccess");
                }
                
                
                %>
                   <form action="Login" method="get" class="log-form p-3">
                    
                    <div class="form-group">
                        <label for="exampleInputEmail1">Email address</label>
                        <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email" name="lEmail" required>
                      </div>
                    <div class="form-group">
                      <label for="exampleInputPassword1">Password</label>
                      <input type="password" class="form-control" id="password" placeholder="Password" name="lPassword" required>
                    </div>
                    
                      <div class="form-group form-check">
                        <input type="checkbox" class="form-check-input" id="check" onclick="myFunction()">
                        <label class="form-check-label" for="exampleCheck1">show password</label>
                      </div>
                    <div class="btn1 text-center">
                        <button type="submit" class="btn btn-primary">Login</button>

                    </div>
                    
                  </form>
                  
                   <div class="new-member text-center">
                       <a href="forgetPassword.jsp" id="fpassword">forget Password</a><br>
                       <a href="Register.jsp" id="account-member">New to Electronic Mart? Create an account</a>
                   </div>
               </div>
            </div>
        </div>
    </div>
   
   
   

    
    <!-- ==================================================Footer-bar============================================================================= -->


    <div class="footer-bar">
      <div class="row">
         <div class="col-3 p-3 text-center">
             <h3 style="color: white;">Download Our App</h3>
             <p style="color: rgb(27, 20, 20);">Download App for Android and ios mobile phone.</p>
             <div class="app-logo">
                 <img src="images/play-store.png" alt="">
                 <img src="images/app-store.png" alt="">
             </div>
         </div>
         <div class="col-3 p-3 text-center">
             <img id="img-logo" src="images/Capture-1.png" alt="">
             <p id="logo-para">Our purpose is to sustainably make the pleasure <br> and
                 benifits of Sports accessible to the many.</p>
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


<!-- ======================================JavaScript Login Password================================================================================ -->


<script>
    function myFunction() {
      var x = document.getElementById("password");
      if (x.type === "password") {
        x.type = "text";
      } else {
        x.type = "password";
      }
    }
    </script>


<!-- =========================================================For Alert message After register=================================================================== -->    
    <script type="text/javascript">
        setTimeout(function () {
  
            // Closing the alert
            $('#alert').alert('close');
        }, 8000);
    </script>
   
 
<!-- ===================================================================Bootstrap js========================================================================================= -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
 
</body>
</html>