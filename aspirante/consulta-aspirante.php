
<?php include('../utils/header.php'); ?>

<?php include('../utils/menu.php'); ?>


   <table class="table table-dark">
   <thead>
     <tr>
       <th scope="col">DNI</th>
       <th scope="col">Nombre</th>
       <th scope="col">Apellido</th>
       <th scope="col">Direcion</th>
     </tr>
   </thead>
   <tbody>

<?php
include("../utils/conectar.php");

$mysqli=conectar();
// aspirantes que no son docentes
$sql = "SELECT Aspirante.idAspirante, Aspirante.nombre, Aspirante.apellido, Aspirante.direccion 
FROM Aspirante
WHERE NOT EXISTS(SELECT Docente.idAspirante 
FROM Docente
WHERE Docente.idAspirante=Aspirante.idAspirante )"; 
 
 $resultado = $mysqli->query($sql);  
 if($mysqli->errno) die($mysqli->error);
 while($fila = $resultado -> fetch_assoc() ){  
    echo `<tr>`;
    echo "<th>".$fila['idAspirante']. "</th>".
    "<td>".$fila['nombre']."</td>".
    "<td>".$fila['apellido']."</td>".
    "<td>".$fila['direccion']."</td></tr>";  
}  
?>
   </tbody>
 </table> 
 <?php include('../utils/footer.php'); ?>