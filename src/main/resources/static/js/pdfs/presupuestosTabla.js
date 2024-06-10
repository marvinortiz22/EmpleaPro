function presupuestosTablaPdf (idtabla, {
    titulo = 'Tabla exportada a PDF',
    colorCabecera = '#000',
    colorTextoCabecera = '#fff',
    colorBordes = '#eee',
    alternarColorFilas = false,
    ultimaColumna = false
}) {
    const tabla = document.getElementById(idtabla)
    if (!tabla) return console.error('No se encontró la tabla con el id:', idtabla)
    const titulosColumnas = Array.from(tabla.querySelectorAll('thead tr th')).map(th => th.innerText).slice(0, !ultimaColumna ? -1 : undefined)
    const filas = Array.from(tabla.querySelectorAll('tbody tr')).map(tr => 
        Array.from(tr.querySelectorAll('td')).map(td => td.innerText)
    ).map(fila => fila.slice(0, !ultimaColumna ? -1 : undefined))
    // console.log(titulosColumnas, filas)
    const documento = new window.jspdf.jsPDF({format: 'letter'})
    documento.setFontSize(14)
    documento.setTextColor(colorCabecera)
    documento.addImage('../logo.jpg', 'JPEG', 10, 10, 20, 20)
    documento.text(titulo, 105, 16, { align: 'center' })
    documento.text('Fecha: ' + new Date().toLocaleDateString(), 162, 16)
    documento.setFontSize(10)
    // documento.line(10, 25, 200, 25) // el ancho de la hoja es de 210 mm, se deja margen de 10 mm en cada lado
    const anchoColumna = (190 / titulosColumnas.length)
    const altoCelda = 10
    let y = 35 // alto inicial para la tabla
    documento.setTextColor(colorTextoCabecera); documento.setFillColor(colorCabecera)
    documento.rect(10, y, 190, altoCelda, 'F') // dibujar la cabecera
    documento.setDrawColor(colorBordes) // definimos el color de la linea
    titulosColumnas.forEach((titulo, i, arr) => {
        documento.text(titulo, i * anchoColumna + 12, y + 6)
        documento.line(i * anchoColumna + 10, y, i * anchoColumna + 10, y + altoCelda) // dibujar lineas verticales
        documento.line(i * anchoColumna + 10, y, i * anchoColumna + 10 + anchoColumna, y) // dibuja la linea superior
        documento.line(i * anchoColumna + 10, y + altoCelda, i * anchoColumna + 10 + anchoColumna, y + altoCelda) // dibuja la linea inferior
        if (arr.length - 1 === i) documento.line(i * anchoColumna + 10 + anchoColumna, y, i * anchoColumna + 10 + anchoColumna, y + altoCelda) // dibujar la ultima linea vertical
    })
    y += altoCelda
    documento.setTextColor(colorCabecera); documento.setFillColor(colorBordes)
    filas.forEach((fila, i) => {
        if (alternarColorFilas) {
            documento.setFillColor(i % 2 === 0 ? '#f9f9f9' : '#fff')
            documento.rect(10, y, 190, altoCelda, 'F')
        }
        let textoNoCabe = false
        fila.forEach((celda, j) => {
            if (y >= 260) {
                documento.addPage()
                y = 20
            }
            if (documento.getTextDimensions(celda).w > anchoColumna - 2) {
                textoNoCabe = true
            }
            documento.text(celda, j * anchoColumna + 12, (textoNoCabe ? y + 3 : y + 5), {maxWidth: anchoColumna - 2, align: 'left', baseline: 'middle'})
            documento.line(j * anchoColumna + 10, y, j * anchoColumna + 10, y + altoCelda) // dibujar lineas verticales
            if (j === fila.length - 1) documento.line(j * anchoColumna + 10 + anchoColumna, y, j * anchoColumna + 10 + anchoColumna, y + altoCelda) // dibujar la ultima linea vertical
            textoNoCabe = false
        })
        documento.line(10, y, 200, y) // dibujar la linea superior
        documento.line(10, y + altoCelda, 200, y + altoCelda) // dibujar la linea inferior
        y += altoCelda
    })
    documento.save('presupuestos.pdf')
}