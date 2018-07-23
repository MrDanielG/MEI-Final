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
                $inst = $_POST["inst"];

                if (isset($_POST["rank_nac"])) {
                    $becas = $_POST["becas"];
                    $rank_nac = $_POST["rank_nac"];
                    $rank_mun = $_POST["rank_wrld"];
                    $intercambio = $_POST["intercambio"];

                    mysqli_query($con, "INSERT INTO `institucion`(`name`, `intercambio`, `becas`, `rank_nac`, `rank_mun`)
                                        VALUES ('$inst', '$intercambio', '$becas', '$rank_nac', '$rank_mun')");

                    header("Location: index.php");
                }
            }
        ?>
        <nav>
            <div class="nav-wrapper red darken-3">
                <div class="container" id="div_menu">
                    <a href="#!" class="brand-logo">Mi Escuela Ideal</a>
                    <a href="#" data-target="slide-out" class="sidenav-trigger"><i class="material-icons">menu</i></a>
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
                            <div class="instIn">
                                Pertenece a (Instituto Politécnico Nacional, Universidad Nacional Autonoma de México, etc):
                                <input type="text" name="inst" id="inst" required autocomplete="off">
                                <blockquote>
                                    Ranking nacional:
                                    <a href="https://www.topuniversities.com/university-rankings/latin-american-university-rankings/2018" target="_blank">Sacar de aquí</a>
                                    <input type="number" name="rank_nac" value="" min="0" required>
                                </blockquote>
                                <blockquote>
                                    Ranking mundial:
                                    <a href="https://www.topuniversities.com/university-rankings/latin-american-university-rankings/2018" target="_blank">Sacar de aquí</a>
                                    <input type="number" name="rank_wrld" value="" min="0" required>
                                </blockquote>
                                <blockquote>

                                    Becas que ofrece la institución
                                    <span style="color:red">(compatible con HTML)</span>:
                                    <textarea name="becas" id="" class="becas  materialize-textarea" cols="30" rows="10" required></textarea> Vista previa
                                    <div class="becas" style="border: 1px solid red" required>

                                    </div>
                                </blockquote>
                                <blockquote>

                                    Opciones de intercambio internacional o nacional
                                    <span style="color:red">(compatible con HTML)</span>:
                                    <textarea name="intercambio" class="intercambio  materialize-textarea" cols="30" rows="20" required></textarea> Vista previa
                                    <div class="intercambio" style="border: 1px solid red" required>

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
        $(".button-collapse").sideNav();
        $(document).ready(function () {
            $('select').formSelect();
        });

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

        $(".intercambio").keyup(e => {
            $($(".intercambio").get(1)).html($($(".intercambio").get(0)).val());
        });
        $(".becas").keyup(e => {
            $($(".becas").get(1)).html($($(".becas").get(0)).val());
        });

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