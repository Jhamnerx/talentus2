<?php
require_once "../controladores/cobros.controlador.php";
require_once "../controladores/utiles.php";
require_once "../modelos/cobros.modelo.php";

require_once "../controladores/notificaciones.controlador.php";
require_once "../modelos/notificaciones.modelo.php";
/**
 *
 */
class CobrosNotificacion{

  static public function IngresarNotificacion() {
    /**
     * AÑDIR NOTIFICACION
     */
      $cobros = ModeloCobros::mdlMostrarCobros("cobros", null, null);


      for ($i=0; $i < count($cobros); $i++) {
          $fechaInicial = $cobros[$i]["fechaVen"];
          $fechaFinal = date("Y/m/d");

          $dias = Utiles::diferenciaFechas($fechaInicial, $fechaFinal);


          if ($dias <= 10 AND $dias >= 0) {

            $datos = array("tipo"=>"vencimiento",
             "descripcion"=>"porvencer",
             "idCobro"=>$cobros[$i]["id"],
             "autor"=> "sistema",
             "estado"=> "1");

            $notifi = ControladorNotificaciones::ctrIngresarNotificacion($datos);

            if ($cobros[$i]["estado"] != 0) {
              
              $notifi = ControladorNotificaciones::ctrIngresarNotificacion($datos);

              $estado = ModeloCobros::mdlActualizarEstadoCobros("cobros", "estado", 1, "id", $cobros[$i]["id"]);


            }


          }

      }

  }
}

/*=============================================
AÑADIR NOTIFICACION
=============================================*/
if(isset($_POST["notificacion"])){
  $ingresarNotificacion = new CobrosNotificacion();
  $ingresarNotificacion -> IngresarNotificacion();
}

 ?>
