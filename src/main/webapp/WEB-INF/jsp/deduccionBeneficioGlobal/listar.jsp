<%@ include file="../base/head.jsp" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<title>ISSS y AFP</title>
<%@ include file="../base/navbar.jsp" %>
    <div class="container-fluid px-4">
        <div class="d-flex justify-content-center text-center">
            <h1 class="mt-4">ISSS y AFP</h1>
        </div>
        <div class="d-flex justify-content-end mb-4">
        </div>
        <div class="card mb-4">
            
            <div class="card-body">
                <table id="datatablesSimple" class="table">
                    <thead>
                        <tr>
                            <th >#</th>                           
                            <th>Nombre</th>
                            <th>Porcentaje</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    
                    <tbody>
                        <c:forEach var="deduccionBeneficio" items="${deduccionesBeneficios}" varStatus="i">
                        <tr>
                        <td>${i.count}</td>
                        <td>
                            ${deduccionBeneficio.deduccionBeneficio.nombreDeducBenef}
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
                            <a href="/deduccionesBeneficiosGlobales/editar?id=${deduccionBeneficio.deduccionBeneficio.idDeducBenef}"><button title="Editar" class="btn btn-warning"><i class="fas fa-pen-to-square"></i></button></a>
                        </td>
                        </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
<%@ include file="../base/footer.jsp" %>
