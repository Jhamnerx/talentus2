/*=============================================
CARGAR LA TABLA DINÁMICA DE COBROS
=============================================*/

$.ajax({

 url:"ajax/tablaCobros.ajax.php",
 success:function(respuesta){
    
   console.log("respuesta", respuesta);

 }

})

var tablaCobros = $(".tablaCobranzas").DataTable({
    "ajax": "ajax/tablaCobros.ajax.php",
    "deferRender": true,
    "retrieve": true,
    "processing": true,
    "language": {

        "sProcessing":     "Procesando...",
       "sLengthMenu":     "Mostrar _MENU_ registros",
       "sZeroRecords":    "No se encontraron resultados",
       "sEmptyTable":     "Ningún dato disponible en esta tabla",
       "sInfo":           "Mostrando registros del _START_ al _END_ de un total de _TOTAL_",
       "sInfoEmpty":      "Mostrando registros del 0 al 0 de un total de 0",
       "sInfoFiltered":   "(filtrado de un total de _MAX_ registros)",
       "sInfoPostFix":    "",
       "sSearch":         "Buscar:",
       "sUrl":            "",
       "sInfoThousands":  ",",
       "sLoadingRecords": "Cargando...",
       "oPaginate": {
           "sFirst":    "Primero",
           "sLast":     "Último",
           "sNext":     "Siguiente",
           "sPrevious": "Anterior"
       },
       "oAria": {
               "sSortAscending":  ": Activar para ordenar la columna de manera ascendente",
               "sSortDescending": ": Activar para ordenar la columna de manera descendente"
       }

    }


});

function autocompleteEmpresa(){

    var availableTags = $(".autocomplete").val();
    var names = availableTags.split(",");
    var obj = JSON.parse(availableTags);
    //console.log(names);

    var anames = $.map(obj, function (value, key) { return { value: value, data: key }; });

    //console.log(anames);
    // Setup jQuery ajax mock:
    // $.mockjax({
    //     url: '*',
    //     responseTime: 2000,
    //     response: function (settings) {
    //         var query = settings.data.query,
    //             queryLowerCase = query.toLowerCase(),
    //             re = new RegExp('\\b' + $.Autocomplete.utils.escapeRegExChars(queryLowerCase), 'gi'),
    //             suggestions = $.grep(anames, function (country) {
    //                  // return country.value.toLowerCase().indexOf(queryLowerCase) === 0;
    //                 return re.test(country.value);
    //             }),
    //             response = {
    //                 query: query,
    //                 suggestions: suggestions
    //             };

    //         this.responseText = JSON.stringify(response);
    //     }
    // });

    // Initialize ajax autocomplete:
    $('#autocomplete-ajax').devbridgeAutocomplete({
        // serviceUrl: '/autosuggest/service/url',
        lookup: anames,
        lookupFilter: function(suggestion, originalQuery, queryLowerCase) {
            var re = new RegExp('\\b' + $.Autocomplete.utils.escapeRegExChars(queryLowerCase), 'gi');
            return re.test(suggestion.value);
        },
        onSelect: function(suggestion) {
            $('#selction-ajax').html('You selected: ' + suggestion.value + ', ' + suggestion.data);
            $(".nameEmpresa").val(suggestion.data);

        },
        onHint: function (hint) {
            $('#autocomplete-ajax-x').val(hint);
        },
        onInvalidateSelection: function() {
            $('#selction-ajax').html('You selected: none');
        }
    });
    // Initialize ajax autocomplete:
    $('#autocomplete-ajax-linea').devbridgeAutocomplete({
        // serviceUrl: '/autosuggest/service/url',
        lookup: anames,
        lookupFilter: function(suggestion, originalQuery, queryLowerCase) {
            var re = new RegExp('\\b' + $.Autocomplete.utils.escapeRegExChars(queryLowerCase), 'gi');
            return re.test(suggestion.value);
        },
        onSelect: function(suggestion) {
            $('#selction-ajax').html('You selected: ' + suggestion.value + ', ' + suggestion.data);
            $(".nameEmpresa").val(suggestion.data);

        },
        onHint: function (hint) {
            $('#autocomplete-ajax-x').val(hint);
        },
        onInvalidateSelection: function() {
            $('#selction-ajax').html('You selected: none');
        }
    });
}

