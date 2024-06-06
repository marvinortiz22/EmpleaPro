<%@ include file="../base/head.jsp" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<title>Deduccion/beneficio</title>
<%@ include file="../base/navbar.jsp" %>
    <div class="container-fluid px-4">
        <div class="d-flex justify-content-center">
            <h1 class="mt-4">Empleados</h1>
        </div>
        <div class="card mb-4">
            
            <div class="card-body">
                <table id="datatablesSimple" class="table">
                    <thead>
                        <tr>
                            <th >#</th>
                            <th>Puesto</th>
                            <th>Nombre</th>
                            <th>Documento</th>
                            <th>Fecha Nacimiento</th>
                            <th>Estado</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    
                    <tbody>
                        <c:forEach var="empleado" items="${empleados}" varStatus="i">
                        <tr>
                        <td>${i.count}</td>
                        <td>
                            ${empleado.puesto.nombrePuesto}
                        </td>
                        <td>
                            ${empleado.nombre1} ${empleado.nombre2} ${empleado.apellido1} ${empleado.apellido2}
                        </td>
                        <td>
                            <c:if test="${empleado.tipoDocumento != null}">
                            ${empleado.tipoDocumento.nombreDoc}: ${empleado.numeroDoc}<br>
                            </c:if>
                        </td>
                        <td>
                            <fmt:formatDate value="${empleado.fechaNacimiento}" pattern="dd/MM/yyyy" />
                        </td>
                        <td>
                            <c:if test="${empleado.estado}">
                                Activo
                            </c:if>
                            <c:if test="${!empleado.estado}">
                                Inactivo
                            </c:if>
                        </td>
                        <td>
                            <a href="/deduccionesBeneficiosEmpleados/listar?id=${empleado.idEmpleado}">
                                <button title="Ver detalles" class="btn btn-primary">
                                    <i class="fas fa-eye"></i>
                                </button>
                        </td>
                        </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
<%@ include file="../base/footer.jsp" %>
