<!-- SELECT * FROM `tiporegular` -->
<select class="custom-select" id="idTipoRegular" onchange="">    
<?php
include("../utils/conectar.php");

$mysqli=conectar();
// docentes que no son aspirante
$regular = "SELECT * FROM tiporegular"; 
 
 $resultadoregular = $mysqli->query($regular);  
 if($mysqli->errno) die($mysqli->error);
 while($row = $resultadoregular -> fetch_assoc() ){  
    echo "<option value='" . $row['idTipoRegular']."' > " . $row['descripcion'] . " </option>";  
}  
?>
</select>