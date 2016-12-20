<%@ tag language="java" pageEncoding="UTF-8"%>
<%@attribute name="action"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@attribute name="title" required="false"%>
<%@taglib prefix="my" tagdir="/WEB-INF/tags/"%>
<!DOCTYPE html>
<html>
<my:header></my:header>
<body>
	<div class="my-content container">
		<jsp:doBody></jsp:doBody>
	</div>
</body>
<my:importJs></my:importJs>
</html>
