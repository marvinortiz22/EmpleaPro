const manejarTabla = new ManejoTabla({ 
    datos: datos, 
    idContenedorTabla: 'contenedorTabla',
    acciones: (permisoEditar !== 'true' && permisoEliminar !== 'true') ? false : true,
    html: `
        <td>
            <button class="btnEditar" onclick="editarUnidad([[id]])" ${permisoEditar !== 'true' ? 'hidden' : ''}>
                Editar
            </button>
            <button class="btnEliminar" onclick="desactivarUnidad([[id]])" ${cambiarEstado !== 'true' ? 'hidden' : ''}>
                Desactivar
            </button>
        </td>
        <td>
            Hola mundo
        </td>
    `,
    ocultarCampos: ['id'],
    tituloColAcciones: ['Acciones', 'hola']
});


function editarUnidad(id) {
    console.log('Aca se editará luego', id);
}

function desactivarUnidad(id) {
    console.log('Aca se desactivará luego', id);
}
