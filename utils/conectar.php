<?php

function conectar(){
    define("DB_HOST","localhost" );  
    define("DB_USER", "root");  
    define("DB_PASS", "");  
    define("DB_DATABASE", "fce" );  
    $mysqli = new mysqli(DB_HOST, DB_USER, DB_PASS, DB_DATABASE);   
    if($mysqli->connect_errno > 0){   
        die("Imposible conectarse con la base de datos [" . $mysqli->connect_error . "]");   
    }  
    return $mysqli;
}
?>