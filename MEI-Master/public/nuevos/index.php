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
        <div class="card-content" align="center">
          <div class="card">
            <div class="card-content">
              <h5>Expira en:
                <span id="countdown"></span>
              </h5>
            </div>
          </div>
          <a class="btn red darken-3" href="todas.php" target="_blank">Carreras agregadas (Vista previa)</a>
          <br>
          <br>
          <a href="addInst.php" class="btn waves-effect lime center-align">
            Agregar institucion
          </a>
          <br>
          <br>
          <a href="addUni.php" class="btn waves-effect teal lighten-2 center-align">
            Agregar unidad academica
          </a>
          <br>
          <br>
          <a href="addCarrera.php" class="btn waves-effect blue lighten-1 center-align">
            Agregar carrera
          </a>
          <br>
        </div>
      </div>
    </div>
    <?php include '../../public/resourses/footer.html' ?>
  </body>
  <script src="../../assets/js/jquery-3.2.1.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-rc.2/js/materialize.min.js"></script>
  <script>
    $('.sidenav').sidenav();
    var countDownDate = new Date("<?php echo $date;?>").getTime();
    var x = setInterval(function () {
      var now = new Date().getTime();
      var distance = countDownDate - now;
      var days = Math.floor(distance / (1000 * 60 * 60 * 24));
      var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
      var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
      var seconds = Math.floor((distance % (1000 * 60)) / 1000);

      document.getElementById("countdown").innerHTML = days + "d " + hours + "h " +
        minutes + "m " + seconds + "s ";
    }, 1000);
  </script>

</html>