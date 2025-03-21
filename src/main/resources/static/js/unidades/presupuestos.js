const manejarTabla = new ManejoTabla({ 
    datos: JSON.parse(datos).map(dato => {
        return {
            ...dato,
            Monto: '$' + dato.Monto.toFixed(2).replace(/\d(?=(\d{3})+\.)/g, '$&,'),
        }
    }),
    idContenedorTabla: 'contenedorTabla',
    acciones: true,
    html: `
        <td>
            <button onclick="editarPresupuesto([[id]])" ${permisoEditar !== 'true' ? 'hidden' : ''}>
                <svg  xmlns="http://www.w3.org/2000/svg"  width="24"  height="24"  viewBox="0 0 24 24"  fill="none"  stroke="currentColor"  stroke-width="2"  stroke-linecap="round"  stroke-linejoin="round"  class="icon icon-tabler icons-tabler-outline icon-tabler-pencil"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M4 20h4l10.5 -10.5a2.828 2.828 0 1 0 -4 -4l-10.5 10.5v4" /><path d="M13.5 6.5l4 4" /></svg>
                Editar
            </button>
        </td>
    `,
    ocultarCampos: ['id'],
    ordenColumnas: ['id', 'Año', 'Monto','Monto-Salarios'],
    tituloColAcciones: ['Acciones'],
    pdf: true,
    funcionPdf: presupuestosTablaPdf,
    parametrosPdf: ['contenedorTabla', { titulo : [nombreEmpresa, 'Presupuestos de la Unidad: ' + document.getElementById('nombreUnidadViendo').innerText, ''] }]
});


function editarPresupuesto(id) {
    window.location.href = `/unidad/presupuestos/editar?id=${id}`;
}
