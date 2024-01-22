package com.example.reservation_airplan;

import java.io.*;
import java.util.Date;
import java.util.List;

import Dao.VolDAO;
import Model.Reservation;
import Model.Utilisateur;
import Model.Vol;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.hibernate.SessionFactory;


// RechercheVolsServlet.java
public class RechercheVolsServlet extends HttpServlet {
    private VolDAO volDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        // SessionFactory sessionFactory = (SessionFactory) getServletContext().getAttribute("hibernateSessionFactory");
        volDAO = new VolDAO();

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtenez l'utilisateur authentifié depuis la session

        HttpSession session = request.getSession();
        Utilisateur utilisateur = (Utilisateur) session.getAttribute("authenticatedUser");
System.out.println(utilisateur);
        if (utilisateur != null) {
            try {


                RequestDispatcher dispatcher = request.getRequestDispatcher("/HomPage.jsp");
                    dispatcher.forward(request, response);
                    System.out.println("Forwarding to HomePage.jsp");

            } catch (Exception e) {
                throw new ServletException("Erreur lors de la recherche des vols : " + e.getMessage(), e);
            }
        } else {
            // L'utilisateur n'est pas authentifié, rediriger vers la page de login
            RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
            dispatcher.forward(request, response);
        }
    }
}
