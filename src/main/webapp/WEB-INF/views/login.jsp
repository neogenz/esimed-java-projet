<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html class="no-js before-run" lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <meta name="description" content="bootstrap admin template">
    <meta name="author" content="">

    <title>Connexion | Esimed project</title>

    <link rel="apple-touch-icon" href="${pageContext.request.contextPath}/assets/images/apple-touch-icon.png">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/images/favicon.ico">

    <!-- Stylesheets -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap-extend.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/site.min.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/animsition/animsition.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/asscrollable/asScrollable.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/switchery/switchery.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/intro-js/introjs.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/slidepanel/slidePanel.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/flag-icon-css/flag-icon.css">


    <!-- Page -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/pages/login.css">

    <!-- Fonts -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/fonts/web-icons/web-icons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/fonts/brand-icons/brand-icons.min.css">
    <link rel='stylesheet' href='http://fonts.googleapis.com/css?family=Roboto:300,400,500,300italic'>


    <!--[if lt IE 9]>
    <script src="${pageContext.request.contextPath}/assets/vendor/html5shiv/html5shiv.min.js"></script>
    <![endif]-->

    <!--[if lt IE 10]>
    <script src="${pageContext.request.contextPath}/assets/vendor/media-match/media.match.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/vendor/respond/respond.min.js"></script>
    <![endif]-->

    <!-- Scripts -->
    <script src="${pageContext.request.contextPath}/assets/vendor/modernizr/modernizr.js"></script>
    <script src="${pageContext.request.contextPath}/assets/vendor/breakpoints/breakpoints.js"></script>
    <script>
        Breakpoints();
    </script>
</head>
<body class="page-login layout-full">
<!--[if lt IE 8]>
<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade
    your browser</a> to improve your experience.</p>
<![endif]-->


<!-- Page -->
<div class="page animsition vertical-align text-center" data-animsition-in="fade-in"
     data-animsition-out="fade-out">>
    <div class="page-content vertical-align-middle">
        <div class="brand">
            <img class="brand-img" src="${pageContext.request.contextPath}/assets/images/logo.png" alt="...">
            <h2 class="brand-text">Esimed Project</h2>
        </div>
        <p>Connectez vous à votre équipe</p>
        <c:if test="${param.error != null}">
            <div class="alert alert-danger">
                Utilisateur ou mot de passe incorrect.
            </div>
        </c:if>
        <form:form class="form-signin" method="POST" action="login">


            <div class="form-group">
                    <%--<label class="sr-only" for="username">Utilisateur</label>--%>
                <input type="text" id="username" name="username" class="form-control" required autofocus
                       placeholder="Utilisateur"/>
            </div>

            <div class="form-group">
                <label class="sr-only" for="password">Password</label>
                <input type="password" id="password" name="password" class="form-control" required
                       placeholder="Mot de passe">
            </div>

            <button type="submit" class="btn btn-primary btn-block">Connexion</button>

            <%--<label for="inputEmail" class="sr-only">Utilisateur</label>--%>
            <%--<input type="text" id="inputEmail" name="username" class="form-control" required autofocus/>--%>
            <%--<label for="inputPassword" class="sr-only">Mot de passe</label>--%>
            <%--<input type="password" id="inputPassword" name="password" class="form-control" required/>--%>
            <%--<button class="btn btn-lg btn-primary btn-block" type="submit">Se connecter</button>--%>
        </form:form>

        <footer class="page-copyright">
            <p>WEBSITE BY Maxime De Sogus</p>
            <p>© 2015. All RIGHT RESERVED.</p>
            <div class="social">
                <a href="javascript:void(0)">
                    <i class="icon bd-twitter" aria-hidden="true"></i>
                </a>
                <a href="javascript:void(0)">
                    <i class="icon bd-facebook" aria-hidden="true"></i>
                </a>
                <a href="javascript:void(0)">
                    <i class="icon bd-dribbble" aria-hidden="true"></i>
                </a>
            </div>
        </footer>
    </div>
</div>
<!-- End Page -->


<!-- Core  -->
<script src="${pageContext.request.contextPath}/assets/vendor/jquery/jquery.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/bootstrap/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/animsition/jquery.animsition.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/asscroll/jquery-asScroll.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/mousewheel/jquery.mousewheel.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/asscrollable/jquery.asScrollable.all.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/ashoverscroll/jquery-asHoverScroll.js"></script>

<!-- Plugins -->
<script src="${pageContext.request.contextPath}/assets/vendor/switchery/switchery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/intro-js/intro.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/screenfull/screenfull.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/slidepanel/jquery-slidePanel.js"></script>

<script src="${pageContext.request.contextPath}/assets/vendor/jquery-placeholder/jquery.placeholder.js"></script>

<!-- Scripts -->
<script src="${pageContext.request.contextPath}/assets/js/core.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/site.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/sections/menu.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/sections/menubar.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/sections/sidebar.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/configs/config-colors.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/configs/config-tour.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/components/asscrollable.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/components/animsition.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/components/slidepanel.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/components/switchery.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/components/jquery-placeholder.js"></script>

<script>
    (function (document, window, $) {
        'use strict';

        var Site = window.Site;
        $(document).ready(function () {
            Site.run();
        });
    })(document, window, jQuery);
</script>

</body>

</html>