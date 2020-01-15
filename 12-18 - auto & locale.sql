SELECT 
	a.targa,
	a.marca,
	if(a.cod_cliente is null, 'in sede', e.cod_cliente)
FROM auto as a
join cliente as e on a.cod_cliente = e.cod_cliente

SELECT 
	EXISTS(SELECT 1 FROM DUAL WHERE 1=0)
FROM DUAL

-- Tutti i bar per cui ci sono recensioni
SELECT *
FROM locali AS l
WHERE l.tipo_locale = 'bar' AND
	  EXISTS(SELECT 1
	  FROM recensioni AS r
	  WHERE r.cod_locale = l.cod_locale
	  AND r.voto = 0)