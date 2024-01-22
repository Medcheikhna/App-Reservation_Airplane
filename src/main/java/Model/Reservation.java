package Model;

import jakarta.persistence.*;

@Entity
@Table(name = "reservation")
public class Reservation {
@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idReservation;
@JoinColumn
    private Long idUtilisateur;



    @JoinColumn
  private  long flightid;
    @Transient
    private int idVol;



    @Column
private String status;
    public Reservation() {
    }



    public Reservation(int idReservation, Long idUtilisateur, long flightid, int idVol,String status) {
        this.idReservation = idReservation;
        this.idUtilisateur = idUtilisateur;
        this.flightid = flightid;
        this.idVol = idVol;
        this.status = status;

    }

    public int getIdReservation() {
        return idReservation;
    }

    public void setIdReservation(int idReservation) {
        this.idReservation = idReservation;
    }

    public Long getIdUtilisateur() {
        return idUtilisateur;
    }

    public void setIdUtilisateur(Long idUtilisateur) {
        this.idUtilisateur = idUtilisateur;
    }
    public long getFlightid() {
        return flightid;
    }

    public void setFlightid(long flightid) {
        this.flightid = flightid;
    }


    public int getIdVol() {
        return idVol;
    }

    public void setIdVol(int idVol) {
        this.idVol = idVol;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
//    public void setAnnulee(boolean annulee) {
//        this.annulee = annulee;
//    }
}
