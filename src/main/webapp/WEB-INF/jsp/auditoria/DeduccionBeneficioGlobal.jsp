<%@ include file="../base/head.jsp" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<title>Auditoria Deducciones y Beneficios Globales</title>
<%@ include file="../base/navbar.jsp" %>
<div class="container-fluid px-4">
    <div class="d-flex justify-content-center">
        <h1 class="mt-4">Historial de cambios en las deducciones y beneficios globales</h1>
    </div>
    <div class="card mb-4">
        <div class="card-body">
            <table id="datatablesSimple" class="table">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Nombre Deduccion o Beneficio</th>
                        <th>Tipo</th>
                        <th>Proporcional al sueldo</th>
                        <th>Monto o porcentaje</th>
                        <th>Estado</th>
                        <th>Fecha</th>
                        <th>Tipo de operacion</th>
                        <th>Modificado por</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="deducBen" items="${listaDecBen}" varStatus="i">
                        <tr>
                            <td>${i.count}</td>
                            <td>${deducBen.nombreDeducBenef}</td>
                            <td>
                                <c:if test="${deducBen.tipo == 'D'}">Deduccion</c:if>
                                <c:if test="${deducBen.tipo == 'B'}">Beneficio</c:if>
                            </td>
                            <td>
                                ${deducBen.empleado.nombre1}
                                <c:if test="${deducBen.empleado.nombre2 != null}">${deducBen.empleado.nombre2}</c:if>,
                                ${deducBen.empleado.apellido1}
                                <c:if test="${deducBen.empleado.apellido2 != null}">${deducBen.empleado.apellido2}</c:if>
                            </td>
                            <td>
                                <c:if test="${deducBen.proporcionalAlSueldo}">Si</c:if>
                                <c:if test="${!deducBen.proporcionalAlSueldo}">No</c:if>
                            </td>
                            <td>${deducBen.montoOPorcentaje}</td>
                            <td><fmt:formatDate value="${deducBen.fechaDeOperacion}" /></td>
                            <td>${deducBen.tipoDeOperacion}</td>
                            <td>${deducBen.usuarioRegistra.username}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
<%@ include file="../base/footer.jsp" %>
