<%@ include file="../base/head.jsp" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<title>Control de horas</title>
<%@ include file="../base/navbar.jsp" %>
    <div class="container-fluid px-4">
        <div class="d-flex flex-column text-center mt-4">
            <h2>Control de horas</h2>
            <c:if test="${!param.all}">
                <h2>${usuarioPermisos.fecha}</h2>           
            </c:if>
            
        </div>
        <div class="d-flex justify-content-end mb-4">
            <c:if test="${param.all}">
                <a href="/horasEmpleado/listar"><button title="" class="btn btn-primary"><i class="fa-solid fa-eye"></i> Ver todos</button></a>
            </c:if>
            <c:if test="${!param.all}">
                <a href="/horasEmpleado/listar?all=true"><button title="" class="btn btn-primary"><i class="fa-solid fa-eye"></i> Ver actuales</button></a>
            </c:if>
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
                        <td>
                            <fmt:formatDate value="${horasEmpleado.fecha}" pattern="dd-MM-yyyy" />
                        </td>
                        <td>                    
                            <c:if test="${not empty horasEmpleado.horaIngreso}">
                                <fmt:formatDate value="${horasEmpleado.horaIngreso}" pattern="hh:mm a" />
                            </c:if>
                            <c:if test="${empty horasEmpleado.horaIngreso}">
                                --:-- --
                            </c:if>
                        </td>
                        <td>
                            <c:if test="${not empty horasEmpleado.horaSalida}">
                                <fmt:formatDate value="${horasEmpleado.horaSalida}" pattern="hh:mm a" />
                            </c:if>
                            <c:if test="${empty horasEmpleado.horaSalida}">
                                --:-- --
                            </c:if> 
                        </td>
                        <td>
                            <c:if test="${!param.all}">
                                <c:if test="${horasEmpleado.idHorasEmpleado==0}">
                                    <a href="/horasEmpleado/editar?empleado=${horasEmpleado.empleado.idEmpleado}"><button title="Editar" class="btn btn-success"><i class="fas fa-pen-to-square"></i></button></a>
                                </c:if>
                                <c:if test="${horasEmpleado.idHorasEmpleado!=0}">
                                    <a href="/horasEmpleado/editar?id=${horasEmpleado.idHorasEmpleado}"><button title="Editar" class="btn btn-warning"><i class="fas fa-pen-to-square"></i></button></a>
                                </c:if>
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
