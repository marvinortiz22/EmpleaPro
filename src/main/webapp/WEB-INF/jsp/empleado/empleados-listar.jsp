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
            <a href="/usuarioEjemplo/agregar"><button title="Agregar" class="btn btn-primary"><i class="fa-solid fa-plus"></i></button></a>
        </div>
        <div class="card mb-4">
            
            <div class="card-body">
                <table id="datatablesSimple" class="table">
                    <thead>
                        <tr>
                            <th >#</th>
                            <th>Ingreso</th>
                            <th>Puesto</th>
                            <th>Salario</th>
                            <th>Nombres</th>
                            <th>Apellidos</th>
                            <th>Documentos</th>
                            <th>Correos</th>
                            <th>Direccion</th>
                            <th>Profesiones</th>
                            <th>Estado</th>
                        </tr>
                    </thead>
                    
                    <tbody>
                        <c:forEach var="empleado" items="${empleados}" varStatus="i">
                        <tr>
                        <td>${i.count}</td>
                        <td>
                            <fmt:formatDate value="${empleado.fechaIngreso}" pattern="dd/MM/yyyy" />
                        </td>
                        <td>
                            ${empleado.puesto.nombrePuesto}
                        </td>
                        <td>
                            <fmt:formatNumber value="${empleado.salario}" pattern="$#,##0" />
                        </td>
                        <td>
                            ${empleado.nombre1}<br>
                            ${empleado.nombre2}
                        </td>
                        <td>
                            ${empleado.apellido1}<br>
                            ${empleado.apellido2}
                        </td>
                        <td>
                            <c:if test="${empleado.tipoDocumento != null}">
                            ${empleado.tipoDocumento.nombreDoc} - ${empleado.numeroDoc}<br>
                            </c:if>
                            <c:if test="${empleado.nit != null}">
                            NIT - ${empleado.nit}<br>
                            </c:if>
                            ISSS - ${empleado.isss}<br>
                            <c:if test="${empleado.nup != null}">
                                NUP - ${empleado.nup}
                            </c:if>
                        </td>
                        <td>
                            ${empleado.correoInstitucional}<br>
                            ${empleado.correoPersonal}
                        </td>
                        <td>
                            ${empleado.municipio.nombreMunicipio}<br>
                            ${empleado.municipio.departamento.nombreDepartamento}
                        </td>
                        <td>
                        ${empleado.nombre1}
                        </td>
                        <td>
                            <a href="/usuarioEjemplo/detalles">
                                <button title="Ver detalles" class="btn btn-primary btn-sm">
                                    <i class="fas fa-eye"></i>
                                </button>
                            </a>
                            <a href="/usuarioEjemplo/editar?id=${usuario.idUsuario}">
                                <button title="Editar" class="btn btn-warning btn-sm">
                                    <i class="fas fa-pen-to-square"></i>
                                </button>
                            </a>
                            <c:if test="${usuario.estado}">
                                <a href="/usuarioEjemplo/cambiarEstado?id=${usuario.idUsuario}">
                                    <button id="x" title="Inhabilitar" class="btn btn-danger btn-sm">
                                        <i class="fas fa-lock"></i>
                                    </button>
                                </a>
                            </c:if>
                            <c:if test="${!usuario.estado}">
                                <a href="/usuarioEjemplo/cambiarEstado?id=${usuario.idUsuario}">
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
