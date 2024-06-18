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
        <p class="text-center">Por favor seleccione ingrese el mes y el año</p>
        <div class="d-flex justify-content-center">
            <form:form method="POST" action="/contabilidad/planilla" class="container mx-2 mt-4" id="formulario">
                <div class="row mb-3">
                    <div class="col-md-6">
                        <label for="mes">Mes:</label>
                        <select id="mes" class="form-select" name="mes">
                            <option value="1">Enero</option>
                            <option value="2">Febrero</option>
                            <option value="3">Marzo</option>
                            <option value="4">Abril</option>
                            <option value="5" selected>Mayo</option>
                            <option value="6">Junio</option>
                            <option value="7">Julio</option>
                            <option value="8">Agosto</option>
                            <option value="9">Septiembre</option>
                            <option value="10">Octubre</option>
                            <option value="11">Noviembre</option>
                            <option value="12">Diciembre</option>
                        </select>
                    </div>
                    <div class="col-md-6">
                        <label for="anio">Año:</label>
                        <input type="number" class="form-control" id="anio" name="anio" value="2024" min="2000" max="3000" >
                    </div>
                </div>    
                <div class="row mb-3">
                    <div class="col-md-6">
                        
                        <input type="date" class="form-control" name="fecha1" id="fecha1" value="2024-05-01" hidden="true"/>
                    </div>
                    <div class="col-md-6">
                        
                        <input type="date" class="form-control" name="fecha2" id="fecha2" value="2024-05-31" hidden="true"/>
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
        /*let fecha1 = document.getElementById("fecha1").value;
        let fecha2 = document.getElementById("fecha2").value;

        if (fecha2 <= fecha1) {
            alert("La fecha de fin debe ser mayor que la fecha de inicio.");
            event.preventDefault();
        }*/
        setFechas()
        
    });
    function setFechas() {
            var mes = document.getElementById('mes').value;
            var anio = document.getElementById('anio').value;
            
            // Crear la fecha del primer día del mes
            var primerDia = new Date(anio, mes - 1, 1);
            // Crear la fecha del último día del mes
            var ultimoDia = new Date(anio, mes, 0);

            // Formatear las fechas en formato YYYY-MM-DD
            var fecha1 = primerDia.toISOString().split('T')[0];
            var fecha2 = ultimoDia.toISOString().split('T')[0];

            // Asignar los valores a los inputs ocultos
            document.getElementById('fecha1').value = fecha1;
            document.getElementById('fecha2').value = fecha2;

            // Para depurar, mostrar los valores en consola
            console.log("Fecha1: " + fecha1);
            console.log("Fecha2: " + fecha2);
        }
    </script>
    <script src="${pageContext.request.contextPath}/js/jspdf.js"></script>
    <script src="${pageContext.request.contextPath}/js/pdfs/planillaTabla.js"></script>
    <script src="${pageContext.request.contextPath}/js/ManejoTablas.js"></script>
    <script src="${pageContext.request.contextPath}/js/planilla/js.js"></script>
<%@ include file="../base/footer.jsp" %>
