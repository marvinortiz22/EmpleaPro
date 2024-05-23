document.getElementById("nuevaUnidadform").addEventListener("submit", (e) => {
    e.preventDefault();
    const datos = Object.fromEntries(new FormData(e.target));
    console.log(datos);
    fetch("/unidad/agregar", {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify({
            tipoUnidad: datos.tipo,
            nombreUnidad: datos.nombre,
            estado: datos.estado
        })
    }).then((response) => {
        if (response.ok) {
            return response.json();
        }
        return Promise.reject(response);
    }).then((data) => {
        console.log(data);
    }).catch((error) => {
        console.error("Error al agregar la unidad", error);
    })
})