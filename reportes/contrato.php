<?php 
setlocale(LC_ALL, "es_ES", 'Spanish_Spain', 'Spanish');
require_once "../controladores/contratos.controlador.php";
require_once "../controladores/persona.controlador.php";
require_once "../controladores/vehiculos.controlador.php";
require_once "../modelos/contratos.modelo.php";
require_once "../modelos/persona.modelo.php";
require_once "../modelos/vehiculos.modelo.php";


require_once "../modelos/plantilla.modelo.php";

if (isset($_SERVER["REQUEST_URI"])) {
	/**
	 * OBTENER ID CONTRATO
	 * DESDE URL
	 */
	$dir= $_SERVER["REQUEST_URI"];
	$url = explode("/", $dir);
	$html = "<!DOCTYPE html>
				<html>";
	/**
	 * CONSULTAR
	 * CONTRATO
	 */
	$item = "id";
	$valor = $url[4];
	$count = 1;

    $contrato = ControladorContratos::ctrMostrarContratos($item, $valor, 1);


    $detalle = ControladorContratos::ctrMostrarDetalleContratos("idcontrato", $contrato["id"], 0);

    //var_dump(count($detalle));

	$cliente = ControladorPersona::ctrMostrarPersona($item, $contrato["idcliente"], $count);




    $plantilla = ModeloPlantilla::mdlSeleccionarPlantilla("plantilla");


    $html.='
	<head>
		<title>Contrato N°'.$contrato["idcliente"].'</title>
		<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,300,700&subset=latin,latin-ext" rel="stylesheet" type="text/css">
		<!-- <link rel="stylesheet" href="sass/main.css" media="screen" charset="utf-8"/> -->
		<meta content="width=device-width, initial-scale=1.0" name="viewport">
		<meta http-equiv="content-type" content="text-html; charset=utf-8">
	  	<script src="../../vistas/bower_components/jquery/dist/jquery.min.js"></script>
		<script src="../kendo.all.min.js"></script>
	    <script>

	      function exportPDF() {
	        kendo.drawing.drawDOM(".contrato", {
	          forcePageBreak: ".new-page",
	          paperSize: "A4",
	          margin: {top: "0cm", bottom: "0cm", left: "0cm"},
	          scale: 0.75,
	          height: 500
	        }).then(function(group){
	          kendo.drawing.pdf.saveAs(group, "contrato_'.$contrato["id"].'-'.$contrato["idcliente"].'");
	        });
	      }
	      kendo.pdf.defineFont({
	        "DejaVu Sans"             : "https://kendo.cdn.telerik.com/2016.2.607/styles/fonts/DejaVu/DejaVuSans.ttf",
	        "DejaVu Sans|Bold"        : "https://kendo.cdn.telerik.com/2016.2.607/styles/fonts/DejaVu/DejaVuSans-Bold.ttf",
	        "DejaVu Sans|Bold|Italic" : "https://kendo.cdn.telerik.com/2016.2.607/styles/fonts/DejaVu/DejaVuSans-Oblique.ttf",
	        "DejaVu Sans|Italic"      : "https://kendo.cdn.telerik.com/2016.2.607/styles/fonts/DejaVu/DejaVuSans-Oblique.ttf",
	        "WebComponentsIcons"      : "https://kendo.cdn.telerik.com/2017.1.223/styles/fonts/glyphs/WebComponentsIcons.ttf"
	    });


		$( document ).ready(function() {
		 
		   console.log( "ready!" );
		   exportPDF();
		});
	    </script>
		<style type="text/css">

			.contrato{
			  font-size: 14px;
			  color: #000;
			}
			.page1{
			  background-repeat: no-repeat;
			  background-size: 100%;
			  width: 21cm;
			  height: 29.7cm;
			  position: relative;
			  left: 0px;
			  top: 0px;


			}
			.page2{
			  background-repeat: no-repeat;
			  background-size: 100%;
			  top: 10px;
			  width: 21cm;
			  height: 29.7cm;
			  position: relative;
			  left: 0px;
			  top: 0px;



			}
			.page3{
			  background-repeat: no-repeat;
			  background-size: 100%;
			  top: 10px;
			  width: 21cm;
			  height: 29.7cm;
			  position: relative;
			  left: 0px;
			  top: 0px;
			}

			.titulo{
			  position: absolute;
			  top: 150px;
			  left: 25%;
			  margin-right: 100px;
			  font-size: 16px;
			}
			.descripcion{
			  position: absolute;
			  top: 180px;
			  margin-left: 130px;
			  margin-right: 100px;

			}

			.primera_titulo{
			  position: absolute;
			  top: 295px;
			  margin-left: 130px;
			  margin-right: 100px;
			}

			.primera{
			  position: absolute;
			  top: 325px;
			  margin-left: 130px;
			  margin-right: 100px;
			}
			.segunda_titulo{
			  position: absolute;
			  top: 850px;
			  margin-left: 130px;
			  margin-right: 100px;
			}
			.segunda{
			  position: absolute;
			  top: 870px;
			  margin-left: 130px;
			  margin-right: 100px;
			}
			.tercera_titulo{
			  position: absolute;
			  top: 150px;
			  margin-left: 130px;
			  margin-right: 100px;
			}
			.tercera{
			  position: absolute;
			  top: 180px;
			  margin-left: 130px;
			  margin-right: 100px;
			}
			.cuarta_titulo{
			  position: absolute;
			  top: 280px;
			  margin-left: 130px;
			  margin-right: 100px;
			}
			.cuarta{
			  position: absolute;
			  top: 310px;
			  margin-left: 130px;
			  margin-right: 100px;}

			.quinta_titulo{
			  position: absolute;
			  top: 640px;
			  margin-left: 130px;
			  margin-right: 100px;
			}
			.quinta{
			  position: absolute;
			  top: 670px;
			  margin-left: 130px;
			  margin-right: 100px;
			}

			.sexta_titulo{
			  position: absolute;
			  top: 750px;
			  margin-left: 130px;
			  margin-right: 100px;
			}
			.sexta{
			  position: absolute;
			  top: 780px;
			  margin-left: 130px;
			  margin-right: 100px;
			}
			.septima_titulo{
			  position: absolute;
			  top: 150px;
			  margin-left: 130px;
			  margin-right: 100px;
			}
			.septima{
			  position: absolute;
			  top: 180px;
			  margin-left: 130px;
			  margin-right: 100px;
			}
			.octava_titulo{
			  position: absolute;
			  top: 420px;
			  margin-left: 130px;
			  margin-right: 100px;
			}
			.octava{
			  position: absolute;
			  top: 450px;
			  margin-left: 130px;
			  margin-right: 100px;
			}
			.fecha{
			  position: absolute;
			  top: 380px;
			  margin-left: 80px;
			  margin-right: 100px;
			}
			.cliente{
			  position: absolute;
			  top: 800px;
			  margin-left: 130px;
			  text-align: center;
			}
			.empresa{
			  position: absolute;
			  top: 800px;
			  right: 10px;
			  margin-left: 130px;
			  margin-right: 100px;
			  text-align: center;
			}

			.sello{
			  position: absolute;
			  top: 740px;
			  right: 65px;
			  margin-left: 90px;
			  margin-right: 80px;
			}

			*{
			    margin:0px;
			    padding:0px;
			    list-style: none;
			    text-decoration: none;
			    font-family: "Ubunt", sans-serif;
			}

			ul, ol{
			    padding:0px;
			}

			a:visited, a:link, a:focus, a:hover, a:active{
			    list-style: none;
			    text-decoration: none;
			}

			.barraSuperior{
			    background:#052c52;
			    opacity: 0.90;
			}

			.barraSuperior a{
			    color:white;
			}

			.backColor, .backColor a{
			    background:#47bac1;
			    color:white;
			}
			.fondoBreadcrumb{
			    margin-bottom:0px;
			    background: rgba(0,0,0,0);
			}

			/*=============================================
			TOP
			=============================================*/

			#top ul{
			    padding-top:8px;
			}

			#top ul li{
			    display:inline;
			    line-height:30px;
			    margin:0px 5px;
			    color:white;
			}

			.social ul li a i{
			    font-size:18px;
			    margin:0 1px;
			}

			/*=============================================
			REDES SOCIALES
			=============================================*/

			.redSocial{
			    width:30px;
			    height:30px;
			    text-align: center;
			    line-height:30px;
			}

			/*FACEBOOK*/

			.facebookBlanco{
			    color:white;
			}

			.facebookNegro{
			    color:black;
			}

			.facebookColor{
			    color:white;
			    background:#46639f;
			}

			/*YOUTUBE*/

			.youtubeColor{
			    color:white;
			    background:#d6513e;
			}

			.youtubeBlanco{
			    color:white;
			}

			.youtubeNegro{
			    color:black;
			}

			/*TWITTER*/

			.twitterColor{
			    color:white;
			    background:#0ab2e6;
			}

			.twitterBlanco{
			    color:white;
			}

			.twitterNegro{
			    color:black;
			}

			/*GOOGLE PLUS*/

			.googleColor{
			    color:white;
			    background:#d71617;
			}

			.googleBlanco{
			    color:white;
			}

			.googleNegro{
			    color:black;
			}

			/*INSTAGRAM*/

			.instagramColor{
			    color:white;
			    background:linear-gradient(45deg, #fca925, #ee1d5f,  #6350a2);

			}

			.instagramBlanco{
			    color:white;
			}

			.instagramNegro{
			    color:black;
			}

			.pdf{
			    position: relative;
			    top:10px;

			    left: 1000px;}
			.fecha{
			    position:absolute;
			    top:680px;
			    left:100px;
			    font-family:Arial, Helvetica, sans-serif;
			    font-size:16px;
			    }
			.button{

			    border: 1px solid #fff;
			    padding: 15px;
			    text-align: center;
			    text-decoration: none;
			    display: inline-block;
			    font-size: 13px;
			    margin: 4px 2px;
			    cursor: pointer;
			}
			.titulo_options{
			    font-size: 16px;
			    color: #000;


			}
		</style>
	</head>
	';




  $empresa = json_decode($plantilla["empresa"], true);
  $nombre = $empresa[0]["nombre"];

  $ruc = $empresa[0]["ruc"];
  $direccion = $empresa[0]["direccion"];
  $telefono = $empresa[0]["telefono"];
  $email = $empresa[0]["correo"];
  $cuenta = $empresa[0]["cuenta"];

  if ($contrato["fondo"] == 1) {

    $fondo = $plantilla["fondoContrato"];
  }else{

    $fondo = "";
  }

	if ($cliente["tipo_documento"] == "RUC"){

	    $tipo_cliente="La Empresa";

	}else{

	    $tipo_cliente="el/la Sr/Sra";
	}

	if($contrato["sello"] == 1) {

	    $sello = '<div class="sello">
	        	<img src="../../'.$plantilla["fondoFirma"].'" width="150px">
	        </div>"';

	}else{

		$sello = '<div class="sello"></>';
	}

	$fecha = '<p> '.$contrato["ciudad"].', '.iconv('ISO-8859-2', 'UTF-8', strftime("%d de %B de %Y", strtotime($contrato["fecha"]))).'</p>';

    if ($cliente["apellido"] == "null") {
        $nombre_cliente = $cliente["nombre"];

    }else{

        $nombre_cliente = $cliente["nombre"]. " ".$cliente["apellido"];
    }

  $html.='
	<body>

	<div class="container-fluid center">
	    <div class="row">

	    <!--=====================================
	    SEGUNDO DIV CERTIFICADO
	    ======================================-->

	    <div class="contrato">

		    <div class="page1" style="background-image: url(../../'.$fondo.')">

		    <div class="titulo">

		      <center><b>CONTRATO DE PRESTACIÓN DE SERVICIO AVL</b></center>

		    </div>

		    <div class="descripcion" >

		      <p  align="justify">Conste por el presente documento de prestación del servicio AVL (el Contrato) que celebran
		      <b>'.$nombre.'</b>, con RUC Nº '.$ruc.', domiciliada en la Calle Cornalina Mz A Lt 22, Urb. Los Cedros, Trujillo, y '.$tipo_cliente.' '.$nombre_cliente.' con '.$cliente["tipo_documento"].' '.$cliente["num_documento"].', con domicilio
		      en '.$cliente["direccion"].' el Cliente, da acuerdo a los siguientes términos:</p>

		    </div>

		    <div class="primera_titulo">
		        <p><b>PRIMERA: OBJETO DEL CONTRATO</b></p>

		    </div>

		    <div class="primera">

		      <p  align="justify">
		        <b> SYNTHESIS GROUP EIRL</b> se obliga a prestar al <b>Cliente</b> el servicio <b>AVL</b> (que incluye el acceso a la Plataforma de Monitoreo GPS con su respectiva credencial y la previa instalación del equipo GPS)  y sus servicios incorporados dentro del sistema, Alertas de Exceso de velocidad, Botón de pánico, Ubicación en tiempo real, Control de paradas, Reportes e Historiales hasta 30 días de antigüedad, Posición, Recorrido, Soporte y asesoría online o presencial.
		        Así mismo se encuentra habilitada la opción de migrar sus equipos ya instalados con otro
		        proveedor a la Plataforma SYNTHESIS GROUP. Para efectos del presente contrato, el Cliente autoriza a <b>SYNTHESIS GROUP</b> a verificar su historial crediticio a las Centrales de Riesgos y a reportar a las mismas su eventual morosidad o incumplimiento de las obligaciones asumidas por el Cliente bajo el Contrato. Así mismo el cliente podrá solicitar la habilitación de más de una credencial y configuración en los dispositivos con acceso a internet para el monitoreo de la(las) siguientes unidades de placa (s):
		      </p>';

		      	//tabla
		     if (count($detalle) <= 10) {
		 		
		      	$html.='<table border="1" align="center" style="margin-left: 35px; margin-top: 10px" bordercolor="#000">

					    <tr >
					      <td width="80px" align="center">Item</td>
					      <td width="80px" align="center">Tipo</td>
					      <td width="80px" align="center">Placa</td>
					      <td width="40px" align="center">Plan</td>


					    </tr>';

			    foreach ($detalle as $key => $value) {

			    	$vehiculo = ControladorVehiculos::ctrMostrarVehiculos("id", $value["idvehiculo"]);
		    		$html.='<tr>

				        <td width="50px" align="center">'.($key+1).'</td>
				        <td width="180px" align="center">'.$vehiculo["tipo"].'</td>
				        <td width="120px" align="center">'.$vehiculo["placa"].'</td>
				        <td width="120px" align="center">'.$value["plan"].'</td>
				        </tr>
				        ';
			    }




				$html.='</table>';

		     } 


		     if(count($detalle) <= 20 && count($detalle) >= 11) {

		      	$html.='<table border="1" align="center" style="margin-top: 15px;margin-left: 20px;" bordercolor="#000">

					    <tr >
					      <td width="40px" align="center">Item</td>
					      <td width="40px" align="center">Placa</td>
					      <td width="80px" align="center">Plan</td>

					    </tr>';

			    for ($i=0; $i < 10 ; $i++) { 

			    	$vehiculo = ControladorVehiculos::ctrMostrarVehiculos("id", $detalle[$i]["idvehiculo"]);
		    		$html.='<tr>

				        <td width="50px" align="center">'.($i+1).'</td>
				        <td width="100px" align="center">'.$vehiculo["placa"].'</td>
				        <td width="80px" align="center">'.$detalle[$i]["plan"].'</td>
				        </tr>
				        ';
			    }



		      	$html.='<table border="1" align="center" style="margin-top: -225px;margin-left: 299px;" bordercolor="#000">

					    <tr >
					      <td width="40px" align="center">Item</td>
					      <td width="40px" align="center">Placa</td>
					      <td width="80px" align="center">Plan</td>

					    </tr>';

			    for ($i=10; $i < count($detalle) ; $i++) { 

			    	$vehiculo = ControladorVehiculos::ctrMostrarVehiculos("id", $detalle[$i]["idvehiculo"]);
		    		$html.='<tr>

				        <td width="50px" align="center">'.($i+1).'</td>
				        <td width="100px" align="center">'.$vehiculo["placa"].'</td>
				        <td width="80px" align="center">'.$detalle[$i]["plan"].'</td>
				        </tr>
				        ';
			    }

				$html.='</table>';
		     }



		     //MAS DE 20 VEHICULOS
		     if(count($detalle) >= 21 && count($detalle) <= 31) {

		      	$html.='<table border="1" align="center" style="margin-top: 15px;margin-left: 0px;" bordercolor="#000">

					    <tr >
					      <td width="30px" align="center">Item</td>
					      <td width="80px" align="center">Placa</td>
					      <td width="60px" align="center">Plan</td>

					    </tr>';

			    for ($i=0; $i < 10 ; $i++) { 

			    	$vehiculo = ControladorVehiculos::ctrMostrarVehiculos("id", $detalle[$i]["idvehiculo"]);
		    		$html.='<tr>

				        <td width="30px" align="center">'.($i+1).'</td>
				        <td width="80px" align="center">'.$vehiculo["placa"].'</td>
				        <td width="60px" align="center">'.$detalle[$i]["plan"].'</td>
				        </tr>
				        ';
			    }



		      	$html.='<table border="1" align="center" style="margin-top: -225px;margin-left: 190px;" bordercolor="#000">

					    <tr >
					      <td width="30px" align="center">Item</td>
					      <td width="80px" align="center">Placa</td>
					      <td width="60px" align="center">Plan</td>

					    </tr>';

			    for ($i=10; $i < count($detalle) && $i < 20 ; $i++) { 

			    	$vehiculo = ControladorVehiculos::ctrMostrarVehiculos("id", $detalle[$i]["idvehiculo"]);
		    		$html.='<tr>

				        <td width="30px" align="center">'.($i+1).'</td>
				        <td width="80px" align="center">'.$vehiculo["placa"].'</td>
				        <td width="60px" align="center">'.$detalle[$i]["plan"].'</td>
				        </tr>
				        ';
			    }



			    //TERCERA TABLA

		      	$html.='<table border="1" align="center" style="margin-top: -225px;margin-left: 380px;" bordercolor="#000">

					    <tr >
					      <td width="30px" align="center">Item</td>
					      <td width="80px" align="center">Placa</td>
					      <td width="60px" align="center">Plan</td>

					    </tr>';

			    for ($i=20; $i < count($detalle); $i++) { 

			    	$vehiculo = ControladorVehiculos::ctrMostrarVehiculos("id", $detalle[$i]["idvehiculo"]);
		    		$html.='<tr>

				        <td width="30px" align="center">'.($i+1).'</td>
				        <td width="80px" align="center">'.$vehiculo["placa"].'</td>
				        <td width="60px" align="center">'.$detalle[$i]["plan"].'</td>
				        </tr>
				        ';
			    }





				$html.='</table>';
		     }

		     	//mas de 30

		     //MAS DE 20 VEHICULOS
		     if(count($detalle) >= 31) {

		      	$html.='<table border="1" align="center" style="margin-top: 13px;margin-left: 0px;" bordercolor="#000">

					    <tr >
					      <td width="30px" align="center">Item</td>
					      <td width="80px" align="center">Placa</td>
					      <td width="60px" align="center">Plan</td>

					    </tr>';

			    for ($i=0; $i < 12 ; $i++) { 

			    	$vehiculo = ControladorVehiculos::ctrMostrarVehiculos("id", $detalle[$i]["idvehiculo"]);
		    		$html.='<tr>

				        <td width="30px" align="center">'.($i+1).'</td>
				        <td width="80px" align="center">'.$vehiculo["placa"].'</td>
				        <td width="60px" align="center">'.$detalle[$i]["plan"].'</td>
				        </tr>
				        ';
			    }



		      	$html.='<table border="1" align="center" style="margin-top: -265px;margin-left: 190px;" bordercolor="#000">

					    <tr >
					      <td width="30px" align="center">Item</td>
					      <td width="80px" align="center">Placa</td>
					      <td width="60px" align="center">Plan</td>

					    </tr>';

			    for ($i=12; $i < count($detalle) && $i < 24 ; $i++) { 

			    	$vehiculo = ControladorVehiculos::ctrMostrarVehiculos("id", $detalle[$i]["idvehiculo"]);
		    		$html.='<tr>

				        <td width="30px" align="center">'.($i+1).'</td>
				        <td width="80px" align="center">'.$vehiculo["placa"].'</td>
				        <td width="60px" align="center">'.$detalle[$i]["plan"].'</td>
				        </tr>
				        ';
			    }



			    //TERCERA TABLA

		      	$html.='<table border="1" align="center" style="margin-top: -265px;margin-left: 380px;" bordercolor="#000">

					    <tr >
					      <td width="30px" align="center">Item</td>
					      <td width="80px" align="center">Placa</td>
					      <td width="60px" align="center">Plan</td>

					    </tr>';

			    for ($i=24; $i < count($detalle); $i++) { 

			    	$vehiculo = ControladorVehiculos::ctrMostrarVehiculos("id", $detalle[$i]["idvehiculo"]);
		    		$html.='<tr>

				        <td width="30px" align="center">'.($i+1).'</td>
				        <td width="80px" align="center">'.$vehiculo["placa"].'</td>
				        <td width="60px" align="center">'.$detalle[$i]["plan"].'</td>
				        </tr>
				        ';
			    }





				$html.='</table>';
		     }


		      $html.='</div>


		      <div class="segunda_titulo">
		        <p><b>SEGUNDA: OBLIGACIONES DEL CLIENTE</b></p>

		      </div>

		      <div class="segunda">
		        <p align="justify">Son obligaciones del <b>Cliente</b> además de las establecidas en la normativa vigente: <b>(I)</b> Utilizar adecuadamente y conforme a las Leyes vigentes el servicio contratado, <b>(II)</b> Pagar puntualmente por el Servicio y/o los otros servicios contratados en la forma y plazo acordados por adelantado, <b>(III)</b> Comunicar a <b>SYNTHESIS GROUP </b> su cambio de domicilio o de número telefónico, <b>(IV)</b> Comunicar el ingreso de la unidad a taller de servicio o la inhabilitación del servicio a tiempo.</p>

		      </div>





		    </div>


		    <div class="page2 new-page" style="background-image: url(../../'.$fondo.')">
		      <div class="tercera_titulo">

		        <p><b>TERCERA: PLAZO DEL CONTRATO</b></p>

		      </div>

		      <div class="tercera">
		        <p align="justify">El plazo se encuentra sujeto a 36 meses contabilizados a la firma de la presente.</p>

		      </div>

		     <div class="cuarta_titulo">
		        <p><b>CUARTA: FACTURACIÓN Y PAGOS</b></p>

		      </div>

		      <div class="cuarta">

		        <p align="justify">El Cliente pagará a <b>SYNTHESIS GROUP </b> las tarifas vigentes con sujeción al plan tarifario contratado por el Servicio y/o por los otros servicios contratados. Los conceptos detallados serán pagados por ciclo de facturación ADELANTADO, de ser el caso: (i) renta fija mensual por el uso de la Plataforma  y chip datos el monto detallado en la tabla superior por vehículo más IGV, (ii) la reactivación del servicio estará sujeta a la tarifa establecida por SYNTHESIS GROUP , S/. 50.00 más IGV, el cual incluye cambio de chip, configuración y actualización en la plataforma, (iii) por mantenimientos o revisión del equipo debido a la manipulación de tercero o fallas ajenas a SYNTHESIS GROUP. (iv) por desinstalación o instalación del equipo GPS S/. 50.00 más IGV.
		        Para los casos de adquisición de equipos GPS  que el <b>CLIENTE</b> no cancele en la fecha acordada <b>SYNTHESIS GROUP EIRL</b> procederá a retirar el equipo instalado sin derecho a devolución de adelantos otorgados por el <b>CLIENTE</b>.
		        </p>
		        <p align="justify"><b>SYNTHESIS GROUP EIRL</b> dispone de su Cta. Cte. En el Interbank en Soles Nº  <b>'.$cuenta.'</b>, titular SYNTHESIS GROUP MULTISERVIS EIRL para realizar el pago por los servicios prestados y enviar Voucher  escaneado al correo '.$email.' o al WhatsApp: 949205558</p>

		      </div>

		      <div class="quinta_titulo">

		        <p><b>QUINTA: COBERTURA DE LOS SERVICIOS</b></p>
		      </div>

		      <div class="quinta">

		        <p align="justify">Nuestra cobertura de Monitoreo es a nivel nacional e internacional dependiendo de la señal radio eléctrica propagada por la red de los operadores Virgin mobile, Claro, Movistar, Entel o Bitel para enviar la actualización de datos a la Plataforma.</p>
		      </div>

		      <div class="sexta_titulo">
		        <p><b>SEXTA: EVENTUALIDADES</b></p>

		      </div>

		      <div class="sexta">
		        <p align="justify"><b>SYNTHESIS GROUP EIRL</b>, no se responsabiliza por los eventuales cortes de Transmisión de la señal por causas ajenas a nuestra responsabilidad, falta de reportes o historiales (si estos fueran ocurridos por fallas en la señal radioeléctrica propagadas en la red celular de Claro, Movistar, Entel o Bitel) lo que dificultará el cumplimiento del servicio, Los cortes de energía de los vehículos (al estacionarse o al ingresar al taller), Falta de coordinación en la reparación, Falla del vehículo, Retiro de Batería, Cruce de chip, manipulación de terceros, Soldaduras, Energización a otro vehículo.</p>
		      </div>





		   </div>

		  <div class="page3 new-page" style="background-image: url(../../'.$fondo.')">

		      <div class="septima_titulo">
		        <p><b>SEPTIMA: HURTO, ROBO O PERDIDA DE LA UNIDAD</b></p>

		      </div>

		      <div class="septima">

		        <p align="justify">En caso de robo, perdida u otra circunstancia equivalente, el Cliente deberá reportar el hecho inmediatamente a la Central de Monitoreo y a las autoridades de seguridad (PNP).
		        <b>SYNTHESIS GROUP EIRL</b>, deja plenamente establecido que el servicio que presta es el señalado en la Primera cláusula, por lo cual no está obligada a resarcir por los daños directos e indirectos o por la pérdida total o parcial del vehículo o vehículos por los que transporta o por los daños personales (lesiones o muerte) del cliente o del personal autorizado o de terceros, como consecuencia de intento o comisión de hurto simple, hurto agravado, robo agravado, secuestro y de apropiación ilícita de LOS VEHICULOS. Cualquier póliza de seguros, de ser requerida, será responsabilidad del <b>CLIENTE</b>.
		        </p>
		      </div>
		      <div class="octava_titulo">

		        <p><b>OCTAVA: LEY Y JURISDICCIÓN APLICABLE</b></p>
		      </div>

		      <div class="octava">
		        <p align="justify">Todas las desavenencias o controversias que pudieran derivarse de la ejecución de este contrato incluidas las de su nulidad o invalidez se regirán por el código civil y demás leyes del ordenamiento jurídico de la República del Perú que resulten aplicables, sometiéndose ambas partes a la competencia de los jueces del distrito judicial.</p>

		        <p align="justify">Suscrito por las partes contratantes en señal de conformidad, en la ciudad de:</p>
		      </div>

		      <div class="fecha">
		        '.$fecha.'

		      </div>

		      <div class="cliente">
		        <p>------------------------------------</p>
		        <p><b>CLIENTE</b></p>
		      </div>

		      <div class="empresa">
		        <p>------------------------------------</p>
		        <p><b>SYNTHESIS GROUP</b></p>
		      </div>



		        '.$sello.'

		  	</div>


		</div>
	</div>



  ';











  $html .='

		</body>

	</html>
	';






echo $html;
}





?>








