<?php

require_once "../controladores/tarea.controlador.php";
require_once "../controladores/vehiculos.controlador.php";
require_once "../modelos/tarea.modelo.php";
require_once "../modelos/vehiculos.modelo.php";


class AjaxTarea{
  /*=============================================
  MOSTRAR TAREA NO LEIDA
  =============================================*/ 

  public function ajaxMostrarTareasNoLeidas(){
    setlocale(LC_ALL, "es_ES", 'Spanish_Spain', 'Spanish');

    $tabla = "tareas";

    $datos = ModeloTarea::mdlMostrarTareas($tabla, "leido", "0");

    //var_dump($datos);
  

    if (count($datos)){

      $datanew = [];

      foreach ($datos as $key =>  $value) {
        // code...
        $datacol['key']  = ($key+1);
        $datacol['id']  = $value['id'];
        $datacol['id_empleado']  = $value['id_empleado'];
        $datacol['id_admin']  = $value['id_admin'];
        $datacol['tipo']  = $value['tipo'];

        $vehiculo = ControladorVehiculos::ctrMostrarVehiculos("id", $value['vehiculo']);

        $fecha = iconv('ISO-8859-2', 'UTF-8', strftime("%d de %B de %Y", strtotime($value["fecha"]))).'</p>';

        if (strtolower($value['tipo']) =="instalacion") {


          $datacol['descripcion'] = "<p>Instalacion de GPSS TK-318 en el vehiculo ".$vehiculo["placa"].",</p> <p>Fecha y Hora de instalacion ".$fecha." ".$value['hora']."</p>";


        }
        if (strtolower($value['tipo']) =="mantenimiento") {


          $datacol['descripcion'] = "<p>Mantenimiento del dispositivo GPS del vehiculo ".$vehiculo["placa"].",</p> <p>Fecha y Hora del Mantenimiento ".$fecha." ".$value['hora']."</p>";


        }       
         if (strtolower($value['tipo']) ==strtolower("cambio SIM")) {


          $datacol['descripcion'] = "<p>Mantenimiento del dispositivo GPS del vehiculo ".$vehiculo["placa"].",</p> <p>Fecha y Hora del Mantenimiento ".$fecha." ".$value['hora']."</p>";


        }



        $datacol['vehiculo']  = $value['vehiculo'];
        $datacol['cliente']  = $value['cliente'];
        $datacol['leido']  = $value['leido'];
        $datacol['estado']  = $value['estado'];
        $datacol['fecha']  = $value['fecha'];


        $estado = ModeloTarea::mdlActualizarTarea("tareas", "leido", "1", "id", $value['id']);

        array_push($datanew,$datacol);
      }

      $response['registro'] = $datanew;
      $response['success'] = true;
    }
    else {
      $response['registro'] = null;
      $response['success'] = false;
    }

    // respuesta en json
    echo json_encode($response);


  }



  /*=============================================
  ACTUALIZAR TAREA
  =============================================*/	

  public $actualizarItemTarea;
  public $actualizarId;
  public $valorTarea;

  public function ajaxActualizarTarea(){



    $estado = ModeloTarea::mdlActualizarTarea("tareas", $this->actualizarItemTarea, $this->valorTarea, "id", $this->actualizarId);
  

    echo $estado;


  }

  /*=============================================
  EDITAR TAREA
  =============================================*/ 

  public $idTarea;

  public function ajaxEditarTarea(){

    $item = "id";
    $valor = $this->idTarea;

    $respuesta = ControladorTareas::ctrMostrarTareas($item, $valor);

    echo json_encode($respuesta);

  }

}

/*=============================================
ACTUALIZAR TAREA
=============================================*/

if(isset($_POST["actualizarItemTarea"])){

	$actualizarTarea = new AjaxTarea();
	$actualizarTarea -> actualizarItemTarea = $_POST["actualizarItemTarea"];
	$actualizarTarea -> actualizarId = $_POST["actualizarId"];
  $actualizarTarea -> valorTarea = $_POST["valorTarea"];
	$actualizarTarea -> ajaxActualizarTarea();

}


/*=============================================
EDITAR TAREA
=============================================*/
if(isset($_POST["idTarea"])){

  $editar = new AjaxTarea();
  $editar -> idTarea = $_POST["idTarea"];
  $editar -> ajaxEditarTarea();

}

/*=============================================
MOSTRAR TAREAS NO LEIDAS
=============================================*/ 
if(isset($_GET["verTareasNoleidas"])){
  $mostrar = new AjaxTarea();
  $mostrar -> ajaxMostrarTareasNoLeidas();
}