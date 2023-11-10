<%--
  Created by IntelliJ IDEA.
  User: Jacques
  Date: 19/09/2023
  Time: 14:26
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>ApprenTrack - Détails d'un(e) apprenti(e)</title>
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
</head>
<body>
<div style="padding: 20px; display: flex; justify-content: center; background-color: rgba(189,229,189,0.26)">
    <p style="font-size: 50px;"> APPREN<strong style="color: #62966e">TRACK</strong></p>
</div>
<div style="padding-top:10px; display: flex; justify-content: center; background-color: #62966e;">
    <p style="color : white; font-size: 20px;">
        Gestion de soutenance pour les étudiants en apprentissage
    </p>
</div>
<div>
    <form class="form-horizontal" style="margin-top: 10px; display: flex; justify-content: center" action="Controleur" method="post">
        <fieldset style="width:80%">
            <div style="display:flex; flex-direction: column; justify-content: center">

                <div style="text-align: center">
                    <c:choose>
                        <c:when test="${not empty apprenti.idApprenti}">
                            <legend>Détails de l'apprenti ${apprenti.prenom}  ${apprenti.nom} </legend>
                        </c:when>
                        <c:otherwise>
                            <legend>Création d'un nouvel apprenti</legend>
                        </c:otherwise>
                    </c:choose>
                </div>

                <div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" >Nom</label>
                        <div class="col-sm-8">
                            <input type="text" name="frmNom" value="${empty apprenti.nom ? '' : apprenti.nom}" class="form-control">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label" >Prénom</label>
                        <div class="col-sm-8">
                            <input type="text" name="frmPrenom"  value="${empty apprenti.prenom ? '' : apprenti.prenom}"  class="form-control">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label" >Adresse e-mail</label>
                        <div class="col-sm-8">
                            <input type="text" name="frmEmail" value="${empty apprenti.email ? '' : apprenti.email}"  class="form-control">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label" >Télephone</label>
                        <div class="col-sm-8">
                            <input type="text" name="frmTelephone" value="${empty apprenti.telephone ? '' : apprenti.telephone}"  class="form-control">
                        </div>
                    </div>


                    <div class="form-group">
                        <label class="col-sm-2 control-label" >Année académique</label>
                        <div class="col-sm-8">
                            <input type="text" name="frmAnneeAcademique" value="${empty apprenti.anneeAcademique ? '' : apprenti.anneeAcademique}"   class="form-control">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label" >Majeure</label>
                        <div class="col-sm-8">
                            <input type="text" name="frmMajeure" value="${empty apprenti.majeure ? '' : apprenti.majeure}" class="form-control">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label" >Programme</label>
                        <div class="col-sm-8">
                            <input type="text" name="frmProgramme" value="${empty apprenti.programme ? '' : apprenti.programme}"class="form-control">
                        </div>
                    </div>

                    <input type="hidden" name="idApprenti" value="${empty apprenti.idApprenti ? '' : apprenti.idApprenti}">

                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-8" style="padding-top: 10px;">
                            <div class="pull-right">
                                <c:set var="buttonLabel" value="${not empty apprenti.idApprenti ? 'Modifier' : 'Enregistrer'}" />
                                <button type="submit" name="action" value="${buttonLabel}" class="btn btn-primary">${buttonLabel}</button>
                                <button type="submit" name="action" value="Retour" class="btn btn-default" >Voir liste</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


        </fieldset>
    </form>
</div>
</body>
</html>
