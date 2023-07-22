document.addEventListener("DOMContentLoaded", () => {
    // Escuchamos el click del botón
    const $boton = document.querySelector("#btnDescargar");
    const element = document.getElementById("#element");
    $boton.addEventListener("click", () => {
        html2pdf(element, {
            margin: 10,
            filename: 'myfile.pdf',
            image: {type: 'jpeg', quality: 0.98},
            html2canvas: {scale: 2, logging: true, dpi: 192, letterRendering: true},
            jsPDF: {unit: 'mm', format: 'a4', orientation: 'portrait'}
        });
    });
});


