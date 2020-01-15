<?php  
/*LIBRERIA*/

$query = "SELECT 
		  		u.nome,
		  		u.cognome,
		  		count(p.u_code) AS n_prestiti
		  FROM utenti AS u
		  LEFT JOIN prestiti AS p ON u.u_code=p.u_code
		  GROUP BY u.nome, u.cognome";

/*
Dato un record di una tabella con quanti record è associato ad un altra?
ZAMPA DI CORVO
 	 		+______ PRESTITI
UTENTI +____+______ PRESTITI
	 		+______ PRESTITI

se non c'è una opzionalità la linea è tratteggiata
Relazione uno a uno si considera al MASSIMO una relazione
*/

?>