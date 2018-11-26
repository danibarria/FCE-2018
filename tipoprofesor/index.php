<select class="custom-select" id="idTipoRegular" onchange="showAuxiliarType(this.value)">    
<?php
// include("../utils/conectar.php");

// $mysqli=conectar();
// aspirantes que no son docentes
$profesor = "SELECT * FROM `tipoprofesor`"; 
 
 $resultadoprofesor = $mysqli->query($profesor);  
 if($mysqli->errno) die($mysqli->error);
 while($row = $resultadoprofesor -> fetch_assoc() ){  
    echo "<option value='".$row['idTipo']."'>". $row['descripcion'] ."</option><br/>";  
}  
?>

</select>