<?php include('../utils/header.php'); ?>

<?php include('../utils/menu.php'); ?>

 <table class="table table-dark">
   <thead>
     <tr>
       <th scope="col">DNI </th>
       <th scope="col">Legajo</th>
       <th scope="col">Nombre</th>
       <th scope="col">Apellido</th>
       <th scope="col">Direcion</th>
       <th scope="col">Localidad</th>
     </tr>
   </thead>
   <tbody>

<?php
include("../utils/conectar.php");

$mysqli=conectar();
// docentes que no son aspirante
$sql = "SELECT Docente.legajo, Aspirante.idAspirante, Aspirante.nombre as name,
Aspirante.apellido, Aspirante.direccion, Localidad.nombre as localidad
FROM (((Docente
INNER JOIN Aspirante ON Docente.idAspirante = Aspirante.idAspirante) 
INNER JOIN Localidad ON Docente.idLocalidad = Localidad.idLocalidad)
INNER JOIN Antecedente ON Antecedente.idAntecedente = Docente.idAntecedente)"; 
 
 $resultado = $mysqli->query($sql);  
 if($mysqli->errno) die($mysqli->error);
 while($fila = $resultado -> fetch_assoc() ){  
    echo `<tr>`;
    echo "<th>".$fila['idAspirante']. "</th>".
    "<td>".$fila['legajo']."</td>".    
    "<td>".$fila['name']."</td>".
    "<td>".$fila['apellido']."</td>".
    "<td>".$fila['direccion']."</td>".
    "<td>".$fila['localidad']."</td></tr>";  
}  
?>
   </tbody>
 </table>

<?php include('../utils/footer.php'); ?>