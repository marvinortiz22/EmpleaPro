<%@ include file="base/header.jsp" %>
<title>Document</title>
<main>
    <div class="container-fluid px-4">
        <h1 class="mt-4">Usuarios</h1>
        
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
                        <td>${usuario.estado}</td>
                        <td>${usuario.intentosLogin}</td>
                        <td>
                            <a href="/usuario/editar?id=${usuario.idUsuario}"><button>modificar</button></a>
                            <a href="/usuario/borrar?id=${usuario.idUsuario}"><button>borrar</button></a>
                        </td>
                        </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</main>
<a href="/usuario/agregar"><button>agregar usuario</button></a>
<%@ include file="base/footer.jsp" %>
