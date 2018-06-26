<?php
header("Access-Control-Allow-Origin: *");
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Origin, Content-Type, X-Auth-Token , Authorization, Token, token, TOKEN');

include("functions.php");

if (isset($_POST['firstName']) && isset($_POST['lastName']) && isset($_POST['stariUsername']) && isset($_POST['noviUsername']) && isset($_POST['password'])) {

    $firstname = $_POST['firstName'];
    $lastname = $_POST['lastName'];
    $stariUsername = $_POST['stariUsername'];
    $noviUsername = $_POST['noviUsername'];
    $password = $_POST['password'];

    echo izmeniKorisnika($stariUsername, $noviUsername, $password, $firstname, $lastname);

}
?>