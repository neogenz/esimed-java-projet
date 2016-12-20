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
                    <li class="active">Nouvelle tâche</li>
                </ol>
                <my:panel title="Nouvelle tâche dans le projet ${project.name}">
                    <form:form class="form-horizontal"
                               action="/projets/${project.id}/taches/sauvegarder"
                               method="POST" commandName="newTask" id="newTaskForm">
                        <form:input type="hidden" path="task.id"/>

                        <%--<form:input type="hidden" path="task.manager.id"/>--%>


                        <div class="form-group">
                            <label class="control-label col-md-3">Responsable
                                <span class="required">*</span>
                            </label>
                            <div class="col-md-5">
                                <form:select class="form-control" id="task.manager.id" path="task.manager.id"
                                             name="task.manager.id"
                                             data-fv-notempty="true">
                                    <c:forEach items="${userResources}" var="userResource">
                                        <option value="${userResource.id}">${userResource.trigramme}</option>
                                    </c:forEach>
                                </form:select>
                            </div>
                            <form:errors path="task.manager.id"
                                         cssClass="alert alert-danger margin-top-5"
                                         element="div"/>
                        </div>


                        <div class="form-group">
                            <label class="control-label col-md-3">Libellé
                                <span class="required">*</span>
                            </label>
                            <div class="col-md-5">
                                <form:input type="text" class="form-control" name="label"
                                            path="task.label" required="" id="label"/>
                            </div>
                            <form:errors path="task.label"
                                         cssClass="alert alert-danger margin-top-5"
                                         element="div"/>
                        </div>

                        <div class="form-group">

                            <label class="control-label col-md-3" for="theoreticalBeginDate">Date théorique de début
                                <span class="required">*</span>
                            </label>
                            <div class="col-md-5 date">
                                <div class="input-group input-append date" id="datePicker">
                                    <form:input type="text" class="form-control" path="task.theoreticalBeginDate"
                                                name="theoreticalBeginDate" id="theoreticalBeginDate" required=""/>
                                    <span class="input-group-addon add-on"><i
                                            class="fa fa-calendar"></i></span>
                                </div>
                                <form:errors path="task.theoreticalBeginDate"
                                             cssClass="alert alert-danger margin-top-5"
                                             element="div"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-md-3">Description
                                <span class="required">*</span>
                            </label>
                            <div class="col-md-5">
                                <form:textarea type="text" class="form-control" name="description"
                                               path="task.description" required="" id="description" rows="2"/>
                            </div>
                            <form:errors path="task.description"
                                         cssClass="alert alert-danger margin-top-5"
                                         element="div"/>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-md-3">Jalon
                                <span class="required">*</span>
                            </label>
                            <div class="col-md-5">
                                <form:select class="form-control" id="jalon" path="task.jalon.id"
                                             name="jalon"
                                             data-fv-notempty="true">
                                    <c:forEach items="${jalons}" var="jalon">
                                        <option value="${jalon.id}">${jalon.label}</option>
                                    </c:forEach>
                                </form:select>
                            </div>
                            <form:errors path="task.jalon.id"
                                         cssClass="alert alert-danger margin-top-5"
                                         element="div"/>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-md-3">Exigence à réaliser
                                <span class="required">*</span>
                            </label>
                            <div class="col-md-5">
                                <form:select class="form-control" id="requirementsIds"
                                             name="requirementsIds" path="requirementsIds"
                                             data-fv-notempty="true" multiple="multiple" data-plugin="selectpicker">
                                    <c:forEach items="${requirements}" var="requirement">
                                        <option value="${requirement.id}">${requirement.description}</option>
                                    </c:forEach>
                                </form:select>
                                    <%--
                                    <form:select class="form-control" id="jalon" path="requirements.id"
                                                 name="requirements"
                                                 data-fv-notempty="true">
                                        <c:forEach items="${jalons}" var="jalon">
                                            <option value="${jalon.id}">${jalon.label}</option>
                                        </c:forEach>
                                    </form:select>--%>
                            </div>
                                <%--<form:errors path="requirements"--%>
                                <%--cssClass="alert alert-danger margin-top-5"--%>
                                <%--element="div"/>--%>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-md-3">Tâche requise
                            </label>
                            <div class="col-md-5">
                                <form:select class="form-control" id="requiredTask"
                                             path="task.requiredTask.id" name="requiredTask">
                                    <option value=""> -</option>
                                    <c:forEach items="${tasks}" var="task">
                                        <option value="${task.id}">${task.label}</option>
                                    </c:forEach>
                                </form:select>
                            </div>
                            <form:errors path="task.requiredTask.id"
                                         cssClass="alert alert-danger margin-top-5"
                                         element="div"/>
                        </div>


                        <div class="form-group">
                            <label class="control-label col-md-3">Charge en jours
                                <span class="required">*</span>
                            </label>
                            <div class="col-md-5">
                                <form:input type="text" class="form-control" name="load" data-plugin="TouchSpin"
                                            data-min="1" data-max="365" data-step="1" data-decimals="0"
                                            data-boostat="5" data-maxboostedstep="10" data-postfix="jours" value="1"
                                            path="task.load" required=""
                                />
                            </div>
                            <form:errors path="task.load"
                                         cssClass="alert alert-danger margin-top-5"
                                         element="div"/>
                        </div>


                        <div class="form-group">
                            <div class="col-md-12">
                                <button type="reset" class="btn btn-default btn-outline">Réinitialiser</button>
                                <button type="submit" id="saveTaskBtn" class="btn btn-primary pull-right">
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

        if (${taskHasCreated}) {
            alertify.logPosition("bottom right");
            alertify.success("La tâche à bien été créée.");
        }


        $('#theoreticalBeginDate')
                .datepicker({
                    format: 'dd/mm/yyyy'
                })
                .on('changeDate', function (e) {
                    // Revalidate the date field
                    $('#newTaskForm').formValidation('revalidateField', 'task.theoreticalBeginDate');
                });


        $('#jalon').on('change', function () {
            var idOfJalon = $('#jalon option:selected').val();

            $.getJSON('/projets/jalon/' + idOfJalon + '/taches', function (response) {
                var tasks = response;
                $('#requiredTask option').remove();
                var options = '';

                options += '<option value=""> - </option>';
                $("#requiredTask").html(options);
                tasks.forEach(function (item) {
                    options += '<option value="' + item.id + '">' + item.label + '</option>';
                    $("#requiredTask").html(options);
                });

            });
        });


        var yesterday = new Date();
        yesterday.setDate(yesterday.getDate() - 1);

        $('#newTaskForm').formValidation({
            framework: "bootstrap",
            button: {
                selector: '#saveTaskBtn',
                disabled: 'disabled'
            },
            icon: null,
            fields: {
                'task.theoreticalBeginDate': {
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
                'task.description': {
                    validators: {
                        notEmpty: {
                            message: 'Le champ est obligatoire.'
                        }
                    }
                },
                'task.label': {
                    validators: {
                        notEmpty: {
                            message: 'Le champ est obligatoire.'
                        }
                    }
                },
                'task.jalon': {
                    validators: {
                        notEmpty: {
                            message: 'Le champ est obligatoire.'
                        }
                    }
                },
                'task.load': {
                    validators: {
                        notEmpty: {
                            message: 'Le champ est obligatoire.'
                        }
                    }
                },
                requirementsIds: {
                    validators: {
                        notEmpty: {
                            message: 'Le champ est obligatoire.'
                        }
                    }
                },
                'task.manager.id':{
                    validators: {
                        notEmpty: {
                            message: 'Le champ est obligatoire.'
                        }
                    }
                }
            }
        });
    })();

    <%--$('#requirementsIds').selectpicker('val', '${requirements.get(0).id}', null);--%>
    $('#requirementsIds').val('${requirements.get(0).id}');
    $('#requirementsIds').on('changed.bs.select', function () {
        if ($('#requirementsIds option:selected').length <= 0) {
            $('#requirementsIds').selectpicker('val', '${requirements.get(0).id}');
        }
    });

</script>
