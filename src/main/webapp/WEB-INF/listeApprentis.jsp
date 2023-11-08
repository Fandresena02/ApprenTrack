<%--
  Created by IntelliJ IDEA.
  User: Jacques
  Date: 11/09/2023
  Time: 15:19
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>ALTN72 - Liste des employés </title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <link href="https://unpkg.com/bootstrap-table@1.22.1/dist/bootstrap-table.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://unpkg.com/bootstrap-table@1.22.1/dist/bootstrap-table.min.js"></script>
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
        <div style="margin: 20px;">
            <p style="font-size: 17px; margin-top:20px; display: flex; justify-content: center;"> Bonjour - <strong> ${ utilisateur.loginSaisi } </strong> - !</p>
            <input type="submit" name="action" value="Deconnexion" class="btn btn-danger"/>

        </div>
        <div class="content m-16" style="display: flex; justify-content: center;">
            <form method="post" action="Controleur" >
                <table id="table"
                       data-pagination="true"
                       data-show-pagination-switch="true"
                       data-id-field="id"
                       data-page-list="[5, 10, 25, 50, 100]"
                       data-toggle="table"
                       data-height="460"
                       data-page-size="5"
                       data-search="true"
                       data-show-refresh="true">
                    <thead class="table-success">
                    <center>
                        <h2 style="margin-top:20px; padding: 20px;"><u>Liste des apprentis </u></h2>
                        <c:if test="${!empty messageReussite}">
                            <div class="alert alert-success alert-dismissible" role="alert">
                                    ${messageReussite}
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            </div>
                        </c:if>
                    </center>
                    <tr class="text-center">
                        <c:if test="${utilisateur.estTuteur}">
                            <th data-field="idApprenti">#</th>
                        </c:if>
                        <th data-field="nom" data-sortable="true">Nom</th>
                        <th data-field="prenom" data-sortable="true">Prénom</th>
                        <c:if test="${utilisateur.estTuteur}">
                            <th data-field="telephone">Téléphone</th>
                            <th data-field="mail">Mail</th>
                            <th data-field="majeure">Majeure</th>
                        </c:if>
                        <th data-field="programme">Programme</th>
                        <th data-field="anneeAcademique">Année académique</th>
                        <c:if test="${utilisateur.estTuteur}">
                            <th data-field="action">Actions</th>
                        </c:if>
                    </tr>
                    </thead>
                    <tbody>
                    <c:choose>
                        <c:when test="${fn:length(tousLesApprentis) > 0}">
                            <c:forEach items="${tousLesApprentis}" var="apprenti">
                                <c:if test="${!apprenti.getArchive()}">
                                    <tr>
                                        <c:if test="${utilisateur.estTuteur}">
                                            <td><input type="radio" name="idApprenti" value=${apprenti.idApprenti}></td>
                                        </c:if>
                                        <td>${apprenti.nom}</td>
                                        <td>${apprenti.prenom}</td>
                                        <c:if test="${utilisateur.estTuteur}">
                                            <td>${apprenti.telephone}</td>
                                            <td>${apprenti.email}</td>
                                            <td>${apprenti.majeure}</td>
                                        </c:if>
                                        <td>${apprenti.programme}</td>
                                        <td>${apprenti.anneeAcademique}</td>
                                        <c:if test="${utilisateur.estTuteur}">
                                            <td>
                                                <form action="Controleur" method="post" id="archiveApprenti">
                                                    <input type="hidden" id="apprentiId" name="apprentiId" value=${apprenti.idApprenti}>
                                                    <button class="archive-boutton" type="submit" name="action" value="Archiver" data-apprentiId="${apprenti.idApprenti}" data-apprentiNom="${apprenti.nom}" data-apprentiPrenom="${apprenti.prenom}">
                                                        Archiver
                                                    </button>
                                                </form>
                                            </td>
                                        </c:if>

                                    </tr>
                                </c:if>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <tr>
                                <td colspan="8">La liste est vide. Ajoutez au moins un(e) apprenti(e).</td>
                            </tr>
                        </c:otherwise>
                    </c:choose>
                    </tbody>
                </table>
                <div style="display: flex; justify-content: center;">
                    <c:if test="${utilisateur.estTuteur}">
                        <input type="submit" name="action" value="Ajouter" class="btn btn-primary"/>
                        <input type="submit" name="action" value="Details" class="btn btn-primary"/>
                    </c:if>
                </div>

            </form>
        </div>
        <script>
            $(document).ready(function() {
                $('.archive-boutton').click(function() {
                    const userId = $(this).attr('data-apprentiId');
                    const nom = $(this).attr('data-apprentiNom');
                    const prenom = $(this).attr('data-apprentiPrenom');
                    const confirmation = confirm('Êtes-vous sûr de vouloir archiver : ' + nom + ' ' + prenom);

                    if (!confirmation){
                        alert("L'archive de " + nom + " " + prenom + " annulé !");
                        event.preventDefault();
                    }
                });
            });
        </script>
</body>
</html>
