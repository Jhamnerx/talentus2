<?php

require_once "../controladores/cobros.controlador.php";
require_once "../controladores/utiles.php";
require_once "../controladores/persona.controlador.php";
require_once "../modelos/cobros.modelo.php";
require_once "../modelos/persona.modelo.php";

class TablaCobros{

  /*=============================================
  MOSTRAR LA TABLA DE COBROS
  =============================================*/

 	public function mostrarTabla(){

 	$item = null;
 	$valor = null;

 	$cobros = ControladorCobros::ctrMostrarCobros($item, $valor);



  	//var_dump($empresa);
 	//echo $cobros;

 	if(count($cobros) == 0){

      $datosJson = '{ "data":[]}';

      echo $datosJson;

      return;

    }

 	$datosJson = '{

		  "data": [ ';

	for($i = 0; $i < count($cobros); $i++){

			/*=============================================
			REVISAR ESTADO
			=============================================*/

			if($cobros[$i]["estado"] == 0){

				$colorEstado = "btn-danger";
				$textoEstado = "SUSPENDIDO";
				$estadoCobro = 1;

			}else if($cobros[$i]["estado"] == 1){

				$colorEstado = "btn-warning";
				$textoEstado = "POR PAGAR";
				$estadoCobro = 2;

			}else if($cobros[$i]["estado"] == 2){

				$colorEstado = "btn-success";
				$textoEstado = "PAGADO";
				$estadoCobro = 3;

      }else if($cobros[$i]["estado"] == 3){

				$colorEstado = "btn-danger";
				$textoEstado = "VENCIDO";
				$estadoCobro = 4;

      }

		 	$estado = "<button value=".$textoEstado." class='btn ".$colorEstado." btn-xs btnActivar' estadoCobro='".$estadoCobro."' idCobro='".$cobros[$i]["id"]."'>".$textoEstado."</button>";

		 	if ($cobros[$i]["empresa"] != "") {

			   	$empresa = ControladorPersona::ctrMostrarPersona("id", $cobros[$i]["empresa"], 1);

	  			if (strlen($cobros[$i]["empresa"]) > 3) {

	  				$nombreEmpresa = $cobros[$i]["empresa"];

	  			}else{

	  				if ($empresa["apellido"] == "null") {

	  					$nombreEmpresa = $empresa["nombre"];
	  				}else{

	  					$nombreEmpresa = $empresa["nombre"]." ". $empresa["apellido"];
	  				}
	  			}
		 	}else{

		 		$nombreEmpresa = "";
		 	}


			/*=============================================
  			CREAR LAS ACCIONES
  			=============================================*/

  			if($cobros[$i]["estado"] == 0){

          $acciones = "<div class='btn-group'><div class='tooltipb'> <button  class='btn btn-warning btnEditarCobro' idCobro='".$cobros[$i]["id"]."' data-toggle='modal' data-target='#modalEditarCobro'> <i class='fa fa-pencil'></i></button> <span class='tooltipbtext'>Editar</span></div><div class='tooltipb'> <button class='btn btn-danger btnEliminarCobro idCobro".$cobros[$i]["id"]."'  idCobro='".$cobros[$i]["id"]."' ><i class='fa fa-times'></i></button> <span class='tooltipbtext'>Dar de Baja</span></div><div class='tooltipb'> <button class='btn btn-info btnEnviarMensaje' fechaVencimiento='".$cobros[$i]["fechaVen"]."' fechaCobro='".$cobros[$i]["fecha"]."' cliente='".$nombreEmpresa."' monto='".$cobros[$i]["montoxunidad"]*$cobros[$i]["cantidadUnidades"]."' numeroCliente='".$empresa["telefono"]."'><i class='fa fa-share-square'></i> </button> <span class='tooltipbtext'>Enviar Mensaje</span></div></div>";

        }elseif($cobros[$i]["estado"] == 3){
          $acciones = "<div class='btn-group'><div class='tooltipb'> <button class='btn btn-warning btnEditarCobro tooltipb' idCobro='".$cobros[$i]["id"]."' data-toggle='modal' data-target='#modalEditarCobro'> <i class='fa fa-pencil'></i> </button> <span class='tooltipbtext'>Editar</span></div><div class='tooltipb'> <button class='btn btn-success btnPagarCobro' idCobro='".$cobros[$i]["id"]."' data-toggle='modal' data-target='#modalPagar'><i class='fa fa-money'></i></button> <span class='tooltipbtext'>Marcar Como pagado</span></div><div class='tooltipb'> <button class='btn btn-danger btnEliminarCobro idCobro".$cobros[$i]["id"]."' idCobro='".$cobros[$i]["id"]."' ><i class='fa fa-times'></i></button> <span class='tooltipbtext'>Dar de Baja</span></div><div class='tooltipb'> <button class='btn btn-info btnEnviarMensaje' fechaVencimiento='".$cobros[$i]["fechaVen"]."' fechaCobro='".$cobros[$i]["fecha"]."' cliente='".$nombreEmpresa."' monto='".$cobros[$i]["montoxunidad"]*$cobros[$i]["cantidadUnidades"]."' numeroCliente='".$empresa["telefono"]."'><i class='fa fa-share-square'></i> </button> <span class='tooltipbtext'>Enviar Mensaje</span></div></div>";


        }else{

  				$acciones = "<div class='btn-group'><div class='tooltipb'> <button class='btn btn-warning btnEditarCobro tooltipb' idCobro='".$cobros[$i]["id"]."' data-toggle='modal' data-target='#modalEditarCobro'> <i class='fa fa-pencil'></i> </button> <span class='tooltipbtext'>Editar</span></div><div class='tooltipb'> <button class='btn btn-success btnPagarCobro' idCobro='".$cobros[$i]["id"]."' data-toggle='modal' data-target='#modalPagar'><i class='fa fa-money'></i></button> <span class='tooltipbtext'>Marcar Como pagado</span></div><div class='tooltipb'> <button class='btn btn-danger btnEliminarCobro idCobro".$cobros[$i]["id"]."' idCobro='".$cobros[$i]["id"]."' ><i class='fa fa-times'></i></button> <span class='tooltipbtext'>Dar de Baja</span></div><div class='tooltipb'> <button class='btn btn-info btnEnviarMensaje' fechaVencimiento='".$cobros[$i]["fechaVen"]."' fechaCobro='".$cobros[$i]["fecha"]."' cliente='".$nombreEmpresa."' monto='".$cobros[$i]["montoxunidad"]*$cobros[$i]["cantidadUnidades"]."' numeroCliente='".$empresa["telefono"]."'><i class='fa fa-share-square'></i> </button> <span class='tooltipbtext'>Enviar Mensaje</span></div></div>";
  			}

  			/**
  			 * VER REGISTRO
  			 */

  			$ver = "<div class='btn-group'><div class='tooltipb'><button class='btn btn-warning btnVerCobro tooltipb' idCobro='".$cobros[$i]["id"]."' data-toggle='modal' data-target='#modalVerInfoCobro'><i class='fa fa-eye'></i> </button><span class='tooltipbtext'>Ver</span></div></div>";
  			$date = date_create($cobros[$i]["fechaVen"]);
  			$fechaVencimiento = date_format($date, 'd-m-Y');



	        $fechaInicial = $cobros[$i]["fechaVen"];
	        $fechaFinal = date("Y/m/d");

	        $dias = Utiles::diferenciaFechas($fechaInicial, $fechaFinal);

	        if($dias <= 0){

	        	$fechaVencimientoMostrar = "<div class='tooltipb'><span style='color: red;'>".$fechaVencimiento."</span><span class='tooltipbtext'>Vencido</span></div>";


	        }else if($dias >= 1 && $dias < 10){

	        	$fechaVencimientoMostrar = "<div class='tooltipb'><span style='color: orange;'>".$fechaVencimiento."</span><span class='tooltipbtext'>Por Vencer, ".$dias." Dias Restantes</span></div>";

	        }else{


	        	$fechaVencimientoMostrar = "<span style='color: blue;'>".$fechaVencimiento."</span>";

	        }


			$datosJson	 .= '[
				      "'.($i+1).'",
				      "'. $ver.'",
				      "'.$nombreEmpresa.'",
				      "'.$estado.'",
				      "'.$fechaVencimientoMostrar.'",
				      "'.$cobros[$i]["periodo"].'",
				      "'.$cobros[$i]["montoxunidad"].'",
				      "'.$cobros[$i]["cantidadUnidades"].'",
				      "'.$acciones.'"

				    ],';

	}

	$datosJson = substr($datosJson, 0, -1);

	$datosJson.=  ']

	}';

	echo $datosJson;


 	}


}

/*=============================================
ACTIVAR TABLA DE COBROS
=============================================*/
$activar = new TablaCobros();
$activar -> mostrarTabla();
