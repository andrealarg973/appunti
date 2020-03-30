<?php
include_once "../database.php";

// Funzione che trasferisce un importo di denaro dal un conto ad un altro
function trasferisci($pdo, $iban_partenza, $iban_arrivo, $amount)
{
	$op_riuscita = false;
	// Inizio transazione
	try
	{
		$pdo->beginTransaction();

		// Controllo se $iban_partenza ha saldo suff.
		$sql = "SELECT saldo FROM conti WHERE iban=? AND saldo >= ?";
		$stmt = $pdo->prepare($sql);
		$stmt->execute([$iban_partenza, $amount]);
		// Se il saldo non è sufficente eseguo un rollback e poi restituisco FALSE
		if($stmt->rowCount() !== 1)
		{
			echo "saldo insufficiente e/o iban invalido<br>";
			$pdo->rollback();
			return false;
		}

		// Tolgo i soldi da $iban_partenza 
		$sql = "UPDATE conti SET saldo = saldo - ? WHERE iban = ?";
		$stmt = $pdo->prepare($sql);
		$n_rows = $stmt->execute([$amount, $iban_partenza]);
		if($n_rows !== true)
		{
			$pdo->rollback();
			return false;
		}

		// Aggiungo i sodli a $iban_arrivo
		$sql = "UPDATE conti SET saldo = saldo + ? WHERE iban = ?";
		$stmt = $pdo->prepare($sql);
		$n_rows = $stmt->execute([$amount, $iban_arrivo]);
		if($n_rows !== true)
		{
			$pdo->rollback();
			return false;
		}

		// Confermo modifiche (commit)
		$pdo->commit();
		$op_riuscita = true;
	}catch(Exeception $e)
	{
		// Se si verifica qualsiasi eccezione eseguo un rollback
		$pdo->rollback();
		$op_riuscita = false;
	}

	return $op_riuscita;
}
echo trasferisci($pdo, 'gjergji', 'del chin', 5)===true ? "ok" : "ko";
?>