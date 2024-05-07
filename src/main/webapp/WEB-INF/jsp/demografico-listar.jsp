<%@ include file="base/head.jsp" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<title>Departamento y Municipio</title>
<%@ include file="base/navbar.jsp" %>
    <div class="container-fluid px-4">
        <div class="d-flex justify-content-center">
            <h1 class="mt-4">Departamentos y Municipios</h1>
        </div>
        <div class="d-flex justify-content-end mb-4">
            <a href="#"><button title="Imprimir" class="btn btn-success me-1"><i class="fa-solid fa-print"></i></button></a>
        </div>
        <div class="row">
            <div class="col-1"></div>
            <div class="col-4">
                <div class="card mb-4">
                    <div class="card-body">
                        <form id="formDepartamento" action="/demografia/listar" method="get">
                            <div class="row">
                                <select id="selectDepartamento" class="form-select" aria-label="Default select example" name="idDepartamento">
                                    <option selected disabled>${depSeleccionado}</option>
                                    <c:forEach var="departamento" items="${departamentos}">
                                        <option value="${departamento.idDepartamento}">${departamento.nombreDepartamento}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="row">
                                <div class="col-4"></div>
                                <div class="col-6">
                                    <button type="submit" class="btn btn-primary mt-4 ml-6">Ver Municipios</button>
                                </div>
                                <div class="col-2"></div>
                                
                            </div>
                        </form>                
                    </div>
                </div>
            </div>
            <div class="col-2"></div>
            <div class="col-4">
                <div class="card mb-4">
                    <div class="card-body">
                        <select id="selectMunicipio" class="form-select" aria-label="Default select example">
                            <option selected>Seleccionar el municipio</option>
                            <c:forEach var="municipio" items="${municipios}">
                                        <option value="${municipio.idMunicipio}">${municipio.nombreMunicipio}</option>
                            </c:forEach>
                        </select>                        
                    </div>
                </div>
            </div>
        <div class="col-1"></div>
    </div>
    <div class="row">
            <div class="card mb-4">
                <div class="card-header">
                    <i class="fas fa-chart-bar me-1"></i>
                    Grafico Municipios de ${depSeleccionado}
                </div>
                <div class="card-body">
                    <div class="container">
                        <canvas id="myBarChart" width="400" height="200"></canvas>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    </div>
    <script>
    // Obtener el valor de idDepartamento almacenado en el almacenamiento local
    var idDepartamentoSeleccionado = localStorage.getItem('idDepartamento');
    // Establecer el valor seleccionado en el select
    $('#selectDepartamento').val(idDepartamentoSeleccionado);

    $(document).ready(function() {
        // Manejar el evento submit del formulario
        $('#formDepartamento').submit(function(e) {
            // Retener el valor seleccionado del select
            var idDepartamento = $('#selectDepartamento').val();
            localStorage.setItem('idDepartamento', idDepartamento);
            return true; // Permitir que el formulario se envíe
        });
    });
</script>
<script>
    var nombresMunicipios = '${nombresMunicipios}'.split(',');
    var cantidadEmpleados = '${cantidadEmpleados}'.split(',').map(Number);
    console.log(nombresMunicipios);
    console.log(cantidadEmpleados);

    // Bar Chart Example
var ctx = document.getElementById("myBarChart");
var myLineChart = new Chart(ctx, {
  type: 'bar',
  data: {
    labels: nombresMunicipios,
    datasets: [{
      label: "Cantidad de empleados",
      backgroundColor: "rgba(2,117,216,1)",
      borderColor: "rgba(2,117,216,1)",
      data: cantidadEmpleados,
    }],
  },
  options: {
    scales: {
      xAxes: [{
        time: {
          unit: 'month'
        },
        gridLines: {
          display: false
        },
        ticks: {
          maxTicksLimit: 6
        }
      }],
      yAxes: [{
        ticks: {
          min: 0,
          max: 15000,
          maxTicksLimit: 5
        },
        gridLines: {
          display: true
        }
      }],
    },
    legend: {
      display: false
    }
  }
});
</script>


<%@ include file="base/footer.jsp" %>
