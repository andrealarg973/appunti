-- Tipi base per date:
DATE		-->	yyyy-mm-gg
TIME		-->	hh:mm:ss
TIMESTAMP 	-->	yyy-mm-gg hh:mm:ss
DATETIME	--> uguale a timestamp ma più ampio

-- Data e ora corrente
CURRENT_DATE
CURRENT_TIME
CURRENT_TIMESTAMP

-- Nella creazione della tabella posso specificare l'arrotondamento
TIMESTAMP(1-6) --> con approsimazione da 1 a 6 cifre dei millisecondi

-- Nel caso dei DMBS MariaDB/MySQL conviene utilizzare il tipo DATETIME al posto di TIMESTAMP
-- perchè permette di rappresentare un intervallo maggiore di date

CREATE TABLE `Persone` (
	`pid` INT(11) PRIMARY KEY,
	`nome` VARCHAR(50) NOT NULL,
	`cognome` VARCHAR(50) NOT NULL,
	`sex` CHAR(1) NOT NULL,
	`comune_nascita` CHAR(4) NOT NULL,
	`data_nascita` DATETIME NOT NULL)
-- visualizzare le persone nate nel 2001
select *
from persone
where data_nascita >= '2001-01-01'
and   data_nascita <  '2002-01-01'

-- Usando between con le date viene selezionato fino a 
-- '2001-12-31 00:00:00', perdendo l'ultimo giorno.
-- Si può risolvere '2001-12-31 23:59:59'
select *
from persone
where data_nascita between '2001-01-01' and '2001-12-31'

CREATE TABLE logs(
	log_id int auto_increment primary key --> auto_increment viene creato un numero quando un record viene inserito	)
	remote_ip int not null,
	risorsa varchar(300) not null,
	quando datetime default current_timestamp
	)

-- UPDATE -> per modificare un record
update nome_tabella
set camp_1 = val_1,
	camp_2 = val_2
where condizioni

-- DELETE
delete from tabella
where condizioni		