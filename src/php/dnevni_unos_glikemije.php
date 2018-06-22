<?php
header("Access-Control-Allow-Origin: *");
header('Access-Control-Allow-Methods: GET, POST');
header('Access-Control-Allow-Headers: Origin, Content-Type, X-Auth-Token , Authorization, Token, token, TOKEN');

include("functions.php");

if (isset($_POST['vrednostGlikemije']) && isset($_POST['datumUnosa']) && isset($_POST['vremeUnosa'])) {

//    && isset($_POST['token'])

    $vrednostGlikemije = htmlspecialchars($_POST['vrednostGlikemije']);
    $datumUnosa = htmlspecialchars($_POST['datumUnosa']);
    $vremeUnosa = htmlspecialchars($_POST['vremeUnosa']);

    echo dnevniUnosGlikemije($vrednostGlikemije, $datumUnosa, $vremeUnosa);
}
?>