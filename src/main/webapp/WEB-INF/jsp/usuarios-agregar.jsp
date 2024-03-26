<!DOCTYPE html>
<html lang="en">
<%@ include file="header.jsp" %>
<form:form modelAttribute="usuario" method="POST" action="/usuario/agregar">
    <label for="">tipo de documento: </label>
    <select name="tipoDocumento">
        <c:forEach var="tipoDocumento" items="${tiposDeDocumento}">
            <option value="${tipoDocumento.idTipoDoc}">${tipoDocumento.nombreDoc}</option>
        </c:forEach>
    </select>
    <label for="">numero de documento: </label>
    <form:input path="numeroDoc" value="12345678-9"/>
    <label for="">email: </label>
    <form:input path="email" value="c@gmail.com"/>
    <label for="">password: </label>
    <form:input path="password" value="1234"/>
    <button type="submit">enviar</button>
</form:form>
<%@ include file="footer.jsp" %>
</html>