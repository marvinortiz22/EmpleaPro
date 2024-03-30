<header>
username: ${usuarioPermisos.username}
permisos:
<c:forEach var="permiso" items="${usuarioPermisos.permisos}">
${permiso.nombrePermiso} ,
</c:forEach>
</header>
<br />


