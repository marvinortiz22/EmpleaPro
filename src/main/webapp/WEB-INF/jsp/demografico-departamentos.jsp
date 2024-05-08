<%@ include file="base/head.jsp" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<title>Departamentos</title>
<%@ include file="base/navbar.jsp" %>
    <div class="container-fluid px-4">
        <div class="d-flex justify-content-center">
            <h1 class="mt-4">Departamentos</h1>

        </div>
        <div class="d-flex justify-content-end mb-4">
           <a href="#"><button title="Imprimir" class="btn btn-success me-1"><i class="fa-solid fa-print"></i></button></a>

        </div>

        <div class="card mb-4">

            <div class="card-body">
                <table id="datatablesSimple" class="table">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Departamento</th>
                            <th>N° de empleados</th>
                            <th></th>
                        </tr>
                    </thead>

                    <tbody>
                        <c:forEach var="departamento" items="${departamentos}" varStatus="i">
                        <tr>
                        <td>${i.count}</td>
                        <td>${departamento.nombreDepartamento}</td>
                        <td>${departamento.cantidad_empleados}</td>
                        <td><a class="d-flex justify-content-center" href="/demografia/municipios?id=${departamento.idDepartamento}"><button class="btn btn-primary">Ver municipios</button></a></td>
                        </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
<%@ include file="base/footer.jsp" %>
