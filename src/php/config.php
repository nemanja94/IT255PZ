<?php

$servername = "localhost";
$username = "root";
$password = "Root@1211";
$db = "it255-pz";

// Kreiraj konekciju
$conn = new mysqli($servername, $username, $password, $db);

if (!$conn->set_charset("utf8")) {
    printf("Error loading character set utf8: %s\n", $mysqli->error);
    exit();
} else if ($conn->connect_errno > 0) {
    die('Unable to connect to database [' . $db->connect_error . ']');
}
?>
