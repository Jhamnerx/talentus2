$(".notificacion").on("mouseover", function(){

	var idnoti = $(this).attr("notificacion")
	//console.log(idnoti);

})

var Ruta = $(".rutaOculta").val();

$(".btnEnviarMensaje").on("click", function(){

	var elemento = document.getElementById("whatsapp");
	while (elemento.firstChild) {
	  elemento.removeChild(elemento.firstChild);
	}

	var numeroTelefono = $(this).attr("numeroCliente");
	var fechaCreacion = $(this).attr("fechaCobro");
	var fechaVencimiento = $(this).attr("fechaVencimiento");
	var monto = $(this).attr("monto");
	var cliente = $(this).attr("cliente");



	console.log(numeroTelefono);
	var oneNum = numeroTelefono.split(",");

    $(function () {
        $('#whatsapp').floatingWhatsApp({
            phone: '+51'+oneNum[0],
            popupMessage: 'Estimado Administrador escribe tu mensaje al Sr '+cliente,
            message: "Estimado cliente buenos días, esto es un recordatorio de su factura creada el "+fechaCreacion+" del servicio GPS y su vencimiento es el "+fechaVencimiento+" monto S/ "+monto+" soles, método de pago: depósito bancario o transferencia.",
            showPopup: true,
            showOnIE: false,
            headerTitle: 'Bienvenido!',
            headerColor: '#075e54',
            backgroundColor: '#128C7E',
            buttonImage: '<img src="'+Ruta+'vistas/img/whatsapp.svg"/>'
        });
    });

})