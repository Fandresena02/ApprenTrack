package fr.efrei.apptrack.model;
import jakarta.persistence.*;

import java.io.Serializable;
import java.util.Objects;

@Entity
@Table(name = "apprenti", schema = "apprentrackbdd")

@NamedQueries(
        {
                @NamedQuery(name = "recupererTousLesApprentis", query = "SELECT a FROM Apprenti a where a.isArchive = false")
                , @NamedQuery(name = "recupererApprentisArchivés", query = "SELECT a FROM Apprenti a where a.isArchive = true")
                , @NamedQuery(name = "recupererUnApprenti", query = "SELECT a FROM Apprenti a WHERE a.idApprenti = :id")
                //, @NamedQuery(name = "recupererApprentiParSonNom", query = "SELECT a FROM Apprenti a WHERE a.nom = :nom")
                //, @NamedQuery(name = "supprimerApprenti", query = "DELETE from Apprenti a WHERE Personne.idPersonne = :id")
        }
)
public class Apprenti implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idApprenti", nullable = false)
    private int idApprenti;
    @Column(name = "nom", nullable = true, length = 25)
    private String nom;
    @Column(name = "prenom", nullable = true, length = 25)
    private String prenom;
    @Column(name = "email", nullable = true, length = 25)
    private String email;
    @Column(name = "telephone", nullable = true, length = 25)
    private String telephone;
    @Column(name = "anneeAcademique", nullable = true)
    private int anneeAcademique;
    @Column(name = "majeure", nullable = true, length = 25)
    private String majeure;
    @Column(name = "programme", nullable = true, length = 25)
    private String programme;
    @Column(name = "isArchive")
    private Boolean isArchive;

    public Apprenti(int idApprenti, String nom, String prenom, String email, String telephone, String majeure, int anneeAcademique, String programme) {
        this.idApprenti = idApprenti;
        this.nom = nom;
        this.prenom = prenom;
        this.email = email;
        this.telephone = telephone;
        this.majeure = majeure;
        this.anneeAcademique = anneeAcademique;
        this.programme = programme;
        this.isArchive = false;
    }

    public Apprenti() {

    }

    public Boolean getArchive() {
        return isArchive;
    }

    public void setArchive(Boolean archive) {
        isArchive = archive;
    }
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

    public int getIdApprenti() {
        return idApprenti;
    }

    public void setIdApprenti(int idApprenti) {
        this.idApprenti = idApprenti;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }
}
