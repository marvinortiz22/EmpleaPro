window.addEventListener('DOMContentLoaded', event => {
    // Simple-DataTables
    // https://github.com/fiduswriter/Simple-DataTables/wiki

    const datatablesSimple = document.getElementById('datatablesSimple');
    if (datatablesSimple) {
        new simpleDatatables.DataTable(datatablesSimple, {
            language: {
                "sEmptyTable":     "No hay datos disponibles en la tabla",
                "sInfo":           "Mostrando _START_ a _END_ de _TOTAL_ entradas",
                "sInfoEmpty":      "Mostrando 0 a 0 de 0 entradas",
                "sInfoFiltered":   "(filtrado de _MAX_ entradas totales)",
                "sInfoPostFix":    "",
                "sInfoThousands":  ",",
                "sLengthMenu":     "Mostrar _MENU_ entradas",
                "sLoadingRecords": "Cargando...",
                "sProcessing":     "Procesando...",
                "sSearch":         "Buscar:",
                "sZeroRecords":    "No se encontraron registros coincidentes",
                "oPaginate": {
                    "sFirst":    "Primero",
                    "sLast":     "Último",
                    "sNext":     "Siguiente",
                    "sPrevious": "Anterior"
                },
                "oAria": {
                    "sSortAscending":  ": activar para ordenar la columna ascendente",
                    "sSortDescending": ": activar para ordenar la columna descendente"
                },
                "select": {
                    "rows": {
                        "_": "Seleccionado %d filas",
                        "0": "Haga clic en una fila para seleccionar",
                        "1": "1 fila seleccionada"
                    }
                }
            }
        });
    }

});
