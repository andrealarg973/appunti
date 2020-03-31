/*
Identificatore surrogato: id, usato quando nella tabella non c'è altro modo per identificare un record

CASO DI IDENTIFICATORE ESTERNO
   matricola
 •		○ 
 |------|-----------+		
+---------------+	|
|				|	|
|	studente	|	|
|				|	|
+---------------+	|
	|	|N	|		|
  nome  | cognome	|
		|-----------+
		|
  ____________
 /			  \
/			   \
\			   /
 \____________/
		|
		|
		|
		|1
+---------------+
|				|
|	università	|--○ a1
|				|--○ a2
+---------------+
	|
	•	
  nome(pk) 	  

- Se l'universo del discordo riguarda solo 1 università, matricola basta per identificare lo studente
- Se l'universo del discordo comprende più università allora la matricola da sola non basta più a identificare lo studente

università(nome, a1, a2, ...)
		   ‾‾‾‾
		   / \
			|
		 	|
studenti(nome_università, matricola, nome, cognome, ...)
		 ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾  ‾‾‾‾‾‾‾‾‾				

ESEMPIO 2


      n_stanza
 •		○ 
 |------|-----------+		
+---------------+	|
|				|	|
|	  stanza	|	|
|				|	|
+---------------+	|
	|	|N	|		|
 posti  |   tv		|
 letto	|-----------+
		|
  ____________
 /			  \
/			   \
\			   /
 \____________/
		|
		|
		|
		|1
+---------------+
|				|
|	albergo		|--○ a1
|				|--○ a2
+---------------+
|---|-------|--			----> coppia di valori per la PK
•	○	    ○1
  nome    città

n_stanza: è un identificatre esterno perchè da solo non permette di identificare la stanza

alberghi(nome, città, stanze,)
		 ‾‾‾‾  ‾‾‾‾‾
		  ^		  ^
		  |		  |
		  |		  +-----+
		  |				|
stanze(nome_albergo, città_albergo, n_stanza, tv, ac, ...)
	   ‾‾‾‾‾‾‾‾‾‾‾‾  ‾‾‾‾‾‾‾‾‾‾‾‾‾  ‾‾‾‾‾‾‾‾

*/				