<?php
header("Access-Control-Allow-Origin: *");
header('Access-Control-Allow-Methods: GET, POST');
header('Access-Control-Allow-Headers: Origin, Content-Type, X-Auth-Token , Authorization, Token, token, TOKEN');

include("functions.php");

if (isset($_POST['vrstaInsulina']) && isset($_POST['vrednostInsulina']) && isset($_POST['vremeUnosa']) && isset($_POST['datumUnosa'])) {

//    && isset($_POST['token'])

    $vrstaInsulina = htmlspecialchars($_POST['vrstaInsulina']);
    $vrednostInsulina = htmlspecialchars($_POST['vrednostInsulina']);
    $vremeUnosa = htmlspecialchars($_POST['vremeUnosa']);
    $datumUnosa = htmlspecialchars($_POST['datumUnosa']);
//    $token = $_SERVER['HTTP_TOKEN'];


    echo dnevniUnosInsulina($vrstaInsulina, $vrednostInsulina, $vremeUnosa, $datumUnosa);
}
?>