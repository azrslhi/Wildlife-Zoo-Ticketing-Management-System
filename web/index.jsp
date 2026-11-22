<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Type Selection</title>
	<link rel="stylesheet" href="css/welcome.css">
        <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
        <script>
            $(document).ready(function () {
                <% if ("success".equals(request.getAttribute("logout"))) { %>
                    alert("<%= request.getAttribute("errMessage") %>");
                <% } %>
            });
        </script>
</head>
<body>
	<div class="bgimg">
	  <div class="middle">
		<h1>WELCOME TO <br>WILDLIFE CONSERVATION MANAGEMENT SYSTEM</h1>
		<hr>
		<p style="color: white;">Choose Your Character</p>
		<p>
			<button onclick="redirectTo('loginStaff.jsp')">Staff</button>
			<button onclick="redirectTo('loginCust.jsp')">Customer</button>
		</p>
	  </div>
	
    <script>
        function redirectTo(page) {
            window.location.href = page;
        }
    </script>

</body>
</html>
