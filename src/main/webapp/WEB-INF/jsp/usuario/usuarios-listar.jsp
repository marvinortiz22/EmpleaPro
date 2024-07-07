<%@ include file="../base/head.jsp" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<title>Usuarios</title>
<%@ include file="../base/navbar.jsp" %>
    <div class="container-fluid px-4">
        <div class="d-flex justify-content-center">
            <h1 class="my-4">Usuarios</h1>
        </div>
        
        <div class="card mb-4">
            
            <div class="card-body">
                <table id="datatablesSimple" class="table">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Username</th>
                            <th>Rol</th>
                            <th>Email</th>
                            <th>Estado</th>                           
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    
                    <tbody>
                        <c:forEach var="usuario" items="${usuarios}" varStatus="i">
                        <tr>
                        <td>${i.count}</td>
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
                        <td>

                            <a href="/usuario/editar?id=${usuario.idUsuario}"><button title="Editar" class="btn btn-warning"><i class="fas fa-pen-to-square"></i></button></a>
                            <c:if test="${usuarioPermisos.username!=usuario.username}">
                                <c:if test="${usuario.estado}">
                                <a href="/usuario/cambiarEstado?id=${usuario.idUsuario}"><button id="x" title="Inhabilitar" class="btn btn-danger"><i class="fas fa-lock"></i></button></a>
                                </c:if>
                                <c:if test="${!usuario.estado}">
                                    <a href="/usuario/cambiarEstado?id=${usuario.idUsuario}"><button title="Habilitar" id="check" class="btn btn-success"><i class="fas fa-lock"></i></button></a>
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
