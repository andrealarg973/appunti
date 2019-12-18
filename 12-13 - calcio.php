<?php
/*
calciatori (nome, cognome, nascita, valore, squadra)
			‾‾‾‾  ‾‾‾‾‾‾‾  ‾‾‾‾‾‾‾
foreign key (squadre.nome, squadre.città) REFERENCES squadre(nome, città)
ON UPDATE CASCADE ON DELETE 

squadre (nome, città, anno_fondazione)
		 ‾‾‾‾  ‾‾‾‾‾

calciatori
'	'   '
+---+---+
	'
	'
	'
	+
	|
	|
squadre


*/
"SELECT 
	s.name,
	s.città,
	s.data_fondazione,
	count(*),
	SUM(c.valore) AS valore_squadra
 FROM squadre AS s
 LEFT JOIN calciatori AS c ON a.squadre=s.nome AND s.città = c.città
 GROUP BY s.nome
 ";
//Per ogni anno quante squadre sono state fondate
"SELECT
	count(*),
	GROUP_CONCAT(CONCAT(s.città, ' ', s.nome))
FROM v_squadre as s
GROUP BY s.data_fondazione";
?>
<!--Pagina-->
<?php
include "database.php";
$città= $_REQUEST['città'] ?? '';
$stmt = "";
?>