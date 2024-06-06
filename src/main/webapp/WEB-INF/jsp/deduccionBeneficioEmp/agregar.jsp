<%@ include file="../base/head.jsp" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<title>Deduccion/beneficio</title>
<%@ include file="../base/navbar.jsp" %>
<a href="/deduccionesBeneficiosEmpleados/listar?id=${empleado.idEmpleado}"><button title="Lista principal" class="btn btn-primary ms-4 mt-1">←</button></a>
<div class="d-flex justify-content-center mt-4">
    
</div>
<form:form modelAttribute="deducBenefEmp" method="POST" action="/deduccionesBeneficiosEmpleados/agregar" class="container mx-2 mt-4">
    <div class="row mb-3">
        <form:hidden path="idDeducBenef_Emp"/>
        <form:hidden path="empleado.idEmpleado" value="${empleado.idEmpleado}"/>
        <div class="col-md-6">
            <label class="form-label">Nombre</label>
            <form:select class="form-select" path="deduccionBeneficio.idDeducBenef" items="${deduccionesBeneficiosBase}" itemValue="idDeducBenef" itemLabel="nombreDeducBenef"/>
        </div>
        <div class="col-md-6">
            <label class="form-label">Proporcional al sueldo </label>
            <form:select class="form-select" path="proporcionalAlSueldo">
                <form:option value="true">Si</form:option>
                <form:option value="false">No</form:option>
            </form:select>
        </div>
    </div>
        <div class="row mb-3">
                <div class="col-md-6">
                    <label class="form-label">Monto o porcentaje</label>
                    <form:input path="montoOPorcentaje" class="form-control"  required="true"/>
               </div>
        </div>
                
    <div class="d-flex justify-content-center">
        <button class="btn btn-primary mt-3">Guardar</button>
    </div>

</form:form>

<%@ include file="../base/footer.jsp" %>
