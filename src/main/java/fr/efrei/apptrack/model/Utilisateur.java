package fr.efrei.apptrack.model;
import jakarta.persistence.*;

import java.io.Serializable;
import java.util.Objects;

@Entity
@Table(name = "utilisateur", schema = "apprentrackbdd")

@NamedQueries(
        {

                @NamedQuery(name = "recupererUnUtilisateur", query = "SELECT a FROM Utilisateur a WHERE a.identifiant = :identifiant AND a.motDePasse = :motDePasse")
        }
)
public class Utilisateur implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idUtilisateur")
    private int idUtilisateur;
    @Column(name = "identifiant", nullable = true, length = 25)
    private String identifiant;
    @Column(name = "motDePasse", nullable = true, length = 25)
    private String motDePasse;
    @Column(name = "estTuteur")
    private Boolean estTuteur;


    public Utilisateur(int idUtilisateur, String identifiant, String motDePasse, Boolean estTuteur) {
        this.idUtilisateur = idUtilisateur;
        this.identifiant = identifiant;
        this.motDePasse = motDePasse;
        this.estTuteur = estTuteur;
    }

    public Utilisateur() {

    }

    public int getIdUtilisateur() {
        return idUtilisateur;
    }

    public void setIdUtilisateur(int idUtilisateur) {
        this.idUtilisateur = idUtilisateur;
    }

    public String getIdentifiant() {
        return identifiant;
    }

    public void setIdentifiant(String identifiant) {
        this.identifiant = identifiant;
    }

    public String getMotDePasse() {
        return motDePasse;
    }

    public void setMotDePasse(String motDePasse) {
        this.motDePasse = motDePasse;
    }

    public Boolean getEstTuteur() {
        return estTuteur;
    }

    public void setEstTuteur(Boolean estTuteur) {
        this.estTuteur = estTuteur;
    }
}
