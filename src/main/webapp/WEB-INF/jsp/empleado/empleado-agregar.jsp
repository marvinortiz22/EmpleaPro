<%@ include file="../base/head.jsp" %>
<%@ include file="../base/navbar.jsp" %>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<title>
    <c:if test="${empty empleado.idEmpleado}">
        Agregar empleado
    </c:if>
    <c:if test="${!empty empleado.idEmpleado}">
        Editar empleado
    </c:if>
</title>

<div class="container-fluid">
    <div class="card bg-light mx-3 my-4">
        <div class="card-header d-flex justify-content-center">
            <h1 class="mt-1 mb-2">
                <c:if test="${empty empleado.idEmpleado}">
                    Agregar empleado
                </c:if>
                <c:if test="${!empty empleado.idEmpleado}">
                    Editar empleado
                </c:if>
            </h1>
        </div>

        <div class="card-body">
            <div class="d-flex flex-row">
                <a href="/empleado/listar">
                    <button title="Lista principal" class="btn btn-primary"> ← Regresar </button>
                </a>
            </div>
            <hr>

            <form:form modelAttribute="empleado" method="post" action="guardar">
            <c:if test="${!empty empleado.idEmpleado}">
                <form:hidden path="idEmpleado"/>
            </c:if>

            <div class="d-flex flex-column mt-4 mb-4">
                <h5 class="card-title">Datos personales</h5>
                <div class="d-flex flex-wrap justify-content-around mb-4">
                    <div class="p-2">
                        <label for="nombre1" class="form-label">Primer Nombre*</label>
                        <form:input path="nombre1" class="form-control" maxlength="20" pattern="^[a-zA-Z\s]*$" title="Solo se permiten letras" required="true"/>
                        <form:errors path="nombre1" class="text-danger small"/>
                    </div>
                    <div class="p-2">
                        <label for="nombre2" class="form-label">Segundo Nombre</label>
                        <form:input path="nombre2" class="form-control" maxlength="20" pattern="^[a-zA-Z\s]*$" title="Solo se permiten letras"/>
                        <form:errors path="nombre2" class="text-danger small"/>
                    </div>
                    <div class="p-2">
                        <label for="apellido1" class="form-label">Primer Apellido*</label>
                        <form:input path="apellido1" class="form-control" maxlength="20" pattern="^[a-zA-Z\s]*$" title="Solo se permiten letras" required="true"/>
                        <form:errors path="apellido1" class="text-danger small"/>
                    </div>
                    <div class="p-2">
                        <label for="apellido2" class="form-label">Segundo Apellido</label>
                        <form:input path="apellido2" class="form-control" maxlength="20" pattern="^[a-zA-Z\s]*$" title="Solo se permiten letras"/>
                        <form:errors path="apellido2" class="text-danger small"/>
                    </div>
                    <div class="p-2" id="apellidoCasada">
                        <label for="apellidoCasada" class="form-label">Apellido de Casada</label>
                        <form:input path="apellidoCasada" class="form-control" maxlength="25" pattern="^[a-zA-Z\s]*$" title="Solo se permiten letras"/>
                        <form:errors path="apellidoCasada" class="text-danger small"/>
                    </div>
                    <div class="p-2">
                        <label for="sexo" class="form-label">Sexo*</label>
                        <form:select path="sexo" id="sexo" class="form-select">
                            <option value="X">Seleccione el Sexo</option>
                            <form:option value="M">Masculino</form:option>
                            <form:option value="F">Femenino</form:option>
                        </form:select>
                        <form:errors path="sexo" class="text-danger small"/>
                    </div>
                    <div class="p-2">
                        <label for="estadoCivil" class="form-label">Estado Civil*</label>
                        <form:select path="estadoCivil.idEstadoCivil" id="estadoCivil" class="form-select">
                            <option value="0">Seleccione un Estado Civil</option>
                            <form:options items="${estadosCiviles}" itemValue="idEstadoCivil" itemLabel="nombreEstado" />
                        </form:select>
                        <form:errors path="estadoCivil" class="text-danger small"/>
                    </div>
                    <div class="p-2">
                        <label for="fechaNacimiento" class="form-label">Fecha de Nacimiento*</label>
                        <form:input path="fechaNacimiento" type="date" class="form-control"/>
                        <form:errors path="fechaNacimiento" class="text-danger small"/>
                    </div>
                    <div class="p-2">
                        <label for="correoPersonal" class="form-label">Correo Personal*</label>
                        <form:input path="correoPersonal" class="form-control" type="email" maxlength="30" required="true"/>
                        <form:errors path="correoPersonal" class="text-danger small"/>
                    </div>
                    <div class="p-2">
                        <label for="departamento" class="form-label">Departamento*</label>
                        <form:select path="municipio.departamento.idDepartamento" id="departamento" class="form-select">
                            <option value="0">Seleccione un Departamento</option>
                            <form:options items="${departamentos}" itemValue="idDepartamento" itemLabel="nombreDepartamento" />
                        </form:select>
                        <form:errors path="municipio.departamento" class="text-danger small"/>
                    </div>
                    <div class="p-2">
                        <label for="municipio" class="form-label">Municipio*</label>
                        <form:select path="municipio.idMunicipio" id="municipio" class="form-select">
                            <option value="0">Seleccione un Departamento</option>
                        </form:select>
                        <form:errors path="municipio" class="text-danger small"/>
                    </div>

                    <div class="p-2">
                        <label for="profesionOficios" class="form-label">Profesiones*</label>
                        <form:select path="profesionOficios" multiple="true" class="form-select" required="true">
                            <c:forEach var="proOfc" items="${profesionesOficios}">
                                <option value="${proOfc.idProfOfc}"
                                    <c:forEach var="proOfcEmpl" items="${empleado.profesionOficios}">
                                        <c:if test="${proOfc.idProfOfc == proOfcEmpl.idProfOfc}">
                                            selected
                                        </c:if>
                                    </c:forEach>
                                >
                                    ${proOfc.nombreProfOfc}
                                </option>
                            </c:forEach>
                        </form:select>
                        <form:errors path="profesionOficios" class="text-danger small"/>
                    </div>
                </div>
                <hr>
                <h5 class="card-title">Documentos</h5>
                <div class="d-flex flex-wrap justify-content-around mb-4">
                    <div class="p-2">
                        <label for="tipoDocumento" class="form-label">Tipo de Documento*</label>
                        <form:select class="form-select" path="tipoDocumento.idTipoDoc" id="tipoDocumento">
                            <option value="0">Seleccione un Tipo</option>
                            <form:options items="${tiposDocumentos}" itemValue="idTipoDoc" itemLabel="nombreDoc" />
                        </form:select>
                        <form:errors path="tipoDocumento" class="text-danger small"/>
                    </div>
                    <div class="p-2">
                        <label for="numeroDoc" class="form-label">Número de Documento*</label>
                        <form:input path="numeroDoc" class="form-control" id="numeroDoc" pattern="^[a-zA-Z0-9]{20}$" disabled="true" title="Deben ser maximo 20 caracteres" maxlength="20" required="true"/>
                        <form:errors path="numeroDoc" class="text-danger small"/>
                    </div>
                    <div class="p-2">
                        <label for="nit" class="form-label">NIT</label>
                        <form:input path="nit" class="form-control" id="nit" pattern="\d{4}-\d{6}-\d{3}-\d" title="Debe ser en formato XXXX-XXXXXX-XXX-X" maxlength="17"/>
                        <form:errors path="nit" class="text-danger small"/>
                    </div>
                    <div class="p-2">
                        <label for="isss" class="form-label">ISSS*</label>
                        <form:input path="isss" class="form-control" id="isss" pattern="\d{9}" title="Debe ser un número de 9 dígitos" required="true"/>
                        <form:errors path="isss" class="text-danger small"/>
                    </div>
                    <div class="p-2">
                        <label for="nup" class="form-label">NUP</label>
                        <form:input path="nup" class="form-control" id="nup" pattern="\d{12}" title="Debe ser un número de 12 dígitos" maxlength="12"/>
                        <form:errors path="nup" class="text-danger small"/>
                    </div>
                </div>
                <hr>
                <h5 class="card-title">Datos empresariales</h5>
                <div class="d-flex flex-wrap justify-content-around mb-4">
                    <div class="p-2">
                        <label for="puesto" class="form-label">Puesto*</label>
                        <form:select class="form-select" path="puesto.idPuesto">
                            <form:options items="${puestos}" itemValue="idPuesto" itemLabel="nombrePuesto" />
                        </form:select>
                    </div>
                    <div class="p-2">
                        <label for="salario" class="form-label">Salario*</label>
                        <form:input path="salario" class="form-control" id="salario" pattern="^\d{1,8}(\.\d{0,2})?$" title="Debe ser un número de 10 dígitos, ejemplo: 12345678.99" required="true"/>
                        <form:errors path="salario" class="text-danger small"/>
                    </div>
                    <!--div class="p-2">
                        <label for="fechaIngreso" class="form-label">Fecha de Ingreso*</label>
                        <form:input path="fechaIngreso" type="date" value="${empleado.getFechaIngresoFormateada()}" class="form-control"/>
                        <form:errors path="fechaIngreso" class="text-danger small"/>
                    </div-->
                    <div class="p-2">
                        <label for="correoInstitucional" class="form-label">Correo Institucional*</label>
                        <form:input path="correoInstitucional" class="form-control" type="email" maxlength="30" required="true"/>
                        <form:errors path="correoInstitucional" class="text-danger small"/>
                    </div>
                    <div class="p-2">
                        <label for="supervisor" class="form-label">Jefe Inmediato</label>
                        <form:select class="form-select" path="supervisor.idEmpleado">
                            <form:option value="0">Sin Jefe Inmediato</form:option>
                            <c:forEach var="empleadoSup" items="${empleados}">
                                <option value="${empleadoSup.idEmpleado}"
                                    <c:if test="${empleadoSup.idEmpleado == empleado.supervisor.idEmpleado}">
                                        selected
                                    </c:if>
                                >
                                    ${empleadoSup.nombre1}
                                    ${empleadoSup.nombre2},
                                    ${empleadoSup.apellido1}
                                    <c:if test="${empleadoSup.apellidoCasada == null}">
                                        ${empleadoSup.apellido2}
                                    </c:if>
                                    <c:if test="${empleadoSup.apellidoCasada != null}">
                                        De ${empleadoSup.apellidoCasada}
                                    </c:if>
                                    <c:if test="${empleadoSup.tipoDocumento != null}">
                                        (${empleadoSup.tipoDocumento.nombreDoc}: ${empleadoSup.numeroDoc})
                                    </c:if>
                                    </option>
                            </c:forEach>
                        </form:select>
                        <form:errors path="supervisor.idEmpleado" class="text-danger small"/>
                    </div>
                    <c:if test="${!empty empleado.idEmpleado}">
                        <div class="p-2">
                            <div class="form-check form-switch">
                                <form:checkbox path="estado" id="estado" class="form-check-input" />
                                <label for="estado">Activo</label>
                                <form:errors path="estado" class="text-danger small"/>
                            </div>
                        </div>
                    </c:if>
                </div>
            </div>

            <div class="d-flex flex-row justify-content-center">
                <button class="btn btn-success">
                    <i class="bi bi-floppy"></i>
                    Guardar
                </button>
            </div>

            </form:form>
        </div>
    </div>
