<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <meta charset="UTF-8" />
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <%@ page contentType="text/html" pageEncoding="UTF-8"%>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link href="${pageContext.request.contextPath}/css/base.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <title>Boleta de pago</title>
    <style>
        td,
        th {
            text-align: justify;
        }

        td {
            width: 50%;
        }

        .td2 {
            text-align: end;
        }
        @media print {
            header, footer {
                display: none;
            }
            
            [title="Imprimir"]{
                display: none;
            }
            .sb-topnav.navbar{
                display: none;
            }
            .sb-sb-sidenav{
                display: none;
            }
            #boletaPago{
                margin-top: -70px;
            }
        }
    </style>
    <%@ include file="../base/navbar.jsp" %>
</head>

<body>
    <a href="/contabilidad/listarEmpleados" data-ac="regresar"><button title="Lista principal" class="btn btn-primary ms-4 mt-1">←</button></a>
    <div class="container-fluid px-4" id="boletaDePago">
        <div class="d-flex flex-column align-items-center cabezaBoleta">
            <h5 id="nombreEmpresa" class="mt-4 mb-2">Nombre de la empresa</h5>
            <h5 class="mb-2" style="text-align: center;">Boleta de pago correspondiente al período</h5>
            <h5 id="rangoFechas" class="mb-2">del: al: </h5>
            <h5 id="nombreEmpleado">Empleado: nombre</h5>
            <h5 id="numeroDoc">Número de documento: 1 </h5>
        </div>
        <div class="d-flex justify-content-end mb-4">
            <button title="Imprimir" class="btn btn-success me-1" onclick="imprimirBoleta()">
                <i class="fa-solid fa-print"></i>
            </button>
        </div>
        <div class="d-flex justify-content-center">
            <h5 class="mt-4">Beneficios</h5>
        </div>
        <div class="row d-flex justify-content-center">
            <table id="benefits-table" class="col-md-8" style="text-align: start;">
                <tr>
                    <td>Sueldo bruto</td>
                    <td class="td2" id="salario-hora"></td>
                </tr>
                <tr>
                    <td>Faltas</td>
                    <td class="td2" id="horas-normales" style="color: red;"></td>
                </tr>
                <tr>
                    <td>Salario</td>
                    <td class="td2" id="salario-base"></td>
                </tr>
                <tr>
                    <td>Vacaciones</td>
                    <td class="td2" id="vacaciones"></td>
                </tr>
                <tr>
                    <td>Horas extra</td>
                    <td class="td2" id="horas-extra"></td>
                </tr>
                <!--tr>
                    <td>Permisos remunerables</td>
                    <td class="td2" id="permisos-remunerables"></td>
                </tr-->
                <!-- Beneficios adicionales se agregarán aquí -->
                <tr>
                    <td>Salario+beneficios</td>
                    <td class="td2" id="salario-beneficios"></td>
                </tr>
            </table>

            <div class="d-flex justify-content-center">
                <h5>Descuentos</h5>
            </div>

            <table id="deductions-table" class="col-md-8" style="text-align: start;">
                <tr>
                    <td>ISSS</td>
                    <td class="td2" id="isss"></td>
                </tr>
                <tr>
                    <td>AFP</td>
                    <td class="td2" id="afp"></td>
                </tr>
                <tr>
                    <td>ISR</td>
                    <td class="td2" id="isr"></td>
                </tr>
                <!-- Deducciones adicionales se agregarán aquí -->
                <tr class="mb-3">
                    <td>Total descuentos</td>
                    <td class="td2" id="total-deducciones"></td>
                </tr>
            </table>

            <table class="col-md-8 mt-4" style="text-align: start;">
                <tr>
                    <th>Salario neto</th>
                    <th class="td2" id="salario-neto"></th>
                </tr>
            </table>
        </div>
    </div>

    <script>
        let jsonData = '<%= request.getAttribute("json") %>';
        jsonData=JSON.parse(jsonData)
        console.log(jsonData)

        if (jsonData.length > 0) {
            let data = jsonData[0];

            // Beneficios
            document.getElementById("nombreEmpresa").textContent=data["Empresa"];
            document.getElementById("nombreEmpleado").textContent="Empleado: "+data["Nombre"];
            document.getElementById("numeroDoc").textContent="Número de documento: "+data["Número de documento"];
            document.getElementById("rangoFechas").textContent="del: "+'<%= request.getAttribute("fecha1") %>'+" al: "+'<%= request.getAttribute("fecha2") %>'
            document.getElementById("salario-hora").textContent = data["Salario/hora"];
            document.getElementById("horas-normales").textContent = data["Horas normales"];
            document.getElementById("salario-base").textContent = data["Salario*horas normales"];
            document.getElementById("vacaciones").textContent = data["Vacaciones"];
            document.getElementById("horas-extra").textContent = data["Horas extra"];
            //document.getElementById("permisos-remunerables").textContent = data["Permisos remunerables"];

            let benefitsTable = document.getElementById("benefits-table");
            data["Beneficios"].forEach(beneficio => {
                let row = benefitsTable.insertRow(benefitsTable.rows.length - 1);
                row.insertCell(0).textContent = beneficio["nombre"];
                row.insertCell(1).textContent = beneficio["monto"];
                row.cells[1].classList.add("td2");
            });

            document.getElementById("salario-beneficios").textContent = data["Salario+beneficios"];

            // Deducciones
            document.getElementById("isss").textContent = data["ISSS"];
            document.getElementById("afp").textContent = data["AFP"];
            document.getElementById("isr").textContent = data["ISR"];

            let deductionsTable = document.getElementById("deductions-table");
            data["Deducciones"].forEach(deduccion => {
                if(!deduccion["nombre"].includes("ISSS")&&!deduccion["nombre"].includes("AFP")){
                    let row = deductionsTable.insertRow(deductionsTable.rows.length - 1);
                    row.insertCell(0).textContent = deduccion["nombre"];
                    row.insertCell(1).textContent = deduccion["monto"];
                    row.cells[1].classList.add("td2");
                }
            });

            document.getElementById("total-deducciones").textContent = data["Total deducciones"];
            document.getElementById("salario-neto").textContent = data["Salario neto"];
        }

        function imprimirBoleta() {
            const btnRegresar = document.querySelector('[data-ac="regresar"]'); btnRegresar.style.display = "none";
            const boletaPago = document.querySelector('#boletaDePago'); //boletaPago.style.marginTop = "-70px";
            window.print();
            btnRegresar.style.display = "block";  //boletaPago.style.marginTop = "0px";
        }
    </script>

    <%@ include file="../base/footer.jsp" %>
</body>

</html>
