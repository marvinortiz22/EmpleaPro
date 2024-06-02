<%@ include file="../base/head.jsp" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<title>Empleados</title>
<%@ include file="../base/navbar.jsp" %>
    <div class="container-fluid px-4">
        <div class="d-flex justify-content-center">
            <h1 class="mt-4">Empleados</h1>
        </div>
        <div class="d-flex justify-content-end mb-4">
            <a href="#"><button title="Imprimir" class="btn btn-success me-1"><i class="fa-solid fa-print"></i></button></a>
            <a href="/empleado/agregar"><button title="Agregar" class="btn btn-primary"><i class="fa-solid fa-plus"></i> Nuevo empleado </button></a>
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
                            ${empleado.nombre1} ${empleado.nombre2}, ${empleado.apellido1} ${empleado.apellido2}
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
                            <a href="/empleado/detalles?id=${empleado.idEmpleado}">
                                <button title="Ver detalles" class="btn btn-primary btn-sm">
                                    <i class="fas fa-eye"></i>
                                </button>
                            </a>
                            <a href="/empleado/editar?id=${empleado.idEmpleado}">
                                <button title="Editar" class="btn btn-warning btn-sm">
                                    <i class="fas fa-pen-to-square"></i>
                                </button>
                            </a>
                            <c:if test="${empleado.estado}">
                                <a href="/empleado/cambiarEstado?id=${empleado.idEmpleado}">
                                    <button id="x" title="Inhabilitar" class="btn btn-danger btn-sm">
                                        <i class="fas fa-lock"></i>
                                    </button>
                                </a>
                            </c:if>
                            <c:if test="${!empleado.estado}">
                                <a href="/empleado/cambiarEstado?id=${empleado.idEmpleado}">
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
