<!DOCTYPE html>
<html lang="en">
<%@ include file="header.jsp" %>
<c:forEach var="usuario" items="${puestos}">
<p>${usuario.idUsuario}</p>
</c:forEach>

<%@ include file="footer.jsp" %>
</html>
