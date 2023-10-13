package fr.efrei.apptrack.controlleur;

import java.io.*;

import fr.efrei.apptrack.Utilisateur;
import fr.efrei.apptrack.utils.Constantes;
import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;

//@WebServlet(name = "helloServlet", value = "/hello-servlet")
public class Controleur extends HttpServlet {
    //@EJB
    //private EmployesSessionBean employesSessionBean;
    private Utilisateur unUtilisateur;
    private String actionUtilisateur;

    public void processRequest (HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        actionUtilisateur = request.getParameter("action");
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
        unUtilisateur.setLoginSaisi(request.getParameter(Constantes.FRM_LOGIN));
        unUtilisateur.setMotDePasseSaisi(request.getParameter(Constantes.FRM_MDP));
        request.getSession().setAttribute("utilisateur", unUtilisateur);
    }

 public void aiguillerVersLaProchainePage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     if (verifierInfosConnexion(unUtilisateur)) {
         request.getRequestDispatcher(Constantes.PAGE_TOUS_LES_EMPLOYES).forward(request, response);
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

                    break;
                case Constantes.ACTION_SUPPRIMER:

                    break;
                case Constantes.ACTION_VOIR_LISTE:

                    break;
                case Constantes.ACTION_MODIFIER:

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