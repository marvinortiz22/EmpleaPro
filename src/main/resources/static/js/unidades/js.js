const manejarTabla = new ManejoTabla({ 
    datosString: datos, 
    idContenedorTabla: 'contenedorTabla', 
    paginacion: 2,
    
    acciones: (permisoEditar !== 'true' && permisoEliminar !== 'true') ? false : true,
    html: `
        <button class="btnEditar" onclick="editarUnidad([[id]])" ${permisoEditar !== 'true' ? 'hidden' : ''}>
            Editar
        </button>
        <button class="btnEliminar" onclick="desactivarUnidad([[id]])" ${cambiarEstado !== 'true' ? 'hidden' : ''}>
            Desactivar
        </button>
    `
});


function editarUnidad(id) {
    console.log('Aca se editará luego', id);
}

function desactivarUnidad(id) {
    console.log('Aca se desactivará luego', id);
}
