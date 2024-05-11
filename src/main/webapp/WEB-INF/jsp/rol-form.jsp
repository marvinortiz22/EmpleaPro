<%@ include file="base/head.jsp" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<title>Datos de rol</title>
<%@ include file="base/navbar.jsp" %>
<a href="/rol/listar"><button title="Lista principal" class="btn btn-none">←</button></a>
<div class="d-flex justify-content-center">
    <h1 class="mt-4">Datos de rol</h1>
</div>
<form:form modelAttribute="rol" method="POST" action="/rol/guardar" class="container mx-2 mt-4">
    <div class="row mb-3">
        <form:hidden path="idRol"/>
        <div class="col-md-6">
            <label class="form-label">Nombre de rol</label>
            <form:input path="nombreRol" class="form-control"  required="true"/>
        </div>
        <div class="col-md-6">
             <label class="form-label">Permisos </label>
             <form:select class="form-select" path="permisos" items="${permisos}" itemValue="idPermiso" itemLabel="nombrePermiso"/>
        </div>
    <div class="d-flex justify-content-center">
        <button class="btn btn-primary mt-3">Guardar</button>
    </div>

</form:form>

<%@ include file="base/footer.jsp" %>
