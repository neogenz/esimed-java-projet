<%--
  Created by IntelliJ IDEA.
  User: maximedesogus
  Date: 21/11/2016
  Time: 11:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="my" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<my:base categorie="projects">
    <div class="page-header padding-0">
        <div class="widget widget-article type-flex">
            <div class="widget-header cover overlay">
                <img class="cover-image height-300"
                     src="${pageContext.request.contextPath}/assets/example-images/dashboard-header.jpg" alt="">
                <a href="javascript:void(0)" data-slug="advanced-tour" class="blue-grey-800 help-btn ">
                    <h2>Aide <i class="fa fa-question-circle-o" aria-hidden="true"></i></h2>
                </a>
                <div class="overlay-panel text-center vertical-align">
                    <div class="widget-metas vertical-align-middle blue-grey-800">
                        <div class="widget-title font-size-50 margin-bottom-35 blue-grey-800">${project.name}</div>
                        <ul class="list-inline font-size-14">
                            <li>
                                <i class="fa fa-info margin-right-5" aria-hidden="true"></i> Détails du projet
                            </li>
                            <li>
                                <i class="fa fa-hashtag margin-right-5" aria-hidden="true"></i> ${project.trigramme}
                            </li>
                            <li class="margin-left-20">
                                <i class="fa fa-id-card margin-right-5"
                                   aria-hidden="true"></i> ${project.manager.firstname} ${project.manager.lastname}
                            </li>
                                <%--<li class="margin-left-20">--%>
                                <%--<a href="javascript:void(0)" data-slug="advanced-tour">--%>
                                <%--<i class="site-menu-icon " aria-hidden="true"></i>--%>
                                <%--<span class="site-menu-title">Tour</span>--%>
                                <%--</a>--%>
                                <%--</li>--%>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="page-content container-fluid">
        <div class="col-xlg-6 col-lg-6 col-md-12">
            <!-- Panel My Tasks -->
            <div class="widget widget-shadow" id="widgetPieProgress">
                <div class="widget-content widget-radius bg-white padding-30" style="min-width:480px;">
                    <div class="row height-50 margin-bottom-8">
                        <div class="col-xs-3">
                            <div class="blue-grey-700">AVANCEMENT</div>
                        </div>
                        <div class="col-xs-9">
                            <div class="dropdown clearfix pull-right">
                                    <%--<button class="btn btn-default dropdown-toggle bg-white" style="border-radius:20px;"--%>
                                    <%--type="button" data-toggle="dropdown" aria-expanded="false">--%>
                                    <%--Filtres--%>
                                    <%--<span class="icon wb-chevron-down-mini" aria-hidden="true"></span>--%>
                                    <%--</button>--%>
                                    <%--<ul class="dropdown-menu" role="menu">--%>
                                    <%--<li role="presentation"><a href="javascript:void(0)" role="menuitem">Month</a></li>--%>
                                    <%--<li role="presentation"><a href="javascript:void(0)" role="menuitem">Year</a></li>--%>
                                    <%--</ul>--%>
                                <i class="fa fa-calendar margin-right-5"></i>Date de fin théorique du projet le
                                <fmt:formatDate value="${theoricalEndDateOfProject}"
                                                pattern="dd/MM/yyyy"></fmt:formatDate>
                            </div>
                        </div>
                    </div>
                    <div class="row" style="height:calc(100% - 80px);">
                        <div class="col-xs-4 padding-horizontal-20">
                            <div class="pieProgress-project" data-size="180" data-barsize="8"
                                 data-goal="${progressPercentageOfProjectByJalon}"
                                 aria-valuenow="${progressPercentageOfProjectByJalon}" role="progressbar">
                                <div class="counter vertical-align">
                                    <div class="counter-number-group  vertical-align-middle text-nowrap">
                                        <span class="counter-number">${progressPercentageOfProjectByJalon}</span>
                                        <span class="counter-number-related margin-left-0">%</span>
                                    </div>
                                </div>
                            </div>
                            <div class="text-center margin-top-20">PROJET</div>
                        </div>
                        <div class="col-xs-4 padding-horizontal-20">
                            <div class="pieProgress-jalons" data-size="180" data-barsize="8"
                                 data-goal="${progressPercentageOfCurrentJalon}"
                                 aria-valuenow="${progressPercentageOfCurrentJalon}" role="progressbar">
                                <div class="counter vertical-align">
                                    <div class="counter-number-group  vertical-align-middle text-nowrap">
                                        <span class="counter-number">${progressPercentageOfCurrentJalon}</span>
                                        <span class="counter-number-related margin-left-0">%</span>
                                    </div>
                                </div>
                            </div>
                            <div class="text-center margin-top-20">JALON EN COURS</div>
                        </div>
                        <div class="col-xs-4 padding-horizontal-20">
                            <div class="pieProgress-exigences" data-size="180" data-barsize="8"
                                 data-goal="${progressPercentageOfProjectByRequirement}"
                                 aria-valuenow="${progressPercentageOfProjectByRequirement}" role="progressbar">
                                <div class="counter vertical-align">
                                    <div class="counter-number-group  vertical-align-middle text-nowrap">
                                        <span class="counter-number">${progressPercentageOfProjectByRequirement}</span>
                                        <span class="counter-number-related margin-left-0">%</span>
                                    </div>
                                </div>
                            </div>
                            <div class="text-center margin-top-20">TAUX COUVERTURE EXIGENCES</div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Panel My Tasks -->
        </div>

        <div class="col-xlg-6 col-lg-6 col-md-12">
            <!-- Panel My Tasks -->
            <div class="widget widget-shadow" id="requirements">
                <div class="widget-content widget-radius bg-white padding-30" style="min-width:480px;">
                    <div class="row height-50">
                        <div class="col-xs-6">
                            <div class="blue-grey-700">EXIGENCES</div>
                        </div>
                        <div class="col-xs-6">
                            <div class="dropdown clearfix pull-right" id="requirementsActions">
                                <button class="btn btn-default dropdown-toggle bg-white" style="border-radius:20px;"
                                        type="button" data-toggle="dropdown" aria-expanded="false">
                                    Actions
                                    <span class="icon wb-chevron-down-mini" aria-hidden="true"></span>
                                </button>
                                <ul class="dropdown-menu" role="menu">
                                    <li role="presentation"><a href="/projets/${project.id}/exigences/nouveau"
                                                               role="menuitem">Ajouter</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <table class="table table-stripped table-fixed toggle-arrow-tiny" id="requirementsTable">
                                <thead>
                                <tr>
                                    <th class="col-xs-4" data-toggle="true">Description</th>
                                    <th class="col-xs-4">Type</th>
                                    <th class="col-xs-3" colspan="2">Précision</th>
                                    <th data-hide="all">Projet associé</th>
                                    <th data-hide="all">Nombre de tâches</th>
                                    <th data-hide="all">Description complète</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${requirements}" var="requirement">
                                    <tr>
                                        <td class="col-xs-4">
                                                ${requirement.description}</td>
                                        <td class="col-xs-4">${requirement.requirementType.label}</td>
                                        <td class="col-xs-3">
                                            <c:choose>
                                                <c:when test="${requirement.requirementPrecisionType != null}">
                                                    ${requirement.requirementPrecisionType.label}
                                                </c:when>
                                                <c:otherwise>
                                                    -
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td class="col-xs-1">
                                            <i class="fa fa-info-circle"
                                               data-content="${requirement.description}"
                                               data-trigger="hover" data-toggle="popover"
                                               data-original-title="Description complète"
                                               data-placement="left"
                                               tabindex="0" title="" type="button"></i>
                                        </td>

                                        <td class="col-xs-12">${requirement.project.trigramme}</td>
                                        <td class="col-xs-12">${requirement.tasks.size()}</td>
                                        <td class="col-xs-12">${requirement.description}</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Panel My Tasks -->
        </div>

        <div class="col-xlg-12 col-lg-12 col-md-12">
            <!-- Panel My Tasks -->
            <div class="widget widget-shadow" id="tasks">
                <div class="widget-content widget-radius bg-white padding-30" style="min-width:480px;">
                    <div class="row height-50">
                        <div class="col-xs-6">
                            <div class="blue-grey-700">TÂCHES</div>
                        </div>
                        <div class="col-xs-6">
                            <div class="dropdown clearfix pull-right" id="tasksActions">
                                <button class="btn btn-default dropdown-toggle bg-white" style="border-radius:20px;"
                                        type="button" data-toggle="dropdown" aria-expanded="false">
                                    Actions
                                    <span class="icon wb-chevron-down-mini" aria-hidden="true"></span>
                                </button>
                                <ul class="dropdown-menu" role="menu">
                                    <li role="presentation"><a href="/projets/${project.id}/taches/nouveau"
                                                               role="menuitem"
                                                               onclick="detailsCtrl.verifyIfProjectIsNotBlank(event)">Ajouter</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <table class="table table-stripped table-fixed toggle-arrow-tiny" id="tasksTable">
                                <thead>
                                <tr>
                                    <th class="col-xs-2" data-toggle="true">Libellé</th>
                                    <th class="col-xs-2">Description</th>
                                    <th class="col-xs-2">Status</th>
                                    <th class="col-xs-2">Jalon</th>
                                    <th class="col-xs-3" colspan="2">Exigences associées</th>
                                    <th data-hide="all">Auteur</th>
                                    <th data-hide="all">Charge (en jours)</th>
                                    <th data-hide="all">Date théorique de début</th>
                                    <th data-hide="all">Date réelle de début</th>
                                    <th data-hide="all">Tache requise</th>
                                </tr>
                                </thead>
                                <div class="form-inline padding-bottom-15">
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <div class="form-group" id="filteringStatusTaskContainer">
                                                <label class="control-label">Jalon</label>
                                                <select id="filteringStatus" class="form-control">
                                                    <option value="">Tous</option>
                                                    <c:forEach items="${jalons}" var="jalon">
                                                        <option value="${jalon.id}-${jalon.id}">${jalon.label}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-sm-6 text-right">
                                            <div class="form-group" id="filteringSearchTaskContainer">
                                                <input id="filteringSearch" type="text" placeholder="Rechercher ..."
                                                       class="form-control"
                                                       autocomplete="off">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <tbody>
                                <c:forEach items="${taskDetailleds}" var="taskDetailled">
                                    <tr>
                                        <td class="col-xs-2">${taskDetailled.task.label}</td>
                                        <td class="col-xs-2">${taskDetailled.task.description}</td>
                                        <td class="col-xs-2">
                                            <c:choose>
                                                <c:when test="${taskDetailled.task.finished == true}">
                                                    <span class="label label-table label-success">Terminée</span>
                                                </c:when>
                                                <c:when test="${taskDetailled.task.finished != true && taskDetailled.task.started == true}">
                                                    <span class="label label-table label-danger">Commencé</span>
                                                    <%--<i class="fa fa-check margin-right-5 light-green-800" type="button"></i>--%>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="label label-table label-dark">Non commencée</span>
                                                    <%--<i class="fa fa-play margin-right-5 blue-800" type="button"></i>--%>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td class="col-xs-2">${taskDetailled.task.jalon.label}<span
                                                class="invisible">${taskDetailled.task.jalon.id}-${taskDetailled.task.jalon.id}</span>
                                        </td>
                                        <td class="col-xs-3">
                                            <c:forEach items="${taskDetailled.requirementParent}" var="requirement">
                                                ${requirement.description};
                                            </c:forEach>
                                            <c:forEach items="${taskDetailled.requirementParent}" var="requirement">
                                                <span class="invisible">#${requirement.id};</span>
                                            </c:forEach>
                                                <%--${taskDetailled.requirementParent.get(0).description}--%>
                                        </td>
                                        <td class="col-xs-1">
                                            <i class="fa fa-info-circle"
                                               data-content="${taskDetailled.task.description}"
                                               data-trigger="hover" data-toggle="popover"
                                               data-original-title="Description complète"
                                               data-placement="left"
                                               tabindex="0" title="" type="button"></i>
                                            <i class="fa fa-tags margin-left-5"
                                               data-content="
                                                <c:forEach items="${taskDetailled.requirementParent}" var="requirement">
                                                    ${requirement.description};
                                                </c:forEach>"
                                               data-trigger="hover" data-toggle="popover"
                                               data-original-title="Exigences associées"
                                               data-placement="left"
                                               tabindex="0" title="" type="button"></i>
                                            <c:choose>
                                                <c:when test="${taskDetailled.task.finished != true && taskDetailled.task.started == true && taskDetailled.inCurrentJalon}">
                                                    <a href="/projets/${project.id}/tache/${taskDetailled.task.id}/terminer"><i
                                                            class="fa fa-stop margin-left-5 btn-pure btn-danger"
                                                            type="button"></i>
                                                    </a>
                                                </c:when>
                                                <c:when test="${!taskDetailled.task.started && taskDetailled.inCurrentJalon}">
                                                    <a href="/projets/${project.id}/tache/${taskDetailled.task.id}/demarrer"><i
                                                            class="fa fa-play margin-left-5 btn-pure btn-success"
                                                            type="button"></i></a>
                                                </c:when>
                                            </c:choose>
                                        </td>
                                        <td class="col-xs-12">${taskDetailled.task.manager.trigramme}</td>
                                        <td class="col-xs-12">${taskDetailled.task.load}</td>

                                        <td class="col-xs-12"><fmt:formatDate
                                                value="${taskDetailled.task.theoreticalBeginDate}"
                                                pattern="dd/MM/yyyy"></fmt:formatDate></td>
                                        <td class="col-xs-12">
                                            <c:choose>
                                                <c:when test="${taskDetailled.task.realBeginDate == null}">
                                                    -
                                                </c:when>
                                                <c:otherwise>
                                                    <fmt:formatDate
                                                            value="${taskDetailled.task.realBeginDate}"
                                                            pattern="dd/MM/yyyy"></fmt:formatDate>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td class="col-xs-12">
                                            <c:choose>
                                                <c:when test="${taskDetailled.task.requiredTask == null}">
                                                    -
                                                </c:when>
                                                <c:otherwise>
                                                    ${taskDetailled.task.requiredTask.label}
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Panel My Tasks -->
        </div>
        <div class="col-xlg-12 col-lg-12 col-md-12">
            <!-- Panel Jalons -->
            <div class="widget widget-shadow" id="jalons">
                <div class="widget-content widget-radius bg-white padding-30" style="min-width:480px;">
                    <div class="row height-50">
                        <div class="col-xs-6">
                            <div class="blue-grey-700">JALONS</div>
                        </div>
                        <div class="col-xs-6">
                            <div class="dropdown clearfix pull-right" id="jalonActions">
                                <button class="btn btn-default dropdown-toggle bg-white" style="border-radius:20px;"
                                        type="button" data-toggle="dropdown" aria-expanded="false">
                                    Actions
                                    <span class="icon wb-chevron-down-mini" aria-hidden="true"></span>
                                </button>
                                <ul class="dropdown-menu" role="menu">
                                    <li role="presentation"><a role="menuitem"
                                                               href="/projets/${project.id}/jalons/nouveau">Ajouter</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <table class="table table-stripped table-fixed toggle-arrow-tiny" id="jalonsTable">
                                <thead>
                                <tr>
                                    <th class="col-xs-2" data-toggle="true">Libellé</th>
                                    <th class="col-xs-1">Status</th>
                                    <th class="col-xs-2">Avancement</th>
                                    <th class="col-xs-2">Livraison prévue</th>
                                    <th class="col-xs-2">Livraison réelle</th>
                                    <th class="col-xs-2" colspan="2">Responsable</th>
                                    <th data-hide="all">Date théorique de livraison</th>
                                </tr>
                                </thead>
                                <div class="form-inline padding-bottom-15">
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <div class="form-group" id="jalonsTableFilteringStatusContainer">
                                                <label class="control-label">Status</label>
                                                <select id="jalonsTableFilteringStatus" class="form-control">
                                                    <option value="">Tous</option>
                                                    <option value="En cours">En cours</option>
                                                    <option value="À venir">À venir</option>
                                                    <option value="Terminé">Terminé</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-sm-6 text-right">
                                            <div class="form-group" id="jalonsTableFilteringSearchContainer">
                                                <input id="jalonsTableFilteringSearch" type="text"
                                                       placeholder="Rechercher ..."
                                                       class="form-control"
                                                       autocomplete="off">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <tbody>
                                <c:forEach items="${jalonWithProgressStates}" var="jalonWithProgressState">
                                    <tr>
                                        <td class="col-xs-2">${jalonWithProgressState.jalon.label}</td>
                                        <td class="col-xs-1">
                                            <c:choose>
                                                <c:when test="${jalonWithProgressState.finished}">
                                                    <span class="label label-table label-success">Terminé</span>
                                                </c:when>
                                                <c:when test="${jalonWithProgressState.current}">
                                                    <span class="label label-table label-danger">En cours</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="label label-table label-dark">À venir</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td class="col-xs-2">${jalonWithProgressState.progressPercentage}%</td>
                                        <td class="col-xs-2">
                                            <fmt:formatDate value="${jalonWithProgressState.jalon.deliveryDate}"
                                                            pattern="dd/MM/yyyy"/>
                                        </td>
                                        <td class="col-xs-2">
                                            <fmt:formatDate value="${jalonWithProgressState.jalon.realDeliveryDate}"
                                                            pattern="dd/MM/yyyy"/>
                                        </td>
                                        <td class="col-xs-2">${jalonWithProgressState.jalon.manager.trigramme}</td>
                                        <td class="col-xs-1">
                                                <%--<i class="fa fa-tags margin-left-5"--%>
                                                <%--data-content=""--%>
                                                <%--data-trigger="hover" data-toggle="popover"--%>
                                                <%--data-original-title="Exigences associées"--%>
                                                <%--data-placement="left"--%>
                                                <%--tabindex="0" title="" type="button"></i>--%>
                                        </td>
                                        <td class="col-xs-12">
                                            <fmt:formatDate value="${jalonWithProgressState.theoricalEndDate}"
                                                            pattern="dd/MM/yyyy"/>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Panel Jalons -->
        </div>
    </div>
