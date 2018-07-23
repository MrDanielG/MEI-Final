<?php
session_start();
if((isset($_GET["id"])&&isset($_GET["token"]))||(isset($_SESSION["id"])||isset($_SESSION["token"]))){
    if((isset($_GET["id"])&&isset($_GET["token"]))){
      $_SESSION["id"] = $_GET["id"];
      $_SESSION["token"] = $_GET["token"];
    } else {
      $_GET["id"] = $_SESSION["id"];
      $_GET["token"] = $_SESSION["token"];
    }
    include '../../private/conn.php';

    $q = "SELECT expira FROM `sesion_agregar_unis` WHERE UID = ".$_GET["id"]." AND token = '".$_GET["token"]."'";
    $result = mysqli_query($con,$q);

    if (mysqli_num_rows($result) <= 0){
        echo "Acceso denegado. La sesion a la que intenta entrar no existe o ha expirado.";
        die();
    }else{
      $date = mysqli_fetch_array($result, MYSQLI_NUM)[0];
      $dt1 = new DateTime($date, new DateTimeZone("America/Mexico_City"));
      $dt2 = new DateTime();
      $dt2 -> setTimezone(new DateTimeZone("America/Mexico_City"));

      if($dt1 < $dt2){
        echo "Acceso denegado. La sesion a la que intenta entrar no existe o ha expirado.";
        die();
      }
    }
  }else{
    echo "Acceso denegado. La sesion a la que intenta entrar no existe o ha expirado.";
    die();
  }
