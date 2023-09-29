package fr.efrei2023.progav_lsi2_tp3;

import java.io.*;
import java.util.List;

import fr.efrei2023.progav_lsi2_tp3.model.EmployesEntity;
import fr.efrei2023.progav_lsi2_tp3.model.EmployesSessionBean;
import fr.efrei2023.progav_lsi2_tp3.utils.EmployesConstantes;
import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import static fr.efrei2023.progav_lsi2_tp3.utils.EmployesConstantes.*;

//@WebServlet(name = "helloServlet", value = "/hello-servlet")
public class Controleur extends HttpServlet {
    @EJB
    private EmployesSessionBean employesSessionBean;
    private Utilisateur unUtilisateur;
    private List<EmployesEntity> tousLesEmployes;
    private EmployesEntity employe;
    private String actionUtilisateur;
    private int idEmployeSelect;

    public void processRequest (HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        actionUtilisateur = request.getParameter("action");
        tousLesEmployes = employesSessionBean.getTousLesEmployes();
        request.getSession().setAttribute("tousLesEmployes", tousLesEmployes);
        chargerLaPageSuivante(actionUtilisateur, request, response);
    }

    // Une tâche <-> une méthode
    public boolean verifierInfosConnexion(Utilisateur unUtilisateur){
        String motDePasseValide = getServletContext().getInitParameter("login");
        String loginValide = getServletContext().getInitParameter("motDePasse");

        return (unUtilisateur.getLoginSaisi().equals(motDePasseValide)
                && unUtilisateur.getMotDePasseSaisi().equals(loginValide));
    }

    public void placerUtilisateurDansContexte(HttpServletRequest request){
        unUtilisateur = new Utilisateur();
        unUtilisateur.setLoginSaisi(request.getParameter(FRM_LOGIN));
        unUtilisateur.setMotDePasseSaisi(request.getParameter(FRM_MDP));
        request.getSession().setAttribute("utilisateur", unUtilisateur);
    }

 public void aiguillerVersLaProchainePage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     if (verifierInfosConnexion(unUtilisateur)) {
         request.getRequestDispatcher(PAGE_TOUS_LES_EMPLOYES).forward(request, response);
     } else {
         request.getSession().setAttribute("messageErreur", MESSAGE_ERREUR_CREDENTIALS_KO);
         request.getRequestDispatcher(PAGE_INDEX).forward(request, response);
     }
 }

public void chargerLaPageSuivante(String actionUtilisateur, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (actionUtilisateur == null || actionUtilisateur.isEmpty()){
            request.getRequestDispatcher(PAGE_INDEX).forward(request, response);
        }else{
            switch (actionUtilisateur){
                case ACTION_LOGIN:
                    placerUtilisateurDansContexte(request);
                    aiguillerVersLaProchainePage(request,response);
                    break;
                case ACTION_DETAILS:
                    idEmployeSelect = Integer.parseInt(request.getParameter(FRM_ID_EMPL_SELECT));
                    employe = employesSessionBean.getEmployeParId(idEmployeSelect);
                    request.getSession().setAttribute("employe", employe);
                    request.getRequestDispatcher(PAGE_DETAILS_EMPLOYE).forward(request, response);
                    break;
                case ACTION_SUPPRIMER:
                    idEmployeSelect = Integer.parseInt(request.getParameter(FRM_ID_EMPL_SELECT));
                    employe = employesSessionBean.getEmployeParId(idEmployeSelect);
                    employesSessionBean.supprimerEmploye(employe);
                    request.getSession().setAttribute("tousLesEmployes", employesSessionBean.getTousLesEmployes());
                    request.getRequestDispatcher(PAGE_TOUS_LES_EMPLOYES).forward(request, response);
                    break;
                case ACTION_VOIR_LISTE:
                    request.getSession().setAttribute("tousLesEmployes", employesSessionBean.getTousLesEmployes());
                    request.getRequestDispatcher(PAGE_TOUS_LES_EMPLOYES).forward(request, response);
                    break;
                case ACTION_MODIFIER:
                    idEmployeSelect = Integer.parseInt(request.getParameter(FRM_ID_EMPL_SELECT));
                    employe = new EmployesEntity(idEmployeSelect,
                            request.getParameter(EmployesConstantes.CHAMP_NOM),
                            request.getParameter(EmployesConstantes.CHAMP_PRENOM),
                            request.getParameter(EmployesConstantes.CHAMP_TELDOMICILE),
                            request.getParameter(EmployesConstantes.CHAMP_TELPORTABLE),
                            request.getParameter(EmployesConstantes.CHAMP_TELPRO),
                            request.getParameter(EmployesConstantes.CHAMP_ADRESSE),
                            request.getParameter(EmployesConstantes.CHAMP_CODEPOSTAL),
                            request.getParameter(EmployesConstantes.CHAMP_VILLE),
                            request.getParameter(EmployesConstantes.CHAMP_EMAIL));
                    employesSessionBean.modifierEmploye(employe);
                    request.getSession().setAttribute("tousLesEmployes", employesSessionBean.getTousLesEmployes());
                    request.getRequestDispatcher(PAGE_TOUS_LES_EMPLOYES).forward(request, response);
                    break;
            }
        }


}

    public void init() { }

    public void destroy() { }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        processRequest(request, response);
    }

    public void doPost (HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        processRequest(request, response);
    }

}