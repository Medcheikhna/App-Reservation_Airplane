package Dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateUtil {

    private static final SessionFactory sessionFactory;

    static {
        try {
            // Configuration d'Hibernate à partir du fichier hibernate.cfg.xml (ou d'une autre source de configuration)
            Configuration configuration = new Configuration();
            configuration.configure("hibernate.cfg.xml");

            // Construction de la SessionFactory
            sessionFactory = configuration.buildSessionFactory();
        } catch (Exception e) {
            throw new ExceptionInInitializerError("Initialisation de la SessionFactory échouée : " + e.getMessage());
        }
    }

    // Méthode pour obtenir une session Hibernate
    public static Session getSession() {
        return sessionFactory.openSession();
    }
}
