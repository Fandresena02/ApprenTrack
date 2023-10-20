package fr.efrei.apptrack.model;

import jakarta.persistence.*;

@Entity
@Table(name = "entreprise", schema = "apprentrackbdd")

@NamedQueries(
        {
                @NamedQuery(name = "recupererToutesLesEntreprises", query = "Select e from Entreprise e")
                , @NamedQuery(name = "recupererUneEntreprise", query = "SELECT e FROM Entreprise e WHERE e.idEntreprise = :id")
                , @NamedQuery(name = "recupererEntrepriseParSonNom", query = "SELECT e FROM Entreprise e WHERE e.raisonSocial = :nom")
                , @NamedQuery(name = "supprimerEntreprise", query = "DELETE from Entreprise e WHERE e.idEntreprise = :id")
        }
)
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
public class Entreprise {
    @Id
    @Column(name = "idEntreprise", nullable = false)
    private int idEntreprise;
    @Column(name = "raisonSocial", nullable = true, length = 25)
    private String raisonSocial;
    @Column(name = "adresse", nullable = true, length = 25)
    private String adresse;
    @Column(name = "informations", nullable = true, length = 25)
    private String informations;

    // Getters and setters for the fields

    public int getIdEntreprise() {
        return idEntreprise;
    }

    public void setIdEntreprise(int idEntreprise) {
        this.idEntreprise = idEntreprise;
    }

    public String getRaisonSocial() {
        return raisonSocial;
    }

    public void setRaisonSocial(String raisonSocial) {
        this.raisonSocial = raisonSocial;
    }

    public String getAdresse() {
        return adresse;
    }

    public void setAdresse(String adresse) {
        this.adresse = adresse;
    }

    public String getInformations() {
        return informations;
    }

    public void setInformations(String informations) {
        this.informations = informations;
    }
}
