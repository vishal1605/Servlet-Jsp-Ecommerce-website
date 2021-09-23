<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Forget Password</title>
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
    <div class="forget_password p-5">
        <div class="row">
            <div class="col-12 d-flex justify-content-center">
               <div class="password-page">
                <div class="description-bar text-center p-1"> 
                        <i class='fa fa-user'></i>&nbsp;
                        Change your password     
                </div>
                <%
                String failedPassword = (String)session.getAttribute("forget-failed-password");
                String forgetSuccess=(String)session.getAttribute("success-password");
                String forgetEmail=(String)session.getAttribute("forget-email-password");
                if(failedPassword!=null)
                {%>
                	<div id="alert" class="alert alert-danger text-center" role="alert">
                	<b><%=failedPassword%></b>
                	
                	</div>
                	
                <%
                session.removeAttribute("forget-failed-password");
                }else if(forgetSuccess!=null)
                {%>
                	<div class="alert alert-success text-center" role="alert">
                	<b><%=forgetSuccess%></b><a href="Login.jsp">Click for Login</a>
                	</div>
                	
                <%
                session.removeAttribute("success-password");
                }else if(forgetEmail!=null)
                {%>
                	<div id="alert" class="alert alert-danger text-center" role="alert">
                	<b><%=forgetEmail%></b>
                	</div>
                	
                <%
                session.removeAttribute("forget-email-password");
                }
                
                %>
                   
                   <form action="ForgetPassword" method="post" class="password-form p-3">
                    
                    <div class="form-group">
                        <label for="exampleInputEmail1">Email address</label>
                        <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email" name="used-email" required>
                      </div>
                    <div class="form-group">
                      <label for="exampleInputPassword1">Password</label>
                      <input type="password" class="form-control" id="password" placeholder="Password" name="change-password" required>
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">Confirm Password</label>
                        <input type="password" class="form-control" id="password" placeholder="Confirm Password" name="confirm-change-password" required>
                      </div>
                    
                      
                    <div class="btn1 text-center">
                        <button type="submit" class="btn btn-primary">Submit</button>

                    </div>
                    
                  </form>
                  <div class="password-note text-center">
                    <p>
                        Note: Write your old Email
                    </p>
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


<!-- ======================================alert-Msg================================================================================ -->

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