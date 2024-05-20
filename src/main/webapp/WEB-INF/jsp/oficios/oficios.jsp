<%@ include file="../base/head.jsp" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<title>Profesiones y Oficios</title>
<%@ include file="../base/navbar.jsp" %>
    <div class="container-fluid px-4">
        <div class="d-flex justify-content-center">
            <h1 class="mt-4">Profesiones y Oficios</h1>
        </div>
        <div class="d-flex justify-content-end mb-4">
            <a href="/oficios/agregar"><button title="Agregar" class="btn btn-primary"><i class="fa-solid fa-plus"></i></button></a>
        </div>
        <div class="card mb-4">
            
            <div class="card-body">
                <table id="datatablesSimple" class="table text-center">
                    
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Nombre Profesion/Oficio</th>
                            <th>N de empleados</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                
                    <tbody>
                        <c:forEach var="oficio" items="${profyOficios}" varStatus="i">
                            <tr>
                                <td>${i.count}</td>
                                <td>${oficio[1]}</td>
                                <td>${oficio[2]}</td>
                                <td class="text-nowrap">
                                    <a href="/oficios/editar?id=${oficio[0]}"><button title="Editar" class="btn btn-warning"><i class="fas fa-pen-to-square"></i></button></a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            
        </div>
    </div>
<%@ include file="../base/footer.jsp" %>
