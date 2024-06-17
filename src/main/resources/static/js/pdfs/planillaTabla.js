function planillaTablaPdf(datos, {
    titulo = 'Tabla exportada a PDF',
    colorCabecera = '#000',
    colorTextoCabecera = '#fff',
    colorBordes = '#eee'
}) {
    /////////////////////////////////////////////////////////////////////
    // Cabezera
    /////////////////////////////////////////////////////////////////////
    const documento = new window.jspdf.jsPDF({ format: 'letter' })
    documento.setFontSize(14)
    documento.setTextColor(colorCabecera)
    documento.addImage('../logo.jpg', 'JPEG', 10, 7, 20, 20)
    documento.text(titulo, 105, 13, { align: 'center' })
    documento.text('Fecha: ' + new Date().toLocaleDateString(), 162, 13)
    documento.setFontSize(10)
    /////////////////////////////////////////////////////////////////////
    // Dibujar la tabla
    /////////////////////////////////////////////////////////////////////
    // documento.line(10, 25, 200, 25) // el ancho de la hoja es de 210 mm, se deja margen de 10 mm en cada lado y el alto de la hoja es de 297 mm
    let y = 29 // alto inicial para la tabla
    datos.forEach((dato, i) => {
        if (y >= 207) {
            documento.addPage()
            y = 15
        }
        let alturaActual = tarjetaEmpleado(y, documento, dato, colorTextoCabecera, colorBordes, colorCabecera)
        y = alturaActual + 2
    })
    documento.save('Planilla.pdf')
}

