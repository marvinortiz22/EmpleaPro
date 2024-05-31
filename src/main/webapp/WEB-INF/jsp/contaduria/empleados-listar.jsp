<%@ include file="../base/head.jsp" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<title>Empleados</title>
<%@ include file="../base/navbar.jsp" %>
    <div class="container-fluid px-4">
        
        <div class="d-flex flex-column align-items-center">
            <h1 class="mt-4 mb-5">Empleados</h1>
            <p class="mb-2">Seleccione un rango de fechas:</p>
        </div>
        <form:form method="post" id="miFormulario">
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
            
            let fecha1 = document.getElementById("fecha1").value;
            let fecha2 = document.getElementById("fecha2").value;

            if (fecha2 <= fecha1) {
                alert("La fecha de fin debe ser mayor que la fecha de inicio.");
                event.preventDefault(); 
            }else
                document.getElementById("miFormulario").submit();
        }
    </script>
<%@ include file="../base/footer.jsp" %>
