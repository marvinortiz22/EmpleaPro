<%@ include file="../base/head.jsp" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<title>Editar Permiso Empleado</title>
<%@ include file="../base/navbar.jsp" %>
<div class="d-flex justify-content-center">
    <h1 class="mt-5">Editar Permiso de Empleado ${permiso.empleado.nombre1} ${permiso.empleado.nombre2} ${permiso.empleado.apellido1} ${permiso.empleado.apellido2}</h1>
</div>
<div class="row m-auto">
    <div class="col-1"></div>
    <div class="col-3">
        <div class="d-flex flex-row">
            <a href="/permiso/listar">
                <button title="Lista principal" class="btn btn-primary">← Regresar</button>
            </a>
        </div>
    </div>
    <div class="col-7">
        <c:if test="${not empty errorMessage}">
    <div class="alert alert-danger alert-dismissible fade show mt-3" role="alert">
        ${errorMessage}
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
</c:if>
    </div>
</div>

<form:form modelAttribute="permiso" method="POST" action="/permiso/editar" class="container mx-2 mt-2">
    <form:hidden path="idPerLic_Emp"/>
    <div class="row mt-5 mb-5">
        <div class="col-md-3"></div>
        <div class="col-md-3 text-end">
            <label class="form-label">Causa</label>
        </div>
        <div class="col-md-3">
            <form:select path="permisoLicencia.idPermisoLicencia" class="form-control">
                <form:options items="${causas}" itemValue="idPermisoLicencia" itemLabel="causa" />
            </form:select>
        </div>
        <div class="col-md-3"></div>
    </div>
    <div class="row mt-5 mb-5">
        <div class="col-md-3"></div>
        <div class="col-md-3 text-end">
            <label class="form-label">Estado</label>
        </div>
        <div class="col-md-3">
            <form:select path="aprobada" class="form-control">
                <form:option value="1">Aprobado</form:option>
                <form:option value="0">Reprobado</form:option>
            </form:select>
        </div>
        <div class="col-md-3"></div>
    </div>
    <div class="row mt-5 mb-5">
        <div class="col-md-3"></div>
        <div class="col-md-3 text-end">
            <label class="form-label">Descontable</label>
        </div>
        <div class="col-md-3">
            <form:select path="descontable" class="form-control">
                <form:option value="1">SI</form:option>
                <form:option value="0">NO</form:option>
            </form:select>
        </div>
        <div class="col-md-3"></div>
    </div>
    <div class="row mt-5 mb-5">
        <div class="col-md-3"></div>
        <div class="col-md-3 text-end">
            <label class="form-label">Fecha de Inicio</label>
        </div>
        <div class="col-md-3">
            <form:input path="fechaInicio" id="fechaInicio" class="form-control" type="date" required="true" value="${permiso.fechaInicio}"/>
        </div>
        <div class="col-md-3"></div>
    </div>
    <div class="row mt-5 mb-5">
        <div class="col-md-3"></div>
        <div class="col-md-3 text-end">
            <label class="form-label">Fecha de Fin</label>
        </div>
        <div class="col-md-3">
            <form:input path="fechaFin" id="fechaFin" class="form-control" type="date" required="true" value="${permiso.fechaFin}"/>
        </div>
        <div class="col-md-3"></div>
    </div>
    <div class="row d-flex justify-content-center">
        <div class="col-6"></div>
        <div class="col-2 mt-2 mb-2">
            <button class="btn btn-primary me-0" type="submit">Guardar</button>
        </div>
        <div class="col-4"></div>
    </div>
</form:form>

<%@ include file="../base/footer.jsp" %>

