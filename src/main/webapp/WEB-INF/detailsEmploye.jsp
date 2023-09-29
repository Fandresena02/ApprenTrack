<%--
  Created by IntelliJ IDEA.
  User: Jacques
  Date: 19/09/2023
  Time: 14:26
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Jakarta EE - Détails d'un employé</title>
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
</head>
    <body>
        <div class="row">
            <div class="col-md-6 col-md-offset-2">
                <form class="form-horizontal" action="Controleur" method="post">
                    <fieldset>
                        <legend>Détails de l'employé ${employe.prenom}  ${employe.nom} </legend>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" >Nom</label>
                            <div class="col-sm-10">
                                <input type="text" name="frmNom" value="${employe.nom}"   class="form-control">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" >Prénom</label>
                            <div class="col-sm-10">
                                <input type="text" name="frmPrenom"  value="${employe.prenom}"  class="form-control">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" >Tél dom</label>
                            <div class="col-sm-10">
                                <input type="text" name="frmTelDomicile" value="${employe.teldom}"  class="form-control">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" >Tél mob</label>
                            <div class="col-sm-10">
                                <input type="text" name="frmTelPortable" value="${employe.telport}"  class="form-control">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" >Tél pro</label>
                            <div class="col-sm-10">
                                <input type="text" name="frmTelPro" value="${employe.telpro}"  class="form-control">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" >Adresse</label>
                            <div class="col-sm-10">
                                <input type="text" name="frmAdresse" value="${employe.adresse}"   class="form-control">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" >Code postal</label>
                            <div class="col-sm-10">
                                <input type="text" name="frmCodePostal" value="${employe.codepostal}" class="form-control">
                            </div>
                        </div>

                        <label class="col-sm-2 control-label" >Ville</label>
                        <div class="col-sm-4">
                            <input type="text" name="frmVille" value="${employe.ville}"class="form-control">
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" >Adresse e-mail</label>
                            <div class="col-sm-4">
                                <input type="text" name="frmEmail" value="${employe.email}"  class="form-control">
                            </div>
                        </div>


                        <input type="hidden" name="idEmploye" value=${employe.id}>

                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <div class="pull-right">
                                    <button type="submit" name="action" value="Modifier" class="btn btn-primary">Modifier</button>
                                    <button type="submit" name="action" value="Retour" class="btn btn-default" >Voir liste</button>
                                </div>
                            </div>
                        </div>

                    </fieldset>
                </form>
            </div>
        </div>
    </body>
</html>
