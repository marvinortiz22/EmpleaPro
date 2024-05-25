<%@ include file="../base/head.jsp" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<title>Editar datos empresa</title>
<%@ include file="../base/navbar.jsp" %>
<div class="card bg-light mx-3 my-4">
    <div class="card-header d-flex justify-content-center">
        <h1 class="mt-1 mb-2">Editar Detalles de la empresa</h1>
    </div>
</div>
<div class="d-flex flex-row">
    <div class="col-1"></div>
    <div class="col-3">
        <a href="/datosEmpresa/listar">
            <button title="Lista principal" class="btn btn-primary"> ← Regresar </button>
        </a>
    </div>
    <div class="col-8"></div>
</div>
<form:form modelAttribute="datosEmpresa" method="POST" action="/datosEmpresa/editar" class="container mx-2 mt-4">
    <div class="row mt-5 mb-2">
        <form:hidden path="idEmpresa"/>
        <div class="container mb-5">
        <div class="row mt-5 mb-5">
            <div class="col-1"></div>
            <div class="col-1 text-end">
                <label class="form-label">Nombre</label>
            </div>
            <div class="col-4">
                <form:input path="nombreEmpresa" class="form-control" value="" required="true"/>
            </div>
            <div class="col-1 text-end">Direccion</div>
            <div class="col-4"><form:input path="direccion" class="form-control" value="" required="true"/></div>
            <div class="col-1"></div>
        </div>
        <div class="row mt-5 mb-5">
            <div class="col-1"></div>
            <div class="col-1">
                <label class="form-label">Representante Legal</label>
            </div>
            <div class="col-4">
                <form:input path="nombreRepresentante" class="form-control" value="" required="true"/>
            </div>
            <div class="col-1 text-end">NIT</div>
            <div class="col-4">
                <form:input path="nit" id="nit" class="form-control" value="" required="true" pattern="\d{4}-\d{6}-\d{3}-\d" title="Debe ser en formato XXXX-XXXXXX-XXX-X"/>
            </div>
            <div class="col-1"></div>
        </div>
        <div class="row mt-5 mb-5">
            <div class="col-1"></div>
            <div class="col-1 text-end">
                <label class="form-label">NIC</label>
            </div>
            <div class="col-4">
                <form:input path="nic" id="nic" class="form-control" value="" required="true" pattern="\d{7}" title="Debe ser un número de 7 dígitos"/>
            </div>
            <div class="col-1 text-end">Telefono</div>
            <div class="col-4"><form:input path="telefono" id="telefono" class="form-control" value="" required="true" pattern="\d{4}-\d{4}" title="Debe ser en formato XXXX-XXXX"/></div>
            <div class="col-1"></div>
        </div>
        <div class="row mt-5 mb-5">
            <div class="col-1"></div>
            <div class="col-1 text-end">
                <label class="form-label">Pagina Web</label>
            </div>
            <div class="col-4">
                <form:input path="paginaWeb" id="paginaWeb" class="form-control" value="" required="true" pattern="https?://.*" title="Ingrese una URL válida, por ejemplo: http://www.ejemplo.com"/>
            </div>
            <div class="col-1">Correo Electronico</div>
            <div class="col-4">
                <form:input path="email" id="email" class="form-control" value="" required="true" title="Ingrese un correo electrónico válido"/>
            </div>
            <div class="col-1"></div>
        </div>
    </div>
    <div class="row">
        <div class="col-12 d-flex justify-content-center">
            <button class="btn btn-primary">Guardar</button>
        </div>
    </div>
</form:form>
<script>
    document.getElementById('telefono').addEventListener('input', function (e) {
        var x = e.target.value.replace(/\D/g, '').match(/(\d{0,4})(\d{0,4})/);
        e.target.value = !x[2] ? x[1] : x[1] + '-' + x[2];
    });

    document.getElementById('nit').addEventListener('input', function (e) {
        var x = e.target.value.replace(/\D/g, '').match(/(\d{0,4})(\d{0,6})(\d{0,3})(\d{0,1})/);
        e.target.value = !x[2] ? x[1] : x[1] + '-' + x[2] + (x[3] ? '-' + x[3] : '') + (x[4] ? '-' + x[4] : '');
    });
    document.getElementById('nic').addEventListener('input', function (e) {
        e.target.value = e.target.value.replace(/\D/g, '').slice(0, 7);
    });

    document.getElementById('email').addEventListener('input', function(e) {
        var email = e.target.value;
        console.log(email);
        var regex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
        if (!regex.test(email)) {
            e.target.setCustomValidity('Ingrese un correo electrónico válido');
        } else {
            e.target.setCustomValidity('');
        }
    });
</script>
<%@ include file="../base/footer.jsp" %>
