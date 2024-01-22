<%--
  Created by IntelliJ IDEA.
  User: Mohamed
  Date: 1/5/2024
  Time: 9:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Model.Utilisateur" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Dao.VolDAO" %>
<%@ page import="Dao.FlightInfoDao" %>
<%@ page import="Model.FlightInfo" %>
<%@ page import="java.util.Iterator" %>

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
            background-color: rgba(255, 87, 51, 1);
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
            background-color: rgba(255, 87, 51, 1);
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
    <link rel="stylesheet" type="text/css" href="AirplaneStyle.css">
    <meta charset="ISO-8859-1">
    <title>Airline Ticket Booking</title></head>
<body>

<%! String message="";int m; %>
<% message=(String)request.getAttribute("key");%>
<%if(message==null){
    message="";
}%>
<%!int i=0; %>

<%! String miss=""; %>
<% miss=(String)request.getAttribute("user");%>
<%if(miss==null){
    miss="";
}%>

<% Utilisateur utilisateur = (Utilisateur) session.getAttribute("authenticatedUser"); %>
<% if (utilisateur != null) { %>
<h2>Bienvenue, <%= utilisateur.getNomUtilisateur() %>!</h2>
<%-- Autres contenus pour un utilisateur authentifié --%>
<% } else { %>
<p>Vous n'êtes pas authentifié. Redirection vers la page de login...</p>

<% } %>


<div style="margin:20px; margin-left:50px; width:25%; display: inline;">
    <img src="images/logo.jpg">
</div>
<%if(utilisateur!=null){
    i=5;
%>

    <div style="display: inline;" id="navigation">
        <ul>
            <li><a href="HomePage_1.jsp">Home</a></li>
            <li><a href="UserInfo.jsp"><%=utilisateur.getNomUtilisateur()%></a></li>
            <li><a href="LogOutServlet">Log out</a></li>
            <li><a href="Footer.html">Contact Us</a></li>
        </ul>
    </div>

    <div style="display: inline;" id="navigation">
        <ul>
            <li><a href="HomePage_1.jsp">Home</a></li>
            <li><a href="index.jsp">Sign in</a></li>
            <li><a href="signup.jsp">Sign Up</a></li>
            <li><a href="">Contact Us</a></li>
        </ul>
    </div>
    <%
        }
    %>

    <div class="alphared whitetext">

        <div class="subheader">
            <b>Book Domestic flight tickets</b>
        </div>
        <br>
        <%=miss%>
        <form action="SearchFlightsServlet" method="post">
            <table style="font-size: 150%;" cellspacing=20px align="center">
                <tr>
                    <td><a href="HomePage_1.jsp"><input class="button1"
                                                       type="button" name="Dflights" value="Domestic Flights" /></a></td>
                    <td><a href="HomePage2.jsp"><input class="button1"
                                                       type="button" name="Iflights" value="International Flights" /></a></td>
                </tr>

                <tr>
                    <td>From <br> <select name="from"
                                          style="border-radius: 50px; padding: 7px;">
                        <option value="Nema">Nema</option>
                        <option value="NKT">NKT</option>
                        <option value="NDB">NDB</option>
                        <option value="Zwe">Zwe</option>
                    </select>
                    <td>To <br> <select name="to"
                                        style="border-radius: 50px; padding: 7px;">
                        <option value="Nema,nema">Nema</option>
                        <option value="NKT">NKT</option>
                        <option value="NDB">NDB</option>
                        <option value="Zwe">Zwe</option>
                    </select>
                </tr>
                <tr>
                    <td><label for="departure">Departure </label> <br> <input
                            type="date" id="departure" name="departure"
                            /></td>


                    <td>Class <br> <select name="class"
                                           style="border-radius: 50px; padding: 7px;">
                        <option value="Economy">Economy</option>
                        <option value="Business">Business</option>
                        <option value="FirstClass">First Class</option>
                    </select>
                    </td>
                </tr>
                <tr>
                    <td><label for="Adult">Adult </label> <br> <input
                            type="number" id="adult" name="adult"
                            placeholder="Number of Adults" /></td>
                    <td><label for="child">Child </label><br> <input
                            type="number" id="child" name="child"
                            placeholder="Number of Childs" /></td>
                    <td><label for="srcitizen">Senior Citizen </label><br> <input
                            type="number" id="srcitizen" name="srcitizen"
                            placeholder="Number of Sr Citizen" /></td>
                </tr>
                <tr>
                    <td><input class="button1" type="submit" name="Submit"
                               value="Search Flights" /></td>
                </tr>
            </table>
        </form>
    </div>

<form action="Search" method="post">
    <div class="alphared" style="font-size: 200%">
        <font class="whitetext" align="center"> List of Available
            Flights </font>
    </div>
    <table margin=50px class="whitetext">


        <%
            FlightInfoDao flightInfoDao=new FlightInfoDao();
            List<FlightInfo> flightlist = flightInfoDao.getFlightInfo();
            request.setAttribute("flightlist", flightlist);
       List<FlightInfo> flight=(List<FlightInfo>) request.getAttribute("flightlist");
            if (flight != null && flight.size() > 0) {
                Iterator<FlightInfo> iter = flight.iterator();
                while (iter.hasNext()) {
                    /* session.removeAttribute("PDFBOOK"); */

                    FlightInfo f = iter.next();
                    //byte[] image = books.getImage();
                    //session.setAttribute("key", image);
                    /* session.removeAttribute("key"); */
        %>
        <thead>
        <tr>
            <th><h3></h3></th>
            <th><h3>Flight ID</h3></th>
            <th><h3>Source</h3></th>
            <th><h3>Destination</h3></th>
            <th><h3>Service Provider</h3></th>
            <th><h3>Cost</h3></th>
            <th><h3>Seat</h3></th>
            <th><h3>Journey</h3></th>
            <th><h3>Departure time</h3></th>
        </tr>

        <tr>
            <td width="10%" align="center"><input type="radio"
                                                  id="<%=f.getFlightid()%>" name="flight"
                                                  value="<%=f.getFlightid()%>" /></td>
            <td width="10%" align="center"><%=f.getFlightid()%></td>
            <td width="10%" align="center"><%=f.getSource()%></td>
            <td width="10%" align="center"><%=f.getDestination()%></td>
            <td width="10%" align="center"><%=f.getService_provider()%></td>
            <td width="10%" align="center"><%=f.getTicket_cost()%></td>
            <td width="10%" align="center"><%=f.getSeat()%></td>
            <td width="10%" align="center"><%=f.getDeparture_date()%></td>
            <td width="10%" align="center"><%=f.getArrival_time()%></td>


        </tr>

        <%
            }
        %>

        <tr align="right">

            <td width="10%" align="center"><input class="button1"
                                                  type="submit" name="Submit" value="Book Flight" /></td>
        </tr>



        <%
        } else {
        %>

        <tr align="center">
            <td align="center" colspan="4"><font style="font-size: large;">
                <b> No flights found</b>
            </font></td>
        </tr>

        <%
            }
        %>
        </thead>

    </table>
</form>



</div>
</body>
</html>
