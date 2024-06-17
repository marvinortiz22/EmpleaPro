<%@ include file="../base/head.jsp" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<title>Vacaciones</title>
<%@ include file="../base/navbar.jsp" %>
    <div class="container-fluid px-4">
        <div class="d-flex flex-column text-center mt-4">
            <h2>Vacaciones</h2>
            <c:if test="${!param.all}">
                <h2>
                    <jsp:useBean id="now" class="java.util.Date"/>    
                    <fmt:formatDate value="${now}" pattern="yyyy" />
                </h2>           
            </c:if>
            
        </div>
        <div class="d-flex justify-content-end mb-4">
            <c:if test="${param.all}">
                <a href="/vacaciones/listar"><button title="" class="btn btn-primary"><i class="fa-solid fa-eye"></i> Ver actuales</button></a>
            </c:if>
            <c:if test="${!param.all}">
                <a href="/vacaciones/listar?all=true"><button title="" class="btn btn-primary"><i class="fa-solid fa-eye"></i> Ver todos</button></a>
            </c:if>
        </div> 
        <div class="card mb-4">
               
            <div class="card-body">
                <table id="datatablesSimple" class="table">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Empleado</th>
                            <th>Fecha de inicio</th>
                            <th>Estado</th>   
                            <th>Acciones</th>                       
                        </tr>
                    </thead>
                    
                    <tbody>
                        <c:forEach var="vacacion" items="${vacacionesList}" varStatus="i">
                        <tr>
                        <td>${i.count}</td>
                        <td>${vacacion.empleado.nombreCompleto}</td>
                        <td>                    
                            <c:if test="${not empty vacacion.fechaInicio}">
                                <fmt:formatDate value="${vacacion.fechaInicio}" pattern="dd-MM-yyyy" />
                            </c:if>
                            <c:if test="${empty vacacion.fechaInicio}">
                               --/--/----
                            </c:if>
                        </td>
                        <td>
                            <c:if test="${not empty vacacion.fechaInicio}">
                                Dada
                            </c:if>
                            <c:if test="${empty vacacion.fechaInicio}">
                               Pendiente
                            </c:if>
                        </td>
                        <td>
                            <c:if test="${!param.all}">
                                <c:if test="${vacacion.idVacacion==0}">
                                    <a href="/vacaciones/editar?empleado=${vacacion.empleado.idEmpleado}"><button title="Editar" class="btn btn-success"><i class="fas fa-pen-to-square"></i></button></a>
                                </c:if>
                                <c:if test="${vacacion.idVacacion!=0}">
                                    <a href="/vacaciones/editar?id=${vacacion.idVacacion}"><button title="Editar" class="btn btn-warning"><i class="fas fa-pen-to-square"></i></button></a>
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
