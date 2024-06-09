<%@ include file="../base/head.jsp" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<style>
                span{
                    color:red;
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

<form:form modelAttribute="horasEmpleado" method="POST" action="/horasEmpleado/editar" class="container mx-2 mt-4">
    <div class="row mb-3">
        <form:hidden path="idHorasEmpleado"/>
        <form:hidden path="empleado.idEmpleado"/>
        <form:input hidden="true" type="date" path="fecha" value="${usuarioPermisos.fecha2}"/>
        <div class="col-md-6">
            <label class="form-label">Hora de ingreso</label>
            <form:input path="horaIngreso" type="time" class="form-control" step="1" value=""/>
            <form:errors path="horaIngreso"/>
        </div>
        <div class="col-md-6">
            <label class="form-label">Hora de salida </label>
            <form:input path="horaSalida" type="time" class="form-control" step="1" value=""/>
            <form:errors path="horaSalida"/>
        </div>
    </div>
    <div class="d-flex justify-content-center">
        <button class="btn btn-primary me-0">Guardar</button>
    </div>
    
</form:form>

<%@ include file="../base/footer.jsp" %>

