<?php

$servername = "127.0.0.1";
$username = "root";
$password = "root";
$db = "z_db";

// Create connection
$con = mysqli_connect($servername, $username, $password,$db);

// Check connection
if (!$con) {
    die("Connection failed: " . mysqli_connect_error());
}


?>
