<?php
/*
SQL -> Linguaggio dichiarativo e logico perchè non do ordini su come fare al DBMS, ma solo che dati voglio


CREATE DATABSE(o SCHEMA) nome_del_database; -> crea il database
DROP DATABASE nome_del_database; -> cancella il database
USE scuola; -> una volta scritta questa linea, va a cercare le tablelle in questo db

CREATE TABLE IF NOT EXISTS persone(
	nome VARCHAR(80),
	telefono VARCHAR(12),
	email VARCAHR(60)
);

--------------------------------------------------------------------------------------------

INSERT INTO persone (nome, telefono, email) VALUES ('gianni', '338498392', 'gianni@virgilio.it');
INSERT INTO persone (nome, email) VALUES ('piero', 'piero@libero.com'); -> telefono sarà NULL -> valore ignoto, inesistente, assenza del valore

--------------------------------------------------------------------------------------------

SELECT colonna1, colonna2 FROM tabella -> Ricerca nel database
SELECT nome, email FROM persone
si ottiene una tabella così formata:
|-------|-----------|
|nome	|telefono	|
|-------|-----------|
|mario 	|3565412874	|
|-------|-----------|
|gigi 	|3565412304	|
|-------|-----------|
|dario 	|3565412985	|
|-------|-----------|
Operazione chiamata 'PROIEZIONE'

SELECT * FROM persone-> seleziona tutte le colonne
SELECT col1, col2 FROM tabella WHERE condizioni -> l'op. di WHERE si chiama 'SELEZIONE'

seleziona tutte le persone con nome è 'mario'
SELECT * FROM persone WHERE nome = 'mario'
si otterrà la tabella:
|-------|-----------|-------|
|nome	|telefono	|email 	|
|-------|-----------|-------|
|mario 	|3565412874	|#######|
|-------|-----------|-------|

SELECT * FROM persone WHERE nome = 'mario' AND telefono <> '3565412874' -> <> o NOT diverso
tabella:
|-------|-----------|-------|
|nome	|telefono	|email 	|
|-------|-----------|-------|

nome di tutte le persone di qui non è noto l'indirizzo email
SELECT nome FROM persone WHERE email IS NULL
tabella:
|-------|
|nome	|
|-------|
|dario 	|
|-------|


La tabella con i risultati si chiama RESULT SET

column LIKE 'gi%'; -> % indica una sequenza di 0 o più caratteri
column LIKE '___'; -> _ rappresenta un carattere

'ciao' LIKE '___' -> false perchè cerca una sequenza di esattamente 3 caratteri
'ciao' LIKE '___%' -> true
--------------------------------------------------------------------------------------------


----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	|-------|-----------|-------|
	|nome	|telefono	|email 	|
	|-------|-----------|-------|
	|mario 	|3565412874	|#######| --> RECORD
	|-------|-----------|-------|
	|gigi 	|3565412304	|#######|
	|-------|-----------|-------|
	|dario 	|3565412985	|NULL	|
	|-------|-----------|-------|
*/
?>