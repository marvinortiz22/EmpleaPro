<%@ include file="../base/head.jsp" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<title>Boleta</title>
<%@ include file="../base/navbar.jsp" %>
    <div class="container-fluid px-4">
        
        <div class="d-flex flex-column align-items-center">
            <h1 class="mt-4 mb-5">Boletas de pago</h1>
            <p class="mb-2">Seleccione un rango de fechas:</p>
        </div>
        <form:form method="POST" action="/contabilidad/planilla" class="container mx-2 mt-4" id="miFormulario">
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
        <p class="text-center mt-2">Seleccione un empleado: </p>
        <div class="card mb-4">
            
            <div class="card-body">
                <table id="datatablesSimple" class="table">
                    <thead>
                        <tr>
                            <th >#</th>
                            <th>Puesto</th>
                            <th>Nombre</th>
                            <th>Documento</th>
                            <th>Estado</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    
                    <tbody>
                        <c:forEach var="empleado" items="${empleados}" varStatus="i">
                        <tr>
                        <td>${i.count}</td>
                        <td>
                            ${empleado.puesto.nombrePuesto}
                        </td>
                        <td>
                            ${empleado.nombre1} ${empleado.nombre2} ${empleado.apellido1} ${empleado.apellido2}
                        </td>
                        <td>
                            <c:if test="${empleado.tipoDocumento != null}">
                            ${empleado.tipoDocumento.nombreDoc}: ${empleado.numeroDoc}<br>
                            </c:if>
                        </td>
                        <td>
                            <c:if test="${empleado.estado}">
                                Activo
                            </c:if>
                            <c:if test="${!empleado.estado}">
                                Inactivo
                            </c:if>
                        </td>
                        <td>
                            
                                <button onclick="enviarFormulario(${empleado.idEmpleado})" title="Ver boleta de pago" class="btn btn-success">
                                    <i class="fas fa-dollar-sign"></i>
                                </button>
                            

                        </td>
                        </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        </form:form>
    </div>
    <script>
        function enviarFormulario(idEmpleado) {
            
            // Actualiza la acción del formulario con el ID del empleado
            document.getElementById("miFormulario").action = "/contabilidad/boleta?id=" + idEmpleado;
            
            /*let fecha1 = document.getElementById("fecha1").value;
            let fecha2 = document.getElementById("fecha2").value;

            if (fecha2 <= fecha1) {
                alert("La fecha de fin debe ser mayor que la fecha de inicio.");
                event.preventDefault(); 
            }else
                document.getElementById("miFormulario").submit();*/
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
<%@ include file="../base/footer.jsp" %>
