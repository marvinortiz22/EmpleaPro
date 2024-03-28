<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
${permisos}
<c:forEach var="permiso" items="${permisos}">
${permiso.nombrePermiso}
</c:forEach>