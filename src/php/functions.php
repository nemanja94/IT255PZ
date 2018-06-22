<?php
include("config.php");

if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    die();
}

function checkIfLoggedIn()
{
    global $conn;
    if (isset($_SERVER['HTTP_TOKEN'])) {
        $token = $_SERVER['HTTP_TOKEN'];
        $result = $conn->prepare("SELECT * FROM korisnik WHERE token=?");
        $result->bind_param("s", $token);
        $result->execute();
        $result->store_result();
        $num_rows = $result->num_rows;
        if ($num_rows > 0) {
            return true;
        } else {
            return false;
        }
    } else {
        return false;
    }
}

function login($username, $password)
{
    global $conn;
    $rarray = array();
    if (checkLogin($username, $password)) {
        $id = sha1(uniqid());
        $result2 = $conn->prepare("UPDATE korisnik SET token=? WHERE username=?");
        $result2->bind_param("ss", $id, $username);
        $result2->execute();
        $rarray['token'] = $id;
    } else {
        header('HTTP/1.1 401 Unauthorized');
        $rarray['error'] = "Invalid username/password";
    }
    return json_encode($rarray);
}

function checkLogin($username, $password)
{
    global $conn;
    $password = md5($password);
    $result = $conn->prepare("SELECT * FROM korisnik WHERE username=? AND password=?");
    $result->bind_param("ss", $username, $password);
    $result->execute();
    $result->store_result();
    $num_rows = $result->num_rows;
    if ($num_rows > 0) {
        return true;
    } else {
        return false;
    }
}

function register($username, $password, $firstname, $lastname)
{
    global $conn;
    $rarray = array();
    $errors = "";
    if (checkIfUserExists($username)) {
        $errors .= "Username already exists\r\n";
    }
    if (strlen($username) < 5) {
        $errors .= "Username must have at least 5 characters\r\n";
    }
    if (strlen($password) < 5) {
        $errors .= "Password must have at least 5 characters\r\n";
    }
    if (strlen($firstname) < 3) {
        $errors .= "First name must have at least 3 characters\r\n";
    }
    if (strlen($lastname) < 3) {
        $errors .= "Last name must have at least 3 characters\r\n";
    }
    if ($errors == "") {
        $stmt = $conn->prepare("INSERT INTO `korisnik` (`id`, `firstname`, `lastname`, `username`, `password`, `token`) VALUES (NULL, ?, ?, ?, ?, '');");
        $pass = md5($password);
        $stmt->bind_param("ssss", $firstname, $lastname, $username, $pass);
        if ($stmt->execute()) {
            $token = sha1(uniqid());
            $result2 = $conn->prepare("UPDATE korisnik SET token=? WHERE username=?");
            $result2->bind_param("ss", $token, $username);
            $result2->execute();
            $rarray['token'] = $token;
        } else {
            header('HTTP/1.1 400 Bad request');
            $rarray['error'] = "Database connection error";
        }
    } else {
        header('HTTP/1.1 400 Bad request');
        $rarray['error'] = json_encode($errors);
    }
    return json_encode($rarray);
}

function checkIfUserExists($username)
{
    global $conn;
    $result = $conn->prepare("SELECT * FROM korisnik WHERE username=?");
    $result->bind_param("s", $username);
    $result->execute();
    $result->store_result();
    $num_rows = $result->num_rows;
    if ($num_rows > 0) {
        return true;
    } else {
        return false;
    }
}

function getId()
{
    global $conn;
    $token = $_SERVER['HTTP_TOKEN'];

    $result = $conn->prepare("SELECT id FROM korisnik where token = ?");
    $result->bind_param("s", $token);
    $result->execute();
    $result->bind_result($id);

    while ($row = $result->fetch()) {
        return $id;
    }
}

function dnevniUnosInsulina($vrstaInsulina, $vrednostInsulina, $vremeUnosa, $datumUnosa)
{
    global $conn;
    $rarray = array();
    $token = $_SERVER['HTTP_TOKEN'];

    if (checkIfLoggedIn()) {

        $userId = getId();

        $result2 = $conn->prepare("INSERT INTO insulin (id, datum, vreme, vrednost, vrsta_insulina) values (?, ?, ?, ?, ?)");
        $result2->bind_param("issis", $userId, $datumUnosa, $vremeUnosa, $vrednostInsulina, $vrstaInsulina);
        if ($result2->execute()) {
            $rarray['success'] = $userId;
        } else {
            $rarray['error'] = "Database connection error" . $result2->error;
            //$result2->error
        }
    } else {
        $rarray['error'] = "Please log in";
        header('HTTP/1.1 401 Unauthorized');
    }

    return json_encode($rarray);
}