<%@ tag language="java" pageEncoding="UTF-8" %>
<%@attribute name="action" %>
<%@attribute name="categorie" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@attribute name="title" required="false" %>
<%@taglib prefix="my" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<my:header title="Projets"></my:header>
<body class="dashboard">
<!--[if lt IE 8]>
<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade
    your browser</a> to improve your experience.</p>
<![endif]-->

<nav class="site-navbar navbar navbar-default navbar-fixed-top navbar-mega" role="navigation">

    <div class="navbar-header">
        <button type="button" class="navbar-toggle hamburger hamburger-close navbar-toggle-left hided"
                data-toggle="menubar">
            <span class="sr-only">Toggle navigation</span>
            <span class="hamburger-bar"></span>
        </button>
        <button type="button" class="navbar-toggle collapsed" data-target="#site-navbar-collapse"
                data-toggle="collapse">
            <i class="icon wb-more-horizontal" aria-hidden="true"></i>
        </button>
        <div class="navbar-brand navbar-brand-center site-gridmenu-toggle" data-toggle="gridmenu">
            <img class="navbar-brand-logo" src="${pageContext.request.contextPath}/assets/images/logo.png"
                 title="Remark">
            <span class="navbar-brand-text"> Esimed Project</span>
        </div>
    </div>

    <div class="navbar-container container-fluid">
        <!-- Navbar Collapse -->
        <div class="collapse navbar-collapse navbar-collapse-toolbar" id="site-navbar-collapse">
            <!-- Navbar Toolbar -->
            <ul class="nav navbar-toolbar">
                <li class="hidden-float" id="toggleMenubar">
                    <a data-toggle="menubar" href="#" role="button">
                        <i class="icon hamburger hamburger-arrow-left">
                            <span class="sr-only">Toggle menubar</span>
                            <span class="hamburger-bar"></span>
                        </i>
                    </a>
                </li>
                <li class="hidden-xs" id="toggleFullscreen">
                    <a class="icon icon-fullscreen" data-toggle="fullscreen" href="#" role="button">
                        <span class="sr-only">Toggle fullscreen</span>
                    </a>
                </li>
            </ul>
            <!-- End Navbar Toolbar -->

            <!-- Navbar Toolbar Right -->
            <%--<ul class="nav navbar-toolbar navbar-right navbar-toolbar-right">--%>
                <%--<li class="dropdown">--%>
                    <%--<a class="navbar-avatar dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false"--%>
                       <%--data-animation="slide-bottom" role="button">--%>
              <%--<span class="avatar avatar-online">--%>
                <%--<img src="${pageContext.request.contextPath}/assets/portraits/5.jpg" alt="...">--%>
                <%--<i></i>--%>
              <%--</span>--%>
                    <%--</a>--%>
                    <%--<ul class="dropdown-menu" role="menu">--%>

                        <%--<li role="presentation">--%>
                            <%--<a href="/authentification/deconnexion" role="menuitem"><i class="icon wb-power"--%>
                                                                            <%--aria-hidden="true"></i> Déconnexion</a>--%>
                        <%--</li>--%>
                    <%--</ul>--%>
                <%--</li>--%>
            <%--</ul>--%>
            <!-- End Navbar Toolbar Right -->
        </div>
        <!-- End Site Navbar Seach -->
    </div>
