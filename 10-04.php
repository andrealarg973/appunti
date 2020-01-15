<?php
//Content-type: application/pdf
header("Content-type: text/csv");
//Per salvare i file al browser
//filename='' -> nome del file suggerito
header("Content-Disposition: attachment; filename='Reprot.csv'");
header("Content-Disposition: inline");
//Serve per importare una volta sola uno script
include_once("");
?>