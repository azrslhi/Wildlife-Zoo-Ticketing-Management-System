<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.LinkedList" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <style>
        body {
            font-family: Garamond, serif;
			background-image: url('images/bg_role.jpg');
			background-position: center;
			background-size: cover;
        }

        .container {
            width: 300px;
            margin: 0 auto;
            margin-top: 100px;
        }

        form {
            border: 1px solid #f1f1f1;
            padding: 16px;
			background-color: white;
        }

        input[type=text], input[type=password] {
            width: 100%;
            padding: 12px 20px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }

        button {
            background-color: #4CAF50;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            cursor: pointer;
            width: 100%;
        }

        button:hover {
            opacity: 0.8;
        }
    </style>
</head>
<body>
    <div class="container">
		<h1 style="text-align:center">Wildlife Zoo Ticketing Management System</h1>
                <button onclick="window.location.href = 'index.jsp'" class="home">Home</button>
        <form action="LoginServlet" method="post">
            <h4 style="text-align: center;">WELCOME ADMIN</h4>
            <input type="hidden" name="userType" value="admin">
            <label><b>Admin ID</b></label>
            <input type="text" placeholder="Enter your ID" name="adminID" required>

            <label><b>Password</b></label>
            <input type="password" placeholder="Enter your password" name="adminPass" required>
            <div style="color: red; text-align: center;">
                <c:if test="${not empty WrongLoginMsg}">
                    <div class="error-messages">
                        <c:forEach var="error" items="${WrongLoginMsg}">
                            ${error}<br>
                        </c:forEach>
                    </div>
                </c:if>
            </div>
            <h5 style="text-align:center">Are you staff? <i><a href="loginStaff.jsp">Click here</a></i></h5>
            <button type="submit">Login</button>
        </form>
    </div>
	
</body>
</html>
