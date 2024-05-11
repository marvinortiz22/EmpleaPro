<%@ include file="base/head.jsp" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<style>
            ul,li{
                list-style-type: none;
                margin:0;
                padding:0;
            }

        </style>
<title>Detalles Rol</title>
<%@ include file="base/navbar.jsp" %>
<a href="/rol/listar"><button title="Lista principal" class="btn btn-none">←</button></a>
<div class="d-flex justify-content-center">
    <h1 class="mt-4">Datos de rol</h1>
</div>
<div class="container mt-4">
    <div class="row mb-3 justify-content-around">
        <div class="col-md-4">
            <strong >Nombre</strong>
            <p>${rol.nombreRol}</p>
        </div>
        <div class="col-md-4">
            <strong >Permisos </strong>
            <ul>
            <c:forEach var="permiso" items="${rol.permisos}" varStatus="i">
                <li>${permiso.nombrePermiso}</li>
            </c:forEach>
            </ul>
        </div>
    </div>
    
</div>

<%@ include file="base/footer.jsp" %>
