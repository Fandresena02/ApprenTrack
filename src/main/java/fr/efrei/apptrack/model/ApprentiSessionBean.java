package fr.efrei.apptrack.model;

import jakarta.ejb.Stateless;
import jakarta.persistence.*;

import java.util.List;

@Stateless
public class ApprentiSessionBean {
    private final EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("APPRENTRACK_PU");
    private final EntityManager entityManager = entityManagerFactory.createEntityManager();
    private Query requete;

    public List<Apprenti> getTousLesApprentis(){
        requete = entityManager.createNamedQuery("recupererTousApprentis");
        return  requete.getResultList();
    }

    public EmployesEntity getEmployeParId(int id) {
        requete = entityManager.createNamedQuery("recupererUnEmploye" );
        requete.setParameter("id", id);
        return (EmployesEntity) requete.getSingleResult();
    }

    public void supprimerEmploye(EmployesEntity employeASupprimer) {
        entityManager.getTransaction().begin();
        entityManager.remove(employeASupprimer);
        entityManager.getTransaction().commit();
    }

    public void modifierEmploye(EmployesEntity emplAModifier) {
        entityManager.getTransaction().begin();
        entityManager.merge(emplAModifier);
        entityManager.getTransaction().commit();
    }
}
