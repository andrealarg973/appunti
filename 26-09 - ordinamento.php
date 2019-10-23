<!--FUNZIONE STAMPA ESTESA-->
<?php
//codice php valido; stampa tutto tra le parentesi
function stampa() {
?>

FUNZIONE DI STAMPA

<?php
}
?>
<!--FUNZIONE COUNT-->
<?php
$vettore = ['zio', 'zia', 'zie', 'zii'];
count($vettore); //numero di elemeti di array 'vettore'
for($i = 0; $i < count($vettore); $i++)
{
	echo $vettore[$i] . ' ';
}
?>
<br><br>
<!--ORDINAMENTO-->
<?php
$lingue = ['IT' => 'ITALIANO', 'ES' => 'SPAGNOLO', 'RU' => 'RUSSO'];
echo "default: ";
print_r($lingue);
echo "<br>";
echo "default: ";
$nomi = ['zorro', 'pippo', 'de la lega'];
print_r($nomi);
echo "<br>";
sort($nomi); //Oridna i VALORI dell'array in senso crescente, e vengono perse le chiavi
print_r($nomi);
echo "<br>";
asort($lingue); //Ordina i VALORI dell'array in senso crescente, e NON vengono perse le le chiavi
print_r($lingue);
//rsort($lingue); //Ordina i VALORI dell'array in senso decrescente, e vengono perse le chiavi
arsort($lingue); //Ordina i VALORI dell'array in senso decrescente, e NON vengono perse le chiavi
echo "<br>";
print_r($lingue);
//ksort($array) --> ordina le chiavi in ordine crescente
//krsort($array) --> ordina le chiavi in ordine decrescente
?>