<%@ include file="base/header.jsp" %>
<title>Usuario</title>
<form:form modelAttribute="usuario" method="POST" action="/usuario/agregar">
    <form:hidden path="idUsuario"/>
    <label for="">username: </label>
        <form:input path="username" value=""/>

    <label for="">email: </label>
    <form:input path="email" value=""/>
    <label for="">password: </label>
    <form:input path="password" value=""/>
    <button type="submit">enviar</button>
</form:form>
<%@ include file="base/footer.jsp" %>
