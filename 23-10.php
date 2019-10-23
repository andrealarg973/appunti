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
		- di opzionalità -> NOT NULL / NULL
		- di chiave primaria (PRIMARY KEY) -> uno o più campi della tabella per i quali non sono consentite ripetizioni e non sono consentiti valori nulli; valori unici
		CREATE TABLE persone (
			CF VARCAHR(16) PRIMARY KEY,
			nome VARCHAR(30) NOT NULL -> il valore è obbligatorio
			cognome VARCHAR(80) NOT NULL
		)

		- di chiave unica (UNIQUE KEY)
		- condizione sui valori (clausola CHECK)

	2. Vincoli INTER-RELAZIONALI (sono convolte pi tabelle) -> nella tabella persone posso inserire un codice lingua se e solo se esiste in una altra tabella; la tua comune di nascita lo posso inserire solo se è presente in una tabella con tutti i codice comune
*/
?>