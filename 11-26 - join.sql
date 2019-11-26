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
JOIN nazioni AS n 
	ON p.nazione = n.nazione