$(".btnAgregarCobro").on("click", function(){

 autocompleteEmpresa();
});


/*=============================================
EDITAR REGISTRO
=============================================*/
  
$(".tablaCobranzas tbody").on("click", ".btnEditarCobro", function(){

  var idCobro = $(this).attr("idCobro");

  //console.log(idCobro);

  var datos = new FormData();
  datos.append("idCobro", idCobro);


  $.ajax({
    url: "ajax/cobros.ajax.php",
    method: "POST",
    data: datos,
    cache: false,
    contentType: false,
    processData: false,
    dataType: "json",
    success: function(cobros){
      //console.log(cobros["id"]);
      $("#modalEditarCobro .idEditarCobro").val(cobros["id"]);
      //$("#modalEditarCobro .editarEmpresa").val(cobros["empresa"]);
      var idPersona = cobros["empresa"];

      var datosPer = new FormData();
      datosPer.append("idPersona", idPersona);

      $.ajax({

        url:"ajax/persona.ajax.php",
        method: "POST",
        data: datosPer,
        cache: false,
        contentType: false,
        processData: false,
        dataType: "json",
        success: function(respuesta){
         // console.log(respuesta);


          $("#modalEditarCobro .editarEmpresa").val(respuesta["nombre"]);
          $("#modalEditarCobro .editarIdEmpresa").val(respuesta["id"]);


        }

      })



      $("#modalEditarCobro .editarFecha").val(cobros["fechaVen"]);
      $("#modalEditarCobro .editarPeriodo").val(cobros["periodo"]);
      $("#modalEditarCobro .editarMonto").val(cobros["montoxunidad"]);
      $("#modalEditarCobro .editarCantidadunidad").val(cobros["cantidadUnidades"]);
      $("#modalEditarCobro .editarCiudad").val(cobros["ciudad"]);
      $("#modalEditarCobro .editarTipoPago").val(cobros["tipoPago"]);
      $("#modalEditarCobro .editarObservacion").val(cobros["observacion"]);


    }


  })


})


/*=============================================
MARCAR COMO PAGADO
=============================================*/
  
$(".tablaCobranzas tbody").on("click", ".btnPagarCobro", function(){

  var idCobro = $(this).attr("idCobro");

  //console.log(idCobro);

  var datos = new FormData();
  datos.append("idCobro", idCobro);


  $.ajax({
    url: "ajax/cobros.ajax.php",
    method: "POST",
    data: datos,
    cache: false,
    contentType: false,
    processData: false,
    dataType: "json",
    success: function(respuesta){
     // console.log(respuesta);
       //$("#modalPagar .PagarEmpresa").val(respuesta["empresa"]);
      var idPersona = respuesta["empresa"];

      var datosPer = new FormData();
      datosPer.append("idPersona", idPersona);

      $.ajax({

        url:"ajax/persona.ajax.php",
        method: "POST",
        data: datosPer,
        cache: false,
        contentType: false,
        processData: false,
        dataType: "json",
        success: function(cliente){
          //console.log(cliente);


          $("#modalPagar .PagarEmpresa").val(cliente["nombre"]);


        }

      })


       $("#modalPagar .pagarIdCobro").val(respuesta["id"]);
       $("#modalPagar .pagarFecha").val(respuesta["fechaVen"]);
       $("#modalPagar .pagarMonto").val(respuesta["montoxunidad"]);
       $("#modalPagar .pagarCantidadunidad").val(respuesta["cantidadUnidades"]);
       $("#modalPagar .cantidadPago").val((respuesta["montoxunidad"]*respuesta["cantidadUnidades"]));
       $("#modalPagar .totalPagar").html('<b>TOTAL: </b>'+(respuesta["montoxunidad"]*respuesta["cantidadUnidades"]));




    }


  })


})


