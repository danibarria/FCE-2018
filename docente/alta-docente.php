<?php include('../utils/header.php'); ?>

<?php include('../utils/menu.php'); ?>

<div class="col-9">
Seleccione Aspirante para promover a Docente:
<form>
<select class="custom-select" >
<?php
include("../utils/conectar.php");

$mysqli=conectar();
// @SQL :  los docentes que no son aspirantes
// aspirantes que no son docentes
$sql = "SELECT Aspirante.idAspirante, Aspirante.nombre, Aspirante.apellido, Aspirante.direccion 
FROM Aspirante
WHERE NOT EXISTS(SELECT Docente.idAspirante 
FROM Docente
WHERE Docente.idAspirante=Aspirante.idAspirante )";
 
 $resultado = $mysqli->query($sql);  
 if($mysqli->errno) die($mysqli->error);
 while($fila = $resultado -> fetch_assoc() ){  
    echo " <option value='" . 
    $fila['idAspirante']. "'>".
    $fila['idAspirante']. " - ".
    $fila['nombre']." ".
    $fila['apellido']." - ".
    $fila['direccion'] . 
    "</option>";  
}
?>
</select>
<div class="form-group">
            <label for="name">Fecha de ingreso</label>
            <input type="date" class="form-control" id="Fecha-ingreso" aria-describedby="nameHelp" placeholder="Pone Fecha de ingreso" name="fecha-ingreso">
        </div>
<button mat-button>Promover</button>
</form>
</div>

<?php include('../utils/footer.php'); ?>