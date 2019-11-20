CREATE TABLE impiegati(
cod_imp INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(30),
cognome VARCHAR(30),
data_nascita DATA(),
cod_boss, ...,
FOREIGN KEY (cod_boss) REFERENCES impiegati(cod_imp));