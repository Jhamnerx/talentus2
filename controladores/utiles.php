<?php


class Utiles{

	static public function diferenciaFechas($fechaInicial, $fechaFinal)
	{
		$dias = (strtotime($fechaInicial)-strtotime($fechaFinal))/(60*60*24);
		// $dias =abs($dias);
		$dias = floor($dias);
		return $dias;
	}
	static public function is_email($str)
	{
	  return (false !== strpos($str, "@") && false !== strpos($str, "."));
	}
	
} 



	


 ?>