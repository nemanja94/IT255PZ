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
        $stmt = $conn->prepare("INSERT INTO korisnik (id, firstname, lastname, username, password, token) VALUES (NULL, ?, ?, ?, ?, '');");
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

function dnevniUnosInsulina($vrstaInsulina, $vrednostInsulina, $vremeDatumUnosa)
{
    global $conn;
    $rarray = array();

    if (checkIfLoggedIn()) {

        $userId = getId();
        $tip_unosa = "Insulin";

        $result2 = $conn->prepare("INSERT INTO istorija_merenja (id, DATUM_I_VREME_IM, VREDNOST, TIP_INSULINA, TIP_UNOSA) values (?, ?, ?, ?, ?)");
        $result2->bind_param("isiss", $userId, $vremeDatumUnosa, $vrednostInsulina, $vrstaInsulina, $tip_unosa);
        if ($result2->execute()) {
            $rarray['success'] = 'ok';
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

function dnevniUnosGlikemije($vrednostGlikemije, $vremeDatumUnosa)
{
    global $conn;
    $rarray = array();

    if (checkIfLoggedIn()) {

        $userId = getId();
        $tip_unosa = "Glikemija";

        $result2 = $conn->prepare("INSERT INTO istorija_merenja (id, DATUM_I_VREME_IM, VREDNOST, TIP_INSULINA, TIP_UNOSA) VALUES (?, ?, ?, 'null', ?);");
        $result2->bind_param("isis", $userId, $vremeDatumUnosa, $vrednostGlikemije, $tip_unosa);
        if ($result2->execute()) {
            $rarray['success'] = 'ok';
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

function getDnevnik()
{
    global $conn;
    $rarray = array();
    $user_id = getId();
    $zapisi = array();
    $zapis = array();

    if (checkIfLoggedIn()) {

        $stmt = $conn->prepare('SELECT  
                                        istorija_merenja.ISTORIJA_MERENJA_ID,                                       
                                        istorija_merenja.DATUM_I_VREME_IM, 
                                        istorija_merenja.VREDNOST, 
                                        istorija_merenja.TIP_INSULINA, 
                                        istorija_merenja.TIP_UNOSA 
                                        FROM  istorija_merenja
                                        where id=?');

        $stmt->bind_param('i', $user_id);
        $stmt->bind_result($v1, $v2, $v3, $v4, $v5);
        $stmt->execute();

        while ($row = $stmt->fetch()) {

            $zapis['ISTORIJA_MERENJA_ID'] = $v1;
            $zapis['DATUM_I_VREME_IM'] = $v2;
            $zapis['VREDNOST'] = $v3;
            $zapis['TIP_INSULINA'] = $v4;
            $zapis['TIP_UNOSA'] = $v5;

            array_push($zapisi, $zapis);
        }


        $rarray['zapisi'] = $zapisi;
        return json_encode($rarray);

    } else {
        $rarray['error'] = "Please log in";
        header('HTTP/1.1 401 Unauthorized');
        return json_encode($rarray);
    }
}

function obirsi_unos($id)
{
    global $conn;
    $rarray = array();

    if (checkIfLoggedIn()) {
        $result = $conn->prepare("DELETE FROM istorija_merenja WHERE ISTORIJA_MERENJA_ID=?");
        $result->bind_param("i", $id);
        $result->execute();
        $rarray['success'] = "Deleted successfully";
    } else {
        $rarray['error'] = "Please log in";
        header('HTTP/1.1 401 Unauthorized');
    }
    return json_encode($rarray);
}

function getHba1c()
{
    global $conn;
    $rarray = array();
    $user_id = getId();
    $zbir_vrednosti_glikemija = 0;
    $brojac = 0;

    if (checkIfLoggedIn()) {

        $stmt = $conn->prepare('SELECT istorija_merenja.VREDNOST FROM istorija_merenja
        where istorija_merenja.id=? and istorija_merenja.TIP_UNOSA="Glikemija"');

        $stmt->bind_param('i', $user_id);
        $stmt->bind_result($v1);
        $stmt->execute();

        while ($row = $stmt->fetch()) {

            $zbir_vrednosti_glikemija += $row['VREDNOST'];
            $brojac++;

        }
        $hbcb1 = $zbir_vrednosti_glikemija / $brojac;


        return json_encode($hbcb1);

    } else {
        $rarray['error'] = "Please log in";
        header('HTTP/1.1 401 Unauthorized');
        return json_encode($rarray);
    }
}

function obirsi_korisnika($id)
{
    global $conn;
    $rarray = array();

    if (checkIfLoggedIn()) {
        $result = $conn->prepare("DELETE FROM korisnik WHERE id=?");
        $result->bind_param("i", $id);
        $result->execute();
        $rarray['success'] = "Deleted successfully";
    } else {
        $rarray['error'] = "Please log in";
        header('HTTP/1.1 401 Unauthorized');
    }
    return json_encode($rarray);
}

function getUsers()
{
    global $conn;
    $rarray = array();
    $korisnici = array();
    $korisnik = array();

    if (checkIfLoggedIn()) {

        $stmt = $conn->prepare('SELECT  
                                        *
                                        FROM  korisnik');

        $stmt->bind_result($v1, $v2, $v3, $v4, $v5, $v6);
        $stmt->execute();

        while ($row = $stmt->fetch()) {

            $korisnik['id'] = $v1;
            $korisnik['firstname'] = $v2;
            $korisnik['lastname'] = $v3;
            $korisnik['username'] = $v4;
            $korisnik['password'] = $v5;
            $korisnik['token'] = $v6;

            array_push($korisnici, $korisnik);
        }


        $rarray['korisnici'] = $korisnici;
        return json_encode($rarray);

    } else {

        $rarray['error'] = "Please log in";
        header('HTTP/1.1 401 Unauthorized');
        return json_encode($rarray);

    }
}

function pronadji_korisnika($username)
{
    global $conn;
    $rarray = array();
    //$korisnici = array();
    $korisnik = array();

    if (checkIfLoggedIn()) {

        $stmt = $conn->prepare('SELECT  
                                        *
                                        FROM  korisnik
                                        WHERE username = ?');
        $stmt->bind_param('s', $username);
        $stmt->bind_result($v1, $v2, $v3, $v4, $v5, $v6);
        $stmt->execute();

        while ($row = $stmt->fetch()) {

            $korisnik['id'] = $v1;
            $korisnik['firstname'] = $v2;
            $korisnik['lastname'] = $v3;
            $korisnik['username'] = $v4;
            $korisnik['password'] = $v5;
            $korisnik['token'] = $v6;

            //array_push($korisnici, $korisnik);
        }


        //$rarray['korisnik'] = $korisnik;
        return json_encode($korisnik);

    } else {

        $rarray['error'] = "Please log in";
        header('HTTP/1.1 401 Unauthorized');
        return json_encode($rarray);

    }
}

function izmeniKorisnika($stariUsername, $noviUsername, $password, $firstname, $lastname)
{
    global $conn;
    $rarray = array();
    $errors = "nema err";

    if (checkIfLoggedIn()) {
        $stmt = $conn->prepare("UPDATE korisnik SET firstname = ?, lastname = ?, username = ?, password = ? WHERE username = ?");
        $pass = md5($password);
        $stmt->bind_param("sssss", $firstname, $lastname, $noviUsername, $pass, $stariUsername);

        if ($stmt->execute()) {

            $rarray['success'] = "Korisnik je uspesno azuriran";

        } else {

            header('HTTP/1.1 400 Bad request');
            $rarray['error'] = json_encode($errors);

        }
    } else {

        $rarray['error'] = "Please log in";
        header('HTTP/1.1 401 Unauthorized');
        return json_encode($rarray);

    }

    return json_encode($rarray);
}