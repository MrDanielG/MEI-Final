<?php
    include '../conn.php';
    if(isset($_POST["smt"])){
        $name = $_POST["carrera"];
        $uni = $_POST["unidad"];
        if(isset($_POST["lat"])){
            $lat = $_POST["lat"];//
            $lng = $_POST["lng"];//
            $inst = $_POST["inst"];//
            $img = $_POST["img"];//
            $city = $_POST["ciudad"];//
            $unidesc = $_POST["unidad_desc"];//
            $becas = $_POST["becas"];//

            $q1 = "INSERT INTO `institucion`(`name`) VALUES ('$inst')";
            mysqli_query($con,$q1);
            $q2 = "SELECT `id` FROM `institucion` WHERE `name` = '$inst'";
            $res1 = mysqli_fetch_array(mysqli_query($con,$q2), MYSQLI_NUM);
            $q3 = "INSERT INTO `universidades` (`nombre`, `idInstitutucion`, `descripcion`, `ciudad`, `latitud`, `longitud`, `becas`, `uni_foto`) VALUES ('$uni', '$res1[0]', '$unidesc', '$city', '$lat', '$lng', '$becas', '$img')";
            mysqli_query($con,$q3);
        }
        $area = $_POST["area"];
        $kw = $_POST["keywords"];
        $carrdesc = $_POST["carreraDesc"];
        $planest = $_POST["plan_estudios"];
        $intercambio = $_POST["intercambio"];
        $egreso = $_POST["perfEgreso"];

        $q4 = "INSERT INTO `carreras` (`AreaNombre`, `NombreUni`, `nombre`, `descripcion`, `planestudios`, `intercambio`, `perfilegreso`, `keywords`) VALUES ('$area', '$uni', '$name', '$carrdesc', '$planest', '$intercambio', '$egreso', '$kw')";
        mysqli_query($con,$q4);
    }
?>

