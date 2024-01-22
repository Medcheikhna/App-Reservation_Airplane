package com.example.reservation_airplan;

import Dao.ReservationDao;
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

@WebServlet("/annulerReservation")
public class annulerReservation  extends HttpServlet {
ReservationDao reservationDao;
    public void init() throws ServletException {
        super.init();
        reservationDao = new ReservationDao();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Check if the cancelReservation parameter is present in the request
        if (request.getParameter("cancelReservation") != null) {
            // Perform the reservation cancellation logic
            annulerReservation(request, response);
        } else {
            // Handle other cases or redirect as needed
            RequestDispatcher dispatcher = request.getRequestDispatcher("/Ticket.jsp");
            dispatcher.forward(request, response); // Redirect to the home page for example
        }
    }

    private void annulerReservation(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the authenticated user from the session
        HttpSession session = request.getSession();
       String utilisateur=request.getParameter("utilisateur");
        System.out.println("///////User in servelt anuuler////////");
       System.out.println(utilisateur);
        if (utilisateur != null) {
            HttpSession sess=request.getSession();
            // Get other necessary parameters for canceling the reservation
            String flightIds = request.getParameter("flightIds");
            System.out.println("///////flightIds in servelt anuuler////////");// Adjust as needed
            System.out.println(flightIds);
            System.out.println("///////flightIds in servelt anuuler////////");
            //  Reservation reservation =new Reservation();
           // reservation.setFlightid(Long.parseLong(flightIds));
            // Perform the cancellation logic using your ReservationDao
            reservationDao.annulerReservation(utilisateur, flightIds);

            // Redirect to a success page or display a confirmation message
            RequestDispatcher dispatcher = request.getRequestDispatcher("/HomePage_1.jsp");
            dispatcher.forward(request, response); // Redirect to a success page
        }
    }

}
