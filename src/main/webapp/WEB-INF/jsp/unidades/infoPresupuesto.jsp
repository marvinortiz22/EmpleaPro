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
                    Nueva Presupuesto
                <% } else { %>
                    Editar Presupuesto
                <% } %>
            </h1>
            <div></div>
        </header>
        <%
        String action;
        if (!Boolean.parseBoolean(request.getAttribute("editar").toString())) {
            action = "/unidad/presupuesto/agregar";
        } else {
            action = "/unidad/presupuesto/editar";
        }
        %>
        <form:form modelAttribute="presupuesto" method="POST" action="${action}">
            <form:input path="idPresupuesto" hidden="true"/>
            <form:input path="unidad.idUnidad" hidden="true"/>
            <div>
                <label for="nombre">Monto</label>
                <form:input path="monto" name="monto" required="true" type="number" step="0.01" min="0"/>
            </div>
            <div>
                <label for="nombre">Año</label>
                <form:input path="ano" name="ano" required="true" type="number" min="0" />
            </div>
            <div style="grid-column: span 2;">
                <button type="submit">Guardar</button>
            </div>
        </form:form>
    </div>
<%@ include file="../base/footer.jsp" %>
