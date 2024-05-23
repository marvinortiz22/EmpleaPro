const manejarTabla = new ManejoTabla({ 
    datos: datos, 
    idContenedorTabla: 'contenedorTabla',
    acciones: (permisoEditar !== 'true' && cambiarEstado !== 'true') ? false : true,
    html: `
        <td>
            [[Presupuesto]]
            ${verPresupuestos === 'true' ? `
                <hr style="margin: 0.5em 0;">
                <button onclick="irPresupuestos([[id]])">
                    <svg  xmlns="http://www.w3.org/2000/svg"  width="24"  height="24"  viewBox="0 0 24 24"  fill="none"  stroke="currentColor"  stroke-width="2"  stroke-linecap="round"  stroke-linejoin="round"  class="icon icon-tabler icons-tabler-outline icon-tabler-report-money"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M9 5h-2a2 2 0 0 0 -2 2v12a2 2 0 0 0 2 2h10a2 2 0 0 0 2 -2v-12a2 2 0 0 0 -2 -2h-2" /><path d="M9 3m0 2a2 2 0 0 1 2 -2h2a2 2 0 0 1 2 2v0a2 2 0 0 1 -2 2h-2a2 2 0 0 1 -2 -2z" /><path d="M14 11h-2.5a1.5 1.5 0 0 0 0 3h1a1.5 1.5 0 0 1 0 3h-2.5" /><path d="M12 17v1m0 -8v1" /></svg>
                    Ver Presupuestos
                </button>
            ` : ''}
        </td>
        <td>
            <button onclick="editarUnidad([[id]])" ${permisoEditar !== 'true' ? 'hidden' : ''}>
                <svg  xmlns="http://www.w3.org/2000/svg"  width="24"  height="24"  viewBox="0 0 24 24"  fill="none"  stroke="currentColor"  stroke-width="2"  stroke-linecap="round"  stroke-linejoin="round"  class="icon icon-tabler icons-tabler-outline icon-tabler-pencil"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M4 20h4l10.5 -10.5a2.828 2.828 0 1 0 -4 -4l-10.5 10.5v4" /><path d="M13.5 6.5l4 4" /></svg>
                Editar
            </button>
        </td>
    `,
    ocultarCampos: ['id', 'Presupuesto'],
    ordenColumnas: ['id', 'Presupuesto', 'Nombre', 'Tipo Unidad', 'Unidad Padre', 'Estado'],
    tituloColAcciones: ['Presupuesto', 'Acciones']
});


function editarUnidad(id) {
    window.location.href = `/unidad/editar?id=${id}`;
}

function irPresupuestos(id) {
    window.location.href = `/unidad/presupuestos?id=${id}`;
}
