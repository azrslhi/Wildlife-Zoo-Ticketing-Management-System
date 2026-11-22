<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<sql:setDataSource var="myDatasource" driver="org.apache.derby.jdbc.ClientDriver"
    url="jdbc:derby://localhost:1527/wildlife" user="app" password="app"/>

<html lang="en">
  <head>
    <title>Wildlife Conservation | Staff</title>
	<link href="img/logo.jpg" rel="icon">
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
	    <a class="navbar-brand" href="indexStaff.jsp"><br>Wildlife Conservation Staff Panel</a>
	    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="oi oi-menu"></span> Menu
	    </button>
	    <div class="collapse navbar-collapse" id="ftco-nav">
	        <ul class="navbar-nav ml-auto">
                    <li class="nav-item "><a href="indexStaff.jsp" class="nav-link">Dashboard</a></li>
                    <li class="nav-item active"><a href="manageAnimalStaff.jsp" class="nav-link">Manage Animals</a></li>
                    <li class="nav-item "><a href="manageTicketStaff.jsp" class="nav-link">Manage Ticket</a></li>
	        </ul>
		<button class="btn btn-primary btn-xs"  onclick="location.href='LogoutServlet'">Logout</button>
	    </div>
	</div>
    </nav>
	  
    <div class="hero-wrap" style="background-image: url('images/bg_1.jpg');">
        <div class="overlay"></div>
        <div class="container">
            <div class="row no-gutters slider-text d-flex align-itemd-end justify-content-center">
                <div class="col-md-9 ftco-animate text-center d-flex align-items-end justify-content-center">
                    <div class="text">
                        <h1 class="mb-4 bread">Animals Updates</h1>
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
                            <sql:query var="result" dataSource="${myDatasource}">
                                SELECT * FROM ANIMAL WHERE ANIMALID = ?
                                <sql:param value="${param.animalID}" />
                            </sql:query>
                            <c:if test="${not empty result.rows}">
				<form class="booking-form" action="AnimalServlet" method="post">
                                    <input type="hidden" name="action" value="updateAnimalStaff">
                                    <table class="table table-bordered" align="center">
                                    <c:forEach var="row" items="${result.rows}">
					<tr>
                                            <td colspan="2"><h1>Animal Details</h1></td>
					</tr>
					<tr>
                                            <th>Animal ID :</th>
                                            <td>${row.ANIMALID}<input type="hidden" name="animalID" value="${row.ANIMALID}"></td>	
					</tr>
					<tr>
                                            <th>Scientific Name	:</th> 
                                            <td><input type="text" name="sciName" value="${row.SCINAME}" required></td>
					</tr>
					<tr>
                                            <th>Animal Name	:</th>
                                            <td><input type="text" name="animalName" value="${row.ANIMALNAME}" required></td>
					</tr>
					<tr>
                                            <th>Nickname	:</th>
                                            <td><input type="text" name="nickname" value="${row.NICKNAME}" required></td>
					</tr>
					<tr>
                                            <th>Category	:</th>
                                            <td>
                                                <select name="category" required>
                                                    <option value="${row.CATEGORY}" selected>${row.CATEGORY}</option>
                                                    <option value="Mammal">Mammals</option>
                                                    <option value="Reptiles">Reptiles</option>
                                                    <option value="Amphibian">Amphibian</option>
						</select>
                                            </td>
					</tr>
					<tr>
                                            <th>Type	:</th>
                                            <td>
                                                <select name="type">
                                                    <option value="${row.TYPE}" selected>${row.TYPE}</option>
                                                    <option value="Carnivore">Carnivore</option>
                                                    <option value="Herbivore">Herbivore</option>
                                                    <option value="Omnivore">Omnivore</option>
						</select>
                                            </td>
					</tr>
					<tr>
                                            <th>Details	:</th>
                                            <td><textarea id="animalDetails" name="animalDetails" rows="6" cols="50" required>${row.ANIMALDETAILS}</textarea></td>
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
