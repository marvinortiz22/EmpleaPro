<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
username: ${usuario.username}
permisos:
<c:forEach var="permiso" items="${usuario.permisos}">
${permiso.nombrePermiso} ,
</c:forEach>