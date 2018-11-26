<?php include('../utils/header.php'); ?>

<?php include('../utils/menu.php'); ?>

    <div class="col-12">
        <form method="post" action="query-alta-aspirante.php">
        <div class="form-group">
            <label for="name">Fecha Inicio</label>
            <input type="date" class="form-control" id="fechainicio" aria-describedby="nameHelp" name="fechainicio">
        </div>
        
        <div class="form-group">
            <label for="name">Fecha Fin</label>
            <input type="date" class="form-control" id="fechafin" aria-describedby="nameHelp" name="fechafin">
        </div>
        <?php include('../tiporegular/index.php');?>
        <?php include('../tipoprofesor/index.php');?>
        <?php include('../tipoauxiliar/index.php');?>
        </form>
    </div>




<script>
function showAuxiliarType(str) {
    if (str == 2) {
        document.getElementById("idTipoAuxiliar").style.display = "block";
        return;
    } 
    document.getElementById("idTipoAuxiliar").style.display = "none";
}
</script>
<?php include('../utils/footer.php'); ?>