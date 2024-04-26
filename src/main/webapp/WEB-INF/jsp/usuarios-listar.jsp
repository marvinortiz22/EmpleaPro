<%@ include file="base/header.jsp" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<title>Usuarios</title>

    <div class="container-fluid px-4">
        <div class="d-flex justify-content-center">
            <h1 class="mt-4">Usuarios</h1>
        </div>
        <div class="d-flex justify-content-end mb-4">
            <a href="/usuario/agregar"><button title="Agregar" class="btn btn-primary m"><i class="fa-solid fa-plus"></i></button></a>
        </div>
        
        <div class="card mb-4">
            
            <div class="card-body">
                <table id="datatablesSimple" class="table">
                    <thead>
                        <tr>
                            <th>id</th>
                            <th>username</th>
                            <th>rol</th>
                            <th>email</th>
                            <th>estado</th>
                            <th>intentosLogin</th>
                            <th>acciones</th>
                        </tr>
                    </thead>
                    
                    <tbody>
                        <c:forEach var="usuario" items="${puestos}">
                        <tr>
                        <td>${usuario.idUsuario}</td>
                        <td>${usuario.username}</td>
                        <td>${usuario.rol.nombreRol}</td>
                        <td>${usuario.email}</td>
                        <td>
                            <c:if test="${usuario.estado}">
                                Activo
                            </c:if>
                            <c:if test="${!usuario.estado}">
                                Inactivo
                            </c:if>
                        </td>
                        <td>${usuario.intentosLogin}</td>
                        <td>
                            <a href="/usuario/editar?id=${usuario.idUsuario}"><button title="Editar" class="btn btn-warning"><i class="fas fa-pen-to-square"></i></button></a>
                            <c:if test="${usuario.estado}">
                                <a href="/usuario/borrar?id=${usuario.idUsuario}"><button id="x" title="Inhabilitar" class="btn btn-danger"><i class="fas fa-lock"></i></button></a>
                            </c:if>
                            <c:if test="${!usuario.estado}">
                                <a href="#"><button title="Habilitar" id="check" class="btn btn-success"><i class="fas fa-lock"></i></button></a>
                            </c:if>
                        </td>
                        </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

<%@ include file="base/footer.jsp" %>
