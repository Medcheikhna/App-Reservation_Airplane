package Dao;

import Model.Utilisateur;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.mindrot.jbcrypt.BCrypt;

import java.util.List;

public class UtilisateurDao {
    // Méthode pour ajouter un utilisateur à la base de données
    public void ajouterUtilisateur(Utilisateur utilisateur) {
        Transaction transaction = null;
        Session session = null;
        try {
            session = HibernateUtil.getSession();
            transaction = session.beginTransaction();
            session.save(utilisateur);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            if (session != null && session.isOpen()) {
                session.close();
            }
        }
    }


    // Méthode pour rechercher un utilisateur par nom d'utilisateur
    public Utilisateur rechercherUtilisateurParNom(String nomUtilisateur) {
        try (Session session = HibernateUtil.getSession()) {
            return session.createQuery("FROM Utilisateur WHERE nomUtilisateur = :nomUtilisateur", Utilisateur.class)
                    .setParameter("nomUtilisateur", nomUtilisateur)
                    .uniqueResult();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public Utilisateur authentifierUtilisateur(String nomUtilisateur, String motDePasse) {
        Transaction transaction = null;
        Utilisateur utilisateur = null;

        try (Session session = HibernateUtil.getSession()) {
            transaction = session.beginTransaction();

            // Requête pour récupérer l'utilisateur en fonction du nom d'utilisateur
            Query<Utilisateur> query = session.createQuery("FROM Utilisateur WHERE nomUtilisateur = :nomUtilisateur", Utilisateur.class);
            query.setParameter("nomUtilisateur", nomUtilisateur);

            utilisateur = query.uniqueResult();

            // Si l'utilisateur existe, vérifiez le mot de passe
            if (utilisateur != null && BCrypt.checkpw(motDePasse, utilisateur.getMotDePasse())) {
                transaction.commit();
            } else {
                utilisateur = null;
                transaction.rollback();
            }
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }

        return utilisateur;
    }

}
