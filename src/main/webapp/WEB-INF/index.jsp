
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
    <head>
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <title>Jakarta EE - Login</title>
        <style>
            body {
                background-color: #d3e3d8;
            }
        </style>
    </head>

    <body>
        <div class="container" style="padding-top: 90px;">
            <div class="d-flex justify-content-center" style="max-width: 50%; margin:auto;">
                <div class="col-sm" style="margin-top: 100px;">
                    <div style="color:red">
                        ${messageErreur}
                    </div>
                    <div class="login-panel panel panel-default rounded">
                        <div class="panel-heading">
                            <h3 class="text-center justify-content-center align-items-center" style="color: darkslategrey">Connexion</h3>
                        </div>
                        <div class="panel-body">
                            <form action="Controleur" method="post">
                                <fieldset>
                                    <div class="form-group">
                                        <input class="form-control" placeholder="Login" name="champLogin" autofocus="">
                                    </div>
                                    <div class="form-group">
                                        <input class="form-control" placeholder="Mot de passe" name="champMotDePasse" type="password">
                                    </div>

                                    <input type="submit" name="action" value="Login" class="btn btn-primary" style="background-color: #b6d8c6; color:white; border-color:#b6d8c6 "/>
                                    <br>
                                    <br>
                                    <p class="mt-10 text-center text-sm" style="color: darkslategrey">
                                        Vous n'avez pas de compte ?
                                        <a href="#" class="font-semibold leading-6 hover:text-green-500" style="color:#679769">Inscription</a>
                                    </p>
                                </fieldset>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
