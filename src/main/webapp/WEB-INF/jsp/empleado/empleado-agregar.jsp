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
                    </div>
                    <div class="p-2">
                        <label for="nombre2">Segundo Nombre</label>
                        <form:input path="nombre2" class="form-control"/>
                    </div>
                    <div class="p-2">
                        <label for="apellido1">Primer Apellido*</label>
                        <form:input path="apellido1" class="form-control"/>
                    </div>
                    <div class="p-2">
                        <label for="apellido2">Segundo Apellido</label>
                        <form:input path="apellido2" class="form-control"/>
                    </div>
                    <div class="p-2">
                        <label for="apellidoCasada">Apellido de Casada</label>
                        <form:input path="apellidoCasada" class="form-control"/>
                    </div>
                    <div class="p-2">
                        <label for="sexo">Sexo*</label>
                        <form:input path="sexo" class="form-control"/>
                    </div>
                    <div class="p-2">
                        <label for="fechaNacimiento">Fecha de nacimiento*</label>
                        <form:input path="fechaNacimiento" type="date" class="form-control"/>
                    </div>
                    <div class="p-2">
                        <label for="correoPersonal">Correo Personal*</label>
                        <form:input path="correoPersonal" class="form-control"/>
                    </div>
                </div>
                <hr>
                <h5 class="card-title">Documentos</h5>
                <div class="d-flex flex-wrap justify-content-around mb-4">
                    <div class="p-2">
                        <label for="numeroDoc">Número de Documento*</label>
                        <form:input path="numeroDoc" class="form-control"/>
                    </div>
                    <div class="p-2">
                        <label for="nit">NIT</label>
                        <form:input path="nit" class="form-control"/>
                    </div>
                    <div class="p-2">
                        <label for="isss">ISSS*</label>
                        <form:input path="isss" class="form-control"/>
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
                        <label for="fechaIngreso">Fecha de Ingreso*</label>
                        <form:input path="fechaIngreso" type="date" value="${empleado.getFechaIngresoFormateada()}" class="form-control"/>
                    </div>
                    <div class="p-2">
                        <label for="salario">Salario*</label>
                        <form:input path="salario" class="form-control"/>
                    </div>
                    <div class="p-2">
                        <label for="correoInstitucional">Correo Institucional*</label>
                        <form:input path="correoInstitucional" class="form-control"/>
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
