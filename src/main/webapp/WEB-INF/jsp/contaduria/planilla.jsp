<%@ include file="../base/head.jsp" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<style>
        td {
            white-space: nowrap;
        }
    </style>
<title>Unidades</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/unidades/css.css">
<%@ include file="../base/navbar.jsp" %>
    <div id="contenedorPrincipal">
        <header>
            <h1>Planilla</h1>
        </header>
        <form:form method="POST" action="/contabilidad/planilla" class="container mx-2 mt-4" id="formulario">
            <div class="row mb-3">
                <div class="col-md-6">
                    <label for="">Desde:</label>
                    <input type="date" class="form-control" name="fecha1" id="fecha1" value="2024-05-21"/>
                </div>
                <div class="col-md-6">
                    <label for="">Hasta:</label>
                    <input type="date" class="form-control" name="fecha2" id="fecha2" value="2024-05-23"/>
                </div>
            </div>
            <div class="d-flex justify-content-center">
                <button class="btn btn-primary me-0">Mostrar</button>
            </div>
        </form:form>
        <div>
            <a href="/unidad/agregar" class="btnAgregar" <% if(!Boolean.parseBoolean(request.getAttribute("permisoCrear").toString())){ %> hidden <% } %> >
                <svg  xmlns="http://www.w3.org/2000/svg"  width="24"  height="24"  viewBox="0 0 24 24"  fill="none"  stroke="currentColor"  stroke-width="2"  stroke-linecap="round"  stroke-linejoin="round"  class="icon icon-tabler icons-tabler-outline icon-tabler-plus"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M12 5l0 14" /><path d="M5 12l14 0" /></svg>
                Nueva unidad
            </a>
        </div>
        <section id="contenedorTabla">
            <form>
                <div>
                    <select name="filtro" id="filtro">
                    </select>
                    <input type="text" name="buscar" id="buscar" placeholder="Buscar" autocomplete="off">
                    <button type="submit">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon icon-tabler icons-tabler-search"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><circle cx="10" cy="10" r="7" /><line x1="21" y1="21" x2="15" y2="15" /></svg>
                    </button>
                </div>
                <div>
                    <label for="mostrar">Mostrar:</label>
                    <select name="mostrar" id="mostrar">
                        <option value="5">5</option>
                        <option value="10">10</option>
                        <option value="25">25</option>
                        <option value="50">50</option>
                        <option value="100">100</option>
                    </select>
                </div>
            </form>
            <table>
                <thead>
                    <tr>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td colspan="2">Por favor, seleccione un rango de fechas</td>
                    </tr>
                </tbody>
            </table>
            <footer>
                <div>
                    <button class="btnPrimero">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon icon-tabler icons-tabler-chevron-left"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><polyline points="15 6 9 12 15 18" /></svg>
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon icon-tabler icons-tabler-chevron-left"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><polyline points="15 6 9 12 15 18" /></svg>
                    </button>
                    <button class="btnAnterior">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon icon-tabler icons-tabler-chevron-left"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><polyline points="15 6 9 12 15 18" /></svg>
                    </button>
                    <button class="btnSiguiente">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon icon-tabler icons-tabler-chevron-right"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><polyline points="9 6 15 12 9 18" /></svg>
                    </button>
                    <button class="btnUltimo">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon icon-tabler icons-tabler-chevron-right"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><polyline points="9 6 15 12 9 18" /></svg>
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon icon-tabler icons-tabler-chevron-right"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><polyline points="9 6 15 12 9 18" /></svg>
                    </button>
                </div>
                <div>
                </div>
            </footer>
        </section>
    </div>

    <script>
        let datos = '<%= request.getAttribute("unidades") %>';
        let permisoEditar = '<%= request.getAttribute("permisoEditar") %>';
        let permisoCrear = '<%= request.getAttribute("permisoCrear") %>';
        let cambiarEstado = '<%= request.getAttribute("cambiarEstado") %>';
        let verPresupuestos = '<%= request.getAttribute("verPresupuestos") %>';
        document.getElementById("formulario").addEventListener("submit", function(event) {
        var fecha1 = document.getElementById("fecha1").value;
        var fecha2 = document.getElementById("fecha2").value;

        if (fecha2 <= fecha1) {
            alert("La fecha de fin debe ser mayor que la fecha de inicio.");
            event.preventDefault(); 
        }
    });
    </script>
    <script src="${pageContext.request.contextPath}/js/ManejoTablas.js"></script>
    <script src="${pageContext.request.contextPath}/js/planilla/js.js"></script>
<%@ include file="../base/footer.jsp" %>
