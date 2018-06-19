<?php
header("Access-Control-Allow-Origin: *");
header('Access-Control-Allow-Methods: GET, POST');
header('Access-Control-Allow-Headers: Origin, Content-Type, X-Auth-Token , Authorization, Token, token, TOKEN');

include("functions.php");

if (isset($_POST['insulin']) && isset($_POST['datumDu']) && isset($_POST['kolicinaJedinica']) && isset($_POST['token'])) {

//    && isset($_POST['token'])

    $insulin = htmlspecialchars($_POST['insulin']);
    $datumDu = htmlspecialchars($_POST['datumDu']);
    $kolicinaJedinica = htmlspecialchars($_POST['kolicinaJedinica']);
//    $token = htmlspecialchars($_SERVER['HTTP_TOKEN']);
    $token = htmlspecialchars($_POST['token']);

    echo dnevniUnos($insulin, $datumDu, $kolicinaJedinica, $token);
}
?>