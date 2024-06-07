<%@ include file="../base/head.jsp" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<title>Control de horas</title>
<%@ include file="../base/navbar.jsp" %>
    <div class="container-fluid px-4">
        <div class="d-flex justify-content-center">
            <h1 class="mt-4">Control de horas</h1>
        </div>
        <div class="card mb-4">
            
            <div class="card-body">
                <table id="datatablesSimple" class="table">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Empleado</th>
                            <th>Fecha</th>
                            <th>Hora de ingreso</th>
                            <th>Hora de salida</th>    
                            <th>Acciones</th>                       
                        </tr>
                    </thead>
                    
                    <tbody>
                        <c:forEach var="horasEmpleado" items="${horasEmpleadolist}" varStatus="i">
                        <tr>
                        <td>${i.count}</td>
                        <td>${horasEmpleado.empleado.nombreCompleto}</td>
                        <td>${horasEmpleado.fecha}</td>
                        <td>${horasEmpleado.horaIngreso}</td>
                        <td>${horasEmpleado.horaSalida} </td>
                        <td>
                            <c:if test="${horasEmpleado.idHorasEmpleado==0}">
                                ${horasEmpleado.idHorasEmpleado}
                            </c:if>
                        </td>
                        </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
<%@ include file="../base/footer.jsp" %>