?>
    <html>

    <head>
        <title>Ingresar Datos MEI</title>

        <!--Estilos-->
        <link rel="stylesheet" type="text/css" href="../../assets/css/estilos.css">
        <!--Import Google Icon Font-->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
        <!--Import materialize.css-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-rc.2/css/materialize.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <meta charset="utf-8" />

        <!--Let browser know website is optimized for mobile-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    </head>

    <body>
        <?php
            if(isset($_POST["smt"])){
                $uni = $_POST["uni"];
                $inst = $_POST["inst"];

                if (isset($_POST["lat"])) {
                    $lat = $_POST["lat"];
                    $lng = $_POST["lng"];
                    $img = "";
            
                    if(!empty($_FILES)){
                        move_uploaded_file($_FILES["imgF"]["tmp_name"], "../resourses/uni_pics/".$_FILES["imgF"]["name"]);
                        $img = "../resourses/uni_pics/".$_FILES["imgF"]["name"];
                    }else{
                        $img = $_POST["img"];
                    }
            
                    $city = $_POST["ciudad"];
                    $unidesc = $_POST["unidad_desc"];
                    $autor = $_POST["img-autor"];
            
                    mysqli_query($con, "INSERT INTO `universidad`(`nombre`, `descripcion`, `lat`, `lng`, `foto_url`, `foto_autor`, `ciudad`, `id_institutucion`)
                                            VALUES ('$uni', '$unidesc', '$lat', '$lng', '$img', '$autor', '$city', $inst)");
            
                    header("Location: index.php");
                    echo "<!--".mysqli_error($con)."-->";
                }
            }
        ?>
            <nav>
                <div class="nav-wrapper red darken-3">
                    <div class="container" id="div_menu">
                        <a href="#!" class="brand-logo">Mi Escuela Ideal</a>
                        <a href="#" data-target="slide-out" class="sidenav-trigger">
                            <i class="material-icons">menu</i>
                        </a>
                        <ul class="right hide-on-med-and-down">
                            <li>
                                <a href="#">Contáctanos</a>
                                <!-- Bug al meter iconos wtf -->

                            </li>
                        </ul>
                    </div>
                </div>
            </nav>

            <ul id="slide-out" class="sidenav">
                <li>
                    <a href="#"> Contáctanos</a>
                </li>
            </ul>

            <div class="container">
                <div class="card">
                    <div class="card-content">
                        <div class="card">
                            <div class="card-content">
                                <h5>Expira en:
                                    <span id="countdown"></span>
                                </h5>
                            </div>
                        </div>
                        <a class="btn red darken-3 right-align" href="todas.php" target="_blank">Carreras agregadas (Vista previa)</a>
                        <br>
                        <form method="post" enctype="multipart/form-data">
                            <blockquote style="border-left-color: #cddc39">
                                Institución:
                                <select type="text" name="inst" id="inst" required autocomplete="off">
                                    <option selected disabled>Seleccione una institución.</option>
                                    <?php
                                    $query = "SELECT * FROM institucion ORDER BY name";
                                    $inst = mysqli_query($con,$query);

                                    while ($r = mysqli_fetch_array($inst, MYSQLI_ASSOC)){
                                        echo "<option value='".$r["UID"]."'>".$r["name"]."</option>";
                                    }
                                ?>
                                </select>
                            </blockquote>
                            <blockquote style="border-left-color: #4db6ac">
                                <div class="input-field">
                                    Nombre de la unidad academica (Centro Universitario de Ciencias Exactas e Ingenierías, Facultad de Medicina):
                                    <input type="text" name="uni" id="uni" required autocomplete="off" class="autocomplete">
                                </div>
                                <div class="uniIn">
                                    <blockquote>
                                        Descripcion de la unidad academica
                                        <span style="color:red">(compatible con HTML)</span>:
                                        <textarea type="text" name="unidad_desc" class="uni_desc materialize-textarea" id="uni_desc" required></textarea>
                                        Vista previa
                                        <div class="uni_desc" style="border: 2px solid red" required>

                                        </div>
                                    </blockquote>
                                    <blockquote>
                                        Coordenadas de la unidad academica:
                                        <br>
                                        <blockquote>
                                            Latitud:
                                            <input type="number" name="lat" id="lat" step="0.00000001" required>
                                        </blockquote>
                                        <blockquote>
                                            Longitud
                                            <input type="number" name="lng" id="lng" step="0.00000001" required>
                                        </blockquote>
                                    </blockquote>
                                    <blockquote>
                                        Fotografía del exterior de la unidad academica (resolucion recomendada: 1920x1080 o superior)
                                        <br>
                                        <br>
                                        <input class="file-input1" type="file" name="imgF" value="">
                                        <br>
                                        <br> o
                                        <br>
                                        <br> Enlace de la imagen:
                                        <input type="url" name="img" class="file-input2" required>
                                        <br>
                                    </blockquote>
                                    <blockquote>
                                        Autor de la foto:
                                        <input type="text" name="img-autor" id="" required>
                                        <br>
                                    </blockquote>
                                    <blockquote>
                                        Estado de la unidad academica (Ciudad de México, Zacatecas):
                                        <div class="input-field">
                                            <select class="validate" id="input_lugar" name="ciudad" required>
                                                <option disabled selected>Seleccione una opción...</option>
                                                <option>Aguascalientes</option>
                                                <option>Baja California</option>
                                                <option>Baja California Sur</option>
                                                <option>Campeche</option>
                                                <option>Coahuila</option>
                                                <option>Colima</option>
                                                <option>Chiapas</option>
                                                <option>Chihuahua</option>
                                                <option>Ciudad de México</option>
                                                <option>Estado de México</option>
                                                <option>Durango</option>
                                                <option>Guanajuato</option>
                                                <option>Guerrero</option>
                                                <option>Hidalgo</option>
                                                <option>Jalisco</option>
                                                <option>Michoacán</option>
                                                <option>Morelos</option>
                                                <option>Nayarit</option>
                                                <option>Nuevo León</option>
                                                <option>Oaxaca</option>
                                                <option>Puebla</option>
                                                <option>Querétaro</option>
                                                <option>Quintana Roo</option>
                                                <option>San Luis Potosí</option>
                                                <option>Sinaloa</option>
                                                <option>Sonora</option>
                                                <option>Tabasco</option>
                                                <option>Tamaulipas</option>
                                                <option>Tlaxcala</option>
                                                <option>Veracruz</option>
                                                <option>Yucatán</option>
                                                <option>Zacatecas</option>
                                            </select>
                                        </div>
                                    </blockquote>
                                </div>
                            </blockquote>
                            <div align="center">
                                <input type="submit" name="smt" class="btn">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <?php include '../../public/resourses/footer.html' ?>
    </body>
    <script src="../../assets/js/jquery-3.2.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-rc.2/js/materialize.min.js"></script>
    <script>
        $(document).ready(function () {
            $('select').formSelect();
        });
        $(".button-collapse").sidenav();

        var countDownDate = new Date("<?php echo $date;?>").getTime();
        var x = setInterval(function () {
            var now = new Date().getTime();
            var distance = countDownDate - now;
            var days = Math.floor(distance / (1000 * 60 * 60 * 24));
            var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
            var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
            var seconds = Math.floor((distance % (1000 * 60)) / 1000);

            $("#countdown").html(days + "d " + hours + "h " + minutes + "m " + seconds + "s ");
        }, 1000);

        $(".file-input1").change(e => {
            if ($(".file-input1").val() == "") {
                $(".file-input2").removeAttr("disabled");
                $(".file-input2").attr("placeholder", "");
            } else {
                $(".file-input2").attr("disabled", "");
                $(".file-input2").attr("placeholder", "Desabilitado");
            }
        });

        $(".file-input2").keyup(e => {
            if ($(".file-input2").val() == "") {
                $(".uniIn").find("input").removeAttr("disabled");
            } else {
                $(".file-input1").attr("disabled", "");
            }

        });
    </script>

    </html>