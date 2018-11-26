<?php

function conectar(){
    define("DB_HOST",$_ENV['DB_CLEARDB_DATABASE_URL'] );  
    define("DB_USER", $_ENV['DB_USER']);  
    define("DB_PASS", $_ENV['DB_PASSWORD']);  
    define("DB_DATABASE", "heroku_cfa203353792999" );  
    $mysqli = new mysqli(DB_HOST, DB_USER, DB_PASS, DB_DATABASE);   
    if($mysqli->connect_errno > 0){   
        die("Imposible conectarse con la base de datos [" . $mysqli->connect_error . "]");   
    }  
    return $mysqli;
}
?>