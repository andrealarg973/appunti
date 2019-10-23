<?php
/*
Collegarsi con un socket con porta 80,
poi leggo la risposta->4,5 linee di intestazione e poi il la pagina
+-----------------------+------+
|GET / HTTP/1.1			|CR LF |
+-----------------------+------+
|Host: www.repubblica.it|CR LF |
+-----------------------+------+
*/
_________________________________________________________________________________________
-----------------------------------------------------------------------------------------
/*
 ----- VINCOLI -----

Condizione che deve essere verificata dai record di una tabella:
	1. Vincoli INTRA-RELAZIONALI (solo record di una tabella) -> la data di morte deve essere successiva alla data di nascita
	2. Vincoli INTER-RELAZIONALI (sono convolte pi tabelle) -> nella tabella persone posso inserire un codice lingua se e solo se esiste in una altra tabella; la tua comune di nascita lo posso inserire solo se è presente in una tabella con tutti i codice comune
*/
?>