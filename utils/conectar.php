<?php

function conectar(){
    define("DB_HOST","" );  
    define("DB_USER", "");  
    define("DB_PASS", "");  
    define("DB_DATABASE", "heroku_cfa203353792999" );  
    $mysqli = new mysqli(DB_HOST, DB_USER, DB_PASS, DB_DATABASE);   
    if($mysqli->connect_errno > 0){   
        die("dani: " . DB_HOST."Imposible conectarse con la base de datos [" . $mysqli->connect_error . "]");   
    }  
    return $mysqli;
}
?>