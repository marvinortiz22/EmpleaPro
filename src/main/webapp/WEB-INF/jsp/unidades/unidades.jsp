<%@ include file="../base/head.jsp" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<title>Unidades</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/unidades/css.css">
<%@ include file="../base/navbar.jsp" %>
    <div id="contenedorPrincipal">
        <header>
            <h1>Unidades</h1>
            <div>
                <button id="btnAgregar" <% if(!Boolean.parseBoolean(request.getAttribute("permisoCrear").toString())){ %> hidden <% } %> >
                    <svg  xmlns="http://www.w3.org/2000/svg"  width="24"  height="24"  viewBox="0 0 24 24"  fill="none"  stroke="currentColor"  stroke-width="2"  stroke-linecap="round"  stroke-linejoin="round"  class="icon icon-tabler icons-tabler-outline icon-tabler-plus"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M12 5l0 14" /><path d="M5 12l14 0" /></svg>
                    Nueva unidad
                </button>
            </div>
        </header>
        <section id="contenedorTabla">
            <form>
                <select name="filtro" id="filtro">
                </select>
                <input type="text" name="buscar" id="buscar" placeholder="Buscar" autocomplete="off">
                <button type="submit">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon icon-tabler icons-tabler-search"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><circle cx="10" cy="10" r="7" /><line x1="21" y1="21" x2="15" y2="15" /></svg>
                </button>
            </form>
            <table>
                <thead>
                    <tr>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td colspan="2">Cargando...</td>
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
        console.log(permisoCrear);
    </script>
    <script src="${pageContext.request.contextPath}/js/ManejoTablas.js"></script>
    <script src="${pageContext.request.contextPath}/js/unidades/js.js"></script>
<%@ include file="../base/footer.jsp" %>
