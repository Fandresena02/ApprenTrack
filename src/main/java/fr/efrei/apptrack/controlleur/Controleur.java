package fr.efrei.apptrack.controlleur;

import java.io.*;
import java.util.List;

import fr.efrei.apptrack.Connexion;
import fr.efrei.apptrack.model.*;
import fr.efrei.apptrack.utils.Constantes;
import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;

import static fr.efrei.apptrack.utils.Constantes.*;

//@WebServlet(name = "helloServlet", value = "/hello-servlet")
public class Controleur extends HttpServlet {
    @EJB
    private ApprentiSessionBean apprentiSessionBean;
    private Connexion unUtilisateur;
    private List<Apprenti> tousLesApprentis;
    private String actionUtilisateur;
    private int idApprentiSelect;
    private Apprenti apprenti;

    public void processRequest (HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        actionUtilisateur = request.getParameter("action");
        tousLesApprentis = apprentiSessionBean.getTousLesApprentis();
        request.getSession().setAttribute("tousLesApprentis", tousLesApprentis);
        chargerLaPageSuivante(actionUtilisateur, request, response);
    }

    // Une tâche <-> une méthode
    public Utilisateur verifierInfosConnexion(Connexion unUtilisateur){
        return apprentiSessionBean.getUtilisateur(unUtilisateur);
    }

    public void placerUtilisateurDansContexte(HttpServletRequest request){
        unUtilisateur = new Connexion();
        unUtilisateur.setLoginSaisi(request.getParameter(Constantes.FRM_LOGIN));
        unUtilisateur.setMotDePasseSaisi(request.getParameter(Constantes.FRM_MDP));
        request.getSession().setAttribute("utilisateur", unUtilisateur);
    }

 public void aiguillerVersLaProchainePage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        var utilisateur = verifierInfosConnexion(unUtilisateur);
     if (utilisateur != null) {
         unUtilisateur.setEstTuteur(utilisateur.getEstTuteur());
         request.getRequestDispatcher(PAGE_TOUS_LES_APPRENTIS).forward(request, response);
     } else {
         request.getSession().setAttribute("messageErreur", Constantes.MESSAGE_ERREUR_CREDENTIALS_KO);
         request.getRequestDispatcher(Constantes.PAGE_INDEX).forward(request, response);
     }
 }

public void chargerLaPageSuivante(String actionUtilisateur, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (actionUtilisateur == null || actionUtilisateur.isEmpty()){
            request.getRequestDispatcher(Constantes.PAGE_INDEX).forward(request, response);
        }else{
            switch (actionUtilisateur){
                case Constantes.ACTION_LOGIN:
                    placerUtilisateurDansContexte(request);
                    aiguillerVersLaProchainePage(request,response);
                    break;
                case Constantes.ACTION_DETAILS:
                    idApprentiSelect = Integer.parseInt(request.getParameter(FRM_ID_APPRENTI_SELECT));
                    apprenti = apprentiSessionBean.getApprentiParId(idApprentiSelect);
                    request.getSession().setAttribute("apprenti", apprenti);
                    request.getRequestDispatcher(PAGE_DETAILS_APPRENTI).forward(request, response);
                    break;
                case Constantes.ACTION_AJOUTER:
                    request.getRequestDispatcher(PAGE_DETAILS_APPRENTI).forward(request, response);
                    break;
                case Constantes.ACTION_VOIR_LISTE:
                    request.getSession().setAttribute("tousLesApprentis", apprentiSessionBean.getTousLesApprentis());
                    request.getSession().setAttribute("messageReussite", "");
                    request.getRequestDispatcher(PAGE_TOUS_LES_APPRENTIS).forward(request, response);
                    break;
                case Constantes.ACTION_MODIFIER:
                    idApprentiSelect = Integer.parseInt(request.getParameter(FRM_ID_APPRENTI_SELECT));
                    apprenti = new Apprenti(idApprentiSelect,
                            request.getParameter(Constantes.CHAMP_NOM),
                            request.getParameter(Constantes.CHAMP_PRENOM),
                            request.getParameter(Constantes.CHAMP_EMAIL),
                            request.getParameter(Constantes.CHAMP_TELEPHONE),
                            request.getParameter(Constantes.CHAMP_MAJEURE),
                            Integer.parseInt(request.getParameter(Constantes.CHAMP_ANNEEACADEMIQUE)),
                            request.getParameter(Constantes.CHAMP_PROGRAMME));
                    apprentiSessionBean.modifierApprenti(apprenti);
                    request.getSession().setAttribute("tousLesApprentis", apprentiSessionBean.getTousLesApprentis());
                    request.getSession().setAttribute("messageReussite", Constantes.MESSAGE_REUSSITE_MODIFICATION);
                    request.getRequestDispatcher(PAGE_TOUS_LES_APPRENTIS).forward(request, response);
                    break;
                case Constantes.ACTION_ENREGISTRER:
                    apprenti = new Apprenti();
                    apprenti.setNom(request.getParameter(Constantes.CHAMP_NOM));
                    apprenti.setPrenom(request.getParameter(Constantes.CHAMP_PRENOM));
                    apprenti.setEmail(request.getParameter(Constantes.CHAMP_EMAIL));
                    apprenti.setTelephone(request.getParameter(Constantes.CHAMP_TELEPHONE));
                    apprenti.setMajeure(request.getParameter(Constantes.CHAMP_MAJEURE));
                    apprenti.setAnneeAcademique(Integer.parseInt(request.getParameter(Constantes.CHAMP_ANNEEACADEMIQUE)));
                    apprenti.setProgramme(request.getParameter(Constantes.CHAMP_PROGRAMME));
                    apprentiSessionBean.ajouterApprenti(apprenti);
                    request.getSession().setAttribute("tousLesApprentis", apprentiSessionBean.getTousLesApprentis());
                    request.getSession().setAttribute("messageReussite", Constantes.MESSAGE_REUSSITE_AJOUT);
                    request.getRequestDispatcher(PAGE_TOUS_LES_APPRENTIS).forward(request, response);
                    break;
                case Constantes.ACTION_ARCHIVER:
                    idApprentiSelect = Integer.parseInt(request.getParameter("apprentiId"));
                    apprenti = apprentiSessionBean.getApprentiParId(idApprentiSelect);
                    apprenti.setArchive(true);
                    apprentiSessionBean.modifierApprenti(apprenti);
                    request.getSession().setAttribute("tousLesApprentis", apprentiSessionBean.getTousLesApprentis());
                    request.getSession().setAttribute("messageReussite", Constantes.MESSAGE_REUSSITE_ARCHIVE);
                    request.getRequestDispatcher(PAGE_TOUS_LES_APPRENTIS).forward(request, response);
                    break;
                case Constantes.ACTION_DECONNEXION:
                    request.getSession().invalidate();
                    response.sendRedirect(Constantes.PAGE_INDEX);
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