<?php include('../utils/header.php'); ?>

<?php include('../utils/menu.php'); ?>

   <table class="table table-dark">
   <thead>
     <tr>
       <th scope="col">Codigo Postal</th>
       <th scope="col">Nombre</th>
     </tr>
   </thead>
   <tbody>

<?php
include("../utils/conectar.php");

$mysqli=conectar();
$sql = "SELECT * FROM `Localidad`"; 
 
 $resultado = $mysqli->query($sql);  
 if($mysqli->errno) die($mysqli->error);
 while($fila = $resultado -> fetch_assoc() ){
     //pre1234pot  
    echo "<tr><th>".$fila['idLocalidad']. "</th>".
    "<td>".$fila['nombre']."</td></tr>";  
}  
?>
</tbody>
</table>
<?php include('../utils/footer.php'); ?>