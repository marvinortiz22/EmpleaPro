<%@ include file="../base/head.jsp" %>
<%@ include file="../base/navbar.jsp" %>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<title>Detalle Auditoria Empleados</title>

<div class="container-fluid">
    <div class="card bg-light mx-3 my-4">
        <div class="card-header d-flex justify-content-center">
            <h1 class="mt-1 mb-2">Detalles de los cambios</h1>
        </div>

        <div class="card-body">
            <div class="d-flex flex-row">
                <a href="/auditoria/empleados">
                    <button title="Lista principal" class="btn btn-primary"> ← Regresar </button>
                </a>
            </div>
            <hr>
            <div class="d-flex flex-column mt-4 mb-4">
                <h5 class="card-title">Datos personales</h5>
                <div class="d-flex flex-wrap justify-content-around mb-4">
                    <div class="p-2">
                        <strong>Nombre:</strong>
                        ${empleado.empleado.nombre1}
                        ${empleado.empleado.nombre2},
                        ${empleado.empleado.apellido1}
                        <c:if test="${empty empleado.apellidoCasada}">
                            ${empleado.empleado.apellido2}
                        </c:if>
                        <c:if test="${!empty empleado.apellidoCasada}">
                            De ${empleado.empleado.apellidoCasada}
                        </c:if>
                    </div>
                    <div class="p-2">
                        <strong>Sexo:</strong>
                        <c:if test="${empleado.empleado.sexo == 'M'}">
                            Masculino
                        </c:if>
                        <c:if test="${empleado.empleado.sexo == 'F'}">
                            Femenino
                        </c:if>
                    </div>
                    <c:if test="${!empty empleado.estadoCivil}">
                        <div class="p-2">
                            <strong>Estado Civil:</strong>
                            ${empleado.empleado.estadoCivil.nombreEstado}
                        </div>
                    </c:if>
                    <div class="p-2">
                        <strong>Fecha de nacimiento:</strong>
                        <fmt:formatDate value="${empleado.empleado.fechaNacimiento}" pattern="dd/MM/yyyy" />
                    </div>
                    <c:if test="${!empty empleado.municipio}">
                        <div class="p-2">
                            <strong>Direccion:</strong>
                            ${empleado.empleado.municipio.nombreMunicipio},
                            ${empleado.empleado.municipio.departamento.nombreDepartamento}
                        </div>
                    </c:if>
                    <div class="p-2">
                        <strong>Correo personal:</strong>
                        ${empleado.empleado.correoPersonal}
                    </div>
                </div>
                <hr>
                <h5 class="card-title">Documentos</h5>
                <div class="d-flex flex-wrap justify-content-around mb-4">
                    <c:if test="${!empty empleado.tipoDocumento}">
                        <div class="p-2"><strong>${empleado.empleado.tipoDocumento.nombreDoc}: </strong>${empleado.empleado.numeroDoc}</div>
                    </c:if>
                    <c:if test="${!empty empleado.empleado.nit}">
                        <div class="p-2"><strong>NIT: </strong>${empleado.empleado.nit}</div>
                    </c:if>
                    <div class="p-2"><strong>ISSS: </strong>${empleado.empleado.isss}</div>
                    <c:if test="${!empty empleado.empleado.nup}">
                        <div class="p-2"><strong>NUP: </strong>${empleado.empleado.nup}</div>
                    </c:if>
                </div>
                <hr>
                <h5 class="card-title">Datos empresariales</h5>
                <div class="d-flex flex-wrap justify-content-around mb-4">
                    <c:if test="${!empty empleado.puesto}">
                        <div class="p-2"><strong>Puesto: </strong>${empleado.empleado.puesto.nombrePuesto}</div>
                    </c:if>
                    <div class="p-2">
                        <strong>Salario: </strong>
                        <fmt:formatNumber value="${empleado.empleado.salario}" pattern="$##,###,##0.00" />
                    </div>
                    <div class="p-2">
                        <strong>Fecha ingreso: </strong>
                        <fmt:formatDate value="${empleado.empleado.fechaIngreso}" pattern="dd/MM/yyyy" />
                    </div>
                    <div class="p-2">
                        <strong>Correo institucional:</strong>
                        ${empleado.empleado.correoInstitucional}
                    </div>
                    <div class="p-2">
                        <strong>Estado:</strong>
                        <c:if test="${empleado.empleado.estado}">
                            Activo
                        </c:if>
                        <c:if test="${!empleado.empleado.estado}">
                            Inactivo
                        </c:if>
                    </div>
                </div>
                <hr>
                <h5 class="card-title">Detalles de Auditoria</h5>
                <div class="d-flex flex-wrap justify-content-around mb-4">
                    <div class="p-2">
                        <div class="p-2"><strong>Tipo de Modificacion: </strong>${empleado.tipoDeOperacion}</div>
                    </div>
                    <div class="p-2">
                        <div class="p-2"><strong>Modificado por Usuario: </strong>${empleado.usuarioRegistra.username}</div>
                    </div>
                    <div class="p-2">
                        <strong>Fecha de Modificacion: </strong>
                        <fmt:formatDate value="${empleado.fechaModificacion}" pattern="dd/MM/yyyy hh:mm:ss a" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="../base/footer.jsp" %>