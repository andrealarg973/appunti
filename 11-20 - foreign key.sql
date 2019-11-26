CREATE TABLE impiegati(
cod_imp INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(30),
cognome VARCHAR(30),
data_nascita DATE,
cod_boss INT, ...,
FOREIGN KEY (cod_boss) REFERENCES impiegati(cod_imp));

/*
+---+-----------+---------------+-----------+
|cod|   nome	|    cognome	| cod_boss	|
+---+-----------+---------------+-----------+
| 1	|	Mattia	|	De Biasi	|	NULL	|
+---+-----------+---------------+-----------+
| 2	|	Mario	|	  Rossi		|	  1		|
+---+-----------+---------------+-----------+
| 3	|	Paolo	|	  Verdi		|	  1		|
+---+-----------+---------------+-----------+
*/

-- Mostra la lista di tutti gli impiegati e quanti sottoposti ha ciascuno
SELECT 
	*,
	(SELECT COUNT(*)
	 FROM impiegati as i1
	 WHERE i1.cod_boss = i.cod_imp) as sottoposti
FROM impiegati as i

-- Creazione viste
CREATE VIEW v_impiegati (cimp, nome, cognome, n_slaves) --> do dei nomi alle colonne 
as SELECT 
	*,
	(SELECT COUNT(*)
	 FROM impiegati as i1
	 WHERE i1.cod_boss = i.cod_imp) as sottoposti
FROM impiegati as i

-- Mostra impiegati con almeno 10 sottoposti usando la vista
SELECT *
FROM v_impiegati
WHERE sottoposti > 10

/*
<?php
$cod = $_REQUEST['codice'] ?? false;
if(!$cod)
{
	echo "Codice impigato non specificato";
	exit();
}
$sql = "SELECT nome, cognome, n_slaves
		FROM v_impiegati
		WHERE cod_imp = $cod";
echo "<code>" . $sql . "\n</code>";
?>
*/