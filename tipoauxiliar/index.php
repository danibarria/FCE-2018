<select class="custom-select" id="idTipoAuxiliar" style="display:none;" >    
<?php
// include("../utils/conectar.php");

// $mysqli=conectar();
// aspirantes que no son docentes
$sqlauxiliar = "SELECT * FROM `tipoauxiliar`"; 
 
 $resultadoauxiliar = $mysqli->query($sqlauxiliar);  
 if($mysqli->errno) die($mysqli->error);
 while($row = $resultadoauxiliar -> fetch_assoc() ){  
    echo "<option value='".$row['idTipoAuxiliar']."'>". $row['descripcion'] ."</option><br/>";  
}  
?>

</select>