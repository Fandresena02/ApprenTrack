package fr.efrei.apptrack;

public class Connexion {

    private String loginSaisi;
    private String motDePasseSaisi;
    private Boolean estTuteur;

    public String getLoginSaisi() {
        return loginSaisi;
    }

    public void setLoginSaisi(String loginSaisi) {
        this.loginSaisi = loginSaisi;
    }

    public String getMotDePasseSaisi() {
        return motDePasseSaisi;
    }

    public void setMotDePasseSaisi(String motDePasseSaisi) {
        this.motDePasseSaisi = motDePasseSaisi;
    }

    public Boolean getEstTuteur() {
        return estTuteur;
    }

    public void setEstTuteur(Boolean estTuteur) {
        this.estTuteur = estTuteur;
    }
}
