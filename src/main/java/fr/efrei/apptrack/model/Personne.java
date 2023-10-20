package fr.efrei.apptrack.model;

import jakarta.persistence.*;

@Entity
@Table(name = "personne", schema = "apprentrackbdd")

@NamedQueries(
        {
                @NamedQuery(name = "recupererToutesLesPersonnes", query = "Select p from Personne p")
                , @NamedQuery(name = "recupererUnePersonne", query = "SELECT p FROM Personne p WHERE p.idPersonne = :id")
                , @NamedQuery(name = "recupererPersonneParSonNom", query = "SELECT p FROM Personne p WHERE p.nom = :nom")
                , @NamedQuery(name = "supprimerPersonne", query = "DELETE from Personne p WHERE p.idPersonne = :id")
        }
)
public class Personne {

    @Id
    @Column(name = "idPersonne", nullable = false)
    private int idPersonne;
    @Column(name = "nom", nullable = true, length = 25)
    private String nom;
    @Column(name = "prenom", nullable = true, length = 25)
    private String prenom;
    @Column(name = "email", nullable = true, length = 25)
    private String email;
    @Column(name = "telephone", nullable = true, length = 10)
    private String telephone;

    // Getters and setters for the fields

    public int getIdPersonne() {
        return idPersonne;
    }

    public void setIdPersonne(int idPersonne) {
        this.idPersonne = idPersonne;
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
