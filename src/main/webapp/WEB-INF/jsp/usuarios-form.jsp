<!DOCTYPE html>
<html lang="en">
<%@ include file="header.jsp" %>
<form:form modelAttribute="usuario" method="POST" action="/usuario/agregar">
    <form:hidden path="idUsuario"/>
    <label for="">username: </label>
        <form:input path="username" value=""/>
    <label for="">tipo de documento: </label>
    <form:select path="tipoDocumento.idTipoDoc">
          <form:options items="${tiposDeDocumento}" itemValue="idTipoDoc" itemLabel="nombreDoc" />
    </form:select>
    <label for="">numero de documento: </label>
    <form:input path="numeroDoc" value=""/>
    <label for="">email: </label>
    <form:input path="email" value=""/>
    <label for="">password: </label>
    <form:input path="password" value=""/>
    <button type="submit">enviar</button>
</form:form>
<%@ include file="footer.jsp" %>
</html>