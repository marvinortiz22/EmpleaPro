<%@ include file="../base/head.jsp" %>
<%@ include file="../base/navbar.jsp" %>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<title>Datos del empleado</title>

<div class="container-fluid">
    <div class="card bg-light mx-3 my-4">
        <div class="card-header d-flex justify-content-center">
            <h1 class="mt-1 mb-2">Bienvenido</h1>
        </div>

        <div class="card-body d-flex justify-content-center">
            <h2 class="mt-1 mb-2">${usuarioPermisos.username}</h2>
        </div>
    </div>
</div>
<%@ include file="../base/footer.jsp" %>
