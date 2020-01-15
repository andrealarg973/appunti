<?php
/*
	file_get_contents(filename) restituisce una stringa con il contenuto del file
	In php una stringa è un array di byte
*/
$bytes = file_get_contents("26-09.php"); //accetta anche un url
echo $bytes;
?>

<?php
//NON OTTIMIZZATO, viene copiato l'intero array di bytes della stringa
$bytes = 'telefono';
$bytes = $bytes . '0584930239' . '|' . 'messaggio' . "\n";

/*
	file_put_contents(filename, data) crea o sovrascrive un file
*/
file_put_contents('contatti.txt', $bytes);
?>

<?php
//OTTIMIZZATO, con FILE_APPEND aggiunge al file e non sovrascrive
$linea = '0584930239' . '|' . 'messaggio';
/*
	LOCK_EX -> Blocco esclusivo, funge da semaforo creando un file di lock,
	se è libero crea questo file per segnalare che sta venedo usato, poi lo distrugge

file_exists(filename) controlla se il file esiste
filesize(filename) restituisce la dimensione del file
readfile(filename) invia il file direttamente al browser
*/
file_put_contents('contatti.txt', $linea . "\n", FILE_APPEND | LOCK_EX);

/*
	fopen()

	fwrite()
	fread()

	fclose()
*/
?>

<?php
/*
	è come lo splitter
	explode(delimiter, string) -> restituisce un array di stringhe
*/
$line = '02-10-2019';
$strings = explode('-', $line);
var_dump($strings);

/*
	implode(glue, pieces) -> restitusice una stringa
*/
$line2 = implode('-', $strings);
echo $line2
?>