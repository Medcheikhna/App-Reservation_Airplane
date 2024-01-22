package com.example.reservation_airplan;

import Dao.UtilisateurDao;
import Model.Utilisateur;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import org.mindrot.jbcrypt.BCrypt;

public class SignUpServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private UtilisateurDao utilisateurDao;

    @Override
    public void init() throws ServletException {
        super.init();
        utilisateurDao = new UtilisateurDao();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Récupération des paramètres du formulaire
        String nomUtilisateur = request.getParameter("nomUtilisateur");
        String motDePasse = request.getParameter("motDePasse");
        String confirmerMotDePasse = request.getParameter("confirmerMotDePasse");

        // Vérification si l'utilisateur existe déjà
        if (utilisateurDao.rechercherUtilisateurParNom(nomUtilisateur) != null) {
            // Gestion des erreurs (utilisateur déjà existant)
            response.sendRedirect("signup.jsp?error=already exit this username");
        } else if (!motDePasse.equals(confirmerMotDePasse)) {
            // Gestion des erreurs (mot de passe et confirmation ne correspondent pas)
            response.sendRedirect("signup.jsp?error=password and ConfirmPassword is not compatible ");
        } else  if (motDePasse.length() < 4 || motDePasse.length() > 10) {
            // Gestion des erreurs (longueur du mot de passe incorrecte)
            response.sendRedirect("signup.jsp?error=length should be between 4 and 10");

        }else  {

            String motDePasseHache = BCrypt.hashpw(motDePasse, BCrypt.gensalt());
          //  String confirmDePasseHache = BCrypt.hashpw(confirmerMotDePasse, BCrypt.gensalt());

            // Création d'un objet Utilisateur
            Utilisateur utilisateur = new Utilisateur();
            utilisateur.setNomUtilisateur(nomUtilisateur);
            utilisateur.setMotDePasse(motDePasseHache);
        //    utilisateur.setConFirmModPass(confirmDePasseHache);

            // Enregistrement de l'utilisateur dans la base de données
            utilisateurDao.ajouterUtilisateur(utilisateur);

            // Enregistrement de l'utilisateur dans la session
            HttpSession session = request.getSession(true);
            session.setAttribute("utilisateur", utilisateur);

            // Redirection vers la page d'accueil (ou autre page)
            RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
            dispatcher.forward(request, response);
        }
    }
}
