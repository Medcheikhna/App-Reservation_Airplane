<%@ page import="Model.Utilisateur" %><%--
  Created by IntelliJ IDEA.
  User: Mohamed
  Date: 1/7/2024
  Time: 6:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <style>
        input[type=text], select {
            width: 100%;
            padding: 12px 20px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        input[type=number], select {
            width: 100%;
            padding: 12px 20px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        input[type=date], select {
            width: 100%;
            padding: 12px 20px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        input[type=submit] {
            width: 100%;
            background-color: rgba(255, 87, 51,1);
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            border-radius: 10px;
            cursor: pointer;
        }

        input[type=submit]:hover {
            background-color: #45a049;
        }

        input[type=button] {
            width: 100%;
            background-color: rgba(255, 87, 51,1);
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            border-radius: 10px;
            cursor: pointer;
        }

        input[type=button]:hover {
            background-color: #45a049;
        }

    </style>
    <link rel = "stylesheet" type="text/css" href="AirlineStyle.css">
    <meta charset="ISO-8859-1">
    <title>Email Confirmation</title>
</head>
<body>
<%!Utilisateur userloggedin; %>
<% userloggedin= (Utilisateur)session.getAttribute("userlogin");%>


<div style="margin:20px; margin-left:50px; width:25%; display: inline;">
    <img src="images/logo.jpg">
</div>

<div style="display:inline;" id="navigation">
    <ul>
        <li><a href="HomePage_1.jsp">Home</a></li>
        <li><a href="index.jsp">Sign in</a></li>
        <li><a href="signup.jsp">Sign Up</a></li>
        <li><a href="Footer.html">Contact Us</a></li>
    </ul>
</div>

<div class="alphared whitetext">
    <form action="LoginServlet" method="POST">
        <table style="font-size:150%;" cellspacing=20px align="center">
            <tr>
                <td><label for="IdBooking">Contact Information </label> <br>
                    <input type="text" id="IdBooking" name="IdBooking" placeholder="enter Your Number for your Booking"/></td>
            </tr>
            <tr>
                <td><a href="signup.jsp"><input class="button1" type="button" name="Guest" value="Cotinue as Guest"/></a></td>
                <td>Or</td>
                <td><a href="index.jsp"><input class="button1" type="submit" name="login" value="Login"/></a></td>
            </tr>
        </table>
    </form>
</div>


</body>
</html>
