<?php
/*
Prepared statements o istruzioni SQL precompilate
	- Diminuisce il carico di lavoro perchè precompila l'istruzione
	- Prevenzione di attacchi di SQL Injection
*/
include "pdo.php";
$sql = "SELECT titolo, anno, naz, reg
		  FROM v_peliculas
		  WHERE anno=? AND naz=?"; #NO APICI ANCHE SE STRINGHE
$stmt = $pdo->prepare($sql);
$stmt->execute([2001, 'ESP']);#Ora lo stmt è iterabile e contiene i risultati
#Opzione 1
while($row = $stmt->fetch())
{
	printf('%20s %4d %15s %20s', $row['titolo'], $row['anno'], $row['naz'], $row['reg']);
}
#Opzione 2
foreach ($stmt as $row)
{
	# code...
}
#Opzione 3
$rows = $stmt->fetchAll(); #restituisce tutti i risultati in un array

$stmt->execute([2001, 'USA']);
foreach ($stmt as $row)
{
	# code...
}

#Segnaposti con nome
$sql = "SELECT titolo, anno, naz, reg
		  FROM v_peliculas
		  WHERE anno=:anno AND naz=:naz";
$stmt = $pdo->prepare($sql);
$stmt->execute([':anno' => 2001,':naz' => 'ESP']);

#Riuso la stessa query precompilata per avere diversi dati
$stmt->execute([':naz' => 'ITA', ':anno' => 2001]);
$italians_films = $stmt->fetchAll();
$stmt->execute([':naz' => 'USA', ':anno' => 2001]);
$american_films = $stmt->fetchAll();
$stmt->execute([':naz' => 'ESP', ':anno' => 2001]);
$spanish_films = $stmt->fetchAll();