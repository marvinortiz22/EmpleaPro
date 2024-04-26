<%@ include file="base/header.jsp" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<title>Usuario</title>

<div class="d-flex justify-content-center">
    <h1 class="mt-4">Datos de usuario</h1>
</div>

<form:form modelAttribute="usuario" method="POST" action="/usuario/agregar" class="container mx-2 mt-4">
    <div class="row mb-3">
        <form:hidden path="idUsuario"/>
        <div class="col-md-6">
            <label class="form-label">Nombre de usuario</label>
            <form:input path="username" class="form-control" value=""/>
        </div>
        <div class="col-md-6">
            <label class="form-label">Correo electrónico </label>
            <form:input path="email" class="form-control" value=""/>
        </div>
    </div>
    <div class="row mb-3">
        <div class="col-md-6">
            <label class="form-label">Contraseña </label>
            <form:input path="password" class="form-control" type="password" value=""/>
        </div>
    </div>
    <div class="d-flex justify-content-center">
        <button class="btn btn-primary me-0">Guardar</button>
    </div>
    
</form:form>

<%@ include file="base/footer.jsp" %>
