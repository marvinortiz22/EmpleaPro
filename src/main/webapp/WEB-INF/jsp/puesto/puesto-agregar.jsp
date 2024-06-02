<%@ include file="../base/head.jsp" %>
<%@ include file="../base/navbar.jsp" %>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<title>
    <c:if test="${empty puesto.idPuesto}">
        Agregar puesto
    </c:if>
    <c:if test="${!empty puesto.idPuesto}">
        Editar puesto
    </c:if>
</title>

<div class="container-fluid">
    <div class="card bg-light mx-3 my-4">
        <div class="card-header d-flex justify-content-center">
            <h1 class="mt-1 mb-2">
                <c:if test="${empty puesto.idPuesto}">
                    Agregar puesto
                </c:if>
                <c:if test="${!empty puesto.idPuesto}">
                    Editar puesto
                </c:if>
            </h1>
        </div>

        <div class="card-body">
            <div class="d-flex flex-row">
                <a href="/puesto/listar">
                    <button title="Lista principal" class="btn btn-primary"> ← Regresar </button>
                </a>
            </div>
            <hr>

            <form:form modelAttribute="puesto" method="post" action="guardar">
            <c:if test="${!empty puesto.idPuesto}">
                <form:hidden path="idPuesto"/>
            </c:if>

            <div class="d-flex flex-column mt-4 mb-4">
                <h5 class="card-title">Datos del puesto</h5>
                <div class="d-flex flex-wrap justify-content-around mb-4">
                    <div class="p-2">
                        <label for="nombrePuesto" class="form-label">Nombre del Puesto*</label>
                        <form:input path="nombrePuesto" class="form-control" maxlength="50" required="true"/>
                        <form:errors path="nombrePuesto" class="text-danger small"/>
                    </div>
                    <div class="p-2">
                        <label for="salarioMin" class="form-label">Salario Mínimo*</label>
                        <form:input path="salarioMin" class="form-control" id="salarioMin" pattern="^\d{1,8}(\.\d{0,2})?$" title="Debe ser un número de 10 dígitos, ejemplo: 12345678.99" required="true"/>
                        <form:errors path="salarioMin" class="text-danger small"/>
                    </div>
                    <div class="p-2">
                        <label for="salarioMax" class="form-label">Salario Máximo*</label>
                        <form:input path="salarioMax" class="form-control" id="salarioMax" pattern="^\d{1,8}(\.\d{0,2})?$" title="Debe ser un número de 10 dígitos, ejemplo: 12345678.99" required="true"/>
                        <form:errors path="salarioMax" class="text-danger small"/>
                    </div>
                    <div class="p-2">
                        <label for="unidad" class="form-label">Unidad</label>
                        <form:select path="unidad.idUnidad" id="unidad" class="form-select">
                            <option value="0">Seleccione una Unidad</option>
                            <form:options items="${unidades}" itemValue="idUnidad" itemLabel="nombreUnidad" />
                        </form:select>
                        <form:errors path="unidad.idUnidad" class="text-danger small"/>
                    </div>
                </div>
            </div>

            <div class="d-flex flex-row justify-content-center">
                <button class="btn btn-success">
                    <i class="bi bi-floppy"></i>
                    Guardar
                </button>
            </div>

            </form:form>
        </div>
    </div>
</div>

<script>
    document.getElementById('salarioMin').addEventListener('input', function (e) {
        e.target.value = e.target.value.replace(/[^\d.]/g, '').slice(0, 11);
    });

    document.getElementById('salarioMax').addEventListener('input', function (e) {
        e.target.value = e.target.value.replace(/[^\d.]/g, '').slice(0, 11);
    });
</script>

<%@ include file="../base/footer.jsp" %>

