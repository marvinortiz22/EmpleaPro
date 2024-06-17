<%@ include file="../base/head.jsp" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<style>
    span {
        color: red;
    }
</style>
<title>Control de horas</title>
<%@ include file="../base/navbar.jsp" %>
<a href="/horasEmpleado/listar"><button title="Lista principal" class="btn btn-primary ms-4 mt-1">←</button></a>
<div class="d-flex flex-column text-center mt-4">
    <h6>Control de horas</h6>
    <h6>Empleado: ${horasEmpleado.empleado.nombreCompleto}</h6>
    <h6>Fecha: ${usuarioPermisos.fecha}</h6>
</div>

<form:form modelAttribute="horasEmpleado" method="POST" action="/horasEmpleado/editar" class="container mx-2 mt-4" onsubmit="return validarHoras()">
    <div class="row mb-3">
        <form:hidden path="idHorasEmpleado"/>
        <form:hidden path="empleado.idEmpleado"/>
        <form:input hidden="true" type="date" path="fecha" value="${usuarioPermisos.fecha2}"/>
        <div class="col-md-6">
            <label class="form-label">Hora de ingreso</label>
            <form:input path="horaIngreso" type="time" class="form-control" step="1" id="horaIngreso"/>
            <form:errors path="horaIngreso"/>
        </div>
        <div class="col-md-6">
            <label class="form-label">Hora de salida </label>
            <form:input path="horaSalida" type="time" class="form-control" step="1" id="horaSalida"/>
            <form:errors path="horaSalida"/>
        </div>
    </div>
    <div class="d-flex justify-content-center">
        <button class="btn btn-primary me-0">Guardar</button>
    </div>
</form:form>

<%@ include file="../base/footer.jsp" %>

<script>
    function validarHoras() {
        var horaIngreso = document.getElementById("horaIngreso").value;
        var horaSalida = document.getElementById("horaSalida").value;

        if (horaIngreso && horaSalida) {
            var ingreso = new Date("1970-01-01T" + horaIngreso + "Z");
            var salida = new Date("1970-01-01T" + horaSalida + "Z");

            if (ingreso >= salida) {
                alert("La hora de ingreso debe ser menor que la hora de salida.");
                return false;
            }
        }

        return true;
    }
</script>
