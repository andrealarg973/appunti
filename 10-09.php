<!--
'Cos'è l'array $_GET?'
E' un array SUPER GLOBALE che contiene la query string e viene creato all'inizio del programma dal  complilatore php che sono subito utilizzabili es. con il url http://.../pagina.php?city=BL&day=today,
viene creato l'array $_GET(array con chiave=>valore) che conterrà due elementi: ['city']=>['BL'] e ['day']=>['today']. Quando termina l'eseczione dello script, l'interprete distrugge l'array.
La dimenione massima dell'array è pari alla lunghezza massima della query string, al contrario del POST, che non ha un limite alle dimensioni

$_POST -> se arrivati dati dal form con action='post' 
$_SERVER -> con alcune info tipo IP, il browser, e una serie di chiavi chiamate 'http_' che rappresentano tutte le intestazioni spedite dal browser (es. la linuga) 
-->

<!-- Form che invia dati nei $_GET e nel $_POST
-->
<?php
if(isset($_POST['btn']))
{
	echo "POST: ";
	print_r($_POST);
	echo "<br><br>GET: ";
	print_r($_GET);
}
?>

<form method="POST" action="09-10.php?city=BL&day=today">
	<input type="text" name="city">
	<input type="text" name="day">
	<button type="submit" name="btn">OK</button>
</form>

<!--
Concetto risorsa statica e dinamica
-->

<!--
Gestione di file
Chiedere ad un sito il meteo e salva la pagina in locale su disco
-->
<?php
//www.wunderground.com/weather/it/treviso
if(isset($_GET['btnOk']))
{
	$stato =$_GET['state'] ?? 'it';
	$città = $_GET['city'] ?? 'belluno';
	
	$file = file_get_contents("https://www.wunderground.com/weather/$stato/$città");
	file_put_contents("site", $file);
}
?>

<form method="GET" action="">
	<input type="text" name="state" placeholder="state"><br><br>
	<input type="text" name="city" placeholder="city"><br><br>
	<button type="submit" name="btnOk">OK</button>
</form>
