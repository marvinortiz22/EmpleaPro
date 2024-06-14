<%@ include file="../base/head.jsp" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<title>Puestos</title>
<%@ include file="../base/navbar.jsp" %>
    <div class="container-fluid px-4">
        <div class="d-flex justify-content-center">
            <h1 class="mt-4">Puestos</h1>
        </div>
        <div class="d-flex justify-content-end mb-4">
            <!--a href="#"><button title="Imprimir" class="btn btn-success me-1"><i class="fa-solid fa-print"></i></button></a-->
            <a href="/puesto/agregar"><button title="Agregar" class="btn btn-primary"><i class="fa-solid fa-plus"></i> Nuevo puesto </button></a>
        </div>
        <div class="card mb-4">

            <div class="card-body">
                <table id="datatablesSimple" class="table">
                    <thead>
                        <tr>
                            <th >#</th>
                            <th>Nombre</th>
                            <th>Rango salarial</th>
                            <th>Unidad</th>
                            <th>Estado</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>

                    <tbody>
                        <c:forEach var="puesto" items="${puestos}" varStatus="i">
                        <tr>
                        <td>${i.count}</td>
                        <td>
                            ${puesto.nombrePuesto}
                        </td>
                        <td>
                            <fmt:formatNumber value="${puesto.salarioMin}" pattern="$##,###,##0.00" /> -
                            <fmt:formatNumber value="${puesto.salarioMax}" pattern="$##,###,##0.00" />
                        </td>
                        <td>
                            <c:if test="${empty puesto.unidad}">
                                N/A
                            </c:if>
                            <c:if test="${!empty puesto.unidad}">
                                ${puesto.unidad.nombreUnidad}
                            </c:if>
                        </td>
                        <td>
                            <c:if test="${puesto.estado}">
                                Activo
                            </c:if>
                            <c:if test="${!puesto.estado}">
                                Inactivo
                            </c:if>
                        </td>
                        <td>
                            <a href="/puesto/detalles?id=${puesto.idPuesto}">
                                <button title="Ver detalles" class="btn btn-primary btn-sm">
                                    <i class="fas fa-eye"></i>
                                </button>
                            </a>
                            <a href="/puesto/editar?id=${puesto.idPuesto}">
                                <button title="Editar" class="btn btn-warning btn-sm">
                                    <i class="fas fa-pen-to-square"></i>
                                </button>
                            </a>
                            <c:if test="${puesto.estado}">
                                <a href="/puesto/cambiarEstado?id=${puesto.idPuesto}">
                                    <button id="x" title="Inhabilitar" class="btn btn-danger btn-sm">
                                        <i class="fas fa-lock"></i>
                                    </button>
                                </a>
                            </c:if>
                            <c:if test="${!puesto.estado}">
                                <a href="/puesto/cambiarEstado?id=${puesto.idPuesto}">
                                    <button title="Habilitar" id="check" class="btn btn-success btn-sm">
                                        <i class="fas fa-lock"></i>
                                    </button>
                                </a>
                            </c:if>
                        </td>
                        </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
<%@ include file="../base/footer.jsp" %>
