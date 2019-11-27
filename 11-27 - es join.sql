/*
UTENTI
---------+----+-------+---------+
id_utente|nome|cognome|indirizzo
‾‾‾‾‾‾‾‾‾
   /\
   ||
   ++---------+ ->(foreign key)
ORDINI		  |
---------|‾‾‾‾‾‾‾‾‾|-----------+------+
id_ordine|id_utenti|data_ordine|totale
‾‾‾‾‾‾‾‾‾
*/

-- Visualizzare tutti gli ordini orfani, con sottoquery
SELECT
FROM ordini AS o
WHERE NOT EXISTS (SELECT 1
	   FROM utenti as U
	   WHERE u.id_utente=o.id_utente) 