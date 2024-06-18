<%@ include file="../base/head.jsp" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<title>Municipios</title>
<%@ include file="../base/navbar.jsp" %>
<a href="/demografia/departamentos" class="btn btn-primary ms-4 mt-1">←</a>
    <div class="container-fluid px-4">
        
        <div class="d-flex justify-content-center">
            <!--h1 class="mt-4">Municipios de ${nombreDepartamento}</h1-->

        </div>
        <div class="d-flex justify-content-end mb-4">
           <!--a href="#"><button title="Imprimir" class="btn btn-success me-1"><i class="fa-solid fa-print"></i></button></a-->

        </div>

        <div class="card mb-4">

            <div class="card-body">
                <table id="datatablesSimple" class="table">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Municipio</th>
                            <th>N° de empleados</th>
                        </tr>
                    </thead>

                    <tbody>
                        <c:forEach var="municipio" items="${municipios}" varStatus="i">
                        <tr>
                        <td>${i.count}</td>
                        <td>${municipio.nombreMunicipio}</td>
                        <td>${municipio.cantidad_empleados}</td>
                        </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
<%@ include file="../base/footer.jsp" %>
<script>
    const datatablesSimple = document.getElementById('datatablesSimple');
        if (datatablesSimple) {
            new simpleDatatables.DataTable(datatablesSimple, {
                            perPage:15,
                            labels:{
                                placeholder: "Buscar...",
                                searchTitle: "Buscar en la tabla",
                                pageTitle: "Página {page}",
                                perPage: "Filas por página",
                                noRows: "No hay datos",
                                info: "Mostrando {start} a {end} de {rows} entradas",
                                noResults: "No se encontraron filas coincidentes",
                            }
            });
            console.log(simpleDatatables.rows)
        }
        
  
  </script>