</div>

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
    var selectedDepartamentoId = "${empleado.municipio.departamento.idDepartamento}";
    var selectedMunicipioId = "${empleado.municipio.idMunicipio}";

    $('#departamento').change(function() {
        var departamentoId = $(this).val();
        if (departamentoId) {
            $.ajax({
                url: '/municipio/' + departamentoId,
                type: 'GET',
                success: function(data) {
                    $('#municipio').empty();
                    $('#municipio').append('<option value="0">Seleccione un Municipio</option>');
                    $.each(data, function(index, municipio) {
                        $('#municipio').append('<option value="' + municipio.idMunicipio + '">' + municipio.nombreMunicipio + '</option>');
                    });

                    // Preseleccionar el municipio si es necesario
                    if (departamentoId == selectedDepartamentoId) {
                        $('#municipio').val(selectedMunicipioId);
                    }
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

    // Trigger change event to load municipios on page load if a department is selected
    if (selectedDepartamentoId) {
        $('#departamento').val(selectedDepartamentoId).change();
    }
});
</script>

<script>
$(document).ready(function() {
    function toggleNumeroDoc() {
        var tipoDocumento = $('#tipoDocumento').val();
        var numeroDocInput = $('#numeroDoc');

        if (tipoDocumento !== '0') {
            numeroDocInput.prop('disabled', false);
        } else {
            numeroDocInput.prop('disabled', true);
            numeroDocInput.val('');
        }
    }

    $('#tipoDocumento').change(toggleNumeroDoc);

    // Llamada inicial para manejar el caso de que la página se recargue con un valor seleccionado
    toggleNumeroDoc();
});
</script>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        function applyMasking() {
            var numeroDocInput = document.getElementById('numeroDoc');
            var tipoDocumentoSelect = document.getElementById('tipoDocumento');
            var tipoDocumentoIndex = tipoDocumentoSelect.selectedIndex;
            var tipoDocumentoText = tipoDocumentoSelect.options[tipoDocumentoIndex].text;

            // Remover evento previo para evitar duplicados
            numeroDocInput.removeEventListener('input', duiMask);

            if (tipoDocumentoText === 'DUI') {
                numeroDocInput.pattern = "\\d{8}-\\d";
                numeroDocInput.title = "Debe ser en formato XXXXXXXX-X";
                numeroDocInput.maxLength = 10;
                numeroDocInput.addEventListener('input', duiMask);
                // Aplicar máscara inmediatamente
                numeroDocInput.dispatchEvent(new Event('input'));
            } else {
                numeroDocInput.pattern = '^[a-zA-Z0-9]{20}$';
                numeroDocInput.title = "Deben ser máximo 20 caracteres";
                numeroDocInput.maxLength = 20;
            }
        }

        function duiMask(e) {
            var x = e.target.value.replace(/\D/g, '').match(/(\d{0,8})(\d{0,1})/);
            e.target.value = !x[2] ? x[1] : x[1] + '-' + x[2];
        }

        // Aplicar la máscara cuando se cambia el tipo de documento
        document.getElementById('tipoDocumento').addEventListener('change', function () {
            var numeroDocInput = document.getElementById('numeroDoc');
            numeroDocInput.value = ''; // Limpiar el valor del campo
            applyMasking();
        });

        // Aplicar la máscara al cargar la página
        applyMasking();
    });
</script>



<script>
    document.getElementById('isss').addEventListener('input', function (e) {
        e.target.value = e.target.value.replace(/\D/g, '').slice(0, 9);
    });

    document.getElementById('nup').addEventListener('input', function (e) {
        e.target.value = e.target.value.replace(/\D/g, '').slice(0, 12);
    });

    document.getElementById('nit').addEventListener('input', function (e) {
        var x = e.target.value.replace(/\D/g, '').match(/(\d{0,4})(\d{0,6})(\d{0,3})(\d{0,1})/);
        e.target.value = !x[2] ? x[1] : x[1] + '-' + x[2] + (x[3] ? '-' + x[3] : '') + (x[4] ? '-' + x[4] : '');
    });

    document.getElementById('salario').addEventListener('input', function (e) {
        e.target.value = e.target.value.replace(/[^\d.]/g, '').slice(0, 11);
    });

</script>


<%@ include file="../base/footer.jsp" %>

