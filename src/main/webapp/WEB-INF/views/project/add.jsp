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
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<my:base categorie="projects" action="projects-add">
    <div class="page-content container-fluid">
        <div class="row">
            <div class="col-md-12">
                <my:panel title="Nouveau projet">
                    <form:form class="form-horizontal" action="/projets/sauvegarder"
                               method="POST" commandName="newProject" id="newProjectForm">
                        <form:input type="hidden" path="id"/>

                        <%--<form:input type="hidden" path="manager.id"/>--%>

                        <div class="form-group">
                            <label class="control-label col-md-3">Chef de projet
                                <span class="required">*</span>
                            </label>
                            <div class="col-md-5">
                                <form:select class="form-control" id="manager.id" path="manager.id"
                                             name="manager.id"
                                             data-fv-notempty="true">
                                    <c:forEach items="${userResources}" var="userResource">
                                        <option value="${userResource.id}">${userResource.trigramme}</option>
                                    </c:forEach>
                                </form:select>
                            </div>
                            <form:errors path="manager.id"
                                         cssClass="alert alert-danger margin-top-5"
                                         element="div"/>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-md-3">Nom du projet
                                <span class="required">*</span>
                            </label>
                            <div class="col-md-5">
                                <form:input type="text" class="form-control" name="name"
                                            path="name" required="" id="name"/>
                            </div>
                            <form:errors path="name"
                                         cssClass="alert alert-danger margin-top-5"
                                         element="div"/>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-md-3">Trigramme
                                <span class="required">*</span>
                            </label>
                            <div class="col-md-5">
                                <form:input type="text" class="form-control" name="trigramme"
                                            id="trigramme"
                                            path="trigramme" required="" maxlength="3"/>
                            </div>
                            <form:errors path="trigramme"
                                         cssClass="alert alert-danger margin-top-5"
                                         element="div"/>
                        </div>


                        <div class="form-group">
                            <div class="col-md-12">
                                <button type="reset" class="btn btn-default btn-outline">Réinitialiser</button>
                                <button type="submit" id="saveProjectBtn" class="btn btn-primary pull-right">
                                    Créer
                                </button>
                            </div>
                        </div>
                    </form:form>

                </my:panel>
            </div>
        </div>
    </div>
    <div class="alertify-logs"></div>
</my:base>
<script>
    debugger;
    if(${projectHasCreated}){

        alertify.logPosition("bottom right");
        alertify.success("Le projet à bien été créé.");
    }

    (function () {
        $('#newProjectForm').formValidation({
            framework: "bootstrap",
            button: {
                selector: '#saveProjectBtn',
                disabled: 'disabled'
            },
            icon: null,
            fields: {
                name: {
                    validators: {
                        notEmpty: {
                            message: 'Le champ est obligatoire.'
                        }
                    }
                },
                trigramme: {
                    validators: {
                        notEmpty: {
                            message: 'Le champ est obligatoire.'
                        }
                    }
                },
                'manager.id':{
                    validators: {
                        notEmpty: {
                            message: 'Le champ est obligatoire.'
                        }
                    }
                }
            }
        });
    })();
</script>
