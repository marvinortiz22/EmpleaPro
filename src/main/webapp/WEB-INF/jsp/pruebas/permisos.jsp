<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:forEach var="rol" items="${roles}">
${rol.nombreRol}
<c:forEach var="permiso" items="${rol.permisos}">
${permiso.nombrePermiso}
</c:forEach>
</c:forEach>