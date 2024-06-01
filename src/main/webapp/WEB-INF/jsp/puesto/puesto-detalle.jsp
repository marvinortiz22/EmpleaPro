<%@ include file="../base/head.jsp" %>
<%@ include file="../base/navbar.jsp" %>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<title>Datos del puesto</title>

<div class="container-fluid">
    <div class="card bg-light mx-3 my-4">
        <div class="card-header d-flex justify-content-center">
            <h1 class="mt-1 mb-2">Detalles del puesto</h1>
        </div>

        <div class="card-body">
            <div class="d-flex flex-row">
                <a href="/puesto/listar">
                    <button title="Lista principal" class="btn btn-primary"> ← Regresar </button>
                </a>
            </div>
            <hr>
            <div class="d-flex flex-column mt-4 mb-4">
                <h5 class="card-title">Datos del puesto</h5>
                <div class="d-flex flex-wrap justify-content-around mb-4">
                    <div class="p-2">
                        <strong>Nombre:</strong>
                        ${puesto.nombrePuesto}
                    </div>
                    <div class="p-2">
                        <strong>Salario minimo:</strong>
                        <fmt:formatNumber value="${puesto.salarioMin}" pattern="$##,###,##0.00" />
                    </div>
                    <div class="p-2">
                        <strong>Salario maximo:</strong>
                        <fmt:formatNumber value="${puesto.salarioMax}" pattern="$##,###,##0.00" />
                    </div>
                    <c:if test="${!empty puesto.unidad}">
                        <div class="p-2">
                            <strong>Unidad:</strong>
                            ${puesto.unidad.nombreUnidad}
                        </div>
                        <div class="p-2">
                            <strong>Tipo de Unidad:</strong>
                            ${puesto.unidad.tipoUnidad.nombreTipoUnidad}
                        </div>
                    </c:if>
                    <div class="p-2">
                        <strong>Estado:</strong>
                        <c:if test="${puesto.estado}">
                            Activo
                        </c:if>
                        <c:if test="${!puesto.estado}">
                            Inactivo
                        </c:if>
                    </div>
                </div>
            </div>
            <hr>
            <div class="d-flex flex-row justify-content-center">
                <a href="/puesto/editar?id=${puesto.idPuesto}">
                    <button title="Editar" class="btn btn-warning">
                        Editar <i class="fas fa-pen-to-square"></i>
                    </button>
                </a>
            </div>
        </div>
    </div>
</div>
<%@ include file="../base/footer.jsp" %>
