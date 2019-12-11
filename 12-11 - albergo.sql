/*

alberghi(cod_albergo, nome, via, città, n_starts, telefono, fax, email, ...)
		 ‾‾‾‾‾‾‾‾‾‾‾
		    ^
			|
	+-------+
	|	uk: telefono
	|	uk: fax
	|	uk: email
	|	uk: nome, città
	+-------+
			|
stanze(cod_albergo, n_stanza, posti_letto, bagno_privato, area_condizionata, riscaldamento, prezo_rif)
	   ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
*/
-- Per ogni città quanti posti letto ci sono con area condizionata
-- e bagno privato
SELECT
	a.città,
	COUNT(*) AS tot_stanze,
	SUM(s.posti_letto) AS tot_posti_letto
FROM stanze AS s
JOIN alberghi AS a ON s.cod_albergo = a.cod_albergo
WHERE s.bagno_privato = 1 AND s.area_condizionata = 1 -- oppure IS TRUE
GROUP BY a.città
-- Se ho raggruppato su c1, c2, c3, allora nella clausola select e nella clausola
-- having posso usare solo: 
--	- I campi su cui ho raggruppato,
--  - Funzioni di gruppo applicate agli alti campi

-- Trovare tutti gli alberghi di Belluno di almeno 3 stelle che hanno almeno 10
-- posti letto con l'area condizionata
SELECT
	a.cod_albergo,
	a.nome,
	a.n_starts
FROM alberghi AS a
WHERE 
	  a.città = "Belluno" AND
	  a.n_starts >= 3 AND 
	  (SELECT s.posti_letto
	   FROM stanze AS s
	   WHERE s.cod_albergo = a.cod_albergo
	   AND s.area_condizionata = 1) >= 10