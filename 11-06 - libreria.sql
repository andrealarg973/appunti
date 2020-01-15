utenti(U_ID(pk), nome, cognome, data_nascita, cf(UK))
prestiti(U_ID(pk), L_ID(pk), data_prestito(pk), data_restituzione) --> prestito di 30 giorni
libri(L_ID, titolo, autore, anno)

-- visualizzare gli utenti con prestiti in corso
SELECT u.*
FROM utenti as u
WHERE (SELECT COUNT(*)
	   FROM prestiti as p
	   WHERE p.U_ID = u.U_ID
	   AND p.data_restituzione IS NULL) >= 1

-- EXISTS viene messo prima di una sottoquery
-- e controlla se restituisce o no dei risultati
SELECT u.*
FROM utenti as u
WHERE EXISTS --> o NOT EXISTS
	  (SELECT 'esisto'
	   FROM prestiti as p
	   WHERE p.U_ID = u.U_ID
	   AND p.data_restituzione IS NULL)

-- Tutti i libri che sono stati presi in prestito almeno una volta
SELECT *
FROM libri AS l
WHERE EXISTS
	(SELECT *
	 FROM prestiti AS p
	 WHERE p.L_ID = l.L_ID)
-- Usando IN
SELECT *
FROM libri AS l
WHERE l.L_ID IN
	(SELECT L_ID
	 FROM prestiti)

-- Visualizzare gli utenti con prestiti scaduti
SELECT
FROM utenti AS u
WHERE u.U_ID IN
	(SELECT p.U_ID
	 FROM prestiti
	 WHERE p.data_restituzione IS NULL
	 AND p.data_prestito + INTERVAL 30 DAY < CURRENT_DATE) --> INTERVAL 30 DAY è un intervallo di tempo che può essere sommat e sottratto

-- Per ogni utente tempo medio in giorni prima della sostituzione 
SELECT
	u.U_ID,
	u.nome
	(SELECT AVG(TIMESTAMPDIFF(DAY, p.data_prestito, p.data_restituzione))
	 FROM prestiti as p
	 WHERE p.data_restituzione IS NOT NULL
	 AND p.U_ID = u.U_ID) as prestito_medio
FROM utenti as u
