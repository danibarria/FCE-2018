<?php include('../utils/header.php'); ?>

<?php include('../utils/menu.php'); ?>

    <div class="col-12">
        <form method="post" action="query-alta-localidad.php">
        <div class="form-group">
            <label for="name">Codigo Postal</label>
            <input type="number" class="form-control" id="idLocalidad" aria-describedby="nameHelp" placeholder="Pone DNI" name="idLocalidad">
            <!-- <small id="nameHelp" class="form-text text-muted">We'll never share your email with anyone else.</small> -->
        </div>
        
        <div class="form-group">
            <label for="name">Nombre</label>
            <input type="text" class="form-control" id="nombre" aria-describedby="nameHelp" placeholder="Pone nombre" name="nombre">
            <!-- <small id="nameHelp" class="form-text text-muted">We'll never share your email with anyone else.</small> -->
        </div>

        <button type="submit" class="btn btn-primary" onsubmit="submit()">Submit</button>
        </form>
    </div>

<?php include('../utils/footer.php'); ?>