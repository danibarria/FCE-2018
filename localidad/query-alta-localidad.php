<?php 
include("../utils/conectar.php");
$mysqli=conectar();
$sql = "INSERT INTO Localidad (idLocalidad,nombre) 
VALUES ('".$_POST["idLocalidad"]."','".$_POST["nombre"]."')"; 

 $mysqli->query($sql);  
 if($mysqli->errno) die($mysqli->error);
?>
<h3>Agregado con exito!</h3>
<button onclick="volver()">volver</button>

<script>
function volver() {
    location.replace("alta-aspirante.php");
}
</script>