/*=============================================
VER INFO REGISTRO
=============================================*/
  
$(".tablaCobranzas tbody").on("click", ".btnVerCobro ", function(){
  $(".tablaRegistro .listaRegistro").html('');

  var idcobro = $(this).attr("idcobro");

  //console.log(idcobro);

  var datos = new FormData();
  datos.append("idCobro", idcobro);


  $.ajax({
    url: "ajax/cobros.ajax.php",
    method: "POST",
    data: datos,
    cache: false,
    contentType: false,
    processData: false,
    dataType: "json",
    success: function(respuesta){

      //$("#modalVerInfoCobro .empresa").html(respuesta["empresa"]);

      var idPersona =respuesta["empresa"];

      var datosPer = new FormData();
      datosPer.append("idPersona", idPersona);

      $.ajax({

        url:"ajax/persona.ajax.php",
        method: "POST",
        data: datosPer,
        cache: false,
        contentType: false,
        processData: false,
        dataType: "json",
        success: function(respuesta){


          $("#modalVerInfoCobro .empresa").html(respuesta["nombre"]);


        }

      })

      $("#modalVerInfoCobro .fechavencimiento").html(respuesta["fechaVen"]);
      $("#modalVerInfoCobro .periodo").html(respuesta["periodo"]);
      $("#modalVerInfoCobro .montoxunidad").html(respuesta["montoxunidad"]);
      $("#modalVerInfoCobro .cantunidades").html(respuesta["cantidadUnidades"]);
      $("#modalVerInfoCobro .ciudad").html(respuesta["ciudad"]);
      $("#modalVerInfoCobro .tipopago").html(respuesta["tipoPago"]);
      $("#modalVerInfoCobro .observacion").html(respuesta["observacion"]);

      var idCiudad =respuesta["ciudad"];

      var datos = new FormData();
      datos.append("idCiudad", idCiudad);

      $.ajax({

        url:"ajax/ciudad.ajax.php",
        method: "POST",
        data: datos,
        cache: false,
        contentType: false,
        processData: false,
        dataType: "json",
        success: function(respuesta){


          $("#modalVerInfoCobro .ciudad").html(respuesta["nombre"]);


        }

      })




      var datosR = new FormData();
      datosR.append("idCobroRegistro", idcobro);
      $.ajax({

        url:"ajax/cobros.ajax.php",
        method: "POST",
        data: datosR,
        cache: false,
        contentType: false,
        processData: false,
        dataType: "json",
        success: function(registro){
          //console.log(registro);

          if (registro.length > 0) {
            function ArrayRegistroCobro(element, index, array) {

              //console.log("hay");
              var options = {weekday: "long", year: "numeric", month: "long", day: "numeric"};
              var fechaN = new Date(element.fecha)
              var fechaFormat = fechaN.toLocaleDateString("es-ES", options);

              $(".tablaRegistro .listaRegistro").append('<tr class="row100"><td class="column100 column1" data-column="column1">'+(index+1)+'</td>'+
                                                  '<td class="column100 column2" data-column="column2">'+element.tipo_pago+'</td>'+
                                                  '<td class="column100 column2" data-column="column3">S/ '+element.cantidad+'</td>'+
                                                  '<td class="column100 column3" data-column="column4">'+fechaFormat+'</td>'+
                                              '</tr>');




              }

            registro.forEach(ArrayRegistroCobro);





          }else{
            $(".tablaRegistro .listaRegistro").append('<tr class="row100"><td class="column100 column1" data-column="column1"></td>'+
                                                  '<td class="column100 column2" colspan="4" data-column="column2">No existen Registros</td>'+
                                              '</tr>');

          }


        }

      })




    }


  })


})








    $(".table100").on("mouseover", "column100",function(){
    var table1 = $(this).parent().parent().parent();
    var table2 = $(this).parent().parent();
    var verTable = $(table1).data('vertable')+"";
    var column = $(this).data('column') + ""; 

    $(table2).find("."+column).addClass('hov-column-'+ verTable);
    $(table1).find(".row100.head ."+column).addClass('hov-column-head-'+ verTable);

  });

  $('.column100').on('mouseout',function(){
    var table1 = $(this).parent().parent().parent();
    var table2 = $(this).parent().parent();
    var verTable = $(table1).data('vertable')+"";
    var column = $(this).data('column') + ""; 

    $(table2).find("."+column).removeClass('hov-column-'+ verTable);
    $(table1).find(".row100.head ."+column).removeClass('hov-column-head-'+ verTable);
  });
    

