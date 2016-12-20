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
                    <li class="active">Nouvelle exigence</li>
                </ol>
                <my:panel title="Nouvelle exigence dans le projet ${project.name}">
                    <form:form class="form-horizontal"
                               action="/projets/exigences/sauvegarder"
                               method="POST" commandName="newRequirement" id="newRequirementForm">
                        <form:input type="hidden" path="id"/>

                        <form:input type="hidden" path="project.id"/>

                        <div class="form-group">
                            <label class="control-label col-md-3">Description
                                <span class="required">*</span>
                            </label>
                            <div class="col-md-5">
                                <form:textarea type="text" class="form-control" name="description"
                                               path="description" required="" id="description" rows="2"/>
                            </div>
                            <form:errors path="description"
                                         cssClass="alert alert-danger margin-top-5"
                                         element="div"/>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-md-3">Type
                                <span class="required">*</span>
                            </label>
                            <div class="col-md-5">
                                <form:select class="form-control" id="requirementType" path="requirementType"
                                             name="requirementType"
                                             data-fv-notempty="true">
                                    <%--<c:forEach items="${resources}" var="resource">--%>
                                    <%--<option value="${resource.id}">${resource.label}</option>--%>
                                    <%--</c:forEach>--%>
                                    <form:options items="${requirementTypeList}"
                                                  itemLabel="label"></form:options>
                                </form:select>
                            </div>
                            <form:errors path="requirementType"
                                         cssClass="alert alert-danger margin-top-5"
                                         element="div"/>
                        </div>

                        <div class="form-group" id="precisionOfTypeFormGroup">
                            <label class="control-label col-md-3">Précision du type
                                <span class="required">*</span>
                            </label>
                            <div class="col-md-5">
                                <form:select class="form-control" id="requirementPrecisionType"
                                             path="requirementPrecisionType" name="requirementPrecisionType"
                                             data-fv-notempty="true">
                                    <%--<c:forEach items="${resources}" var="resource">--%>
                                    <%--<option value="${resource.id}">${resource.label}</option>--%>
                                    <%--</c:forEach>--%>
                                    <form:options items="${requirementPrecisionTypeList}"
                                                  itemLabel="label"></form:options>
                                </form:select>
                            </div>
                            <form:errors path="requirementPrecisionType"
                                         cssClass="alert alert-danger margin-top-5"
                                         element="div"/>
                        </div>


                        <div class="form-group">
                            <div class="col-md-12">
                                <button type="reset" class="btn btn-default btn-outline">Réinitialiser</button>
                                <button type="submit" id="saveRequirementBtn" class="btn btn-primary pull-right">
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

        if(${requirementHasCreated}){
            alertify.logPosition("bottom right");
            alertify.success("L'exigence à bien été créée.");
        }

        $('#requirementType').on('change', function () {
            debugger;
            var value = $("#requirementType option:selected").val();
            if (value == '${requirementTypeFunc.name()}') {
                $('#precisionOfTypeFormGroup').show();
                $('#precisionOfTypeFormGroup select').val('${requirementPrecisionTypeList.get(0).name()}');
            } else {
                $('#precisionOfTypeFormGroup select').val(null);
                $('#precisionOfTypeFormGroup').hide();
            }
            $('#newRequirementForm').formValidation('revalidateField', 'begin');
        });

        $('#newRequirementForm').formValidation({
            framework: "bootstrap",
            button: {
                selector: '#saveRequirementBtn',
                disabled: 'disabled'
            },
            icon: null,
            fields: {
                description: {
                    validators: {
                        notEmpty: {
                            message: 'Le champ est obligatoire.'
                        }
                    }
                },
                requirementType: {
                    validators: {
                        notEmpty: {
                            message: 'Le champ est obligatoire.'
                        }
                    }
                },
                requirementPrecisionType: {
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
