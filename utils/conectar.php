<?php

function conectar(){
    define("DB_HOST","us-cdbr-iron-east-01.cleardb.net" );  
    define("DB_USER", "b38793a56ebb32");  
    define("DB_PASS", "c7661958");  
    define("DB_DATABASE", "heroku_cfa203353792999" );  
    $mysqli = new mysqli(DB_HOST, DB_USER, DB_PASS, DB_DATABASE);   
    if($mysqli->connect_errno > 0){   
        die("dani: " . DB_HOST."Imposible conectarse con la base de datos [" . $mysqli->connect_error . "]");   
    }  
    return $mysqli;
}
?>