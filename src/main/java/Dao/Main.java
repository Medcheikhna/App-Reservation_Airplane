package Dao;

import Model.Reservation;
import Model.Utilisateur;
import Model.Vol;
import jakarta.transaction.SystemException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import java.util.List;

public class Main {

    public static void main(String[] args) throws SystemException {
        UtilisateurDao utilisateurDao = new UtilisateurDao();
        VolDAO volDAO = new VolDAO();
FlightInfoDao fl=new FlightInfoDao();
ReservationDao reservationDao=new ReservationDao();
String idFlight= String.valueOf(5);
String idUser= String.valueOf(9);
        Reservation R=new Reservation();
        R.setFlightid(Long.parseLong(idFlight));
        R.setIdUtilisateur(Long.valueOf(idUser));
//        reservationDao.addReservation(R);

        // Remplacez ces valeurs par des valeurs réelles pour les tests
//        String nomUtilisateurTest = "sidi";
//        String motDePasseTest = "1234";
//
//        Utilisateur utilisateur = utilisateurDao.authentifierUtilisateur(nomUtilisateurTest, motDePasseTest);
//
//        if (utilisateur != null) {
//            System.out.println("L'utilisateur est authentifié avec succès.");
//            System.out.println("Nom d'utilisateur : " + utilisateur.getNomUtilisateur());
//            // Affichez d'autres propriétés de l'utilisateur si nécessaire
//        } else {
//            System.out.println("Échec de l'authentification. Veuillez vérifier les informations de connexion.");
//        }
//    }
//        List villesDepart = volDAO.getDistinctVillesDepart();
//        List villesDestination = volDAO.getDistinctVillesDestination();
//        System.out.println(villesDepart );
////
//        List listFI=fl.searchFlights("Nema","Zwe","2024-02-29");
//        System.out.println(listFI);


    }
}

