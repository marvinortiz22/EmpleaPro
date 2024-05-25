<%@ include file="../base/head.jsp" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<title>Auditoria Empleados</title>
<%@ include file="../base/navbar.jsp" %>
<div class="container-fluid px-4">
    <div class="d-flex justify-content-center">
        <h1 class="mt-4">Historial de cambios en la informacion de los empleados</h1>
    </div>
    <div class="card mb-4">
        <div class="card-body">
            <table id="datatablesSimple" class="table">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Puesto</th>
                        <th>Nombre</th>
                        <th>Estado</th>
                        <th>Fecha y Hora de Modificación</th>
                        <th>Tipo de Modificación</th>
                        <th>Modificado Por</th>
                        <th>Ver Detalles</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="empleado" items="${empleado}" varStatus="i">
                        <tr>
                            <td>${i.count}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${empleado.puesto != null}">
                                        ${empleado.puesto.nombrePuesto}
                                    </c:when>
                                    <c:otherwise>
                                        N/A
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>
                                ${empleado.nombre1} <c:if test="${empleado.nombre2 != null}">${empleado.nombre2}</c:if>, ${empleado.apellido1} <c:if test="${empleado.apellido2 != null}">${empleado.apellido2}</c:if>
                            </td>
                            <td>
                                <c:choose>
                                    <c:when test="${empleado.estado}">
                                        Activo
                                    </c:when>
                                    <c:otherwise>
                                        Inactivo
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>
                                ${empleado.fechaModificacion}
                            </td>
                            <td>
                                ${empleado.tipoDeOperacion}
                            </td>
                            <td>
                                <c:choose>
                                    <c:when test="${empleado.usuarioRegistra != null}">
                                        ${empleado.usuarioRegistra.username}
                                    </c:when>
                                    <c:otherwise>
                                        N/A
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>
                                <a href="/auditoria/detalles?id=${empleado.idAuditoriaEmpleado}">
                                    <button title="Ver detalles" class="btn btn-primary btn-sm">
                                        <i class="fas fa-eye"></i>
                                    </button>
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
<%@ include file="../base/footer.jsp" %>
