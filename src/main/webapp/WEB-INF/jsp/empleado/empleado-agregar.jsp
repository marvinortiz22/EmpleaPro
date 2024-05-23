<%@ include file="../base/head.jsp" %>
<%@ include file="../base/navbar.jsp" %>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<title>Agregar empleado</title>

<div class="container-fluid">
    <div class="card bg-light mx-3 my-4">
        <div class="card-header d-flex justify-content-center">
            <h1 class="mt-1 mb-2">Agregar empleado</h1>
        </div>

        <div class="card-body">
            <div class="d-flex flex-row">
                <a href="/empleado/listar">
                    <button title="Lista principal" class="btn btn-primary"> ← Regresar </button>
                </a>
            </div>
            <hr>

            <form:form modelAttribute="empleado" action="guardar" method="post">

            <div class="d-flex flex-column mt-4 mb-4">
                <h5 class="card-title">Datos personales</h5>
                <div class="d-flex flex-wrap justify-content-around mb-4">
                    <div class="p-2">
                        <label for="nombre1">Primer Nombre*</label>
                        <form:input path="nombre1" class="form-control"/>
                        <form:errors path="nombre1" class="text-danger small"/>
                    </div>
                    <div class="p-2">
                        <label for="nombre2">Segundo Nombre</label>
                        <form:input path="nombre2" class="form-control"/>
                        <form:errors path="nombre2" class="text-danger small"/>
                    </div>
                    <div class="p-2">
                        <label for="apellido1">Primer Apellido*</label>
                        <form:input path="apellido1" class="form-control"/>
                        <form:errors path="apellido1" class="text-danger small"/>
                    </div>
                    <div class="p-2">
                        <label for="apellido2">Segundo Apellido</label>
                        <form:input path="apellido2" class="form-control"/>
                        <form:errors path="apellido2" class="text-danger small"/>
                    </div>
                    <div class="p-2" id="apellidoCasada">
                        <label for="apellidoCasada">Apellido de Casada</label>
                        <form:input path="apellidoCasada" class="form-control"/>
                        <form:errors path="apellidoCasada" class="text-danger small"/>
                    </div>
                    <div class="p-2">
                        <label for="sexo">Sexo*</label>
                        <form:select path="sexo" id="sexo" class="form-select">
                            <option value="X">Seleccione el Sexo</option>
                            <form:option value="M">Masculino</form:option>
                            <form:option value="F">Femenino</form:option>
                        </form:select>
                        <form:errors path="sexo" class="text-danger small"/>
                    </div>
                    <div class="p-2">
                        <label for="estadoCivil">Estado Civil*</label>
                        <form:select path="estadoCivil.idEstadoCivil" id="estadoCivil" class="form-select">
                            <option value="0">Seleccione un Estado Civil</option>
                            <form:options items="${estadosCiviles}" itemValue="idEstadoCivil" itemLabel="nombreEstado" />
                        </form:select>
                        <form:errors path="estadoCivil" class="text-danger small"/>
                    </div>
                    <div class="p-2">
                        <label for="fechaNacimiento">Fecha de Nacimiento*</label>
                        <form:input path="fechaNacimiento" type="date" class="form-control"/>
                        <form:errors path="fechaNacimiento" class="text-danger small"/>
                    </div>
                    <div class="p-2">
                        <label for="correoPersonal">Correo Personal*</label>
                        <form:input path="correoPersonal" class="form-control"/>
                        <form:errors path="correoPersonal" class="text-danger small"/>
                    </div>
                    <div class="p-2">
                        <label for="departamento">Departamento*</label>
                        <form:select path="municipio.departamento.idDepartamento" id="departamento" class="form-select">
                            <option value="0">Seleccione un Departamento</option>
                            <form:options items="${departamentos}" itemValue="idDepartamento" itemLabel="nombreDepartamento" />
                        </form:select>
                        <form:errors path="municipio.departamento" class="text-danger small"/>
                    </div>
                    <div class="p-2">
                        <label for="municipio">Municipio*</label>
                        <form:select path="municipio.idMunicipio" id="municipio" class="form-select">
                            <option value="0">Seleccione un Municipio</option>
                        </form:select>
                        <form:errors path="municipio" class="text-danger small"/>
                    </div>
                </div>
                <hr>
                <h5 class="card-title">Documentos</h5>
                <div class="d-flex flex-wrap justify-content-around mb-4">
                    <div class="p-2">
                        <label for="tipoDocumento">Tipo de Documento*</label>
                        <form:select class="form-select" path="tipoDocumento.idTipoDoc">
                            <form:options items="${tiposDocumentos}" itemValue="idTipoDoc" itemLabel="nombreDoc" />
                        </form:select>
                    </div>
                    <div class="p-2">
                        <label for="numeroDoc">Número de Documento*</label>
                        <form:input path="numeroDoc" class="form-control"/>
                        <form:errors path="numeroDoc" class="text-danger small"/>
                    </div>
                    <div class="p-2">
                        <label for="nit">NIT</label>
                        <form:input path="nit" class="form-control"/>
                    </div>
                    <div class="p-2">
                        <label for="isss">ISSS*</label>
                        <form:input path="isss" class="form-control"/>
                        <form:errors path="isss" class="text-danger small"/>
                    </div>
                    <div class="p-2">
                        <label for="nup">NUP</label>
                        <form:input path="nup" class="form-control"/>
                    </div>
                </div>
                <hr>
                <h5 class="card-title">Datos empresariales</h5>
                <div class="d-flex flex-wrap justify-content-around mb-4">
                    <div class="p-2">
                        <label for="puesto">Puesto*</label>
                        <form:select class="form-select" path="puesto.idPuesto">
                            <form:options items="${puestos}" itemValue="idPuesto" itemLabel="nombrePuesto" />
                        </form:select>
                    </div>
                    <div class="p-2">
                        <label for="salario">Salario*</label>
                        <form:input path="salario" class="form-control" type="number" step="0.01"/>
                        <form:errors path="salario" class="text-danger small"/>
                    </div>
                    <div class="p-2">
                        <label for="fechaIngreso">Fecha de Ingreso*</label>
                        <form:input path="fechaIngreso" type="date" value="${empleado.getFechaIngresoFormateada()}" class="form-control"/>
                        <form:errors path="fechaIngreso" class="text-danger small"/>
                    </div>
                    <div class="p-2">
                        <label for="correoInstitucional">Correo Institucional*</label>
                        <form:input path="correoInstitucional" class="form-control"/>
                        <form:errors path="correoInstitucional" class="text-danger small"/>
                    </div>
                    <div class="p-2">
                        <label for="supervisor">Jefe Inmediato</label>
                        <form:select class="form-select" path="supervisor.idEmpleado">
                            <form:option value="0">Sin Jefe Inmediato</form:option>
                            <c:forEach var="empleado" items="${empleados}">
                                <option value="${empleado.idEmpleado}">
                                    ${empleado.nombre1}
                                    ${empleado.nombre2},
                                    ${empleado.apellido1}
                                    <c:if test="${empleado.apellidoCasada == null}">
                                        ${empleado.supervisor.apellido2}
                                    </c:if>
                                    <c:if test="${empleado.apellidoCasada != null}">
                                        De ${empleado.apellidoCasada}
                                    </c:if>
                                    <c:if test="${empleado.tipoDocumento != null}">
                                        (${empleado.tipoDocumento.nombreDoc}: ${empleado.numeroDoc})
                                    </c:if>
                                </option>
                            </c:forEach>
                        </form:select>
                    </div>
                </div>
            </div>

            <div class="d-flex flex-row justify-content-center">
                <a href="/datosEmpresa/editar">
                    <button class="btn btn-success">
                        <i class="bi bi-floppy"></i>
                        Guardar
                    </button>
                </a>
            </div>

            </form:form>
        </div>
    </div>
