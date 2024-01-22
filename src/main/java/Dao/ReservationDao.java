package Dao;

import Model.Reservation;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.transaction.SystemException;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.util.List;

public class ReservationDao {


    public void addReservation(Reservation reservation, HttpServletRequest request, HttpServletResponse response) {
        Transaction transaction = null;
        Session session = null;
        try {
            session = HibernateUtil.getSession();
            // Commencer une transaction
            transaction = session.beginTransaction();

            // Vérifier si une réservation existe déjà pour cet utilisateur et ce vol
            Query<Long> existingReservationQuery = session.createQuery(
                    "SELECT COUNT(*) FROM Reservation WHERE idUtilisateur = :userId AND flightid = :flightId "
            );
            existingReservationQuery.setParameter("userId", reservation.getIdUtilisateur());
            existingReservationQuery.setParameter("flightId", reservation.getFlightid());


            Long existingReservationCount = existingReservationQuery.uniqueResult();

            if (existingReservationCount == 0) {
                // Aucune réservation existante, ajouter la nouvelle réservation
                session.save(reservation);
                if (reservation != null) {
                    // Update the reservation status or perform other logic
                    reservation.setStatus("Reserve"); // Set to your appropriate status
                    session.update(reservation);
                }
                // Valider la transaction
                transaction.commit();
            } else {
                // Une réservation existe déjà, vous pouvez gérer cela en lançant une exception ou en faisant autre chose
                request.setAttribute("reservationMessage", "L'utilisateur a déjà réservé pour ce vol.");

                // Redirigez vers la page de Booking.jsp pour montrer l'erreur
                RequestDispatcher dispatcher = request.getRequestDispatcher("/BookingPage.jsp");
                dispatcher.forward(request, response);
            }
        } catch (Exception e) {
            if (transaction != null && transaction.isActive()) {
                // Rollback seulement si la transaction est active
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            if (session != null && session.isOpen()) {
                // Fermer la session si elle est ouverte
                session.close();
            }
        }
    }

    public void annulerReservation(String userId, String flightId) {
        Transaction transaction = null;
        Session session = null;
        try {
            session = HibernateUtil.getSession();

            transaction = session.beginTransaction();
            Query<Reservation> query = session.createQuery(
                    "FROM Reservation WHERE idUtilisateur = :userId AND flightid = :flightId",
                    Reservation.class
            );

            query.setParameter("userId", userId);
            query.setParameter("flightId", flightId);
            List<Reservation>  reservation = query.getResultList();

            if (reservation.size() ==1) {
                Reservation reservation1=reservation.get(0);
                // Update the reservation status or perform other cancellation logic
                reservation1.setStatus("ANNULÉ"); // Set to your appropriate status
                session.update(reservation1);
            } else if (reservation.isEmpty()) {
                System.out.println("No reservation found for userId :" + userId + "and flightId: " + flightId);
            }else {
                System.out.println("Multiple reservation found for userId: " + userId + " and flightId: " + flightId) ;
            }

            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }
}





