package fr.efrei.apptrack.model;

public class Apprenti {
    private int anneeAcademique;
    private String majeure;
    private String programme;
    private int idPersonne;
    private int idEntreprise;

    // Getters and setters for the fields

    public int getAnneeAcademique() {
        return anneeAcademique;
    }

    public void setAnneeAcademique(int anneeAcademique) {
        this.anneeAcademique = anneeAcademique;
    }

    public String getMajeure() {
        return majeure;
    }

    public void setMajeure(String majeure) {
        this.majeure = majeure;
    }

    public String getProgramme() {
        return programme;
    }

    public void setProgramme(String programme) {
        this.programme = programme;
    }

    public int getIdPersonne() {
        return idPersonne;
    }

    public void setIdPersonne(int idPersonne) {
        this.idPersonne = idPersonne;
    }

    public int getIdEntreprise() {
        return idEntreprise;
    }

    public void setIdEntreprise(int idEntreprise) {
        this.idEntreprise = idEntreprise;
    }
}
