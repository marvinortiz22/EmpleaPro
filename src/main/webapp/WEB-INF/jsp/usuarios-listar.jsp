<!DOCTYPE html>
<html lang="en">
<%@ include file="header.jsp" %>
<c:forEach var="usuario" items="${puestos}">
<p>${usuario.idUsuario}</p>
<p>${usuario.rol.nombreRol}</p>
<p>${usuario.tipoDocumento.nombreDoc}</p>
<p>${usuario.email}</p>
<p>${usuario.password}</p>
<p>${usuario.estado}</p>
<p>${usuario.intentosLogin}</p>
</c:forEach>
<a href="/usuario/agregar"><button>aa</button></a>
<%@ include file="footer.jsp" %>
</html>
