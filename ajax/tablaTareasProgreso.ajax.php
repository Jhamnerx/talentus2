<?php
setlocale(LC_ALL, "es_ES", 'Spanish_Spain', 'Spanish');
require_once "../controladores/tarea.controlador.php";
require_once "../controladores/dispositivos.controlador.php";
require_once "../controladores/vehiculos.controlador.php";
require_once "../controladores/usuarios.controlador.php";

require_once "../modelos/tarea.modelo.php";
require_once "../modelos/dispositivos.modelo.php";
require_once "../modelos/vehiculos.modelo.php";
require_once "../modelos/usuarios.modelo.php";

class TablaTarea{

  /*=============================================
  MOSTRAR LA TABLA DE TAREAS PROGRESO
  =============================================*/ 

 	public function mostrarTabla(){	

 	$item = null;
 	$valor = null;

 	$tareas = ModeloTarea::mdlMostrarTareas("tareas", "estado", "1");
 	
 	if(count($tareas) == 0){

      $datosJson = '{ "data":[]}';

      echo $datosJson;

      return;

    }

 	$datosJson = '{
		 
		  "data": [ ';

	for($i = 0; $i < count($tareas); $i++){
	
		$dispositivo = ControladorDispositivos::ctrMostrarDispositivos("id", $tareas[$i]["dispositivo"]);
		$vehiculo = ControladorVehiculos::ctrMostrarVehiculos("id", $tareas[$i]["vehiculo"]);
        $tipo = ControladorTareas::ctrMostrarTipoTareas("id", $tareas[$i]["tipo"]);
        $usuarios = ControladorUsuarios::ctrMostrarUsuarios("id", $tareas[$i]["id_admin"]);

			/*=============================================
			REVISAR ESTADO
			=============================================*/ 

			if($tareas[$i]["estado"] == 0){
				
				$colorEstado = "btn-danger";
				$textoEstado = "Cancelada";

			}if($tareas[$i]["estado"] == 1){

				$colorEstado = "btn-warning";
				$textoEstado = "En Proceso";

			}if($tareas[$i]["estado"] == 2){
				$colorEstado = "btn-success";
				$textoEstado = "Completado";
			}

			$estado = "<label value=".$textoEstado." class='btn ".$colorEstado." btn-xs btnActivar' idTarea='".$tareas[$i]["id"]."'>".$textoEstado."</label>";



	        $fecha = iconv('ISO-8859-2', 'UTF-8', strftime("%d de %B de %Y", strtotime($tareas[$i]["fecha"])));
	        $descripcion = "<p>".$tipo["tipo"]." de GPS ".$dispositivo["modelo"]." en el vehiculo ".$vehiculo["placa"].",</p> <p>Fecha y Hora de instalacion ".$fecha." 01:30 PM</p>";

	        $fechaMod = iconv('ISO-8859-2', 'UTF-8', strftime("%d de %B de %Y", strtotime($tareas[$i]["fecha_mod"])));

		        /*=============================================
		  		CREAR LAS ACCIONES
		  		=============================================*/
			    
			$acciones = "<div class='btn-group'><button class='btn btn-danger btnCancelarTarea' idTarea='".$tareas[$i]["id"]."'' ><i class='fa fa-times'></i></button> <button class='btn btn-success btnTerminarTarea' idTarea='".$tareas[$i]["id"]."'' ><i class='fa fa-check'></i></button> <div class='tooltipb'> <button class='btn btn-info btnEnviarMensaje'><i class='fa fa-share-square'></i> </button> <span class='tooltipbtext'>Enviar Mensaje</span></div></div>";

	    $informacion = "<p>Tarea En progreso ".$fechaMod."</p>";
			$datosJson	 .= '[
				      "'.($i+1).'",
				      "'.$tipo["tipo"].'",
				      "'.$usuarios["nombre"].'",
				      "'.$descripcion.'",
				      "'.$estado.'",
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
ACTIVAR TABLA DE TAREAS
=============================================*/ 
$activar = new TablaTarea();
$activar -> mostrarTabla();