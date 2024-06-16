<%@ include file="../base/head.jsp" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<title>Deduccion/beneficio</title>
<%@ include file="../base/navbar.jsp" %>
<a href="/deduccionesBeneficiosGlobales/listar"><button title="Lista principal" class="btn btn-primary ms-4 mt-1">←</button></a>
<div class="d-flex justify-content-center">
    <h1 class="mt-4">Editar ${deduccionBeneficio.deduccionBeneficio.nombreDeducBenef} </h1>
</div>
<form:form modelAttribute="deduccionBeneficio" method="POST" action="/deduccionesBeneficiosGlobales/editar" class="container mx-2 mt-4">
    <div class="row mb-3">
        <form:hidden path="deduccionBeneficio.idDeducBenef"/>
        <form:hidden path="deduccionBeneficio.tipo"/>
        <form:hidden path="deduccionBeneficio.nombreDeducBenef"/>
        <form:hidden path="deduccionBeneficio.idDeducBenef"/>
        <form:hidden path="proporcionalAlSueldo"/>
        <div class="row mb-3 d-flex justify-content-center">
            <div class="col-md-6">
                <label class="form-label">Porcentaje</label>
                <form:input path="montoOPorcentaje" placeholder="3.00" max="99999999.99" class="form-control" type="number" step="0.01" required="true"/>
            </div>
    </div>
                
    <div class="d-flex justify-content-center">
        <button class="btn btn-primary mt-3">Guardar</button>
    </div>

</form:form>

<%@ include file="../base/footer.jsp" %>
