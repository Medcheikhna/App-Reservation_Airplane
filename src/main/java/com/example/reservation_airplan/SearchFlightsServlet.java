package com.example.reservation_airplan;

import Dao.FlightInfoDao;
import Dao.UtilisateurDao;
import Model.FlightInfo;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet("/SearchFlightsServlet")
public class SearchFlightsServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
private FlightInfoDao flightInfoDao;
    @Override
    public void init() throws ServletException {
        super.init();
       // utilisateurDao = new UtilisateurDao();
            flightInfoDao=new FlightInfoDao();
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher rd = request.getRequestDispatcher("/HomePage_1.jsp");

        String from = request.getParameter("from");
        String to = request.getParameter("to");
        String departure = request.getParameter("departure");
        String clas = request.getParameter("class");
        String adult = request.getParameter("adult");
        String child = request.getParameter("child");
        String srcitizen = request.getParameter("srcitizen");
        String miss = "";
System.out.println(departure);
        System.out.println(from);
        System.out.println(to);
//        String departureString = convertDateToString(departure);
        int members = 0, adu = 0, chi = 0, sr = 0;
        if (adult != null && !adult.isEmpty())
            adu = Integer.parseInt(adult);
        if (child != null && !child.isEmpty())
            chi = Integer.parseInt(child);
        if (srcitizen != null && !srcitizen.isEmpty())
            sr = Integer.parseInt(srcitizen);

        if (adu != 0) {
            members = adu;
            if (chi != 0 || sr != 0) {
                members += chi + sr;
            }
        }

        HttpSession sess = request.getSession();
        sess.setAttribute("member", members);

        if (from != null && !from.isEmpty() && to != null && !to.isEmpty() && clas != null && !clas.isEmpty()
                && departure != null && !departure.isEmpty() && adu != 0) {
            if (from.equalsIgnoreCase(to)) {
                miss = "source and destination can't be the same..";
                request.setAttribute("user", miss);
                rd.forward(request, response);

            } else {
                List<FlightInfo> flightList = flightInfoDao.searchFlights(from, to, departure);
          System.out.println(flightList);
                if (flightList != null && !flightList.isEmpty()) {


                    request.setAttribute("flightlist", flightList);
                    RequestDispatcher R = request.getRequestDispatcher("/BookingPage.jsp");
                    R.forward(request, response);

                } else {
                    miss = "No flights found for the specified criteria.";
                    request.setAttribute("user", miss);
                    rd.forward(request, response);

                }
            }
        } else {
            if (from == null || from.isEmpty()) {
                miss = "Enter Source";
            } else if (to == null || to.isEmpty()) {
                miss = "Enter Destination";
            } else if (from != null && to != null && from.equalsIgnoreCase(to)) {
                miss = "Source and destination can't be the same";
            } else if (departure == null || departure.isEmpty()) {
                miss = "Enter Departure";
            } else if (clas == null || clas.isEmpty()) {
                miss = "Enter class";
            } else if (adu == 0) {
                miss = "Enter number of Adults";
            }

            request.setAttribute("user", miss);
            rd.forward(request, response);

        }
    }
    private String convertDateToString(String date) {
        // Vous pouvez ajouter une logique supplémentaire ici si nécessaire
        return date;
    }
    }