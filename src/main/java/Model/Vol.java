package Model;

import jakarta.persistence.*;

import java.util.Date;
@Entity
@Table(name = "vol")
public class Vol {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idVol;
    private String destination;
    private Date date;
    private String siege;

    public String getDepart() {
        return depart;
    }

    public void setDepart(String depart) {
        this.depart = depart;
    }

    private String depart;


    public Vol() {
    }

    public Vol(int idVol, String destination, Date date, String siege) {
        this.idVol = idVol;
        this.destination = destination;
        this.date = date;
        this.siege = siege;
    }

    public int getIdVol() {
        return idVol;
    }

    public void setIdVol(int idVol) {
        this.idVol = idVol;
    }

    public String getDestination() {
        return destination;
    }

    public void setDestination(String destination) {
        this.destination = destination;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getSiege() {
        return siege;
    }

    public void setSiege(String siege) {
        this.siege = siege;
    }

}
