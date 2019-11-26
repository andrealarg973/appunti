-- OPERAZIONE DI INNER JOIN
-- Seleziona dalla tabella delle persone e delle nazioni
SELECT 
	p.*,
	n.*
FROM persone AS p,
	 nazioni AS n
-- Con questa query ottengo tutte le possibili coppie per ogni campo,
-- da due tabelle con 3 record ciascuna, otterrei una tabella con 9 record.
-- Detto prodotto cartesiano -> AxB = {(a,b) | a=A, b=B}

-- Associa solo i record con la nazione uguale
SELECT 
	p.*,
	n.*
FROM persone AS p,
	 nazioni AS n
WHERE p.nazione = n.nazione

-- OPPURE
SELECT
	p.nazione,
	n.nome
FROM persone AS p
/*INNER*/ JOIN nazioni AS n ON p.nazione = n.nazione

-- OUTER JOIN



-- LEFT JOIN
-- Associa i valori secondo la condizione dell' ON, e con i record NULL crea
-- un record fittizio settato a NULL
SELECT
	p.nome,
	p.nzione,
	n.nome
FROM persone AS p
LEFT JOIN nazioni AS n ON p.nazione = n.nazione

-- RIGHT JOIN
-- Join interno + record della tabella destra che non 
-- hanno associazioni con l'altra tablella
SELECT
	p.*,
	n.*
FROM persone AS p
RIGHT JOIN nazioni AS n ON n.nazioni = p.nazioni


-- FULL OUTER JOIN (non implementato)
-- Prende tutti i record + i record non associati da entrambe le tabelle