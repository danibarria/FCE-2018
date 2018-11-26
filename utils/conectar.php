<?php

function conectar(){
    define("DB_HOST","mysql://b38793a56ebb32:c7661958@us-cdbr-iron-east-01.cleardb.net/heroku_cfa203353792999?reconnect=true" );  
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