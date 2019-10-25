<?php
/*
 ----- VINCOLI -----

Condizione che deve essere verificata dai record di una tabella:
	1. Vincoli INTRA-RELAZIONALI (solo record di una tabella) -> la data di morte deve essere successiva alla data di nascita
		- di opzionalità -> NOT NULL / NULL
		- di chiave primaria (PRIMARY KEY) -> uno o più campi della tabella per i quali non sono consentite ripetizioni e non sono consentiti valori nulli; valori unici
		CREATE TABLE persone (
			CF VARCAHR(16) PRIMARY KEY,
			nome VARCHAR(30) NOT NULL
			cognome VARCHAR(80) NOT NULL
			sesso VARCHAR(3) NOT NULL DEFAULT 'ND' -> di default 'ND'
		)

		CREATE TABLE cityes(
			cod_nazi CHAR(2),
			nome VARCHAR(80),
			popolazione INT,
			superficie INT,
			lat NUMERIC(9,6),-> NUMERIC(quante cifre uso,quante di queste per la virgola)
			lon NUMERIC(9,6), -> NUMERIC è unisgned, uguale a DECIMAL
			PRIMARY KEY(cod_nazi, nome) -> chiave unica per 2 colonne, l'ordine è importante perchè crea un indice; diciamo che c'è UNA chiave promaria composta da 2 attributi
			+-------+
			|IT  	|
			+-------+
			|ancona |->sa dove deve andare a cercare nel database solo se è
			|venezia|->unico
			+-------+
			|UK		|
			+-------+
			|londra |
			|manches|
			+-------+
			SELECT * FROM cityes WHERE name='procuna' -> deve fare la scansione di tutto il database
			SELECT * FROM cityes WHERE cod_nazi='IT' -> usa l'indice per dire tutte le città in italia
		)

		- di chiave unica (UNIQUE KEY) -> uguale a PRIMARY KEY, la differenza è che sono ammessi valori NULL a meno che non sia specificato; di PRIMARY KEY ce ne può essere solo una per tabella, di UNIQUE KEY quanti ne vuoi
	
		CREATE TABLE automezzi(
			targa VARCHAR(12) PRIMARY KEY,
			n_telaio VARCHAR(30) UNIQUE KEY NOT NULL,
			.
			.
		)

		+-----------------------+
		|		AUTOMEZZI		|
		+-----------------------+
		|TARGA(PK)	|			|
		|			|			|
		|			|			|
		|			|			|

		- condizione sui valori (clausola CHECK)

	2. Vincoli INTER-RELAZIONALI (sono convolte pi tabelle) -> nella tabella persone posso inserire un codice lingua se e solo se esiste in una altra tabella; la tua comune di nascita lo posso inserire solo se è presente in una tabella con tutti i codice comune
*/
?>