<html>
<head>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles.css">
</head>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:forEach var="puesto" items="${puestos}">
<p>${puesto.idPuesto} a</p>
</c:forEach>
</html>