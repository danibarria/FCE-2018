
<?php include('../utils/header.php'); ?>

<?php include('../utils/menu.php'); ?>

<?php 
include("../utils/conectar.php");
$mysqli=conectar();
$sql = "INSERT INTO Aspirante (idAspirante,nombre,apellido,direccion) 
VALUES ('".$_POST["idAspirante"]."','".$_POST["nombre"]."','".$_POST["apellido"]."','".$_POST["direccion"]."')"; 

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

<div class="modal" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Aspirante Agregado</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>Clic para continuar.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <!-- <button type="button" class="btn btn-primary">Save changes</button> -->
      </div>
    </div>
  </div>
</div>

<?php include('../utils/footer.php'); ?>