</nav>
<div class="site-menubar">
    <div class="site-menubar-body">
        <div>
            <div>
                <ul class="site-menu">
                    <li class="site-menu-category">Projet</li>

                    <li class="site-menu-item has-sub ${(categorie =='projects' ? 'active open' : '')}">
                        <a href="javascript:void(0)" data-slug="projects">
                            <i class="site-menu-icon fa fa-cubes" aria-hidden="true"></i>
                            <span class="site-menu-title">Projets</span>
                            <span class="site-menu-arrow"></span>
                        </a>
                        <ul class="site-menu-sub">
                            <li class="site-menu-item ${(action=='projects-all' ? 'active' : '')}">
                                <a class="animsition-link" data-slug="projects-all" href="/projets/">
                                    <i class="site-menu-icon " aria-hidden="true"></i>
                                    <span class="site-menu-title">Tous</span>
                                </a>
                            </li>
                            <li class="site-menu-item ${(action=='projects-add' ? 'active' : '')}">
                                <a class="animsition-link" data-slug="projects-add" href="/projets/nouveau">
                                    <i class="site-menu-icon" aria-hidden="true"></i>
                                    <span class="site-menu-title">Nouveau</span>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li class="site-menu-category">Ressource</li>

                    <li class="site-menu-item has-sub ${(categorie =='resources' ? 'active open' : '')}">
                        <a href="javascript:void(0)" data-slug="projects">
                            <i class="site-menu-icon fa fa-users" aria-hidden="true"></i>
                            <span class="site-menu-title">Ressources</span>
                            <span class="site-menu-arrow"></span>
                        </a>
                        <ul class="site-menu-sub">
                            <%--<li class="site-menu-item ${(action=='projects-all' ? 'active' : '')}">--%>
                                <%--<a class="animsition-link" data-slug="projects-all" href="/projets/">--%>
                                    <%--<i class="site-menu-icon " aria-hidden="true"></i>--%>
                                    <%--<span class="site-menu-title">Tous</span>--%>
                                <%--</a>--%>
                            <%--</li>--%>
                            <li class="site-menu-item ${(action=='resources-add' ? 'active' : '')}">
                                <a class="animsition-link" data-slug="projects-add" href="/ressources/nouveau">
                                    <i class="site-menu-icon" aria-hidden="true"></i>
                                    <span class="site-menu-title">Nouvelle</span>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <%--<li class="site-menu-category">Projet en cours</li>--%>
                    <%--<li class="site-menu-item has-sub ${(categorie =='reservation' ? 'active open' : '')}">--%>
                    <%--<a href="javascript:void(0)" data-slug="reservation">--%>
                    <%--<i class="site-menu-icon wb-time" aria-hidden="true"></i>--%>
                    <%--<span class="site-menu-title">Tâches</span>--%>
                    <%--<span class="site-menu-arrow"></span>--%>
                    <%--</a>--%>
                    <%--<ul class="site-menu-sub">--%>
                    <%--<li class="site-menu-item ${(action=='res-current' ? 'active' : '')}">--%>
                    <%--<a class="animsition-link" data-slug="reservation-current" href="/reservation/current">--%>
                    <%--<i class="site-menu-icon " aria-hidden="true"></i>--%>
                    <%--<span class="site-menu-title">En cours</span>--%>
                    <%--<c:choose>--%>
                    <%--<c:when test="${nbOfReservations != null}">--%>
                    <%--<div class="site-menu-badge">--%>
                    <%--<span class="badge badge-success">${nbOfReservations}</span>--%>
                    <%--</div>--%>
                    <%--</c:when>--%>
                    <%--</c:choose>--%>
                    <%--</a>--%>
                    <%--</li>--%>
                    <%--<li class="site-menu-item ${(action=='res-add' ? 'active' : '')}">--%>
                    <%--<a class="animsition-link" data-slug="reservation-current" href="/reservation/add">--%>
                    <%--<i class="site-menu-icon" aria-hidden="true"></i>--%>
                    <%--<span class="site-menu-title">Nouvelle</span>--%>
                    <%--</a>--%>
                    <%--</li>--%>

                    <%--</ul>--%>
                    <%--</li>--%>


                </ul>
            </div>
        </div>
    </div>

    <%--<div class="site-menubar-footer">--%>
    <%--<a href="javascript: void(0);" data-placement="top" data-toggle="tooltip" data-original-title="Logout">--%>
    <%--<span class="icon wb-power" aria-hidden="true"></span>--%>
    <%--</a>--%>
    <%--</div>--%>
</div>


<!-- Page -->
<div class="page">
    <%--<div class="page-content padding-30 container-fluid">--%>
    <jsp:doBody/>

    <%--</div>--%>
</div>
<!-- End Page -->


<!-- Footer -->
<footer class="site-footer">
    <span class="site-footer-legal">© 2016 Neogenz</span>
    <div class="site-footer-right">
        ESIMED-TP3
    </div>
</footer>
</body>
<my:importJs></my:importJs>
</html>

