<%@ include file="base/head.jsp" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<title>Datos de rol</title>
<%@ include file="base/navbar.jsp" %>
<div class="d-flex justify-content-center">
    <h1 class="mt-4">Datos de rol</h1>
</div>

<form:form modelAttribute="rol" method="POST" action="/usuario/agregarrol" class="container mx-2 mt-4">
    <div class="row mb-3">
        <form:hidden path="idRol"/>
        <div class="col-md-6">
            <label class="form-label">Nombre de rol</label>
            <form:input path="nombreRol" class="form-control" value="a" required="true"/>
        </div>
        <div class="col-md-6">

        </div>
    </div>
    <div class="row mb-3">
            <form:hidden path="estado"/>
            <div class="col-md-6">
                <label class="form-label">Permisos </label>
                <select class="form-select" multiple name="permisosList">
                    <c:forEach var="permiso" items="${permisos}">
                         <option value="${permiso.idPermiso}">${permiso.nombrePermiso}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
    <div class="d-flex justify-content-center">
        <button class="btn btn-primary me-0">Guardar</button>
    </div>

</form:form>

<%@ include file="base/footer.jsp" %>
