/*
Esempio:
Supponiamo di voler transferire una qta. di denaro da un conto corrente A ad un conto corrente B
1. controllare che ci siano almen 500E nel C/C A
2. togliere 500E dal C/C A
3. aggiungere 500E al C/C B

Quindi un TRANSAZIONE SQL è una sequenza di comand SQL(di tipo DML) che vengoono considerati
ATOMICI nel senso che i comandi vengono eseguiti uno dopo l'altro, ma dal punto
di vista logico vengono considerati come un'unica operazione che si conclude con
due possibili stati: SUCCESS / FAILURE.
In caso di success, le modifiche vengono rese effettive nel database
In caso di failure, le modifiche vengono annullate e si ritorna alla situazione che
c'era prima dell'inizio della transazione

ACID

ATOMICITA' -> i comandi vengono eseguiti uno dopo l'altro, ma dal punto di vista logico vengono considerati come un'unica operazione
CONSISTENZA
ISOLAMENTO -> Nel corso di una transazione, non si modifica il database, ma le modifiche sono visibili sono da chi le sta apportando
D ?

NB: In molti DBMS comandi DDL in una transazione comportano un COMMIT implicito

START TRANSACTION: comando SQL che comunica al DBMS l'inizio di una nuova transazione

COMMIT: comando per confermare e rendere definitive le modifiche realizzate all'interno
		della transazione

ROLLBACK: comando per ripristinare la situazione che c'era all'inizio transazione


START TRANSACTION;
comando sql 1;
comando sql 2;
...
COMMIT
oppure: ROLLBACK se intercetto una condizione di errore

Nel corso della transazione, ogni utente vede le modifiche che sta facendo, ma queste non 
non sono visibili da altri utenti collegati al database
*/
-- SAVEPOINT 

START TRASACTION
UPDATE conti
SET saldo = salod - 5
WHERE iban = 'mario';

SAVEPOINT S1;

UPDATE conti
SET saldo = saldo + 5
WHERE iban = 'luigi';

SAVEPOINT S2;

-- Nel caso qualcosa vada storto torno ad un savepoint
ROLLBACK TO S1;

/*
Nel caso che più transazioni avvengono contemporaneamente modificano lo stesso record.
E' possibile definire regole nel database per gestire quest'eccezione:
1. blocco il record: ho iniziato a modificarlo, le altre non possono (di default per molti DB)
2. solo quando è arrivato il commit, il DBMS va a vedere se ce ne sono state altre per
   lo stesso record

PER PHP
$pdo->beginTransaction();
...
...
...
$pdo->commit();
$pdo->rollback();
*/