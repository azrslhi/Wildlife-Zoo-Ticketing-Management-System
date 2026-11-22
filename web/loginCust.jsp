<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.LinkedList" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <title>Login</title> 
    <link rel="stylesheet" href="css/loginStyle.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"/>
  </head>
 <body>
    <div class="container">
      <div class="wrapper">
        <div class="title"><span>Login Form</span></div>
        <form action="LoginServlet" method="post">
            <input type="hidden" name="userType" value="customer">
          <div class="row">
            <i class="fas fa-user"></i>
            <input type="text" placeholder="NRIC" name="custID" required>
          </div>
          <div class="row">
            <i class="fas fa-lock"></i>
            <input type="password" placeholder="Password" name="custPass" required>
          </div>
          <div style="color: red; text-align: center;">
                <c:if test="${not empty WrongLoginMsg}">
                    <div class="error-messages">
                        ${WrongLoginMsg.getStatus()}<br>
                    </div>
                </c:if>
          </div>
          <div class="row button">
            <input type="submit" value="Login">
          </div>
            
          <div class="signup-link">Not a member? <a href="newCust.jsp">Sign up now</a></div>
          <div class="signup-link"><a href="index.jsp">HOME</a></div>
        </form>
      </div>
    </div>

  </body>
</html>
