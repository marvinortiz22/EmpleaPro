<%@ include file="../base/head.jsp" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<title>Departamentos</title>
<%@ include file="../base/navbar.jsp" %>
    <div class="container-fluid px-4">
        <div class="d-flex justify-content-center">
            <h1 class="mt-4">Departamentos</h1>

        </div>
        <div class="d-flex justify-content-end mb-4">
           <a href="#"><button title="Imprimir" class="btn btn-success me-1"><i class="fa-solid fa-print"></i></button></a>

        </div>
        <div class="d-flex justify-content-center">
            <p class="mt-4">Total de empleados: ${nDeEmpleados}</p>

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
        <div class="row">
            <div class="card mb-4">
                <div class="card-header">
                    <i class="fas fa-chart-bar me-1"></i>
                    Grafico Empleados por Departamento
                </div>
                <div class="card-body">
                    <div class="container">
                        <canvas id="myBarChart" width="400" height="200"></canvas>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        var nombresDep = '${nombresDepartamentos}'.split('[').join('').split(']').join('').split(',');
        var cantidadEmpleados = '${cantidadEmpleados}'.split('[').join('').split(']').join('').split(',').map(Number);
        console.log(nombresDep);
        console.log(cantidadEmpleados);
        var ctx = document.getElementById("myBarChart");
        var myLineChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: nombresDep,
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
<%@ include file="../base/footer.jsp" %>
