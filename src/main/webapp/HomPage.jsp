<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="Model.Vol" %>
<%@ page import="Model.Utilisateur" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Dao.VolDAO" %>

<!DOCTYPE html>
<html>
<head>
    <title>Recherche de Vols</title>
    <!-- Ajoutez ces lignes dans la section <head> de votre fichier rechercheVols.jsp -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</head>
<!-- Utilisez Bootstrap dans votre formulaire de recherche -->
<% Boolean isAdmin = (Boolean) session.getAttribute("is_admin"); %>
<% if (isAdmin != null && isAdmin) { %>
<p>Welcome, Admin!</p>
<% } else { %>
<p>Welcome, User!</p>
<% } %>
<p>This is your application's main page after a successful login.</p>

<%-- Récupération de l'utilisateur depuis la session --%>
<%--<% Utilisateur utilisateur = (Utilisateur) session.getAttribute("authenticatedUser"); %>--%>

<%--&lt;%&ndash; Vérification de l'authentification &ndash;%&gt;--%>
<%--<% if (utilisateur != null) { %>--%>
<%--<h2>Bienvenue, <%= utilisateur.getNomUtilisateur() %>!</h2>--%>
<%--&lt;%&ndash; Autres contenus pour un utilisateur authentifié &ndash;%&gt;--%>
<%--<% } else { %>--%>
<%--<p>Vous n'êtes pas authentifié. Redirection vers la page de login...</p>--%>
<%--<% response.sendRedirect("index.jsp"); %>--%>
<%--<% } %>--%>
<%
    VolDAO    volDAO = new VolDAO();
    List<String> villesDepart = volDAO.getDistinctVillesDepart();
    List<String> villesDestination = volDAO.getDistinctVillesDestination();
    request.setAttribute("villesDepart", villesDepart);
    request.setAttribute("villesDestination", villesDestination);

%>
<body class="container">
<h2 class="mt-5">Recherche de Vols</h2>
<form action="RechercheVolsServlet" method="get" class="mt-3">
    <input type="hidden" name="action" value="Recuperate">
    <div class="form-group">
        <label for="destination">Destination:</label>
        <select class="form-control" id="destination" name="destination" required>


            <% List<String> villesDes = (List<String>) request.getAttribute("villesDestination");
                if (villesDes != null) {
                    for (String ville : villesDes) { %>
            <option value="<%= ville %>"><%= ville %></option>
            <%    }
            } else {
                // Gérer le cas où la liste est null (éventuellement afficher un message d'erreur)
                System.out.println("La liste villesDestination est null.");
            }
            %>
        </select>
    </div>
    <div class="form-group">
        <label for="destination">Poit de depart:</label>
        <select class="form-control" id="depart" name="depart" required>

            <% List<String> villesDep = (List<String>) request.getAttribute("villesDepart");
                if (villesDep != null) {
                    for (String ville : villesDep) { %>
            <option value="<%= ville %>"><%= ville %></option>
            <%    }
            } else {
                // Gérer le cas où la liste est null (éventuellement afficher un message d'erreur)
                System.out.println("La liste villes de depart est null.");
            }
            %>
        </select>
    </div>

    <div class="form-group">
        <label for="date">Date:</label>
        <input type="date" class="form-control" id="date" name="date">
    </div>

    <div class="form-check">
        <input type="radio" class="form-check-input" id="allerSimple" name="typeReservation" value="allerSimple" checked>
        <label class="form-check-label" for="allerSimple">Aller Simple</label>
    </div>
    <div class="form-check">
        <input type="radio" class="form-check-input" id="allerRetour" name="typeReservation" value="allerRetour">
        <label class="form-check-label" for="allerRetour">Aller-Retour</label>
    </div>

    <button type="submit" name="action" value="rechercherVols">Rechercher</button>
</form>
</body>

</html>
