package Dao;

import Model.Vol;
import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.CriteriaQuery;
import jakarta.persistence.criteria.Predicate;
import jakarta.persistence.criteria.Root;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;


import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

// VolDAO.java
public class VolDAO {
     SessionFactory sessionFactory;

    public VolDAO() {
        try {
            // Initialize Hibernate configuration
            Configuration configuration = new Configuration();
            configuration.configure("hibernate.cfg.xml"); // Adjust the filename as per your configuration

            // Build the SessionFactory
            sessionFactory = configuration.buildSessionFactory();
        } catch (Exception e) {
            e.printStackTrace();
            // Handle initialization exception
        }
    }

    public List<Vol> rechercherVols(String destination, Date date,String depart) {
        try (Session session = sessionFactory.openSession()) {
            CriteriaBuilder builder = session.getCriteriaBuilder();
            CriteriaQuery<Vol> query = builder.createQuery(Vol.class);
            Root<Vol> root = query.from(Vol.class);

            Predicate predicate = builder.and(
                    builder.equal(root.get("destination"), destination),
                    builder.equal(root.get("date"), date),
                    builder.equal(root.get("depart"), depart)
            );

            query.where(predicate);

            return (List<Vol>) session.createQuery(query).getResultList();
        } catch (Exception e) {
            e.printStackTrace();
            return Collections.emptyList();
        }
    }
    public List<String> getDistinctVillesDepart() {
        List<String> villesDepart = new ArrayList<>();

        try (Session session = sessionFactory.openSession()) {
            // Utilisez une requête SQL pour récupérer distinctement les valeurs de la colonne "depart"
            String sqlQuery = "SELECT DISTINCT depart FROM Vol";
            villesDepart = session.createQuery(sqlQuery).list();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return villesDepart;
    }


    public List<String> getDistinctVillesDestination() {
        List<String> villesDestination = new ArrayList<>();

        try (Session session = sessionFactory.openSession()) {
            // Utilisez une requête SQL pour récupérer distinctement les valeurs de la colonne "destination"
            String sqlQuery = "SELECT DISTINCT destination FROM Vol";
            villesDestination = session.createQuery(sqlQuery).list();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return villesDestination;
    }

}
