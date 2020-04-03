/*
GENERALIZZAZIONI (specializzazioni)

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




		MEDICO
		 /\
		 ||
	+----++-----+------------+--------+
	|			|			 |		  |
PEDIATRA	CHIRURGO	ORTOPEDICO	ALTRO





*/	