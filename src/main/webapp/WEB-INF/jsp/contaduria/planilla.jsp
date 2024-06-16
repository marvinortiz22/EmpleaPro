<%@ include file="../base/head.jsp" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<style>
        td {
            white-space: nowrap;
        }
    </style>
<title>Planilla</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/unidades/css.css">
<%@ include file="../base/navbar.jsp" %>
    <div id="contenedorPrincipal" class="mt-5">
        <header>
            <h1>Planilla</h1>
        </header>
        <p class="text-center">Por favor seleccione un rango de fechas</p>
        <div class="d-flex justify-content-center">
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
        </div>
    </div>

    <script>
        let datos = '<%= request.getAttribute("unidades") %>';
        let fechaI = '<%= request.getAttribute("fecha1") %>', fechaF = '<%= request.getAttribute("fecha2") %>';
        let nombreEmpresa = '<%= request.getAttribute("nombreEmpresa") %>';
        document.getElementById("formulario").addEventListener("submit", function(event) {
        let fecha1 = document.getElementById("fecha1").value;
        let fecha2 = document.getElementById("fecha2").value;

        if (fecha2 <= fecha1) {
            alert("La fecha de fin debe ser mayor que la fecha de inicio.");
            event.preventDefault();
        }
    });
    </script>
    <script src="${pageContext.request.contextPath}/js/jspdf.js"></script>
    <script src="${pageContext.request.contextPath}/js/pdfs/planillaTabla.js"></script>
    <script src="${pageContext.request.contextPath}/js/ManejoTablas.js"></script>
    <script src="${pageContext.request.contextPath}/js/planilla/js.js"></script>
<%@ include file="../base/footer.jsp" %>
