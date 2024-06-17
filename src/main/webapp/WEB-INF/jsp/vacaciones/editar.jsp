<%@ include file="../base/head.jsp" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<style>
                span{
                    color:red;
                }

            </style>
<title>Vacaciones</title>
<%@ include file="../base/navbar.jsp" %>
<a href="/vacaciones/listar"><button title="Lista principal" class="btn btn-primary ms-4 mt-1">←</button></a>
<div class="d-flex flex-column text-center mt-4">
    <h6>Vacaciones</h6>
    <h6>Empleado: ${vacacion.empleado.nombreCompleto}</h6>
    <h6>
        <jsp:useBean id="now" class="java.util.Date"/>    
        <fmt:formatDate value="${now}" pattern="yyyy" />
    </h6>
</div>

<form:form modelAttribute="vacacion" method="POST" action="/vacaciones/editar" class="container mx-2 mt-4">
    <div class="row mb-3 d-flex justify-content-center">
        <form:hidden path="idVacacion"/>
        <form:hidden path="empleado.idEmpleado"/>
        <div class="col-md-8">
            <label class="form-label">Fecha de inicio</label>
            <form:input path="fechaInicio" type="date" class="form-control" min="" required="true"/>
            <form:errors path="fechaInicio"/>
        </div>
    </div>
    <div class="d-flex justify-content-center">
        <button class="btn btn-primary me-0">Guardar</button>
    </div>
    
</form:form>

<%@ include file="../base/footer.jsp" %>

