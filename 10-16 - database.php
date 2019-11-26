<?php
/*
DATABASE -> raccolta di dati correlati
DBMS(DataBase Management System) -> si occupa di gestire l'interazione tra l'applicazione e il database || applicazione che fornisce le funzioni per l'accesso ai dati da parte di programmi/utenti:
	- definire la struttura dei dati;
	- ricerca dei dati in modo efficiente (veloce)
	- possibilità di lavorare con grandi(enormi->terabyte di dati) quantità di dati
	- accesso simultaneo/gestione concorrenza
	- gestisce le operazioni di manipolazione dei dati -> inserimento/aggiornamento/cancellazione
	- sicurezza -> meccanismi per il recupero automatico dell'ultima situazione valida prima di un errore fatale(hardisk che si rompe, corrente che salta...) && programmi per la gestione dei backup
	- privacy dei dati(privatezza) -> possibilità di stabilire regole per l'accesso ai dati, privilegi

Esistono vari tipi di DMBS: 
	- orientati agli oggetti,
	- reticolari,
	- orientati al documento,
	- gerarchici, 
	- RELAZIONALI -> RDMBS, si può pensare a una tabella

Il linguaggio pi diffuso per comunicare con un RDBMS si chiama SQL (Structured Query Language):
	- DDL -> Data Definition Language
	- DML -> Data Manipulation Language -> inserimento/aggiornamento/cancellazione
	inserisco dei dati|modifico il contenuto|aggiungo la colonna email
	+-------+-----------+-------+
	|nome	|telefono	|email 	|
	|-------|-----------|-------|
	|mario 	|3565412874	|#######|
	+-------+-----------+-------+

	
	- QL(sottoinsieme del DML) -> Query Language per le operazioni di ricerca nel database, dette QUERY o interrogazioni

ESEMPI DI DBMS DIFFUSI:
	- OACLE -> commerciale, per aziende
	- SQL Server (Microsoft) -> commerciale
	- Access (Microsoft) -> per piccole applicazioni
	- MySQL(comprato da ORACLE)/MariaDB -> gratuiti e open source
	- PostgreSQL
	- SQLite -> totalmente gratuito, molto leggero, limite: monoutente, database interno di molti browser e applicazioni

Nei database MySQL, MaridaDB le tabelle si organizzano in gruppi chiamati 'database' o 'schema'(insieme di tabelle)
*/
//----------------------------------------------------------------------
//----------------------------------------------------------------------
/*
CREATE TABLE table_name (
	nome VARCHAR(80),
	telefono VARCHAR(12),
	email VARCHAR(60)
);
crea la tavola vuota
+-------+-----------+-------+
|nome	|telefono	|email 	|
+-------+-----------+-------+
|	 	|			|		|
+-------+-----------+-------+
*/
?>