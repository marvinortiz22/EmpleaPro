<%@ include file="../base/head.jsp" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<title>Editar Profesion/Oficio</title>
<%@ include file="../base/navbar.jsp" %>
<div class="d-flex justify-content-center">
    <h1 class="mt-5 mb-5">Editar Profesion u Oficio</h1>
</div>


<form:form modelAttribute="oficio" method="POST" action="/oficios/editar" class="container mx-2 mt-4">
    <div class="row mt-5 mb-5">
        <form:hidden path="idProfOfc"/>
        <div class="col-md-3"></div>
        <div class="col-md-3 text-end">
            <label class="form-label">Nombre de la profesion/oficio</label>
        </div>
        <div class="col-md-3"><form:input path="nombreProfOfc" class="form-control" value="" required="true"/></div>      
    </div>
    <div class="row d-flex justify-content-center">
        <div class="col-5"></div>
        <div class="col-2 mt-5 mb-5"><button class="btn btn-primary me-0">Guardar</button></div>
        <div class="col-5"></div>
    </div>
</form:form>

<%@ include file="../base/footer.jsp" %>