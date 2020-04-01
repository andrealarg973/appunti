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

SELECT *
FROM utenti AS u
LEFT JOIN ordini AS o
ON u.id_utente = o.id_utente
WHERE o.id_utente = NULL

SELECT
	u.id_utente,
	u.nome,
	u.cognome
	count(o.id_ordine) AS cont
FROM utenti AS u
LEFT JOIN ordini AS o ON u.id_utent=o.id_utente
GROUP BY u.id_utente, u.nome, u.cognome

-- **********
-- 2020-04-01
-- **********
/*
Ogni persona ha più numeri di telefono e più indirizzi di posta elettronica

persone(cf(pk), nome, cognome, sesso, ...)
telefoni(cf, numero, ...) pk(cf, numero)
email(cf, email, descrizione, ...) pk(cf, email)
*/
create view v_persone as
select 
	p.cf,
	p.nome,
	p.cognome,
	p.sesso,
	count(distinct t.numero) as n_numeri,
	count(distinct e.email) as n_email
from persone as p
left join telefoni as t on t.cf = p.cf
left join email as e on e.cf = p.cf
group by p.cf, p.nome, p.cognome, p.sesso


-- Media numeri telefoni e email in base al sesso
select
	p.sesso,
	avg(p.n_numeri) as avg_numeri,
	avg(p.n_email) as avg_email
from v_persone as p
group by p.sesso


select
	p.sesso,
	avg(p.n_numeri) as avg_numeri,
	avg(p.n_email) as avg_email
	from (select 
			p.cf,
			p.nome,
			p.cognome,
			p.sesso,
			count(distinct t.numero) as n_numeri,
			count(distinct e.email) as n_email
		from persone as p
		left join telefoni as t on t.cf = p.cf
		left join email as e on e.cf = p.cf
		group by p.cf, p.nome, p.cognome, p.sesso) as p
group by p.sesso