<%@ include file="../base/head.jsp" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<title>Datos de rol</title>
<%@ include file="../base/navbar.jsp" %>
<a href="/rol/listar"><button title="Lista principal" class="btn btn-primary ms-4 mt-1">←</button></a>
<div class="d-flex justify-content-center">
    <h1 class="mt-4">Datos de rol</h1>
</div>
<form:form modelAttribute="deduccionBeneficio" method="POST" action="/deduccionesBeneficios/agregar" class="container mx-2 mt-4">
    <div class="row mb-3">
        <form:hidden path="deduccionBeneficio.idDeducBenef"/>
        <div class="col-md-6">
            <label class="form-label">Nombre</label>
            <form:input path="deduccionBeneficio.nombreDeducBenef" class="form-control"  required="true"/>
        </div>
        <div class="col-md-6">
             <label class="form-label">Tipo </label>
             <form:select class="form-select" path="deduccionBeneficio.tipo">
             <form:option value="B">beneficio</form:option>
             <form:option value="D">deduccion</form:option>
             </form:select>
        </div>
        <div class="row mb-3">
                <form:hidden path="deduccionBeneficio.idDeducBenef"/>
                <div class="col-md-6">
                    <label class="form-label">monto o porcentaje</label>
                    <form:input path="montoOPorcentaje" class="form-control"  required="true"/>
                </div>
                <div class="col-md-6">
                     <label class="form-label">proporcional al sueldo </label>
                     <form:select class="form-select" path="proporcionalAlSueldo">
                     <form:option value="true">si</form:option>
                     <form:option value="false">no</form:option>
                     </form:select>
                </div>
    <div class="d-flex justify-content-center">
        <button class="btn btn-primary mt-3">Guardar</button>
    </div>

</form:form>

<%@ include file="../base/footer.jsp" %>
