<%--
  Created by IntelliJ IDEA.
  User: Jacques
  Date: 11/09/2023
  Time: 15:19
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>ALTN72 - Liste des employés </title>
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
</head>
<body>
    <div class="container" >
        <h3> <strong> Bonjour ${ utilisateur.loginSaisi } ! </strong></h3>
        <div class="row col-md-6 col-md-offset-0 custyle">
            <form method="post" action="Controleur">
                <table class="table table-striped custab">
                    <thead>
                    <h1>Liste des employés</h1>
                    <tr class="text-center">
                        <th>Sél</th>
                        <th>NOM</th>
                        <th>PRENOM</th>
                        <th>TEL DOMICILE</th>
                        <th>TEL PORTABLE</th>
                        <th>TEL PRO</th>
                        <th>ADRESSE</th>
                        <th>CODE POSTAL</th>
                        <th>VILLE</th>
                        <th>EMAIL</th>
                    </tr>
                    </thead>

                    <c:forEach items="${tousLesEmployes}" var="employe">
                        <tr>
                            <td><input type="radio" name="idEmploye" value=${employe.id}></td>
                            <td>${employe.nom}</td>
                            <td>${employe.prenom}</td>
                            <td>${employe.teldom}</td>
                            <td>${employe.telport}</td>
                            <td>${employe.telpro}</td>
                            <td>${employe.adresse}</td>
                            <td>${employe.codepostal}</td>
                            <td>${employe.ville}</td>
                            <td>${employe.email}</td>

                        </tr>
                    </c:forEach>

                </table>
                <input type="submit" name="action" value="Supprimer" class="btn btn-primary"/>
                <input type="submit" name="action" value="Details" class="btn btn-primary"/>
            </form>
        </div>
    </div>
</body>
</html>
