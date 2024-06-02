<%@ include file="../base/head.jsp" %>
<%@ include file="../base/navbar.jsp" %>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<title>Datos del empleado</title>

<div class="container-fluid">
    <div class="card bg-light mx-3 my-4">
        <div class="card-header d-flex justify-content-center">
            <h1 class="mt-1 mb-2">Detalles del empleado</h1>
        </div>

        <div class="card-body">
            <div class="d-flex flex-row">
                <a href="/empleado/listar">
                    <button title="Lista principal" class="btn btn-primary"> ← Regresar </button>
                </a>
            </div>
            <hr>
            <div class="d-flex flex-column mt-4 mb-4">
                <h5 class="card-title">Datos personales</h5>
                <div class="d-flex flex-wrap justify-content-around mb-4">
                    <div class="p-2">
                        <strong>Nombre:</strong>
                        ${empleado.nombre1}
                        ${empleado.nombre2},
                        ${empleado.apellido1}
                        <c:if test="${empty empleado.apellidoCasada}">
                            ${empleado.apellido2}
                        </c:if>
                        <c:if test="${!empty empleado.apellidoCasada}">
                            De ${empleado.apellidoCasada}
                        </c:if>
                    </div>
                    <div class="p-2">
                        <strong>Sexo:</strong>
                        <c:if test="${empleado.sexo == 'M'}">
                            Masculino
                        </c:if>
                        <c:if test="${empleado.sexo == 'F'}">
                            Femenino
                        </c:if>
                    </div>
                    <c:if test="${!empty empleado.estadoCivil}">
                        <div class="p-2">
                            <strong>Estado Civil:</strong>
                            ${empleado.estadoCivil.nombreEstado}
                        </div>
                    </c:if>
                    <div class="p-2">
                        <strong>Fecha de nacimiento:</strong>
                        <fmt:formatDate value="${empleado.fechaNacimiento}" pattern="dd/MM/yyyy" />
                    </div>
                    <c:if test="${!empty profesionesOficios}">
                        <div class="p-2">
                            <strong>Profesion/Oficio:</strong>
                            <c:forEach var="profesionOficio" items="${profesionesOficios}" varStatus="status">
                                ${profesionOficio.nombreProfOfc}
                                <c:if test="${!status.last}">
                                    ,
                                </c:if>
                            </c:forEach>
                            .
                        </div>
                    </c:if>
                    <c:if test="${!empty empleado.municipio}">
                        <div class="p-2">
                            <strong>Direccion:</strong>
                            ${empleado.municipio.nombreMunicipio},
                            ${empleado.municipio.departamento.nombreDepartamento}
                        </div>
                    </c:if>
                    <div class="p-2">
                        <strong>Correo personal:</strong>
                        ${empleado.correoPersonal}
                    </div>
                </div>
                <hr>
                <h5 class="card-title">Documentos</h5>
                <div class="d-flex flex-wrap justify-content-around mb-4">
                    <c:if test="${!empty empleado.tipoDocumento}">
                        <div class="p-2"><strong>${empleado.tipoDocumento.nombreDoc}: </strong>${empleado.numeroDoc}</div>
                    </c:if>
                    <c:if test="${!empty empleado.nit}">
                        <div class="p-2"><strong>NIT: </strong>${empleado.nit}</div>
                    </c:if>
                    <div class="p-2"><strong>ISSS: </strong>${empleado.isss}</div>
                    <c:if test="${!empty empleado.nup}">
                        <div class="p-2"><strong>NUP: </strong>${empleado.nup}</div>
                    </c:if>
                </div>
                <hr>
                <h5 class="card-title">Datos empresariales</h5>
                <div class="d-flex flex-wrap justify-content-around mb-4">
                    <c:if test="${!empty empleado.puesto}">
                        <div class="p-2"><strong>Puesto: </strong>${empleado.puesto.nombrePuesto}</div>
                    </c:if>
                    <div class="p-2">
                        <strong>Salario: </strong>
                        <fmt:formatNumber value="${empleado.salario}" pattern="$##,###,##0.00" />
                    </div>
                    <div class="p-2">
                        <strong>Fecha ingreso: </strong>
                        <fmt:formatDate value="${empleado.fechaIngreso}" pattern="dd/MM/yyyy" />
                    </div>
                    <div class="p-2">
                        <strong>Correo institucional:</strong>
                        ${empleado.correoInstitucional}
                    </div>
                    <div class="p-2">
                        <strong>Jefe inmediato: </strong>
                        <c:if test="${!empty empleado.supervisor}">
                            ${empleado.supervisor.nombre1}
                            ${empleado.supervisor.nombre2},
                            ${empleado.supervisor.apellido1}
                            <c:if test="${empty empleado.supervisor.apellidoCasada}">
                                ${empleado.supervisor.apellido2}
                            </c:if>
                            <c:if test="${!empty empleado.supervisor.apellidoCasada}">
                                De ${empleado.supervisor.apellidoCasada}
                            </c:if>
                            <c:if test="${!empty empleado.supervisor.tipoDocumento}">
                                (${empleado.supervisor.tipoDocumento.nombreDoc}: ${empleado.supervisor.numeroDoc})
                            </c:if>
                        </c:if>
                        <c:if test="${empty empleado.supervisor}">
                            No posee
                        </c:if>
                    </div>
                    <div class="p-2">
                        <strong>Estado:</strong>
                        <c:if test="${empleado.estado}">
                            Activo
                        </c:if>
                        <c:if test="${!empleado.estado}">
                            Inactivo
                        </c:if>
                    </div>
                </div>
                <c:if test="${!empty subordinados}">
                    <hr>
                    <h5 class="card-title">Subordinados</h5>
                    <div class="d-flex flex-wrap justify-content-around mb-4">
                        <c:forEach var="subordinado" items="${subordinados}" varStatus="status">
                            <div class="p-2">
                                ${subordinado.nombre1}
                                ${subordinado.nombre2},
                                ${subordinado.apellido1}
                                <c:if test="${empty subordinado.apellidoCasada}">
                                    ${subordinado.apellido2}
                                </c:if>
                                <c:if test="${!empty subordinado.apellidoCasada}">
                                    De ${subordinado.apellidoCasada}
                                </c:if>
                                <c:if test="${!empty subordinado.tipoDocumento}">
                                    (${subordinado.tipoDocumento.nombreDoc}: ${subordinado.numeroDoc})
                                </c:if>
                            </div>
                        </c:forEach>
                    </div>
                </c:if>
            </div>

            <div class="d-flex flex-row justify-content-center">
                <a href="/empleado/editar?id=${empleado.idEmpleado}">
                    <button title="Editar" class="btn btn-warning">
                        Editar <i class="fas fa-pen-to-square"></i>
                    </button>
                </a>
            </div>
        </div>
    </div>
</div>
<%@ include file="../base/footer.jsp" %>
