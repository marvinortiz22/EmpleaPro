<%@ include file="../base/head.jsp" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<title>
    <% if(!Boolean.parseBoolean(request.getAttribute("editar").toString())){ %>
        Nueva Unidad
    <% } else { %>
        Editar Unidad
    <% } %>
</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/unidades/info.css">
<%@ include file="../base/navbar.jsp" %>
    <div id="contenedorPrincipal">
        <header>
            <button onclick="window.history.back()">
                <svg  xmlns="http://www.w3.org/2000/svg"  width="24"  height="24"  viewBox="0 0 24 24"  fill="none"  stroke="currentColor"  stroke-width="2"  stroke-linecap="round"  stroke-linejoin="round"  class="icon icon-tabler icons-tabler-outline icon-tabler-arrow-left"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M5 12l14 0" /><path d="M5 12l6 6" /><path d="M5 12l6 -6" /></svg>
            </button>
            <h1>
                <% if(!Boolean.parseBoolean(request.getAttribute("editar").toString())){ %>
                    Nueva Unidad
                <% } else { %>
                    Editar Unidad
                <% } %>
            </h1>
            <div></div>
        </header>
        <%
        String action;
        if (!Boolean.parseBoolean(request.getAttribute("editar").toString())) {
            action = "/unidad/agregar";
        } else {
            action = "/unidad/editar";
        }
        %>
        <form:form modelAttribute="unidad" method="POST" action="${action}">
            <form:input path="idUnidad" hidden="true"/>
            <div>
                <label for="nombre">Nombre</label>
                <form:input path="nombreUnidad" maxlength="50" id="nombre" name="nombre" required="true"/>
            </div>
            <div>
                <label for="tipo">Tipo de unidad</label>
                <form:select path="tipoUnidad.idTipoUnidad" items="${tiposUnidades}" itemValue="idTipoUnidad" itemLabel="nombreTipoUnidad" required="true"/>
            </div>
            <div>
                <label for="unidadPadre">Unidad Padre</label>
                <form:select path="unidadPadre.idUnidad">
                    <form:option value="0" label="No tiene unidad padre"/>
                    <form:options items="${unidades}" itemValue="idUnidad" itemLabel="nombreUnidad"/>
                </form:select>
            </div>
            <div>
                <label for="estado">Estado</label>
                <label for="estado">
                    <div id="estadoDiv">
                        <form:checkbox path="estado" id="estado"/>
                        <p>Activado</p>
                    </div>
                </label>
            </div>
            <div style="grid-column: span 2;">
                <button type="submit">Guardar</button>
            </div>
        </form:form>
    </div>
<%@ include file="../base/footer.jsp" %>
