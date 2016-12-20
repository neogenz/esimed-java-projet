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
<my:base>
    <div class="page-content container-fluid">
        <div class="row">
            <div class="col-md-12">
                <ol class="breadcrumb breadcrumb-arrow">
                    <li><a href="/projets/">Projets</a></li>
                    <li><a href="/projets/${project.id}">Projet en cours</a></li>
                    <li class="active">Nouveau jalon</li>
                </ol>
                <my:panel title="Nouveau jalon dans le projet ${project.name}">
                    <form:form class="form-horizontal"
                               action="/projets/jalons/sauvegarder"
                               method="POST" commandName="newJalon" id="newJalonForm">
                        <form:input type="hidden" path="id"/>

                        <form:input type="hidden" path="project.id"/>
                        <%--<form:input type="hidden" path="manager.id"/>--%>


                        <div class="form-group">
                            <label class="control-label col-md-3">Responsable
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
                        </div>
                        <form:errors path="manager.id"
                                     cssClass="alert alert-danger margin-top-5"
                                     element="div"/>

                        <div class="form-group">
                            <label class="control-label col-md-3">Libellé
                                <span class="required">*</span>
                            </label>
                            <div class="col-md-5">
                                <form:input type="text" class="form-control" name="label"
                                            path="label" required="" id="label"/>
                            </div>
                        </div>
                        <form:errors path="label"
                                     cssClass="alert alert-danger margin-top-5"
                                     element="div"/>

                        <div class="form-group">

                            <label class="control-label col-md-3" for="deliveryDate">Date de livraison prévue
                                <span class="required">*</span>
                            </label>
                            <div class="col-md-5 date">
                                <div class="input-group input-append date" id="datePicker">
                                    <form:input type="text" class="form-control" path="deliveryDate"
                                                name="deliveryDate" id="deliveryDate" required=""/>
                                    <span class="input-group-addon add-on"><i
                                            class="fa fa-calendar"></i></span>
                                </div>
                            </div>
                            <form:errors path="deliveryDate"
                                         cssClass="alert alert-danger margin-top-5"
                                         element="div"/>
                        </div>


                        <div class="form-group">
                            <div class="col-md-12">
                                <button type="reset" class="btn btn-default btn-outline">Réinitialiser</button>
                                <button type="submit" id="saveJalonBtn" class="btn btn-primary pull-right">
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

        if (${jalonHasCreated}) {
            alertify.logPosition("bottom right");
            alertify.success("Le jalon à bien été créé.");
        }

        $('#deliveryDate')
                .datepicker({
                    format: 'dd/mm/yyyy'
                })
                .on('changeDate', function (e) {
                    // Revalidate the date field
                    $('#newJalonForm').formValidation('revalidateField', 'deliveryDate');
                });

        var yesterday = new Date();
        yesterday.setDate(yesterday.getDate() - 1);

        $('#newJalonForm').formValidation({
            framework: "bootstrap",
            button: {
                selector: '#saveJalonBtn',
                disabled: 'disabled'
            },
            icon: null,
            fields: {
                label: {
                    validators: {
                        notEmpty: {
                            message: 'Le champ est obligatoire.'
                        },
                        stringLength: {
                            message: 'Minimum 3 caractères.',
                            min: 3
                        }
                    }
                },
                deliveryDate: {
                    validators: {
                        notEmpty: {
                            message: 'Le champ est obligatoire.'
                        },
                        date: {
                            min: yesterday,
                            message: 'Veuillez entrer une date supérieur ou égale à la date du jour.',
                            format: 'DD/MM/YYYY'
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
