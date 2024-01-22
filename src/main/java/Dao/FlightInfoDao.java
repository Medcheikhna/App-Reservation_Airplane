package Dao;

import Model.FlightInfo;
import Model.Reservation;
import Model.Utilisateur;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.ArrayList;
import java.util.List;

public class FlightInfoDao {


    public List<FlightInfo> getFlightInfo() {
        List<FlightInfo> listFlightInfo = new ArrayList<>();

        try (Session session = HibernateUtil.getSession()) {
            // Utilisez une requête SQL pour récupérer distinctement les valeurs de la colonne "depart"
            String sqlQuery = "FROM FlightInfo ";
            listFlightInfo = session.createQuery(sqlQuery).list();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return listFlightInfo;
    }


    public void ajouterFlightInfo(FlightInfo flightInfo) {
        Transaction transaction = null;
        Session session = null;
        try {
            session = HibernateUtil.getSession();
            transaction = session.beginTransaction();
            session.save(flightInfo);
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

    public List<FlightInfo> searchFlights(String from, String to, String departure) {
        Transaction transaction = null;
        Session session = null;
        try{ session =HibernateUtil.getSession()  ;
            transaction = session.beginTransaction();

            String hql = "from FlightInfo where source = :from and destination = :to and journey_date = :departure";
            List<FlightInfo> flightList = session.createQuery(hql, FlightInfo.class)
                    .setParameter("from", from)
                    .setParameter("to", to)
                    .setParameter("departure", departure)
                    .list();

            transaction.commit();

            return flightList;
        } catch (Exception e) {
            e.printStackTrace();

            }
            return null;
        }



        // ... Autres méthodes




}






