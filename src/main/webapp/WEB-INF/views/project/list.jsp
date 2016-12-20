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
<my:base categorie="projects" action="projects-all">
    <div class="page-content container-fluid">
        <div class="row">
            <div class="col-md-12">
                <my:panel title="Projets de l'équipe">
                    <table class="table table-stripped">
                        <thead>
                        <tr>
                            <th>Nom du projet</th>
                            <th>Trigramme</th>
                            <th colspan="2">Chef de projet</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${projects}" var="project">
                            <tr>
                                <td>${project.name}</td>
                                <td>${project.trigramme}</td>
                                <td>${project.manager.firstname} ${project.manager.lastname}</td>
                                <td><a href="/projets/${project.id}"><i class="fa fa-eye"></i></a></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </my:panel>
            </div>
        </div>
    </div>
</my:base>
