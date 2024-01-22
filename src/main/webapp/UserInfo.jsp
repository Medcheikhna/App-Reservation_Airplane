<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ page import="Model.Utilisateur" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Dao.VolDAO" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%--<%@page import="com.travelbyair.pojoclasses.User" %>--%>
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
        input[type=password], select {
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
    </style>
    <link rel = "stylesheet" type="text/css" href="AirlineStyle.css">
    <meta charset="ISO-8859-1">
    <title>User Information Update</title>
</head>
<body>

<%! String message=""; %>
<% message=(String)request.getAttribute("key");%>
<%if(message==null){
    message="";
}%>

<%!Utilisateur userloggedin; %>
<% userloggedin= (Utilisateur)session.getAttribute("userlogin");%>

<div style="margin:20px; margin-left:50px; width:25%; display: inline;">
    <img src="images/logo.jpg">
</div>



<div style="display:inline;" id="navigation">
    <ul>
        <li><a href="HomePage1.jsp">Home</a></li>
        <li><a href="LoginPage.jsp">Sign in</a></li>
        <li><a href="Registration.jsp">Sign Up</a></li>
        <li><a href="Footer.html">Contact Us</a></li>
    </ul>
</div>


<div class="alphared whitetext">
    <form action="SignUpServlet" method="post">
        * Fields are mandatory <br> <br> <br>
        <%=message %>
        <table cellspacing=30px>
            <tr>
                <td><label for="nomUtilisateur">First Name* </label> <br>
                    <input type="text" id="nomUtilisateur" name="nomUtilisateur" value="<%=userloggedin.getNomUtilisateur()%>"/></td>
                <td><label for="lastname">Last Name* </label> <br>
                    <input type="text" id="lastname" name="lastname" value="<%=userloggedin.getNomUtilisateur()%>"/></td>
            </tr>

            <tr>
                <td><label for="dob">Date Of Birth* </label> <br>
                    <input type="date" id="dob" name="dob" value="<%%>"/></td>
            </tr>
            <tr>
                <td><label for="password">Password* </label> <br>
                    <input type="text" id="password" name="password" value="<%=userloggedin.getMotDePasse()%>"/></td>
            </tr>
            <tr>
                <td><label for="contact">Contact Number* </label> <br>
                    <input type="tel" id="contact" name="contact" value="<%%>"/></td>
            </tr>
            <tr>
                <td><label for="email">E-mail* </label> <br>
                    <input type="text" id="email" name="email" value="<%%>"/></td>
                <td><label for="city">City* </label> <br>
                    <input type="text" id="city" name="city" value="<%%>"/></td>
            </tr>

            <tr>
                <td>Upload your Image (Optional)</td>
                <td><input type="file"/></td>
            </tr>

            <tr align="right">
                <td><input style="color:rgba(255, 87, 51,1); background-color: white;padding: 10px;font-size:200%;border-radius:20px;" type="submit" name="login" value="Update" /></td>
            </tr>
        </table>
    </form>
</div>

</body>
</html>