<%@ include file="base/head.jsp" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<title>Roles</title>

<%@ include file="base/navbar.jsp" %>
    <div class="container-fluid px-4">
        <div class="d-flex justify-content-center">
            <h1 class="mt-4">Roles</h1>
        </div>
        <div class="d-flex justify-content-end mb-4">

            <a href="/rol/agregar"><button title="Agregar" class="btn btn-primary"><i class="fa-solid fa-plus"></i></button></a>
        </div>
        <div class="card mb-4">
            
            <div class="card-body">
                <table id="datatablesSimple" class="table">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Rol</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    
                    <tbody>
                        <c:forEach var="rol" items="${roles}" varStatus="i">
                        <tr>
                        <td class="text-center">${i.count}</td>
                        <td>${rol.nombreRol}</td>
                        <td>
                            <a href="/rol/detalles?id=${rol.idRol}"><button title="Ver detalles" class="btn btn-primary"><i class="fas fa-eye"></i></button></a>
                            <a href="/rol/editar?id=${rol.idRol}"><button title="Editar" class="btn btn-warning"><i class="fas fa-pen-to-square"></i></button></a>
                        </td>
                        </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
<%@ include file="base/footer.jsp" %>
