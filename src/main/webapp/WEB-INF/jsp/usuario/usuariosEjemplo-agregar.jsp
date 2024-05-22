<%@ include file="../base/head.jsp" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<title>Datos de usuario</title>
<%@ include file="../base/navbar.jsp" %>
<a href="/usuarioEjemplo/listar"><button title="Lista principal" class="btn btn-primary ms-4 mt-1">←</button></a>
<div class="d-flex justify-content-center">
    <h1 class="mt-4">Datos de usuario</h1>
</div>
<div class="d-flex justify-content-center">
    <p class="mt-4">Nota: de momento no editen los usuarios o ya no podran hacer login con ellos</p>
</div>

<form:form modelAttribute="usuario" method="POST" action="/usuarioEjemplo/agregar" class="container mx-2 mt-4">
    <div class="row mb-3">
        <form:hidden path="idUsuario"/>
        <div class="col-md-6">
            <label class="form-label">Nombre de usuario</label>
            <form:input path="username" class="form-control" value="" required="true"/>

        </div>
        <div class="col-md-6">
            <label class="form-label">Correo electrónico </label>
            <form:input path="email" class="form-control" value="" required="true"/>

        </div>
    </div>
    <div class="row mb-3">
        <div class="col-md-6">
            <label class="form-label">Contraseña </label>
            <form:input path="password" class="form-control" type="password" required="true"/>

        </div>
        <div class="col-md-6">
            <label class="form-label">Rol </label>
            <form:select class="form-select" path="Rol.idRol" items="${roles}" itemValue="idRol" itemLabel="nombreRol"/>
        </div>
    </div>
    <div class="d-flex justify-content-center">
        <button class="btn btn-primary me-0">Guardar</button>
    </div>
    
</form:form>

<%@ include file="../base/footer.jsp" %>