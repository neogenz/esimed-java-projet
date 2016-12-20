<%@ tag language="java" pageEncoding="UTF-8"%>
<%@attribute name="title" required="true"%>
<div class="panel panel-bordered">
    <div class="panel-heading">
        <h3 class="panel-title">${title}</h3>
    </div>
    <div class="panel-body">
        <jsp:doBody/>
    </div>
</div>	