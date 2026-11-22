<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.LinkedList" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html lang="en">
  <head>
    <title>New Registration</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400i,700,700i" rel="stylesheet">

    <link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="css/animate.css">
    
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">

    <link rel="stylesheet" href="css/aos.css">

    <link rel="stylesheet" href="css/ionicons.min.css">

    <link rel="stylesheet" href="css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="css/jquery.timepicker.css">

    
    <link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="css/icomoon.css">
    <link rel="stylesheet" href="css/style.css">
    
     <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script>
        $(document).ready(function () {
            <% if ("success".equals(request.getAttribute("insertResult"))) { %>
                alert("Registered successfully!");
            <% } else if ("error".equals(request.getAttribute("insertResult"))) { %>
                alert("<%=request.getAttribute("errorMsgs")%>");
            <% } %>
        });
    </script>
    
  </head>

<body>

    <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
	<div class="container">
            <a class="navbar-brand" href="indexAdmin.jsp"><br>Wildlife Conservation Management System</a>
	    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="oi oi-menu"></span> Menu
	    </button>
	</div>
    </nav>
	  
    <div class="hero-wrap" style="background-image: url('images/bg_reg.jpeg');">
        <div class="overlay"></div>
        <div class="container">
            <div class="row no-gutters slider-text d-flex align-itemd-end justify-content-center">
                <div class="col-md-9 ftco-animate text-center d-flex align-items-end justify-content-center">
                    <div class="text">
                        <h1 class="mb-4 bread">First Time Registration</h1>
                    </div>
                </div>
            </div>
        </div>
    </div>
	  
    <section class="ftco-section">
        <div class="container">
            <div class="row">
                <div class="col-lg">
                    <div class="row">
          		<div class="col-md-12 room-single mt-4 mb-5 ftco-animate">
                            <div style="color: red; text-align: center;">
                                <c:if test="${not empty errorMsgs}">
                                    <div class="error-messages">
                                        <c:forEach var="error" items="${errorMsgs}">
                                            ${error}<br>
                                        </c:forEach>
                                    </div>
                                </c:if>
                            </div>
                            <form class="booking-form" action="CustomerServlet" method="post">
                                <input type="hidden" name="action" value="insertCust">
                                <table class="table table-bordered" align="center">
                                    <tr>
                                        <th>NRIC :</th>
                                        <td><input type="text" name="custID" required></td>
                                    </tr>
                                    <tr>
                                        <th>Customer Name	:</th> 
                                        <td><input type="text" name="custName" required></td>
                                    </tr>
                                    <tr>
                                        <th>Nationality	:</th>
                                        <td>
                                            <select name="nationality" required>
						<option value="" selected>--- Please Select ---</option>
						<option value="Malaysian">Malaysian</option>
						<option value="Non-Malaysian">Non-Malaysian</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>Phone Number	:</th>
                                        <td><input type="text" name="phoneNum" required></td>
                                    </tr>
                                    <tr>
                                        <th>Email	:</th>
                                        <td><input type="email" name="custEmail" required></td>
                                    </tr>
                                    <tr>
                                        <th>Password	:</th>
                                        <td><input type="password" name="custPass" required></td>
                                    </tr>
                                    <tr>
                                        <th>Confirm Password	:</th>
                                        <td><input type="password" name="custPassConf" required></td>
                                    </tr>
                                </table>      
                                <button style="position:absolute; left:500px;" type="submit" name="submit" class="btn btn-primary px-5">Register</button>
                                <br><br>
                                <button style="position:absolute; left:513px;" type="reset" class="btn btn-primary px-5">Reset</button>
                                <br><br>
                                <p class="message" style="text-align:center;">Already registered?<a href="loginCust.jsp"> Click Here</a></p>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>  
    </section>
    <footer class="ftco-footer ftco-bg-dark ftco-section" style="text-align: center">
      <p>&copy; 2023 Wildlife Conservation Management System</p>
    </footer>

  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


  <script src="js/jquery.min.js"></script>
  <script src="js/jquery-migrate-3.0.1.min.js"></script>
  <script src="js/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/jquery.easing.1.3.js"></script>
  <script src="js/jquery.waypoints.min.js"></script>
  <script src="js/jquery.stellar.min.js"></script>
  <script src="js/owl.carousel.min.js"></script>
  <script src="js/jquery.magnific-popup.min.js"></script>
  <script src="js/aos.js"></script>
  <script src="js/jquery.animateNumber.min.js"></script>
  <script src="js/bootstrap-datepicker.js"></script>
  <script src="js/jquery.timepicker.min.js"></script>
  <script src="js/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="js/google-map.js"></script>
  <script src="js/main.js"></script>
  
  </body>
</html>