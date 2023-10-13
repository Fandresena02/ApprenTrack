package fr.efrei.apptrack.model;

public class Visite {
    private Date dateVisite;
    private String format;
    private String compteRenduExpress;
    private int idPersonne;

    // Getters and setters for the fields

    public Date getDateVisite() {
        return dateVisite;
    }

    public void setDateVisite(Date dateVisite) {
        this.dateVisite = dateVisite;
    }

    public String getFormat() {
        return format;
    }

    public void setFormat(String format) {
        this.format = format;
    }

    public String getCompteRenduExpress() {
        return compteRenduExpress;
    }

    public void setCompteRenduExpress(String compteRenduExpress) {
        this.compteRenduExpress = compteRenduExpress;
    }

    public int getIdPersonne() {
        return idPersonne;
    }

    public void setIdPersonne(int idPersonne) {
        this.idPersonne = idPersonne;
    }
}
