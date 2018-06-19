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
        $result = $conn->prepare("SELECT * FROM users WHERE token=?");
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
        $result2 = $conn->prepare("UPDATE users SET token=? WHERE username=?");
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
    $result = $conn->prepare("SELECT * FROM users WHERE username=? AND password=?");
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
        $stmt = $conn->prepare("INSERT INTO users (firstname, lastname, username, password) VALUES (?, ?, ?, ?)");
        $pass = md5($password);
        $stmt->bind_param("ssss", $firstname, $lastname, $username, $pass);
        if ($stmt->execute()) {
            $id = sha1(uniqid());
            $result2 = $conn->prepare("UPDATE users SET token=? WHERE username=?");
            $result2->bind_param("ss", $id, $username);
            $result2->execute();
            $rarray['token'] = $id;
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
    $result = $conn->prepare("SELECT * FROM users WHERE username=?");
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

function dnevniUnos($insulin, $datumDu, $kolicinaJedinica, $token)
{
    global $conn;
    $rarray = array();

    if (checkIfLoggedIn()) {

        $stmt = $conn->prepare("SELECT id FROM users where token = ?");
        $stmt->bind_param("s", $token);
        $stmt->execute();

        $row = $stmt->fetch_assoc();
        $user_id = $row['id'];

        $stmt = $conn->prepare("INSERT INTO dnevni_unos (KORISNIK_ID, INSULIN, DATUM_DU, KOLICINA_JEDINICA) values (?, ?, ?, ?)");
        $stmt->bind_param("issi", $user_id, $insulin, $datumDu, $kolicinaJedinica);

        if ($stmt->execute()) {
            $rarray['success'] = "ok";
        } else {
            $rarray['error'] = "Database connection error" . $stmt->error;
        }

    } else {
        $rarray['error'] = "Please log in";
        header('HTTP/1.1 401 Unauthorized');
    }
    return json_encode($rarray);
}