<%@ include file="../base/head.jsp" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<title>Deduccion/beneficio</title>
<%@ include file="../base/navbar.jsp" %>
    <div class="container-fluid px-4">
        <div class="d-flex justify-content-center text-center">
            <h1 class="mt-4">Deducciones y beneficios generales </h1>
        </div>
        <div class="d-flex justify-content-end mb-4">
            <a href="/deduccionesBeneficiosGlobales/agregar"><button title="Agregar" class="btn btn-primary"><i class="fa-solid fa-plus"></i></button></a>
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
                            <a href="/deduccionesBeneficiosGlobales/editar?id=${deduccionBeneficio.deduccionBeneficio.idDeducBenef}"><button title="Editar" class="btn btn-warning"><i class="fas fa-pen-to-square"></i></button></a>
                            <c:if test="${deduccionBeneficio.estado}">
                                <a href="/deduccionesBeneficiosGlobales/cambiarEstado?id=${deduccionBeneficio.deduccionBeneficio.idDeducBenef}"><button id="x" title="Inhabilitar" class="btn btn-danger"><i class="fas fa-lock"></i></button></a>
                            </c:if>
                            <c:if test="${!deduccionBeneficio.estado}">
                                <a href="/deduccionesBeneficiosGlobales/cambiarEstado?id=${deduccionBeneficio.deduccionBeneficio.idDeducBenef}"><button title="Habilitar" id="check" class="btn btn-success"><i class="fas fa-lock"></i></button></a>
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
