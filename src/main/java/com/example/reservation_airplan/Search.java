package com.example.reservation_airplan;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/Search")
public class Search extends HttpServlet {


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String time = request.getParameter("time");
        String flightIds = request.getParameter("flightIds");
//        String flightInfos = request.getParameter("flightInfos");
        String sources = request.getParameter("sources");
        String destinations = request.getParameter("destinations");
        System.out.println("Flight Booked ::" + flightIds );
        System.out.println("Flight Booked ::" + sources );
        System.out.println("Flight Booked ::" + time );
        System.out.println("Flight Booked ::" + destinations );

        HttpSession sess=request.getSession();
        sess.setAttribute("time", time);
        sess.setAttribute("flightIds", flightIds);
        sess.setAttribute("sources", sources);
        sess.setAttribute("destinations", destinations);
        RequestDispatcher rd= request.getRequestDispatcher("/index.jsp");
        rd.forward(request, response);

    }
}
