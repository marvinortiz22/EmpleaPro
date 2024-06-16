const manejarTabla = new ManejoTabla({
    datos: datos,
    idContenedorTabla: 'contenedorTabla',
    acciones: false,
    ocultarCampos: [],
    ordenColumnas: ['Número de documento', 'Nombre', 'Cargo', 'Salario / hora', 'Horas normales', 'Salario base', 'Vacaciones', 'Horas extra', 'Permisos remunerables', 'Otros beneficios', 'Salario + beneficios', 'ISSS', 'AFP', 'ISR', 'Otras deducciones', 'Total deducciones', 'Salario neto'],
    tituloColAcciones: ['Presupuesto', 'Acciones'],
    pdf: true,
    funcionPdf: planillaTablaPdf,
    parametrosPdf: [JSON.parse(datos), { titulo: [nombreEmpresa, 'Planilla desde ' + fechaI + ' hasta ' + fechaF, ''] }],
});


function editarUnidad(id) {
    window.location.href = `/unidad/editar?id=${id}`;
}

function irPresupuestos(id) {
    window.location.href = `/unidad/presupuestos?id=${id}`;
}