</my:base>

<script>

    (function () {

        var taskRequiredError = ${hasTaskRequiredError};
        if (taskRequiredError) {
            alertify.alert('Veuillez d\'abord terminer la tâche ${hasTaskRequiredError ? taskRequiredError.label : '' }.');
        }

        detailsCtrl = {};

        detailsCtrl.verifyIfProjectIsNotBlank = _verifyIfProjectIsNotBlank;

        function _verifyIfProjectIsNotBlank(e) {
            if (${isBlankProject}) {
                e.preventDefault(); // --> if this handle didn't run first, this wouldn't work
                alertify.alert('Veuillez d\'abord créer un jalon et une exigence au minimum.');
            }
        }

//        $("").on("click", function (e) {
//
//            doSomething();
//        });
    })();

    //widget-pie-progress
    (function () {
        $("#widgetPieProgress .pieProgress-project").asPieProgress({
            namespace: 'pie-progress',
            barcolor: $.colors("primary", 600),
            trackcolor: $.colors("blue-grey", 100),
        });

        $("#widgetPieProgress .pieProgress-jalons").asPieProgress({
            namespace: 'pie-progress',
            barcolor: $.colors("cyan", 600),
            trackcolor: $.colors("blue-grey", 100),
        });

        $("#widgetPieProgress .pieProgress-exigences").asPieProgress({
            namespace: 'pie-progress',
            barcolor: $.colors("purple", 600),
            trackcolor: $.colors("blue-grey", 100),
        });
    })();

    (function (document, window, $) {
        var defaults = $.components.getDefaults("webuiPopover");
    })(document, window, jQuery);

    (function () {
        $('#requirementsTable').footable().on('footable_row_expanded',
                function (e) {
                    $('#requirementsTable tbody tr.footable-detail-show').not(
                            e.row).each(function () {
                        $('#requirementsTable').data('footable').toggleDetail(
                                this);
                    });
                });

        $('#jalonsTable').footable().on('footable_row_expanded',
                function (e) {
                    $('#jalonsTable tbody tr.footable-detail-show').not(
                            e.row).each(function () {
                        $('#jalonsTable').data('footable').toggleDetail(
                                this);
                    });
                });
    })();


    // Filtering
    // ---------
    (function () {
        var filtering = $('#tasksTable');
        filtering.footable({
            "filtering": {
                "space": "AND"
            }
        }).on('footable_filtering', function (e) {
            var selected = $('#filteringStatus').find(':selected').val();
            e.filter += (e.filter && e.filter.length > 0) ? ' ' +
            selected : selected;
            e.clear = !e.filter;
        });

        //Filter status
        $('#filteringStatus').change(function (e) {
            e.preventDefault();
            filtering.trigger('footable_filter', {
                filter: $(this).val()
            });
        });

        // Search input
        $('#filteringSearch').on('input', function (e) {
            debugger;
            e.preventDefault();
            filtering.trigger('footable_filter', {
                filter: $(this).val()
            });
        });

        var jalonTable = $('#jalonsTable');

        //Filter status
        $('#jalonsTableFilteringStatus').change(function (e) {
            e.preventDefault();
            jalonTable.trigger('footable_filter', {
                filter: $(this).val()
            });
        });

        // Search input
        $('#jalonsTableFilteringSearch').on('input', function (e) {
            debugger;
            e.preventDefault();
            jalonTable.trigger('footable_filter', {
                filter: $(this).val()
            });
        });
    })();

    /*!
     * remark v1.0.1 (http://getbootstrapadmin.com/remark)
     * Copyright 2015 amazingsurge
     * Licensed under the Themeforest Standard Licenses
     */
    (function (window, document, $) {
        'use strict';

        $.configs.set('tour', {
            steps: [{
                element: "#widgetPieProgress",
                intro: "Avancement du projet <p class='content'>Vous pouvez consultez ici les indicateurs concernants le projet en générale. L'avancement du jalon correspond au jalon en cours.</p>"
            }, {
                element: "#requirements",
                intro: "Exigences du projets <p class='content'>Vous pouvez consultez la liste des exigences. Chaque lignes est cliquable et permet d'obtenir des informations supplémentaires.</p>"
            }, {
                element: "#requirementsActions",
                intro: "Actions sur les exigences <p class='content'>Vous pouvez ajouter une exigences au projet courant via ce menu.</p>",
                position: 'left',
            }, {
                element: "#tasks",
                intro: "Tâches du projet <p class='content'>Voici la liste des tâches liés au projets. Comme pour les exigences en cliquant sur une ligne vous aurez des informations supplémentaires. Les exigences associées sont séparée par des points virgules.</p>",
                position: 'left'
            }, {
                element: "#filteringStatusTaskContainer",
                position: 'right',
                intro: "Filtrer les tâches <p class='content'>Suivez l'avancement du projet jalon par jalon, en fonction des tâches du jalon voulu.</p>"
            }, {
                element: "#filteringSearchTaskContainer",
                position: 'left',
                intro: "Rechercher dans les tâches <p class='content'>Vous pouvez aussi filtrer en tapant du texte, pour, par exemple trouver une tâche associée à une ou plusieurs exigences.</p>"
            }, {
                element: "#jalons",
                intro: "Jalon du projet <p class='content'>Vous pouvez ici consultez la liste des jalons. Vous pouvez consulter la date théorique calculée de fin du jalon en cliquant la lignes.</p>",
                position: 'top'
            }, {
                element: "#jalonsTableFilteringStatusContainer",
                position: 'right',
                intro: "Filtrer les jalons <p class='content'>Suivez l'avancement du projet par exemple en fonction des jalons terminées.</p>"
            },
                {
                    element: "#jalonsTableFilteringSearchContainer",
                    position: 'left',
                    intro: "Recherche dans les jalons <p class='content'>Vous pouvez appliquez différente filtre de recherche en tapant du texte.</p>"
                }],
            skipLabel: "<i class='wb-close'></i>",
            doneLabel: "<i class='wb-close'></i>",
            nextLabel: "Suivant <i class='wb-chevron-right-mini'></i>",
            prevLabel: "<i class='wb-chevron-left-mini'></i>Précédent",
            showBullets: false
        });

    })(window, document, $);


</script>

