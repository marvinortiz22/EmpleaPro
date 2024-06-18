<%@ include file="../base/head.jsp" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<title>Planilla</title>
<style>
    #nombre{
             white-space: nowrap; 
            }
    th{
        vertical-align: middle;
    }
    @media print {
            @page {
                size: landscape;
            }
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
        }
</style>
<%@ include file="../base/navbar.jsp" %>

<div class="container-fluid px-4">
    <div class="container-fluid d-flex justify-content-between my-4" id="encabezado">
        <div><img src="${pageContext.request.contextPath}/logo.jpg" alt=""> </div>
        <div class="text-center">
            <h5>Planilla salarial de ${nombreEmpresa} correspondiente al período</h5>
            <h5>del ${fecha1} al ${fecha2}</h5>
        </div>
        <div class="align-items-center">${usuarioPermisos.fecha} </div>
    </div>
    <div class="d-flex justify-content-end mb-4">
        <button title="Imprimir" class="btn btn-success me-1" onclick="window.print()">
            <i class="fa-solid fa-print"></i>
        </button>
    </div>

    <div class="car mb-4">
        <div class="card-bod">
            <table id="datatablesSimpl" class="table">
                <thead>
                        <th>N de documento</th>
                        <th id="nombre">Nombre</th>
                        <th>Cargo</th>
                        <th>Sueldo bruto</th>
                        <th>Faltas</th>
                        <th>Salario</th>
                        <th>Vacaciones</th>
                        <th>Horas extra</th>
                        
                        <th>Otros beneficios</th>
                        <th>Salario + beneficios</th>
                        <th>ISSS</th>
                        <th>AFP</th>
                        <th>ISR</th>
                        <th>Otros descuentos</th>
                        <th>Total descuentos</th>
                        <th>Salario neto</th>
                </thead>
                <tbody id="tableBody">
                    <!-- Aquí se llenará la tabla con JavaScript -->
                </tbody>
            </table>
        </div>
    </div>
</div>
<%@ include file="../base/footer.jsp" %>
<script>
    function llenarTabla(){
        // Recuperar el JSON desde el atributo data
    let unidades = '<%= request.getAttribute("unidades") %>';
    const tableBody = document.querySelector('#tableBody'); // Asegúrate de que tableBody esté correctamente seleccionado
    unidades = JSON.parse(unidades);

    // Iterar sobre cada unidad y agregar una fila a la tabla
    unidades.forEach(unidad => {

    const row = document.createElement('tr');

    // Crear celdas para cada propiedad y verificar sus valores
    const propiedades = [
        'Número de documento',
        'Nombre',
        'Cargo',
        'Salario / hora',
        'Horas normales',
        'Salario base',
        'Vacaciones',
        'Horas extra',
        
        'Otros beneficios',
        'Salario + beneficios',
        'ISSS',
        'AFP',
        'ISR',
        'Otras deducciones',
        'Total deducciones',
        'Salario neto'
    ];

    propiedades.forEach(prop => {
        const cell = document.createElement('td');
        if(prop=="Nombre")
            cell.style.whiteSpace="nowrap"
        const valor = unidad[prop] !== undefined ? unidad[prop] : 'N/A'; // Verificar si la propiedad existe
        cell.textContent = valor;
        row.appendChild(cell);
    });

    tableBody.appendChild(row);
});
    }
    llenarTabla()
   


    // Inicializar DataTables
    const datatablesSimple = document.getElementById('datatablesSimple');
    if (datatablesSimple) {
        let dataTable = new simpleDatatables.DataTable(datatablesSimple, {
            perPage: 15,
            labels: {
                placeholder: "Buscar...",
                searchTitle: "Buscar en la tabla",
                pageTitle: "Página {page}",
                perPage: "Filas por página",
                noRows: "No hay datos",
                info: "Mostrando {start} a {end} de {rows} entradas",
                noResults: "No se encontraron filas coincidentes",
            }
        });
    }
</script>
