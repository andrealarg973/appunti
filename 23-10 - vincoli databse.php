<?php
/*
 ----- VINCOLI -----

Condizione che deve essere verificata dai record di una tabella:
	1. Vincoli INTRA-RELAZIONALI (solo record di una tabella) -> la data di morte deve essere successiva alla data di nascita
		- di opzionalità -> NOT NULL / NULL
		- di chiave primaria (PRIMARY KEY) -> uno o più campi della tabella per i quali non sono consentite ripetizioni e non sono consentiti valori nulli; valori unici
		*/
		"CREATE TABLE persone (
			CF VARCAHR(16) PRIMARY KEY,
			nome VARCHAR(30) NOT NULL
			cognome VARCHAR(80) NOT NULL
			sesso VARCHAR(3) NOT NULL DEFAULT 'ND' -> di default 'ND'
		)"

		"CREATE TABLE cityes(
			cod_nazi CHAR(2),
			nome VARCHAR(80),
			popolazione INT,
			superficie INT,
			lat NUMERIC(9,6), --> NUMERIC(quante cifre uso,quante di queste per la virgola)
			lon NUMERIC(9,6), --> NUMERIC è unisgned, uguale a DECIMAL
			PRIMARY KEY(cod_nazi, nome) --> chiave unica per 2 colonne, l'ordine è importante perchè crea un indice; diciamo che c'è UNA chiave promaria composta da 2 attributi
			"/*
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
			*/
			"SELECT * FROM cityes WHERE name='procuna' -> deve fare la scansione di tutto il database"
			"SELECT * FROM cityes WHERE cod_nazi='IT' -> usa l'indice per dire tutte le città in italia"
			/*
		)

		- di chiave unica (UNIQUE KEY) -> uguale a PRIMARY KEY, la differenza è che sono ammessi valori NULL a meno che non sia specificato; di PRIMARY KEY ce ne può essere solo una per tabella, di UNIQUE KEY quanti ne vuoi
*/	
		"CREATE TABLE automezzi(
			targa VARCHAR(12) PRIMARY KEY,
			n_telaio VARCHAR(30) UNIQUE KEY NOT NULL,
			.
			.
		)"
/*
		+-----------------------+
		|		AUTOMEZZI		|
		+-----------------------+
		|TARGA(PK)	|			|
		|			|			|
		|			|			|
		|			|			|

		- vincolo sui valori (clausola CHECK)
		+-------------------------------+
		|			PAZIENTI			|
		+-------------------------------+
		|CF|nome|cognome|d_nascita|peso |
*/
		"CREATE TABLE pazienti (
		 CF varchar(16) PRIMARY KEY,
		 nome varchar(30) NOT NULL CHECK(nome in ('piero', 'piera')),
		 cognome varchar(30) NOT NULL,
		 data_nascita date NOT NULL CHECK(data_nascita > '1900-01-01')
		 peso decimal(4, 1) NOT NULL CHECK(peso > 0 AND peso < 250)
		 data_morte date NULL,
		 UNIQUE KEY (nome, cognome, data_nascita),
		 CHECK(data_morte >= data_nascita))"

/*
	2. Vincoli INTER-RELAZIONALI (sono convolte più tabelle) -> nella tabella persone posso inserire un codice lingua se e solo se esiste in una altra tabella; la tua comune di nascita lo posso inserire solo se è presente in una tabella con tutti i codice comune

	- Vincolo di chiave esterna (VINCOLO DI INTEGRITA' REFERENZIALE)
	
	ARTISTI
	____________________________________________
	COD_ARTISTA	|NOME 	|COGNOME 	|NAZ_NASCITA
	700			|alberto|sordi 		|ITA-----
	907			|antonio|banderas	|ESP-----

	NAZIONI
	_____________
	COD 	|NOME
-->	ITA 	|ITALIA
-->	ESP 	|SPAGNA
*/
	"CREATE TABLE artisti(
	 cod_artista ...,
	 nome ...,
	 cognome ...,
	 naz_nascita char(3) NULL,
	 FOREIGN KEY(naz_nascita) REFERENCES nazioni(cod) --> CHIAVE ESTERNA
	 ON DELETE(_*_)
	 -- OPPURE
	 ON UPDATE(|*|))"

	 /*
	 	_*_ opzioni:
	 	- CASCADE -> cancella anche tutti i record nella tabella artisti il naz_nascita cancellato
		- SET NULL -> cancello la spagna, nella tabella artiti quelli con spagna diventano null
		- NO ACTION -> proibisce l'azione (di default)

		|*| opzioni:
		

	 */

	"CREATE TABLE nazioni(
	 cod char(3) PRIMARY KEY,
	 nome varchar(30) NOT NULL,
	 ...)"
/*
	Se si prova a cancellare ESP non si potrà fare perchè altrimenti antonio banderas non avrà più la naz_nascita
*/
?>