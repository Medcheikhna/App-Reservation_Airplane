<%--
  Created by IntelliJ IDEA.
  User: Mohamed
  Date: 1/3/2024
  Time: 2:05 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page import="Model.Reservation" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="Model.FlightInfo" %>
<%@ page import="Dao.FlightInfoDao" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="Model.Utilisateur" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Ticket de Réservation</title>
    <!-- Ajoutez ici vos styles CSS pour le ticket -->
    <style>
        /* Exemple de styles pour le ticket */
        body {
            font-family: Arial, sans-serif;
        }
        .ticket {
            border: 1px solid #ccc;
            padding: 20px;
            margin: 20px auto;
            max-width: 600px;
        }
        .ticket-info {
            margin-bottom: 15px;
        }
    </style>
    <script>
        function printDiv() {
            var body = document.getElementById("body").innerHTML;
            var ticket = document.getElementById("ticket").innerHTML;
            document.getElementById("body").innerHTML = ticket;
            window.print();
            document.getElementById("body").innerHTML = body;

        }
    </script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body class="d-flex flex-column min-vh-100" id="body">
<div class="container mt-5" id="ticket">
<form action="annulerReservation" method="post">
        <div class="card">
            <div class="card-header">
                Booking Information
            </div>
            <% Utilisateur utilisateur = (Utilisateur) session.getAttribute("authenticatedUser"); %>
            <% if (utilisateur != null) { %>
            <h2>Bienvenue, <%= utilisateur.getNomUtilisateur() %>!</h2>
            <%-- Autres contenus pour un utilisateur authentifié --%>
            <% } else { %>
            <p>Vous n'êtes pas authentifié. Redirection vers la page de login...</p>

            <% } %>
            <%  request.setAttribute("authenticatedUser",utilisateur); %>
<% String flightIds=(String)  session.getAttribute("flightId");
    String destinations=(String)  session.getAttribute("destinations");
    String sources=(String)  session.getAttribute("sources");
    String time=(String)  session.getAttribute("time");
//   request.setAttribute("flightIds",flightIds);
%>

<input type="hidden" name="flightIds" id="flightIds" value="<%=flightIds%>">
      <input type="hidden" name="utilisateur" id="utilisateur" value="<%=utilisateur.getIdUtilisateur()%>">
            <div class="card-body">
                <h5 class="card-title">Nom for passanger</h5>
                <p class="card-text"><%=utilisateur.getNomUtilisateur()%></p>
                <h5 class="card-title">Departure City</h5>
                <p class="card-text"><%=sources%></p>
                <div class="arrow-icon">&#8594;</div>
                <h5 class="card-title">Arrival City</h5>
                <p class="card-text"><%=destinations%></p>
                <h5 class="card-title">Time for travel</h5>
                <p class="card-text"><%=time%></p>
                <h5 class="card-title">Number for flight</h5>
                <p class="card-text"><%=flightIds%></p>
            </div>

            <div class="card-footer text-muted">
                <button onclick="printDiv()" class="btn btn-primary">Print your Ticket now</button>
            </div>
            <div class="card-footer text-muted">
                <button type="submit" class="btn btn-danger" name="cancelReservation" id="cancelReservation">Cancel Reservation</button>
            </div>




        </div>
</form>
</div>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>


</body>
</html>
