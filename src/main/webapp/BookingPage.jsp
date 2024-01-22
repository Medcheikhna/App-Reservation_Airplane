<%@ page import="Dao.FlightInfoDao" %>
<%@ page import="Model.FlightInfo" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %><%--
  Created by IntelliJ IDEA.
  User: Mohamed
  Date: 1/9/2024
  Time: 9:10 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking Information</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<%
    String reservationMessage = (String) request.getAttribute("reservationMessage");
    if (reservationMessage != null) {
%>
<div class="alert alert-danger" role="alert">
    <%= reservationMessage %>
</div>
<%
    }
%>
<div class="container mt-5">
    <form action="Search" method="post">
    <div class="card">
        <div class="card-header">
            Booking Information
        </div>


        <% List<FlightInfo> flight=(List<FlightInfo>) request.getAttribute("flightlist");
          request.setAttribute("myFlyList",flight);
            System.out.println(flight);
            if (flight != null && !flight.isEmpty()) {
                Iterator<FlightInfo> iter = flight.iterator();
                while (iter.hasNext()) {
                    /* session.removeAttribute("PDFBOOK"); */

                    FlightInfo f = iter.next();

        %>

        <input type="hidden"  name="time" value="<%=f.getArrival_time()%>" id="time">
        <input type="hidden"  name="flightIds" value="<%=f.getFlightid()%>" id="flightIds">
        <input type="hidden" name="sources" value="<%=f.getSource()%>" id="sources">
        <input type="hidden" name="destinations" value="<%=f.getDestination()%>" id="destinations">

        <div class="card-body">
         <center id=<%=f.getFlightid()%> >
             <h5 class="card-title" >Number for your travel</h5>
             <p class="card-text" ><%=f.getFlightid()%></p>
         </center>
            <h5 class="card-title" >Departure City</h5>
            <p class="card-text" ><%=f.getSource()%></p>
            <div class="arrow-icon">&#8594;</div>
            <h5 class="card-title">Arrival City</h5>
            <p class="card-text"><%=f.getDestination()%></p>
            <h5 class="card-title">Time for travel</h5>
            <p class="card-text"><%=f.getArrival_time()%></p>
        </div>
        <%}%>
        <div class="card-footer text-muted">
            <button type="submit" class="btn btn-primary" >Book Now</button>
        </div>
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
    </div>
</form>
</div>




<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</body>
</html>




<%--<html>--%>
<%--<head>--%>
<%--    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">--%>
<%--    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>--%>
<%--    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>--%>
<%--    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>--%>

<%--    <style>--%>
<%--        input[type=text], select {--%>
<%--            width: 100%;--%>
<%--            padding: 12px 20px;--%>
<%--            margin: 8px 0;--%>
<%--            display: inline-block;--%>
<%--            border: 1px solid #ccc;--%>
<%--            border-radius: 4px;--%>
<%--            box-sizing: border-box;--%>
<%--        }--%>

<%--        input[type=number], select {--%>
<%--            width: 100%;--%>
<%--            padding: 12px 20px;--%>
<%--            margin: 8px 0;--%>
<%--            display: inline-block;--%>
<%--            border: 1px solid #ccc;--%>
<%--            border-radius: 4px;--%>
<%--            box-sizing: border-box;--%>
<%--        }--%>

<%--        input[type=date], select {--%>
<%--            width: 100%;--%>
<%--            padding: 12px 20px;--%>
<%--            margin: 8px 0;--%>
<%--            display: inline-block;--%>
<%--            border: 1px solid #ccc;--%>
<%--            border-radius: 4px;--%>
<%--            box-sizing: border-box;--%>
<%--        }--%>

<%--        input[type=submit] {--%>
<%--            width: 100%;--%>
<%--            background-color: rgba(255, 87, 51, 1);--%>
<%--            color: white;--%>
<%--            padding: 14px 20px;--%>
<%--            margin: 8px 0;--%>
<%--            border: none;--%>
<%--            border-radius: 10px;--%>
<%--            cursor: pointer;--%>
<%--        }--%>

<%--        input[type=submit]:hover {--%>
<%--            background-color: #45a049;--%>
<%--        }--%>

<%--        input[type=button] {--%>
<%--            width: 100%;--%>
<%--            background-color: rgba(255, 87, 51, 1);--%>
<%--            color: white;--%>
<%--            padding: 14px 20px;--%>
<%--            margin: 8px 0;--%>
<%--            border: none;--%>
<%--            border-radius: 10px;--%>
<%--            cursor: pointer;--%>
<%--        }--%>

<%--        input[type=button]:hover {--%>
<%--            background-color: #45a049;--%>
<%--        }--%>
<%--    </style>--%>
<%--    <script>--%>
<%--        function printDiv() {--%>
<%--            var body = document.getElementById("body").innerHTML;--%>
<%--            var ticket = document.getElementById("ticket").innerHTML;--%>
<%--            document.getElementById("body").innerHTML = ticket;--%>
<%--            window.print();--%>
<%--            document.getElementById("body").innerHTML = body;--%>

<%--        }--%>
<%--    </script>--%>
<%--</head>--%>
<%--<body class="d-flex flex-column min-vh-100" id="body">--%>


<%--<div style="margin:20px; margin-left:50px; width:25%; display: inline;">--%>
<%--    <img src="images/logo.jpg">--%>
<%--</div>--%>
<%--<div>--%>

<%--    <header class="container">--%>
<%--        <nav class="navbar navbar-expand-lg bg-light ">--%>
<%--            <div class="container-fluid text-right">--%>

<%--            </div>--%>
<%--&lt;%&ndash;            <div class="mx-auto me-md-3 my-auto">&ndash;%&gt;--%>

<%--&lt;%&ndash;                <a class="btn btn-primary   admin-btn" href="admin-login-check.jsp">Admin</a>&ndash;%&gt;--%>

<%--&lt;%&ndash;            </div>&ndash;%&gt;--%>


<%--        </nav>--%>

<%--    </header>--%>
<%--    <% List<FlightInfo> flight=(List<FlightInfo>) request.getAttribute("flightlist");--%>
<%--        if (flight != null && flight.size() > 0) {--%>
<%--            Iterator<FlightInfo> iter = flight.iterator();--%>
<%--            while (iter.hasNext()) {--%>
<%--                /* session.removeAttribute("PDFBOOK"); */--%>

<%--                FlightInfo f = iter.next();--%>

<%--    %>--%>


<%--    <div class="d-inline-flex justify-content-center p-2">--%>
<%--        <div class="alert alert-success " role="alert">--%>
<%--            Payment successfull!! <br> Your ticket has been booked. The--%>
<%--            summary/details are as follows--%>
<%--        </div>--%>
<%--    </div>--%>
<%--    <div class=" d-inline-flex justify-content-center  mt-2  p-2"--%>
<%--         id="ticket">--%>
<%--        <div class="card">--%>
<%--            <div class="card-header">--%>
<%--                Ticket ID #<%=f.getFlightid()%></div>--%>
<%--            <div class="card-body ">--%>


<%--                <div>--%>
<%--                    <h5 class="source"><%=f.getSource().toUpperCase()%>--%>
<%--                        to--%>
<%--                        <%=f.getDestination().toUpperCase()%></h5>--%>
<%--                </div>--%>

<%--                <div>--%>
<%--                    <p>23/12/2022</p>--%>
<%--                </div>--%>



<%--&lt;%&ndash;                <div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <p>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        Number of persons :&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <%=f.getNoOfPerson()%></p>&ndash;%&gt;--%>
<%--&lt;%&ndash;                </div>&ndash;%&gt;--%>
<%--                <div>--%>
<%--                    <p>--%>
<%--                        Total Ticket price : Rs.--%>
<%--                        <%=f.getTicket_cost()%>--%>
<%--                        x--%>
<%--                        <%=f.getTicket_cost()%>--%>
<%--                        =Rs.--%>
<%--                        <%=f.getTicket_cost()%></p>--%>
<%--                </div>--%>
<%--                <%  }%>--%>
<%--                <button class="btn btn-primary" onclick="printDiv()">Print--%>
<%--                    Ticket</button>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--    <%  }%>--%>


<%--    <footer class="bg-light text-center text-lg-start mt-auto">--%>
<%--        <!-- Copyright -->--%>
<%--        <div class="text-center p-3">--%>
<%--            © 2022 Copyright:--%>
<%--            <h5 class="text-dark">flyAway | Developed by Malay Sarkar</h5>--%>
<%--        </div>--%>
<%--        <!-- Copyright -->--%>
<%--    </footer>--%>



<%--&lt;%&ndash;    &lt;%&ndash;%>--%>
<%--&lt;%&ndash;        session.invalidate();&ndash;%&gt;--%>
<%--&lt;%&ndash;    %>&ndash;%&gt;--%>



<%--</div>--%>

<%-- //////information//////--%>
<%--&lt;%&ndash;<div class="container">&ndash;%&gt;--%>
<%--&lt;%&ndash;    <h2>Réservation Details</h2>&ndash;%&gt;--%>
<%--&lt;%&ndash;  <%  List<FlightInfo> flight=(List<FlightInfo>) request.getAttribute("flightlist");&ndash;%&gt;--%>

<%--&lt;%&ndash;      if (flight != null && flight.size() > 0) {&ndash;%&gt;--%>
<%--&lt;%&ndash;          Iterator<FlightInfo> iter = flight.iterator();&ndash;%&gt;--%>
<%--&lt;%&ndash;          while (iter.hasNext()) {&ndash;%&gt;--%>
<%--&lt;%&ndash;              /* session.removeAttribute("PDFBOOK"); */&ndash;%&gt;--%>

<%--&lt;%&ndash;              FlightInfo f = iter.next();&ndash;%&gt;--%>
<%--&lt;%&ndash;  %>&ndash;%&gt;--%>

<%--&lt;%&ndash;        <div class="card">&ndash;%&gt;--%>
<%--&lt;%&ndash;            <div class="card-body">&ndash;%&gt;--%>
<%--&lt;%&ndash;                <h5 class="card-title">Détails de la réservation</h5>&ndash;%&gt;--%>
<%--&lt;%&ndash;                <p class="card-text">Point de départ : <%=f.getSource()%></p>&ndash;%&gt;--%>
<%--&lt;%&ndash;                <p class="card-text">Destination : <%=f.getDestination()%></p>&ndash;%&gt;--%>
<%--&lt;%&ndash;                <!-- Ajoutez d'autres informations de réservation ici -->&ndash;%&gt;--%>
<%--&lt;%&ndash;            </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;        </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;    &lt;%&ndash;%>--%>
<%--&lt;%&ndash;        }&ndash;%&gt;--%>
<%--&lt;%&ndash;    %>&ndash;%&gt;--%>
<%--&lt;%&ndash;    <tr align="right">&ndash;%&gt;--%>

<%--&lt;%&ndash;        <td width="10%" align="center"><input class="button1"&ndash;%&gt;--%>
<%--&lt;%&ndash;                                              type="submit" name="Submit" value="Book Flight" /></td>&ndash;%&gt;--%>
<%--&lt;%&ndash;    </tr>&ndash;%&gt;--%>



<%--&lt;%&ndash;    &lt;%&ndash;%>--%>
<%--&lt;%&ndash;    } else {&ndash;%&gt;--%>
<%--&lt;%&ndash;    %>&ndash;%&gt;--%>

<%--&lt;%&ndash;    <tr align="center">&ndash;%&gt;--%>
<%--&lt;%&ndash;        <td align="center" colspan="4"><font style="font-size: large;">&ndash;%&gt;--%>
<%--&lt;%&ndash;            <b> No flights found</b>&ndash;%&gt;--%>
<%--&lt;%&ndash;        </font></td>&ndash;%&gt;--%>
<%--&lt;%&ndash;    </tr>&ndash;%&gt;--%>

<%--&lt;%&ndash;    &lt;%&ndash;%>--%>
<%--&lt;%&ndash;        }&ndash;%&gt;--%>
<%--&lt;%&ndash;    %>&ndash;%&gt;--%>

<%--&lt;%&ndash;</div>&ndash;%&gt;--%>

<%--&lt;%&ndash;<!-- Inclure ici vos liens vers des fichiers JavaScript, Bootstrap, etc. si nécessaire -->&ndash;%&gt;--%>

<%--&lt;%&ndash;<div>&ndash;%&gt;--%>

<%--&lt;%&ndash;//////Fin de commentaire&ndash;%&gt;--%>
<%--&lt;%&ndash;<form action="Search" method="post">&ndash;%&gt;--%>
<%--&lt;%&ndash;    <div class="alphared" style="font-size: 200%">&ndash;%&gt;--%>
<%--&lt;%&ndash;        <font class="whitetext" align="center"> List of Available&ndash;%&gt;--%>
<%--&lt;%&ndash;            Flights </font>&ndash;%&gt;--%>
<%--&lt;%&ndash;    </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;    <table margin=50px class="whitetext">&ndash;%&gt;--%>


<%--&lt;%&ndash;        &lt;%&ndash;%>--%>

<%--&lt;%&ndash;            List<FlightInfo> flight=(List<FlightInfo>) request.getAttribute("flightlist");&ndash;%&gt;--%>
<%--&lt;%&ndash;            if (flight != null && flight.size() > 0) {&ndash;%&gt;--%>
<%--&lt;%&ndash;                Iterator<FlightInfo> iter = flight.iterator();&ndash;%&gt;--%>
<%--&lt;%&ndash;                while (iter.hasNext()) {&ndash;%&gt;--%>
<%--&lt;%&ndash;                    /* session.removeAttribute("PDFBOOK"); */&ndash;%&gt;--%>

<%--&lt;%&ndash;                    FlightInfo f = iter.next();&ndash;%&gt;--%>
<%--&lt;%&ndash;                    //byte[] image = books.getImage();&ndash;%&gt;--%>
<%--&lt;%&ndash;                    //session.setAttribute("key", image);&ndash;%&gt;--%>
<%--&lt;%&ndash;                    /* session.removeAttribute("key"); */&ndash;%&gt;--%>
<%--&lt;%&ndash;    %>&ndash;%&gt;--%>
<%--&lt;%&ndash;        <thead>&ndash;%&gt;--%>
<%--&lt;%&ndash;        <tr>&ndash;%&gt;--%>
<%--&lt;%&ndash;            <th><h3></h3></th>&ndash;%&gt;--%>
<%--&lt;%&ndash;            <th><h3>Flight ID</h3></th>&ndash;%&gt;--%>
<%--&lt;%&ndash;            <th><h3>Source</h3></th>&ndash;%&gt;--%>
<%--&lt;%&ndash;            <th><h3>Destination</h3></th>&ndash;%&gt;--%>
<%--&lt;%&ndash;            <th><h3>Service Provider</h3></th>&ndash;%&gt;--%>
<%--&lt;%&ndash;            <th><h3>Cost</h3></th>&ndash;%&gt;--%>
<%--&lt;%&ndash;            <th><h3>Seat</h3></th>&ndash;%&gt;--%>
<%--&lt;%&ndash;            <th><h3>Journey</h3></th>&ndash;%&gt;--%>
<%--&lt;%&ndash;            <th><h3>Departure time</h3></th>&ndash;%&gt;--%>
<%--&lt;%&ndash;        </tr>&ndash;%&gt;--%>

<%--&lt;%&ndash;        <tr>&ndash;%&gt;--%>
<%--&lt;%&ndash;            <td width="10%" align="center"><input type="radio"&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                  id="<%=f.getFlightid()%>" name="flight"&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                  value="<%=f.getFlightid()%>" /></td>&ndash;%&gt;--%>
<%--&lt;%&ndash;            <td width="10%" align="center"><%=f.getFlightid()%></td>&ndash;%&gt;--%>
<%--&lt;%&ndash;            <td width="10%" align="center"><%=f.getSource()%></td>&ndash;%&gt;--%>
<%--&lt;%&ndash;            <td width="10%" align="center"><%=f.getDestination()%></td>&ndash;%&gt;--%>
<%--&lt;%&ndash;            <td width="10%" align="center"><%=f.getService_provider()%></td>&ndash;%&gt;--%>
<%--&lt;%&ndash;            <td width="10%" align="center"><%=f.getTicket_cost()%></td>&ndash;%&gt;--%>
<%--&lt;%&ndash;            <td width="10%" align="center"><%=f.getSeat()%></td>&ndash;%&gt;--%>
<%--&lt;%&ndash;            <td width="10%" align="center"><%=f.getDeparture_date()%></td>&ndash;%&gt;--%>
<%--&lt;%&ndash;            <td width="10%" align="center"><%=f.getArrival_time()%></td>&ndash;%&gt;--%>


<%--&lt;%&ndash;        </tr>&ndash;%&gt;--%>

<%--&lt;%&ndash;        &lt;%&ndash;%>--%>
<%--&lt;%&ndash;            }&ndash;%&gt;--%>
<%--&lt;%&ndash;        %>&ndash;%&gt;--%>

<%--&lt;%&ndash;        <tr align="right">&ndash;%&gt;--%>

<%--&lt;%&ndash;            <td width="10%" align="center"><input class="button1"&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                  type="submit" name="Submit" value="Book Flight" /></td>&ndash;%&gt;--%>
<%--&lt;%&ndash;        </tr>&ndash;%&gt;--%>



<%--&lt;%&ndash;        &lt;%&ndash;%>--%>
<%--&lt;%&ndash;        } else {&ndash;%&gt;--%>
<%--&lt;%&ndash;        %>&ndash;%&gt;--%>

<%--&lt;%&ndash;        <tr align="center">&ndash;%&gt;--%>
<%--&lt;%&ndash;            <td align="center" colspan="4"><font style="font-size: large;">&ndash;%&gt;--%>
<%--&lt;%&ndash;                <b> No flights found</b>&ndash;%&gt;--%>
<%--&lt;%&ndash;            </font></td>&ndash;%&gt;--%>
<%--&lt;%&ndash;        </tr>&ndash;%&gt;--%>

<%--&lt;%&ndash;        &lt;%&ndash;%>--%>
<%--&lt;%&ndash;            }&ndash;%&gt;--%>
<%--&lt;%&ndash;        %>&ndash;%&gt;--%>
<%--&lt;%&ndash;        </thead>&ndash;%&gt;--%>

<%--&lt;%&ndash;    </table>&ndash;%&gt;--%>
<%--&lt;%&ndash;</form>&ndash;%&gt;--%>



<%--</div>--%>


<%--</body>--%>
<%--</html>--%>
