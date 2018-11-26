<?php include('../utils/header.php'); ?>

<?php include('../utils/menu.php'); ?>

    <div class="col-12">
        <form method="post" action="query-alta-aspirante.php">
        <div class="form-group">
            <label for="name">DNI</label>
            <input type="number" class="form-control" id="idAspirante" aria-describedby="nameHelp" placeholder="Pone DNI" name="idAspirante">
        </div>
        
        <div class="form-group">
            <label for="name">Nombre</label>
            <input type="text" class="form-control" id="nombre" aria-describedby="nameHelp" placeholder="Pone nombre" name="nombre">
        </div>

        <div class="form-group">
            <label for="lastName">Apellido</label>
            <input type="text" class="form-control" id="apellido" aria-describedby="nameHelp" placeholder="Pone apellido" name="apellido">
        </div>

        <div class="form-group">
            <label for="lastName">Direccion</label>
            <input type="text" class="form-control" id="direccion" aria-describedby="nameHelp" placeholder="Pone direccion" name="direccion">
        </div>
        <button type="submit" class="btn btn-primary" >Submit</button>
        </form>
    </div>

<script>
function submit() {
        $dni = $_POST["idAspirante"] = 1;
        $name = $_POST["nombre"] = "ejemplo";
        $lastname = $_POST["apellido"] = "apellido ejemplo"; 
        $address = $_POST["direccion"] = "direccion ejemplo"; 
        
        if (window.XMLHttpRequest) {
            // code for IE7+, Firefox, Chrome, Opera, Safari
            xmlhttp = new XMLHttpRequest();
        } else {
            // code for IE6, IE5
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
        xmlhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                // document.getElementById("txtHint").innerHTML = this.responseText;
                alert('Enviado');
            }
        };
        xmlhttp.open("POST","query-alta-aspirante.php",true);
        $uri = "query-alta-aspirante.php?"+ "idAspirante="+$dni+"&nombre="+$name+"&apellido="+$lastname+"&direccion="+$address;
        xmlhttp.send(encodeURI($uri));
}
</script>
<?php include('../utils/footer.php'); ?>