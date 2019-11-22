/*
AVG, COUNT, MIN, MAX, SUM |

GROUP_CONCAT -> Concatenazione di stringhe all'interno di un gruppo

cities
+-----------+---------------+-----------+
|	NAZIONE	|	  CITTA'	|	 POP	|
+-----------+---------------+-----------+
|	ITALIA	|	 MILANO		|  1700000	|
|	ITALIA	|	  ROMA		|  2800000	|
|	ITALIA	|	SIRACUSA	|  300000	|
|	SPAGNA	|	VALENCIA	|  3200000	|
|	SPAGNA	| SAN SEBASTIAN	|	200000	|
|	SPAGNA	|	 MALAGA		|	550000	|
+-----------+---------------+-----------+
*/
SELECT GROUP_CONCAT(città) as c
FROM cities
--			||
--			\/
/*
+---------------------------------------------------+
|	 					c							|
+---------------------------------------------------+
|milano,roma,siracusa,valencia,san sebastian,malaga |
+---------------------------------------------------+
*/
SELECT 
	nazione,
	GROUP_CONCAT(città) as all_cities
FROM cities
GROUP BY nazione
/*
+-----------+---------------------------------------+
|	ITALIA	|	  milano,roma,siracusa				|
|	SPAGNA	|	  valencia,san sebastain, malaga	|
+-----------+---------------------------------------+
*/
-- Per ogni nazione della tabella cities elenco tutte le città 
-- con pop superiore ai 200'000 e conteggio delle stesse
SELECT
	nazione,
	GROUP_CONCAT(città),
	count(*)
FROM cities
WHERE pop > 200000
GROUP BY nazione
HAVING count(*) > 100