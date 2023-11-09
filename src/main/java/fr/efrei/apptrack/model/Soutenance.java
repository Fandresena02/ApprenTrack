package fr.efrei.apptrack.model;

import jakarta.persistence.*;

import java.util.Date;

@Entity
@Table(name = "soutenance", schema = "apprentrackbdd")

@NamedQueries(
        {
                @NamedQuery(name = "recupererToutesLesSoutenances", query = "Select s from Soutenance s")
                , @NamedQuery(name = "recupererUneSoutenance", query = "SELECT s FROM Soutenance s WHERE s.idSoutenance = :id")
                , @NamedQuery(name = "supprimerSoutenance", query = "DELETE from Soutenance s WHERE s.idSoutenance = :id")
        }
)
public class Soutenance {

    @Id
    @Column(name = "idSoutenance", nullable = false)
    private int idSoutenance;

    @Column(name = "dateSoutenance", nullable = true)
    private Date dateSoutenance;

    @Column(name = "idEvaluation", nullable = false)
    private int idEvaluation;

    // Getters and setters for the fields

    public int getIdSoutenance() { return idSoutenance; }
    public Date getDateSoutenance() {
        return dateSoutenance;
    }

    public void setDateSoutenance(Date dateSoutenance) {
        this.dateSoutenance = dateSoutenance;
    }

    public int getIdEvaluation() {
        return idEvaluation;
    }

    public void setIdEvaluation(int idEvaluation) {
        this.idEvaluation = idEvaluation;
    }
}

