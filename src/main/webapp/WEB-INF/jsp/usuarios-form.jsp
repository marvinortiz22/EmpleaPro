<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/base.css">
    <title>Document</title>
</head>
<body>
<%@ include file="base/header.jsp" %>
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
</body>
</html>