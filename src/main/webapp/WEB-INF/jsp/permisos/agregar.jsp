<%@ include file="../base/head.jsp" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<title>Agregar Permiso Empleado</title>
<%@ include file="../base/navbar.jsp" %>

<div class="d-flex justify-content-center">
    <h1 class="mt-3">Agregar Permiso a Empleado</h1>
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
    <div class="col-2">
    </div>
    <div class="col-4">
        <c:if test="${not empty errorMessage}">
            <div class="alert alert-danger alert-dismissible fade show mt-3" role="alert">
                ${errorMessage}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        </c:if>
    </div>
    <div class="col-2"></div>
</div>


<form:form modelAttribute="permiso" method="POST" action="/permiso/agregar" class="container mx-2 mt-2">
    <input type="hidden" name="id" value="${permiso.idPerLic_Emp}" />
    <div class="row mt-5 mb-5">
        <div class="col-md-3"></div>
        <div class="col-md-3 text-end">
            <label class="form-label">Empleado</label>
        </div>
        <div class="col-md-3">
            <form:select path="empleado.idEmpleado" class="form-control">
                <form:options items="${empleados}" itemValue="idEmpleado" itemLabel="nombreCompleto"/>
            </form:select>
        </div>
        <div class="col-md-3"></div>
    </div>

    <div class="row mt-5 mb-5">
        <div class="col-md-3"></div>
        <div class="col-md-3 text-end">
            <label class="form-label">Causa</label>
        </div>
        <div class="col-md-3">
            <form:select path="permisoLicencia.idPermisoLicencia" class="form-control">
                <form:options items="${causas}" itemValue="idPermisoLicencia" itemLabel="causa"/>
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
            <form:select path="aprobada" class="form-control" id="estado">
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
            <form:select path="descontable" class="form-control" id="descontable">
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
            <form:input path="fechaInicio" id="fechaInicio" class="form-control" type="date" required="true"/>
        </div>
        <div class="col-md-3"></div>
    </div>

    <div class="row mt-5 mb-5">
        <div class="col-md-3"></div>
        <div class="col-md-3 text-end">
            <label class="form-label">Fecha de Fin</label>
        </div>
        <div class="col-md-3">
            <form:input path="fechaFin" id="fechaFin" class="form-control" type="date" required="true"/>
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
<script>
    document.addEventListener('DOMContentLoaded', function () {
        var estadoSelect = document.getElementById('estado');
        var descontableSelect = document.getElementById('descontable');

        function updateDescontable() {
            if (estadoSelect.value == '1') { // Aprobado
                descontableSelect.disabled = false;
            } else { // Reprobado
                descontableSelect.value = '1'; // Selecciona NO
                descontableSelect.disabled = true;
            }
        }

        // Actualizar el estado al cargar la página
        updateDescontable();

        // Agregar un event listener para actualizar cuando se cambie el estado
        estadoSelect.addEventListener('change', updateDescontable);
    });
</script>
<%@ include file="../base/footer.jsp" %>









