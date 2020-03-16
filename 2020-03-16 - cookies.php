<?php
/*

CLIENT --------> WEB SERVER
http-> protocollo stateless, il server non sa nulla sul client

COOKIE -> una stringa al massimo 4k
stringa che il server fa ... al browser

quando viene inviata una http request, il server risponde con un http response

set-cookie -> è un'intestazione nella http-response per chiedere al browser di memorizzare un cookie(non è altro che una stringa con un nome. Es. dare un ID al browser)

Esempio
set-cookie: nome_cookie = valore
set-cookie: utenteid = 93, lingue = it

FUNZIONAMENTO
1. la prima volta che il borwser si collega al server, il server invia il cookie al browser

2. quando il borwser riceve l'intestazine, il browser memorizza nel disco il valore

3. successivamente, quando il browser invia una http-request viene inviato anche il valore del cookie

I cookie sono salvati nel array super globale $_COOKIES
*/

//Programma per salvare nel browser un valore casuale
if(isset($_COOKIES['numeretto'])) # Se il borwser me l'ha inviato, me lo salvo
{
	$numeretto = $_COOKIES['numeretto'];
}
else # E' la prima volta che il browser si connette al server
{
	$numeretto = rand(100, 999);
	header("set-cookie: numeretto=$numeretto");
}
?>
<html>
	<?="Il cookie numeretto vale: $numeretto"?>
</html>