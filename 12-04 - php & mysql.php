<?php 
/*
PDO(Php Database Object):
	- orientata agli oggetti
	- utilizzabile per una moltiplicità di DBMS
*/
//phpdelusions.net/pdo
/*
$pdo = new PDO($dsn, $user, $pass, $options);
$dsn -> Data Source Name
*/

$pdo = new PDO("mysql:host=127.0.0.1;dbname=employees", "root", "");
$query = "SELECT emp_no, first_name, last_name, birth_date
		  FROM employees LIMIT 10";
$stmt = $pdo->query($query);
//print_r($stmt->fetch());# Ottengo un record dall'insieme dei riusltati
while($row = $stmt->fetch())
{
	printf("%10s %10s %10s\n", $row['first_name'], $row['last_name'], $row['birth_date']);
}
#OPPURE
foreach($stmt as $row)
{
	printf("%10s %10s %10s\n", $row['first_name'], $row['last_name'], $row['birth_date']);
}


while($row = $stmt->fetch(PDO::FETCH_ASSOC))
{
	
}
//Pagina php che riceve un codice imp e fa vedere i dati dell'impiegato e la lista dei sui stipendi
$pdo->query(""); #Si usa solo per eseguire SELECT
$pdo->exec(""); #Si usa per UPDATE, DELETE, CREATE... Restituisce il numero dei record modificati, per i comandi DDL restitusice 0