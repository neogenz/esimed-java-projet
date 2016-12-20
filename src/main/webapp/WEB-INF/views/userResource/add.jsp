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
<my:base categorie="resources" action="resources-add">
    <div class="page-content container-fluid">
        <div class="row">
            <div class="col-md-12">
                <my:panel title="Nouvelle ressource">
                    <form:form class="form-horizontal"
                               action="/ressources/sauvegarder"
                               method="POST" commandName="newUserResource" id="newUserResourceForm">
                        <form:input type="hidden" path="id"/>

                        <div class="form-group">
                            <label class="control-label col-md-3">Nom
                                <span class="required">*</span>
                            </label>
                            <div class="col-md-5">
                                <form:input type="text" class="form-control" name="lastname"
                                            path="lastname" required="" id="lastname"/>
                            </div>
                            <form:errors path="lastname"
                                         cssClass="alert alert-danger margin-top-5"
                                         element="div"/>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-md-3">Prénom
                                <span class="required">*</span>
                            </label>
                            <div class="col-md-5">
                                <form:input type="text" class="form-control" name="firstname"
                                            path="firstname" required="" id="firstname"/>
                            </div>
                            <form:errors path="firstname"
                                         cssClass="alert alert-danger margin-top-5"
                                         element="div"/>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-md-3">Trigramme
                                <span class="required">*</span>
                            </label>
                            <div class="col-md-5">
                                <form:input type="text" class="form-control" name="trigramme"
                                            path="trigramme" required="" id="trigramme" maxlength="3"/>
                            </div>
                            <form:errors path="trigramme"
                                         cssClass="alert alert-danger margin-top-5"
                                         element="div"/>
                        </div>

                        <div class="form-group">
                            <div class="col-md-12">
                                <button type="reset" class="btn btn-default btn-outline">Réinitialiser</button>
                                <button type="submit" id="saveUserResourceBtn" class="btn btn-primary pull-right">
                                    Créer
                                </button>
                            </div>
                        </div>
                    </form:form>

                </my:panel>
            </div>
        </div>
    </div>
</my:base>
<script>

    (function () {

        if (${userResourceHasCreated}) {
            alertify.logPosition("bottom right");
            alertify.success("La ressource à bien été créé.");
        }

        $('#newUserResourceForm').formValidation({
            framework: "bootstrap",
            button: {
                selector: '#saveUserResourceBtn',
                disabled: 'disabled'
            },
            icon: null,
            fields: {
                firstname: {
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
                lastname: {
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
