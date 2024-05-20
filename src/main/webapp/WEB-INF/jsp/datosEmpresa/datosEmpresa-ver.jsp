<%@ include file="../base/head.jsp" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<title>Datos de la empresa</title>
<%@ include file="../base/navbar.jsp" %>
<div class="container-fluid px-4">
    <div class="d-flex justify-content-center">
        <h1 class="mt-4 mb-5">Detalles de la empresa</h1>
    </div>
    <div class="row">
        <div class="col-8"></div>
        <div class="col-3">
            <div class="d-flex justify-content-end mb-4">
                <a href="/datosEmpresa/editar"><button title="Editar" class="btn btn-warning"><i class="fas fa-pen-to-square"></i></button></a>
            </div>
        </div><div class="col-1"></div>
    </div>
    
    <div class="container mb-5">
        <div class="row mt-5 mb-5">
            <div class="col-2"></div>
            <div class="col-3">Nombre: <strong>${datosEmpresa.nombreEmpresa}</strong></div>
            <div class="col-2"></div>
            <div class="col-3">Direccion: <strong>${datosEmpresa.direccion}</strong></div>
            <div class="col-2"></div>
        </div>
        <div class="row mt-5 mb-5">
            <div class="col-2"></div>
            <div class="col-3">Representante Legal: <strong>${datosEmpresa.nombreRepresentante}</strong></div>
            <div class="col-2"></div>
            <div class="col-3">NIT: <strong>${datosEmpresa.nit}</strong></div>
            <div class="col-2"></div>
        </div>
        <div class="row mt-5 mb-5">
            <div class="col-2"></div>
            <div class="col-3">NIC: <strong>${datosEmpresa.nic}</strong></div>
            <div class="col-2"></div>
            <div class="col-3">Telefono: <strong>${datosEmpresa.telefono}</strong></div>
            <div class="col-2"></div>
        </div>
        <div class="row mt-5 mb-5">
            <div class="col-2"></div>
            <div class="col-3">Pagina Web: <strong>${datosEmpresa.paginaWeb}</strong></div>
            <div class="col-2"></div>
            <div class="col-3">Correo Electronico: <strong>${datosEmpresa.email}</strong></div>
            <div class="col-2"></div>
        </div>
    </div>
    
</div>
<%@ include file="../base/footer.jsp" %>