function tarjetaEmpleado(y, documento, datos, colorTextoCabecera, colorBordes, colorCabecera) {
    let anchoNDocumento = 30, anchoNombre = 100, anchoCargo = 30, anchoSalario = 30
    documento.setTextColor(colorTextoCabecera); documento.setFillColor(colorCabecera)
    documento.setDrawColor(colorBordes) // definimos el color de la linea
    documento.rect(10, y, 190, 10, 'F') // dibujar la cabecera
    documento.line(10, y, 200, y) // dibujar la linea superior
    documento.line(10, y + 10, 200, y + 10) // dibujar la linea inferior
    documento.line(10 + anchoNDocumento, y, 10 + anchoNDocumento, y + 10) // dibujar la linea entre N. de documento y Nombre
    documento.line(10 + anchoNDocumento + anchoNombre, y, 10 + anchoNDocumento + anchoNombre, y + 10) // dibujar la linea entre Nombre y Cargo
    documento.line(10 + anchoNDocumento + anchoNombre + anchoCargo, y, 10 + anchoNDocumento + anchoNombre + anchoCargo, y + 10) // dibujar la linea entre Cargo y Salario/hora
    documento.text('N. de documento', 12, y + 6)
    documento.text('Nombre', 10 + anchoNDocumento + 2, y + 6)
    documento.text('Cargo', 10 + anchoNDocumento + anchoNombre + 2, y + 6)
    documento.text('Salario/hora', 10 + anchoNDocumento + anchoNombre + anchoCargo + 2, y + 6)
    //////////////////////////////////////////////////////////////////
    documento.rect(10, y + 10, anchoNDocumento, 70) // dibujar la celda del N. de documento
    documento.rect(10 + anchoNDocumento, y + 10, anchoNombre, 20) // dibujar la celda del Nombre
    documento.rect(10 + anchoNDocumento + anchoNombre, y + 10, anchoCargo, 20) // dibujar la celda del Cargo
    documento.rect(10 + anchoNDocumento + anchoNombre + anchoCargo, y + 10, anchoSalario, 20) // dibujar la celda del Salario/hora
    documento.setTextColor(colorCabecera)
    documento.text(datos['Número de documento'], 24, y + 45)
    documento.text(datos.Nombre, 10 + anchoNDocumento + 2, y + 16)
    documento.text(datos.Cargo, 10 + anchoNDocumento + anchoNombre + 2, y + 16)
    documento.text(datos['Salario/hora'], 10 + anchoNDocumento + anchoNombre + anchoCargo + 2, y + 16)
    //////////////////////////////////////////////////////////////////
    y += 20
    //////////////////////////////////////////////////////////////////
    documento.setTextColor(colorTextoCabecera); let anchoColumasAhora = 53.33
    documento.rect(10 + anchoNDocumento, y, 190 - anchoNDocumento, 10, 'F') // dibujar la cabecera
    documento.line(10 + anchoNDocumento, y, 200, y) // dibujar la linea superior
    documento.line(10 + anchoNDocumento, y + 10, 200, y + 10) // dibujar la linea inferior
    documento.line(10 + anchoNDocumento + anchoColumasAhora, y, 10 + anchoNDocumento + anchoColumasAhora, y + 10) // dibujar la linea entre nombre y cargo
    documento.line(10 + anchoNDocumento + anchoColumasAhora * 2, y, 10 + anchoNDocumento + anchoColumasAhora * 2, y + 10) // dibujar la linea entre cargo y salario
    documento.text('Horas normales', 10 + anchoNDocumento + 2, y + 6)
    documento.text('Salario*horas normales', 10 + anchoNDocumento + anchoColumasAhora + 2, y + 6)
    documento.text('Vacaciones', 10 + anchoNDocumento + anchoColumasAhora * 2 + 2, y + 6)
    //////////////////////////////////////////////////////////////////
    documento.rect(10 + anchoNDocumento, y + 10, anchoColumasAhora, 10) // dibujar la celda de Horas normales
    documento.rect(10 + anchoNDocumento + anchoColumasAhora, y + 10, anchoColumasAhora, 10) // dibujar la celda de Salario*horas normales
    documento.rect(10 + anchoNDocumento + anchoColumasAhora * 2, y + 10, anchoColumasAhora, 10) // dibujar la celda de Vacaciones
    documento.setTextColor(colorCabecera)
    documento.text(datos['Horas normales'].toString(), 10 + anchoNDocumento + 2, y + 16)
    documento.text(datos['Salario*horas normales'], 10 + anchoNDocumento + anchoColumasAhora + 2, y + 16)
    documento.text(datos.Vacaciones, 10 + anchoNDocumento + anchoColumasAhora * 2 + 2, y + 16)
    //////////////////////////////////////////////////////////////////
    y += 20
    //////////////////////////////////////////////////////////////////
    documento.setTextColor(colorTextoCabecera)
    documento.rect(10 + anchoNDocumento, y, 190 - anchoNDocumento, 10, 'F') // dibujar la cabecera
    documento.line(10 + anchoNDocumento, y, 200, y) // dibujar la linea superior
    documento.line(10 + anchoNDocumento, y + 10, 200, y + 10) // dibujar la linea inferior
    documento.line(10 + anchoNDocumento + anchoColumasAhora, y, 10 + anchoNDocumento + anchoColumasAhora, y + 10) // dibujar la linea entre horas extra y permisos remunerables
    documento.line(10 + anchoNDocumento + anchoColumasAhora * 2, y, 10 + anchoNDocumento + anchoColumasAhora * 2, y + 10) // dibujar la linea entre permisos remunerables y otros beneficios
    documento.text('Horas extra', 10 + anchoNDocumento + 2, y + 6)
    documento.text('Permisos remunerables', 10 + anchoNDocumento + anchoColumasAhora + 2, y + 6)
    documento.text('Otros beneficios', 10 + anchoNDocumento + anchoColumasAhora * 2 + 2, y + 6)
    //////////////////////////////////////////////////////////////////
    documento.rect(10 + anchoNDocumento, y + 10, anchoColumasAhora, 10) // dibujar la celda de Horas extra
    documento.rect(10 + anchoNDocumento + anchoColumasAhora, y + 10, anchoColumasAhora, 10) // dibujar la celda de Permisos remunerables
    documento.rect(10 + anchoNDocumento + anchoColumasAhora * 2, y + 10, anchoColumasAhora, 10) // dibujar la celda de Otros beneficios
    documento.setTextColor(colorCabecera)
    documento.text(datos['Horas extra'], 10 + anchoNDocumento + 2, y + 16)
    documento.text(datos['Permisos remunerables'], 10 + anchoNDocumento + anchoColumasAhora + 2, y + 16)
    documento.text(datos['Otros beneficios'], 10 + anchoNDocumento + anchoColumasAhora * 2 + 2, y + 16)
    //////////////////////////////////////////////////////////////////
    y += 20
    //////////////////////////////////////////////////////////////////
    documento.setTextColor(colorTextoCabecera); anchoColumasAhora = 40
    documento.rect(10 + anchoNDocumento, y, 190 - anchoNDocumento, 10, 'F') // dibujar la cabecera
    documento.line(10 + anchoNDocumento, y, 200, y) // dibujar la linea superior
    documento.line(10 + anchoNDocumento, y + 10, 200, y + 10) // dibujar la linea inferior
    documento.line(10 + anchoNDocumento + anchoColumasAhora, y, 10 + anchoNDocumento + anchoColumasAhora, y + 10) // dibujar la linea entre salario+beneficios y ISSS
    documento.line(10 + anchoNDocumento + anchoColumasAhora * 2, y, 10 + anchoNDocumento + anchoColumasAhora * 2, y + 10) // dibujar la linea entre iss y afp
    documento.line(10 + anchoNDocumento + anchoColumasAhora * 3, y, 10 + anchoNDocumento + anchoColumasAhora * 3, y + 10) // dibujar la linea entre afp y isr
    documento.text('Salario+beneficios', 10 + anchoNDocumento + 2, y + 6)
    documento.text('ISSS', 10 + anchoNDocumento + anchoColumasAhora + 2, y + 6)
    documento.text('AFP', 10 + anchoNDocumento + anchoColumasAhora * 2 + 2, y + 6)
    documento.text('ISR', 10 + anchoNDocumento + anchoColumasAhora * 3 + 2, y + 6)
    //////////////////////////////////////////////////////////////////
    documento.rect(10 + anchoNDocumento, y + 10, anchoColumasAhora, 10) // dibujar la celda de Salario+beneficios
    documento.rect(10 + anchoNDocumento + anchoColumasAhora, y + 10, anchoColumasAhora, 10) // dibujar la celda de ISSS
    documento.rect(10 + anchoNDocumento + anchoColumasAhora * 2, y + 10, anchoColumasAhora, 10) // dibujar la celda de AFP
    documento.rect(10 + anchoNDocumento + anchoColumasAhora * 3, y + 10, anchoColumasAhora, 10) // dibujar la celda de ISR
    documento.setTextColor(colorCabecera)
    documento.text(datos['Salario+beneficios'], 10 + anchoNDocumento + 2, y + 16)
    documento.text(datos.ISSS, 10 + anchoNDocumento + anchoColumasAhora + 2, y + 16)
    documento.text(datos.AFP, 10 + anchoNDocumento + anchoColumasAhora * 2 + 2, y + 16)
    documento.text(datos.ISR, 10 + anchoNDocumento + anchoColumasAhora * 3 + 2, y + 16)
    //////////////////////////////////////////////////////////////////

    return y + 20
}