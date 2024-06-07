window.addEventListener('DOMContentLoaded', event => {
    // Simple-DataTables
    // https://github.com/fiduswriter/Simple-DataTables/wiki

    const datatablesSimple = document.getElementById('datatablesSimple');
    if (datatablesSimple) {
        new simpleDatatables.DataTable(datatablesSimple, {
                        perPage:5,
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
    }

});
