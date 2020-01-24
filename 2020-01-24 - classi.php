<?php

class Persona
{
	public $nome;
	public $cognome;
	public static $contatore = 0;

	function __construct($nome, $cognome)
	{
		$this->nome = $nome;
		$this->cognome = $cognome;
		Persona::$contatore++;
	}

	function mi_presento()
	{
		echo "ciao, sono $this->nome";
	}

	static function getContatore()
	{
		return Persona::$contatore;
	}
}

$persona = new Persona('Elsa', 'De s');
$persona->mi_presento();

$persona->data_nascita = 2001; #-> Si crea una varibile data_nascita all'interno della classe

Persona::$getContatore();

public class Commerciale extends Persona
{

}

?>