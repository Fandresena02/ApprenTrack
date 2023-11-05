package fr.efrei.apptrack.utils;

public final class Constantes {
    public static final String ACTION = "action";
    public static final String ACTION_SUPPRIMER = "Supprimer";
    public static final String ACTION_DETAILS = "Details";
    public static final String ACTION_ARCHIVER = "Archiver";
    public static final String ACTION_MODIFIER = "Modifier";
    public static final String ACTION_VOIR_LISTE = "Retour";
    public static final String ACTION_LOGIN = "Login";
    public static final String FRM_LOGIN = "champLogin";
    public static final String FRM_MDP = "champMotDePasse";
    public static final String FRM_ID_APPRENTI_SELECT = "idApprenti";
    public static final String CHAMP_ADRESSE = "frmAdresse";
    public static final String CHAMP_CODEPOSTAL = "frmCodePostal";
    public static final String CHAMP_EMAIL = "frmEmail";
    public static final String CHAMP_NOM = "frmNom";
    public static final String CHAMP_PRENOM = "frmPrenom";
    public static final String CHAMP_TELDOMICILE = "frmTelDomicile";
    public static final String CHAMP_TELPORTABLE = "frmTelPortable";
    public static final String CHAMP_TELPRO = "frmTelPro";
    public static final String CHAMP_VILLE = "frmVille";
    public static final String MESSAGE_ERREUR_CREDENTIALS_KO = "Infos de connexion non valides. Merci de les saisir à nouveau";
    public static final String MESSAGE_REUSSITE_ARCHIVE = "Archive réussi !";
    public static final String PAGE_INDEX = "/WEB-INF/index.jsp";
    public static final String PAGE_TOUS_LES_APPRENTIS = "/WEB-INF/listeApprentis.jsp";
    public static final String PAGE_DETAILS_APPRENTI = "/WEB-INF/detailsApprenti.jsp";


    //Requêtes JPQL
    public static final String CHERCHER_UN_EMPLOYE_PAR_SON_ID = "SELECT e FROM EmployesEntity e WHERE e.id = :id";
    public static final String SELECT_TOUS_LES_EMPLOYES = "SELECT e FROM EmployesEntity e";


}