</div>
<%@ include file="../base/footer.jsp" %>
<script>
$(document).ready(function() {
    function toggleApellidoCasada() {
        var sexo = $('#sexo').val();
        var estadoCivil = $('#estadoCivil').val();
        if(sexo === 'F' && estadoCivil === '2') {
            $('#apellidoCasada').show();
        } else {
            $('#apellidoCasada').hide();
        }
    }

    $('#sexo, #estadoCivil').change(toggleApellidoCasada);

    // Llamada inicial
    toggleApellidoCasada();
});
</script>

<script>
$(document).ready(function() {
    $('#departamento').change(function() {
        var departamentoId = $(this).val();
        if(departamentoId) {
            $.ajax({
                url: '/municipio/' + departamentoId,
                type: 'GET',
                success: function(data) {
                    $('#municipio').empty();
                    $('#municipio').append('<option value="0">Seleccione un Municipio</option>');
                    $.each(data, function(index, municipio) {
                        $('#municipio').append('<option value="' + municipio.idMunicipio + '">' + municipio.nombreMunicipio + '</option>');
                    });
                },
                error: function() {
                    alert('Error al obtener municipios');
                }
            });
        } else {
            $('#municipio').empty();
            $('#municipio').append('<option value="">Seleccione un municipio</option>');
        }
    });
});
</script>
