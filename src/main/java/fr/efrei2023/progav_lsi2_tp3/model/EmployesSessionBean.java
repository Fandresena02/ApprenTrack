package fr.efrei2023.progav_lsi2_tp3.model;

import jakarta.ejb.Stateless;
import jakarta.persistence.*;

import java.util.List;

@Stateless
public class EmployesSessionBean {
    private final EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("TP3PROF_PU");
    private final EntityManager entityManager = entityManagerFactory.createEntityManager();
    private Query requete;

    public List<EmployesEntity> getTousLesEmployes(){
        requete = entityManager.createNamedQuery("recupererTousLesEmployes");
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
