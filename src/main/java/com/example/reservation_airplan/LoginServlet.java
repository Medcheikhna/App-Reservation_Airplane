package com.example.reservation_airplan;

import Dao.FlightInfoDao;
import Dao.ReservationDao;
import Dao.UtilisateurDao;
import Model.Reservation;
import Model.Utilisateur;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.Arrays;

// LoginServlet.java
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private UtilisateurDao utilisateurDao;
    private  ReservationDao reservationDao;
    @Override
    public void init() throws ServletException {
        super.init();
        utilisateurDao = new UtilisateurDao();
        reservationDao=new ReservationDao();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nomUtilisateur = request.getParameter("nomUtilisateur");
        String motDePasse = request.getParameter("motDePasse");

       // String destinations = request.getParameter("destinations");
        System.out.println("//========================//");
       // System.out.println(flightIds);


        System.out.println("//========================//");
        utilisateurDao = new UtilisateurDao();
        // Authentifier l'utilisateur et obtenir l'objet Utilisateur
        Utilisateur utilisateur = utilisateurDao.authentifierUtilisateur(nomUtilisateur, motDePasse);
        System.out.println(utilisateur);
        ReservationDao reservationDao =new ReservationDao();
//        HttpSession session = request.getSession();
//        session.setAttribute("authenticatedUser", utilisateur);
        if (utilisateur != null && utilisateur.isAdmin()) {
            // Utilisateur authentifié, rediriger vers la page d'accueil
            // Après une authentification réussie
            boolean isAdmin = utilisateur.isAdmin();
            request.getSession().setAttribute("is_admin", isAdmin);

            RequestDispatcher dispatcher = request.getRequestDispatcher("/HomPage.jsp");
            dispatcher.forward(request, response);}
            else if (utilisateur !=null){

// Recuperer les donner de Booking de visiteur

            HttpSession sess=request.getSession();
//je stocke les donner dans des variable par getAttribute pour etre capable de reitiliser
          String flightIds = (String) sess.getAttribute("flightIds");
            String sources = (String) sess.getAttribute("sources");
            String destinations = (String) sess.getAttribute("destinations");
            String time = (String) sess.getAttribute("time");

            sess.setAttribute("flightId",flightIds);
            sess.setAttribute("time",time);
            sess.setAttribute("sources",sources);
            sess.setAttribute("destinations",destinations);
//ajouter la reservation par l'id utilisateur et idFlight
            Reservation R=new Reservation();

            Long idUtilisateur   =  utilisateur.getIdUtilisateur();
            System.out.println("===============================");
            System.out.println(idUtilisateur);
        R.setFlightid(Long.parseLong(flightIds));
        R.setIdUtilisateur(idUtilisateur);
        reservationDao.addReservation(R,request,response);
        //=====find ajouter la reservation =========


            HttpSession session = request.getSession();
            session.setAttribute("authenticatedUser", utilisateur);
System.out.println(utilisateur);
//      String flyt=(String)request.getAttribute(myFlyList);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/payment.jsp");
            dispatcher.forward(request, response);
            System.out.println("Forwarding to Ticket.jsp");

        } else


        {
            // Authentification échouée, rediriger vers la page de login avec un message d'erreur
            request.setAttribute("erreurLogin", "Nom d'utilisateur ou mot de passe incorrect");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
            dispatcher.forward(request, response);
            System.out.println(utilisateur);
        }
    }





    private boolean validerMotDePasse(String motDePasse) {
        // Ajoutez vos propres critères de validation pour le mot de passe
        return motDePasse.length() >= 4 && motDePasse.length() <= 10;
    }
}