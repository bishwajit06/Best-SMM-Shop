<?php

$servername = "localhost";
$username = "root";
$password = "";
$db = "ecommercphp";

// Create connection
$con = mysqli_connect($servername, $username, $password, $db);

//Check connection
if(!$con){
  die("Coonection failed: " . mysqli_connect_error());
}

?>
