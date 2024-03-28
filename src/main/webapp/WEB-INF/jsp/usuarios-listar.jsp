<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

    <title>Document</title>
</head>
<body>
<%@ include file="base/header.jsp" %>
<table>
    <tr>
        <th>id</th>
        <th>username</th>
        <th>rol</th>
        <th>tipo de documento</th>
        <th>numero documento</th>
        <th>email</th>
        <th>password</th>
        <th>estado</th>
        <th>intentosLogin</th>
        <th>acciones</th>
    </tr>
<c:forEach var="usuario" items="${puestos}">
 <tr>
<td>${usuario.idUsuario}</td>
<td>${usuario.username}</td>
<td>${usuario.rol.nombreRol}</td>
<td>${usuario.tipoDocumento.nombreDoc}</td>
<td>${usuario.numeroDoc}</td>
<td>${usuario.email}</td>
<td>${usuario.password}</td>
<td>${usuario.estado}</td>
<td>${usuario.intentosLogin}</td>
<td>
    <a href="/usuario/editar?id=${usuario.idUsuario}"><button>modificar</button></a>
    <a href="/usuario/borrar?id=${usuario.idUsuario}"><button>borrar</button></a>
    <a href="/usuario/email?email=${usuario.username}"><button>username</button></a>
 </td>
</tr>
</c:forEach>
</table>
<a href="/usuario/agregar"><button>agregar usuario</button></a>
<%@ include file="base/footer.jsp" %>
</body>
</html>