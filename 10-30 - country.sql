SELECT DISTINCT CountryCode FROM city -> DISTINCT toglie le ripetizioni

select count(*)
from 
	(select DISTINCT CountryCode
	from city) as t


-- individuare le nazioni senza città
select *
from 
	(select 
		code, 
		name,
		(select count(*)
		 from city as ci
		 where ci.CountryCode = co.code) as num_cities
	from country as co) as t
where num_cities = 0

/*
+----------------------------------+
|			IN VERIFICA			   |
+----------------------------------+
*/
-- vizualizzare tutte le città di spagna, francia e italia
-- con almeno mezzo milione di abitanti

select *
from city
where (CountryCode = 'FRA' OR
	  CountryCode = 'ITA' OR
	  CountryCode = 'ESP') AND
	  Population >= 500E3
ORDER BY Population DESC

-- bisogna prestare attenzione all' AND

-- vizualizzare tutte le città di spagna, francia e italia
-- con almeno mezzo milione di abitanti
select *
from city
where 
	city.CountryCode in ('FRA', 'ITA', 'ESP')
ORDER BY Population DESC

-- IN -> operatore logico che da true o false
-- al suo interno si può fare una sotto query con più record MA con una sola colonna


-- Visualizzare ttue le nazioni con metrolopoli di
-- almeno 2E6 abitanti

select *
from country
where code in ( -- negazione con NOT IN
	select CountryCode
	from city
	where Population >= 2E6)