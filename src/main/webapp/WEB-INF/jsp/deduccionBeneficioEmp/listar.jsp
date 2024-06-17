<%@ include file="../base/head.jsp" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<title>Deduccion/beneficio</title>
<%@ include file="../base/navbar.jsp" %>
    <div class="container-fluid px-4">
        <a href="/deduccionesBeneficiosEmpleados/listarEmpleados"><button title="Lista principal" class="btn btn-primary ms-4 mt-1">←</button></a>
        <div class="d-flex justify-content-center text-center">
            <h1 class="mt-4">Deducciones y beneficios en nómina de: <br> ${empleado.nombre1} ${empleado.nombre2} ${empleado.apellido1} ${empleado.apellido2} </h1>
        </div>
        <div class="d-flex justify-content-end mb-4">
            <a href="/deduccionesBeneficiosEmpleados/agregar?empleado=${empleado.idEmpleado}"><button title="Agregar" class="btn btn-primary"><i class="fa-solid fa-plus"></i></button></a>
        </div>
        <div class="card mb-4">
            
            <div class="card-body">
                <table id="datatablesSimple" class="table">
                    <thead>
                        <tr>
                            <th >#</th>                           
                            <th>Tipo</th>
                            <th>Nombre</th>
                            <th>Proporcional al sueldo</th>
                            <th>Monto/porcentaje</th>
                            <th>Estado</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    
                    <tbody>
                        <c:forEach var="deduccionBeneficio" items="${deduccionesBeneficios}" varStatus="i">
                        <tr>
                        <td>${i.count}</td>
                        <td>
                            <c:if test="${deduccionBeneficio.deduccionBeneficio.tipo=='D'}">
                                Deducción
                            </c:if>
                            <c:if test="${deduccionBeneficio.deduccionBeneficio.tipo=='B'}">
                                Beneficio
                            </c:if>
                            
                        </td>
                        <td>
                            ${deduccionBeneficio.deduccionBeneficio.nombreDeducBenef}
                        </td>
                        <td>
                            <c:if test="${deduccionBeneficio.proporcionalAlSueldo}">
                                Si
                            </c:if>
                            <c:if test="${!deduccionBeneficio.proporcionalAlSueldo}">
                                No
                            </c:if>
                        
                        </td>
                        <td>
                            <c:if test="${deduccionBeneficio.proporcionalAlSueldo}">
                                ${deduccionBeneficio.montoOPorcentaje}%
                            </c:if>
                            <c:if test="${!deduccionBeneficio.proporcionalAlSueldo}">
                                $${deduccionBeneficio.montoOPorcentaje}
                            </c:if>
                            
                        </td>
                        <td>
                            <c:if test="${deduccionBeneficio.estado}">
                                Activo
                            </c:if>
                            <c:if test="${!deduccionBeneficio.estado}">
                                Inactivo
                            </c:if>
                        </td>
                        <td>
                            <a href="/deduccionesBeneficiosEmpleados/editar?id=${deduccionBeneficio.idDeducBenef_Emp}&empleado=${empleado.idEmpleado}"><button title="Editar" class="btn btn-warning"><i class="fas fa-pen-to-square"></i></button></a>
                            <c:if test="${deduccionBeneficio.estado}">
                                <a href="/deduccionesBeneficiosEmpleados/cambiarEstado?id=${deduccionBeneficio.idDeducBenef_Emp}"><button id="x" title="Inhabilitar" class="btn btn-danger"><i class="fas fa-lock"></i></button></a>
                            </c:if>
                            <c:if test="${!deduccionBeneficio.estado}">
                                <a href="/deduccionesBeneficiosEmpleados/cambiarEstado?id=${deduccionBeneficio.idDeducBenef_Emp}"><button title="Habilitar" id="check" class="btn btn-success"><i class="fas fa-lock"></i></button></a>
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
