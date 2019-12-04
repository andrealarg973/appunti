/*
PERSONE
+--+----+-------+------------+---+
|id|nome|cognome|data_nascita|sex|
+--+----+-------+------------+---+
|7 |ug  |gat    |1999-01-30  |F  |
|8 |sak |badat  |1999-04-15  |M  | 
|9 |uy  |may    |2000-04-20  |F  |
|10|uy  |gat    |2001-10-17  |F  |
+--+----+-------+------------+---+
*/
--  Estrarre solo l'anno dalla data di nascita
SELECT
	id,
	nome,
	cognome,
	data_nascita,
	EXTRACT(YEAR FROM data_nascita) --> per estrarre da un dato temporale singole componenti
FROM persone

-- Conteggio nomi ragruppati con freq > 2
SELECT
	nome,
	count(*) AS freq_nome
FROM persone
GROUP BY nome
HAVING count(*) >= 2

-- Considerando i 2000 quanti nomi sono stati dati
SELECT
	id,
	nome,
	data_nascita
FROM persone
WHERE data_nascita >= '2000-01-01' AND data_nascita < '2001-01-01'
-- OPPURE
EXTRACT(YEAR FROM data_nascita) = 2000
-- OPPURE
YEAR(data_nascita) = 2000

-- Visualizzare per ogni anno quante persone sono nate
SELECT
	YEAR(data_nascita) AS anno,
	COUNT(*) AS count
FROM persone
GROUP BY YEAR(data_nascita)
ORDER BY anno

-- Quanti maschi e quanti femmine sono nate ogni anno
SELECT
	YEAR(data_nascita) AS anno,
	sex,
	COUNT(*) AS cont
FROM persone
GROUP BY YEAR(data_nascita), sex
ORDER BY anno, sex

-- FUNZIONE IF
IF(condizione, val_vero, val_falso)

SELECT
	nome,
	sex,
	IF(sex = 'F', 1,0)
FROM persone
-- AS VALORE

-- Visualizzare quanti M e F ci sono e in che percentuale rispetto
-- al totale
SELECT
	SUM(valore) AS tot,
	COUNT(*) - SUM(valore) AS diff,
	SUM(valore)/COUNT(*) * 100 AS percentuale
FROM valore

-- Visualizzare per ogni anno quanti maschi
SELECT 
	YEAR(data_nascita) AS anno, 
	SUM(IF(sex='F',1,0)) AS cont_f,
	SUM(IF(sex='F',1,0))/COUNT(*) AS percentuale_f
FROM persone
GROUP BY(data_nascita)
-- 7. Visualizzare il codice ed il nominativo completo (miss nome cognome le donne,
-- mister nome cognome gli uomini) degli impiegati che hanno cambiato di qualifica
-- (tabella titles) esattamente 3 volte e che hanno lavorato o lavorano come
-- manager di un dipartimento.
SELECT 
	e.emp_no,
	CONCAT(IF(e.gender = 'M', 'Mister', 'Miss'), ' ', e.first_name, ' ', e.last_name) as nominativo
FROM employees as e
WHERE (SELECT COUNT(*)
	   FROM titles as t
	   WHERE t.emp_no=e.emp_no
	   GROUP BY t.emp_no) = 3