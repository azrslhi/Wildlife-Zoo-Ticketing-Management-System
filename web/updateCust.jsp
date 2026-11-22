<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<sql:setDataSource var="myDatasource" driver="org.apache.derby.jdbc.ClientDriver"
    url="jdbc:derby://localhost:1527/wildlife" user="app" password="app"/>

<html lang="en">
  <head>
    <title>Wildlife Conservation Management System</title>
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
  </head>
  <body>

    <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
	    <div class="container">
	      <a class="navbar-brand" href="indexCust.jsp"><br>Wildlife Conservation Management System</a>
	      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="oi oi-menu"></span> Menu
	      </button>

	      <div class="collapse navbar-collapse" id="ftco-nav">
	        <ul class="navbar-nav ml-auto">
	          <li class="nav-item "><a href="indexCust.jsp" class="nav-link">Home</a></li>
	          <li class="nav-item active"><a href="updateCust.jsp" class="nav-link">Update Info</a></li>
                  <li class="nav-item "><a href="ticketCust.jsp" class="nav-link">Buy Ticket</a></li>
                  <li class="nav-item "><a href="manageTicketCust.jsp" class="nav-link">Manage Ticket</a></li>
	        </ul>
			<button class="btn btn-primary btn-xs"  onclick="location.href='LogoutServlet'">Logout</button>
	      </div>
	    </div>
	  </nav>
    <!-- END nav -->

    <div class="hero-wrap" style="background-image: url('images/bg_1.jpg');">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text d-flex align-itemd-end justify-content-center">
          <div class="col-md-9 ftco-animate text-center d-flex align-items-end justify-content-center">
          	<div class="text">
	            <h1 class="mb-4 bread">Update User Information</h1>
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
    						<div class="d-md-flex mt-5 mb-5">
                                                    <sql:query var="result" dataSource="${myDatasource}">
                                                        SELECT * FROM CUSTOMER WHERE CUSTID = ?
                                                        <sql:param value="<%= session.getAttribute("custID") %>" />
                                                    </sql:query>

                                                        <c:if test="${not empty result.rows}">
								<form class="booking-form" action="CustomerServlet" method="post">
                                                                    <input type="hidden" name="action" value="updateCust">
                                                                    <table class="table table-bordered" align="center">
                                                                        <c:forEach var="row" items="${result.rows}">
                                                                        <tr>
                                                                            <th>NRIC :</th>
                                                                            <td>${row.CUSTID}</td>
                                                                            <input type="hidden" name="custID" value="${row.CUSTID}">
                                                                        </tr>
                                                                        <tr>
                                                                            <th>Customer Name	:</th> 
                                                                            <td><input type="text" name="custName" id="custName" value="${row.CUSTNAME}" required></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <th>Nationality	:</th>
                                                                            <td><select name="nationality">
                                                                                    <option value="${row.NATIONALITY}" selected>${row.NATIONALITY}</option>
                                                                                    <option value="Malaysian">Malaysian</option>
                                                                                    <option value="Non-Malaysian">Non-Malaysian</option>
                                                                                </select>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <th>Phone Number	:</th>
                                                                            <td><input type="text" name="phoneNum" id="phoneNum" value="${row.PHONENUM}" required></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <th>Email	:</th>
                                                                            <td><input type="email" name="custEmail" id="custEmail" value="${row.CUSTEMAIL}" required></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <th>Password	:</th>
                                                                            <td><input type="text" name="custPass" id="custPass" value="${row.CUSTPASS}" required></td>
                                                                        </tr>
                                                                        </c:forEach>
                                                                    </table>      
                                                                  <button style="position:absolute; left:500px;" type="submit" id="submit" name="submit" class="btn btn-primary px-5">Update</button>
                                                                </form>
                                                        </c:if>
							</div>
    						
          		</div>
          	</div>
          </div>
        </div>
      </div>
	  
    </section> <!-- .section -->
    <footer class="ftco-footer ftco-bg-dark ftco-section" style="text-align: center">
      <p>&copy; 2023 Wildlife Conservation Management System</p>
    </footer>
    
  

  <!-- loader -->
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
  
		<script>
		function totalTicketPrice(){
			let ticketPrice = 0;	
			adult = document.getElementById("adult").value
			children = document.getElementById("children").value
			ratesAdult = 20;
			ratesChild = 5;
			
			ticketPrice = (ratesAdult * Number(adult)) + (ratesChild * Number(children)) ;
			document.getElementById("ticketPrice").value = ticketPrice; 
			return ticketPrice;
		}
		function taxRate(){
			let taxRate = 0;
			ticketPrice = document.getElementById("ticketPrice").value

			taxRate = Number(ticketPrice)* 0.05 ;
			document.getElementById("tax").value = taxRate; 
			return taxRate;
		}
		function totalRate(){
			let totalPrice = 0;	
			ticketPrice = document.getElementById("ticketPrice").value
			taxRate = document.getElementById("tax").value
			
			totalPrice = Number(ticketPrice) + Number(taxRate);
			document.getElementById("totalPrice").value = totalPrice; 
			return totalPrice;
		}		
		</script>
  </body>
</html>