package fr.efrei2023.progav_lsi2_tp3.model;

import jakarta.persistence.*;

import java.util.Objects;

import static fr.efrei2023.progav_lsi2_tp3.utils.EmployesConstantes.*;

@Entity
@Table(name = "employes", schema = "employes")

@NamedQueries(
        {
                @NamedQuery(name = "recupererTousLesEmployes", query = SELECT_TOUS_LES_EMPLOYES)
                , @NamedQuery(name = "recupererUnEmploye", query = CHERCHER_UN_EMPLOYE_PAR_SON_ID)
                , @NamedQuery(name = "recupererEmployeParSonNom", query = "SELECT e FROM EmployesEntity e WHERE e.nom = :nom")
                , @NamedQuery(name = "supprimerEmploye", query = "DELETE from EmployesEntity e WHERE e.id = :id")
        }
)


public class EmployesEntity {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "ID", nullable = false)
    private int id;
    @Basic
    @Column(name = "NOM", nullable = true, length = 25)
    private String nom;
    @Basic
    @Column(name = "PRENOM", nullable = true, length = 25)
    private String prenom;
    @Basic
    @Column(name = "TELDOM", nullable = true, length = 10)
    private String teldom;
    @Basic
    @Column(name = "TELPORT", nullable = true, length = 10)
    private String telport;
    @Basic
    @Column(name = "TELPRO", nullable = true, length = 10)
    private String telpro;
    @Basic
    @Column(name = "ADRESSE", nullable = true, length = 150)
    private String adresse;
    @Basic
    @Column(name = "CODEPOSTAL", nullable = true, length = 15)
    private String codepostal;
    @Basic
    @Column(name = "VILLE", nullable = true, length = 25)
    private String ville;
    @Basic
    @Column(name = "EMAIL", nullable = true, length = 25)
    private String email;

    public EmployesEntity(Integer id, String nom, String prenom, String teldom, String telport, String telpro, String adresse, String codepostal, String ville, String email) {
        this.id = id;
        this.nom = nom;
        this.prenom = prenom;
        this.teldom = teldom;
        this.telport = telport;
        this.telpro = telpro;
        this.adresse = adresse;
        this.codepostal = codepostal;
        this.ville = ville;
        this.email = email;
    }

    public EmployesEntity() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public String getTeldom() {
        return teldom;
    }

    public void setTeldom(String teldom) {
        this.teldom = teldom;
    }

    public String getTelport() {
        return telport;
    }

    public void setTelport(String telport) {
        this.telport = telport;
    }

    public String getTelpro() {
        return telpro;
    }

    public void setTelpro(String telpro) {
        this.telpro = telpro;
    }

    public String getAdresse() {
        return adresse;
    }

    public void setAdresse(String adresse) {
        this.adresse = adresse;
    }

    public String getCodepostal() {
        return codepostal;
    }

    public void setCodepostal(String codepostal) {
        this.codepostal = codepostal;
    }

    public String getVille() {
        return ville;
    }

    public void setVille(String ville) {
        this.ville = ville;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        EmployesEntity that = (EmployesEntity) o;

        if (id != that.id) return false;
        if (!Objects.equals(nom, that.nom)) return false;
        if (!Objects.equals(prenom, that.prenom)) return false;
        if (!Objects.equals(teldom, that.teldom)) return false;
        if (!Objects.equals(telport, that.telport)) return false;
        if (!Objects.equals(telpro, that.telpro)) return false;
        if (!Objects.equals(adresse, that.adresse)) return false;
        if (!Objects.equals(codepostal, that.codepostal)) return false;
        if (!Objects.equals(ville, that.ville)) return false;
        return Objects.equals(email, that.email);
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (nom != null ? nom.hashCode() : 0);
        result = 31 * result + (prenom != null ? prenom.hashCode() : 0);
        result = 31 * result + (teldom != null ? teldom.hashCode() : 0);
        result = 31 * result + (telport != null ? telport.hashCode() : 0);
        result = 31 * result + (telpro != null ? telpro.hashCode() : 0);
        result = 31 * result + (adresse != null ? adresse.hashCode() : 0);
        result = 31 * result + (codepostal != null ? codepostal.hashCode() : 0);
        result = 31 * result + (ville != null ? ville.hashCode() : 0);
        result = 31 * result + (email != null ? email.hashCode() : 0);
        return result;
    }
}
