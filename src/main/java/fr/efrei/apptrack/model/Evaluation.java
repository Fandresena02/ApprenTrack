package fr.efrei.apptrack.model;

import jakarta.persistence.*;

@Entity
@Table(name = "evaluation", schema = "apprentrackbdd")

@NamedQueries(
        {
                @NamedQuery(name = "recupererToutesLesEvaluations", query = "Select e from Evaluation e")
                , @NamedQuery(name = "recupererUneEvaluation", query = "SELECT e FROM Evaluation e WHERE e.idEvaluation = :id")
                , @NamedQuery(name = "supprimerEvaluation", query = "DELETE from Evaluation e WHERE e.idEvaluation = :id")
        }
)
public class Evaluation {
    @Id
    @Column(name = "idEvaluation", nullable = false)
    private int idEvaluation;
    @Column(name = "note", nullable = true)
    private double note;
    @Column(name = "commentaires", nullable = true, length = 25)
    private String commentaires;

    // Getters and setters for the fields

    public int getIdEvaluation() {
        return idEvaluation;
    }

    public void setIdEvaluation(int idEvaluation) {
        this.idEvaluation = idEvaluation;
    }

    public double getNote() {
        return note;
    }

    public void setNote(double note) {
        this.note = note;
    }

    public String getCommentaires() {
        return commentaires;
    }

    public void setCommentaires(String commentaires) {
        this.commentaires = commentaires;
    }
}
