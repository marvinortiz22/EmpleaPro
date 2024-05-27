<%@ include file="../base/head.jsp" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<title>Permisos Empleados</title>
<%@ include file="../base/navbar.jsp" %>
    <div class="container-fluid px-4">
        <div class="d-flex justify-content-center">
            <h1 class="mt-4">Permisos de los Empleados</h1>
        </div>
        <div class="d-flex justify-content-end mb-4">
            <a href="/permiso/agregar"><button title="Agregar" class="btn btn-primary"><i class="fa-solid fa-plus"></i></button></a>
        </div>
        <div class="card mb-4">
            <div class="card-body">
                <table id="datatablesSimple" class="table text-center">
                    
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Causa</th>
                            <th>Tipo</th>
                            <th>Empleado</th>
                            <th>Estado</th>
                            <th>Descontable</th>
                            <th>Fecha Inicio</th>
                            <th>Fecha Fin</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                
                    <tbody>
                        <c:forEach var="permiso" items="${permisos}" varStatus="i">
                            <tr>
                                <td>${i.count}</td>
                                <td>${permiso.permisoLicencia.causa}</td>
                                <td>
                                    <c:if test="${permiso.permisoLicencia.tipo == 'P'}">
                                        Permiso
                                    </c:if>
                                    <c:if test="${permiso.permisoLicencia.tipo == 'L'}">
                                        Licencia
                                    </c:if>
                                </td>
                                <td>
                                    ${permiso.empleado.nombre1} ${permiso.empleado.nombre2}, ${permiso.empleado.apellido1} ${permiso.empleado.apellido2}
                                </td>
                                <td>
                                    <c:if test="${permiso.aprobada}">
                                        Aprobada
                                    </c:if>
                                    <c:if test="${!permiso.aprobada}">
                                        Reprobada
                                    </c:if>
                                </td>
                                <td>
                                    <c:if test="${permiso.descontable}">
                                        Sí
                                    </c:if>
                                    <c:if test="${!permiso.descontable}">
                                        No
                                    </c:if>
                                </td>
                                <td><fmt:formatDate value="${permiso.fechaInicio}"/></td>
                                <td><fmt:formatDate value="${permiso.fechaFin}"/></td>
                                <td>
                                    <a href="/permiso/editar?id=${permiso.idPerLic_Emp}">
                                        <button title="Editar" class="btn btn-warning btn-sm">
                                            <i class="fas fa-pen-to-square"></i>
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