<html>
    <head>
        <title>Nuevos datos</title>
        <!--Estilos-->
        <link rel="stylesheet" type="text/css" href="../css/estilos.css">
        <!--Import Google Icon Font-->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
        <!--Import materialize.css-->
        <link type="text/css" rel="stylesheet" href="../css/materialize.min.css" media="screen,projection" />
        <meta charset="utf-8" />

        <!--Let browser know website is optimized for mobile-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    </head>
    <body>
        <div class="container">
            <div class="card">
                <div class="card-content">
                    <form method="post">
                        Nombre de la carrera (Licenciatura en Biología, Ingeniería en Alimentos). Que no se repitan las carreras de la misma universidad:
                        <input type="text" name="carrera" id="name" required>
                        <div class="coincidenciasName" style="border: 2px solid red">

                        </div><br><br>
                        Nombre de la unidad/facultad/centro universitario/otros (Centro Universitario de Ciencias Exactas e ingenierías, Facultad de Medicina): <br>
                        <input type="text" name="unidad" id="unid" required>
                        <div class="coincidenciasUnid" style="border: 2px solid red">   

                        </div><br><br>
                        Coordenadas de la unidad/facultad/centro universitario/otros (22.918273, -122.1827): <br><br>
                        latitud:<input type="number" name="lat" id="" step="0.00000001">
                        longitud <input type="number" name="lng" id="" step="0.00000001">
                        Pertenece a (Instituto Politécnico Nacional, Universidad Nacional Autonoma de México, etc):
                        <input type="text" name="inst" id="inst">
                        <div class="coincidenciasInst" style="border: 2px solid red" required>

                        </div><br><br>
                        Link de imagen de la unidad/facultad/centro universitario/otros (al menos resolucion 720p):
                        <input type="url" name="img" id="" required>
                        Ciudad de la la unidad/facultad/centro universitario/otros (Ciudad de México, Zacatecas):
                        <input type="text" name="ciudad" id="" required>
                        Descripcion de la la unidad/facultad/centro universitario/etc:
                        <input type="text" name="unidad_desc" id="" required>
                        Becas que ofrece la institución:
                        <textarea name="becas" id="" cols="30" rows="10" required></textarea>
                        Area a la que pertenece la carrera:
                        <select class="browser-default" name="area" id="" required>
                            <option value="Biológicas">Biológicas</option>
                            <option value="Humanidades">Humanidades</option>
                            <option value="Ingeniería">Ingeniería</option>
                            <option value="Sociales">Sociales</option>
                        </select>
                        Palabras clave de la carrera (separadas por comas y sin espacios):
                        <textarea name="keywords" id="" cols="30" rows="20" required></textarea>
                        Descripcion de la carrera:
                        <textarea name="carreraDesc" id="" cols="30" rows="20" required></textarea>
                        Plan de estudios:
                        <textarea name="plan_estudios" id="" cols="30" rows="20" required></textarea>
                        Intercambio:
                        <textarea name="intercambio" id="" cols="30" rows="20" required></textarea>
                        Perfil de egreso:
                        <textarea name="perfEgreso" id="" cols="30" rows="20" required></textarea>
                        <input type="submit" name="smt" class="btn">
                    </form>
                </div>
            </div>
        </div>
    </body>
    <script src="../js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="../js/materialize.js"></script>
    <script>
        $(document).ready(function() {
            $('select').material_select();
        });

        var cont = 0;

        $("#name").keyup(e => {
            $.ajax({url: "ajaxCname.php?data="+$("#name").val(),
            success: function(r){
                $(".coincidenciasName").html(r);
                cont++;
                if($(".coincidenciasName").find(".true").length>0&&cont%8==0){
                    Materialize.toast('Por favor elige una carrera que no se repita', 3000, 'rounded');
                }
            }});
        });
        $("#unid").keyup(e => {
            $.ajax({url: "ajaxUnid.php?data="+$("#unid").val(),
            success: function(r){
                $(".coincidenciasUnid").html(r);
                if($(".coincidenciasUnid").find(".true").length > 0){
                    $($("input").get(2)).attr("disabled","");
                    $($("input").get(2)).attr("placeholder","Desabilitado. Ya tenemos esta informacion.");
                    $($("input").get(3)).attr("disabled","");
                    $($("input").get(3)).attr("placeholder","Desabilitado. Ya tenemos esta informacion.");
                    $($("input").get(4)).attr("disabled","");
                    $($("input").get(4)).attr("placeholder","Desabilitado. Ya tenemos esta informacion.");
                    $($("input").get(5)).attr("disabled","");
                    $($("input").get(5)).attr("placeholder","Desabilitado. Ya tenemos esta informacion.");
                    $($("input").get(6)).attr("disabled","");
                    $($("input").get(6)).attr("placeholder","Desabilitado. Ya tenemos esta informacion.");
                    $($("input").get(7)).attr("disabled","");
                    $($("input").get(7)).attr("placeholder","Desabilitado. Ya tenemos esta informacion.");
                    $($("input").get(8)).attr("disabled","");
                    $($("input").get(8)).attr("placeholder","Desabilitado. Ya tenemos esta informacion.");
                    $($("textarea").get(0)).attr("disabled","");
                    $($("textarea").get(0)).attr("placeholder","Desabilitado. Ya tenemos esta informacion.");
                    $("#exist").attr("value","1");
                }else{
                    $($("input").get(2)).removeAttr("disabled");
                    $($("input").get(2)).attr("placeholder","");
                    $($("input").get(3)).removeAttr("disabled");
                    $($("input").get(3)).attr("placeholder","");
                    $($("input").get(4)).removeAttr("disabled");
                    $($("input").get(4)).attr("placeholder","");
                    $($("input").get(5)).removeAttr("disabled");
                    $($("input").get(5)).attr("placeholder","");
                    $($("input").get(6)).removeAttr("disabled");
                    $($("input").get(6)).attr("placeholder","");
                    $($("input").get(7)).removeAttr("disabled");
                    $($("input").get(7)).attr("placeholder","");
                    $($("input").get(8)).removeAttr("disabled");
                    $($("input").get(8)).attr("placeholder","");
                    $($("textarea").get(0)).removeAttr("disabled");
                    $($("textarea").get(0)).attr("placeholder","");
                    $("#exist").attr("value","0");
                }
            }});
        });
        $("#inst").keyup(e => {
            $.ajax({url: "ajaxInst.php?data="+$("#inst").val(),
            success: function(r){
                $(".coincidenciasInst").html(r);
            }});
        });
    </script>
</html>