$(".tablaCobranzas tbody").on("click", ".btnEliminarCobro", function(){

  var idCobro = $(this).attr("idCobro");
  var estadoCobro = 0;

  var datos = new FormData();
  datos.append("suspenderId", idCobro);
    datos.append("estadoCobro", estadoCobro);

    $.ajax({

       url:"ajax/cobros.ajax.php",
       method: "POST",
      data: datos,
      cache: false,
        contentType: false,
        processData: false,
        success: function(respuesta){ 

          tablaCobros.ajax.reload();


      iziToast.show({
              title: '<h4><label class="label-danger">SE HA MARCADO COMO SUSPENDIDO</label></h4>',
              message: '<br>Se suspendio el servicio',
              theme: 'light',
              layout: 2,
              displayMode: 2,
              progressBar: false,
              imageWidth: 325,
              timeout: 3000,
              transitionIn: 'bounceInLeft',
              onClosed: function () {
                //location.reload();
              }
      });

        }    

    });


})


$(".prima").on("mouseover", ".columnaPrima", function(){

 var valor = $(this).attr("class").split(" ");


    var mi_div = valor[1];
    indice;
    indice = mi_div.indexOf('val');
    mi_div = mi_div.substring(indice + 3);
    console.log(mi_div);


});



$(".tablaCobranzas tbody").on("click", ".btnEnviarMensaje", function(){

  var elemento = document.getElementById("whatsapp");
  while (elemento.firstChild) {
    elemento.removeChild(elemento.firstChild);
  }

  var numeroTelefono = $(this).attr("numeroCliente");
  var fechaCreacion = $(this).attr("fechaCobro");
  var fechaVencimiento = $(this).attr("fechaVencimiento");


  var fechaVe = new Date(fechaVencimiento);

  const fechaFormateada = formatearFecha(fechaVe);

  //console.log(fechaFormateada);



  var monto = $(this).attr("monto");
  var cliente = $(this).attr("cliente");



  //console.log(numeroTelefono);
  var oneNum = numeroTelefono.split(",");

    $(function () {
        $('#whatsapp').floatingWhatsApp({
            phone: '+51'+oneNum[0],
            popupMessage: 'Estimado Administrador escribe tu mensaje al Sr '+cliente,
            message: "Estimado cliente buenos días, esto es un recordatorio de su factura creada el "+fechaCreacion+" del servicio GPS y su vencimiento es el "+fechaFormateada+" monto S/ "+monto+" soles, método de pago: depósito bancario o transferencia.",
            showPopup: true,
            showOnIE: false,
            headerTitle: 'Bienvenido!',
            headerColor: '#075e54',
            backgroundColor: '#128C7E',
            buttonImage: '<img src="'+Ruta+'vistas/img/whatsapp.svg"/>'
        });
    });

})


const formatearFecha = fecha => {
    const mes = fecha.getMonth() + 1; // Ya que los meses los cuenta desde el 0
    const dia = fecha.getDate() +1;
    //return `${fecha.getFullYear()}-${(mes < 10 ? '0' : '').concat(mes)}-${(dia < 10 ? '0' : '').concat(dia)}`;
    return `${(dia < 10 ? '0' : '').concat(dia)}-${(mes < 10 ? '0' : '').concat(mes)}-${fecha.getFullYear()}`
};

