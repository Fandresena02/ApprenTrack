package fr.efrei.apptrack.model;
import jakarta.persistence.*;

import java.util.Objects;

@Entity
@Table(name = "apprenti", schema = "apprenti")

@NamedQueries(
        {
                @NamedQuery(name = "recupererTousLesApprentis", query = "Select a from Apprenti a")
                , @NamedQuery(name = "recupererUnApprenti", query = "SELECT a FROM Apprenti a WHERE a.idPersonne = :id")
                , @NamedQuery(name = "recupererApprentiParSonNom", query = "SELECT a FROM Apprenti a WHERE a.nom = :nom")
                , @NamedQuery(name = "supprimerApprenti", query = "DELETE from Apprenti a WHERE a.idPersonne = :id")
        }
)
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
public class Apprenti extends Personne {

    @Column(name = "anneeAcademique", nullable = true)
    private int anneeAcademique;
    @Column(name = "majeure", nullable = true, length = 25)
    private String majeure;
    @Column(name = "programme", nullable = true, length = 25)
    private String programme;
    @Id
    @Column(name = "idPersonne", nullable = false)
    private int idPersonne;
    @Column(name = "idEntreprise", nullable = false)
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
