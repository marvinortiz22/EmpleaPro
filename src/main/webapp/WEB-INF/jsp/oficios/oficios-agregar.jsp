<%@ include file="../base/head.jsp" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<title>Agregar Profesion/Oficio</title>
<%@ include file="../base/navbar.jsp" %>
<div class="d-flex justify-content-center">
    <h1 class="mt-5 mb-5">Agregar Profesiones u Oficios al catalogo</h1>
</div>
<div class="row m-auto">
    <div class="col-1"></div>
    <div class="col-3">
        <div class="d-flex flex-row ">
            <a href="/oficios/listar">
                <button title="Lista principal" class="btn btn-primary"> ← Regresar </button>
            </a>
        </div>
    </div>
    <div class="col-7"></div>
</div>
<form:form modelAttribute="oficio" method="POST" action="/oficios/agregar" class="container mx-2 mt-4">
    <div class="row mt-5 mb-5">
        <div class="col-md-3"></div>
        <div class="col-md-3 text-end">
            <label class="form-label">Nombre de la profesion u oficio</label>
        </div>
        <div class="col-md-3">
            <form:input path="nombreProfOfc" class="form-control" value="" required="true" maxlength="50"/>
        </div>
        <div class="col-md-3"></div>         
    </div>
    <div class="row d-flex justify-content-center">
        <div class="col-5"></div>
        <div class="col-2 mt-5 mb-5 text-end"><button class="btn btn-primary me-0">Guardar</button></div>
        <div class="col-5"></div>
    </div>
</form:form>



<%@ include file="../base/footer.jsp" %>