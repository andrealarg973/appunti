/*
GENERALIZZAZIONI (specializzazioni)

DIAGRAMMI EER => Enhanced(potenziato) Entity-Relationship


ES. 1
 targa combustibile
 	•	○
	|   |
	MEZZO --> ENTITA' GENERICA
	/|\
	|||	
 +--+++--------+----------+
 |   		   |		  |
MOTOCICLO	 AUTO		CAMION  --> ENTITA' SPECIALIZZATE
 							|
							○
						 tipo_trasporto

le properietà dell'entità generica vengono passate alle entità specializzate

totale/parziale: 
	- totale: ogni istanza dell'entità generica appartiene ad almeno una delle entità figlie
	- parziale: non è detto che ogni istanza dell'entità generica appartiene ad almeno una delle entità figlie
	- per indicarlo si colora la freccia per il totale, si lascia bianca per il parziale

sovrapposizioni/disgiunti:
	- sovrapposizioni: se un istanza dell'entità generica appartiene a più di una delle entità figlie
	- disgiunti: se un istanza non appartiene a più di una delle entità figlie


ES. 2
	  nome cognome
		|   |  N		   1
		PERSONA----abita----LUOGO -> entità che viene ereditata dalle specializz.
		  / \
(parziale)| | sovrapp.
	+-----+++------+-----------------+
	|			   |			 	 |(per evitare sovrapp. aggiungo un'entità oppure scrivo che ci sono sovrapp.)
LAVORATORE		STUDENTE	LAVORATORE-STUDENTE
 |N				 |N
 | 				 |
lavora in	  iscritto a
 |				 |
 |1				 |1
AZIENDA			  SCUOLA



ES. 3
		MEDICO
		 /\
		 ||
	+----++-----+------------+--------+
	|			|			 |		  |
PEDIATRA	CHIRURGO	ORTOPEDICO	ALTRO

 _______________________________________
|										|
|	TRADUZIONE DELLE GENERALIZZAZIONI	|
|										|
 ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
con es. 2:
sol. 1 -> tabella per l'entità madre + tabelle per entità figlie, in queste foreign key alla primary key della tabella madre
‾‾‾‾‾‾
persone(pid(pk), nome cognome, ...)
		   ^^
		   ||
studenti(pid(pk), scuola, matricola, ...)
		   |
		   |
lavoratori(pid(pk), stipendio, ...)

-- Per comodità creo una vista per essere più veloce per estrarre i dati
CREATE VIEW v_studenti AS
SELECT p.nome, p.cognome, ...
FROM persone AS p
JOIN studenti AS s on p.pid = s.pid -- JOIN e non LEFT JOIN per evitare di prendere le persone che sono nella tab scuola

sol.2 -> una tabella unica con campi flag per sapere a che entità figlia appartiene una persona
‾‾‾‾‾
svantaggi: avrò potenzialmente molti campi nulli, che sprecano spazio

persone(pid(pk), nome, cognome, is_studente, scuola, matricola, ..., is_lavoratore, stipendio, ...)


sol.3 -> tabelle SOLO per le entità figlie dove si riportano gli attributi delle proprietà madre + quella della figlia
‾‾‾‾‾
svantaggi: NON si possono gestire le sovrapposizioni, perchè ci potrebbero essere dati della tabella madre doppi

studenti(pid(pk), nome, cognome, scuola, matricola, ...)

lavoratori(pid(pk), nome, cognome, stipendio, ...)
*/