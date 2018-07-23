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
        $name = $_POST["carrera"];
        $uni = $_POST["uni"];
        $inst = $_POST["inst"];
        $id_insert = -1;
        $id_carrera = mysqli_query($con, "SELECT `UID` FROM `carrera_info` WHERE `nombre` = '$name'");

        if(mysqli_num_rows($id_carrera) > 0){
          $id_insert =  mysqli_fetch_array($id_carrera, MYSQLI_NUM)[0];
        }

        if (isset($_POST["carreraDesc"])) {
          $carrdesc = $_POST["carreraDesc"];
          $area = $_POST["area"];
          $sMax = $_POST["sueldo_max"];
          $sMin = $_POST["sueldo_min"];
          mysqli_query($con, "INSERT INTO `carrera_info`(`nombre`, `descripcion`, `salario_min`, `salario_max`)
                              VALUES ('$name','$carrdesc','$sMin','$sMax')");

          echo "<!--".mysqli_error($con)."-->";

          $id_insert = mysqli_insert_id($con);

          for($i = 0 ; $i < count($area) ; ++$i){
            $id_area = mysqli_fetch_array(mysqli_query($con, "SELECT `UID` FROM area WHERE nombre_completo = '".$area[$i]."'"));
            mysqli_query($con, "INSERT INTO `carrera_area`(`id_carrera`, `id_area`) VALUES (".mysqli_insert_id($con).",{$id_area[0]})");
          }
        }
        if(isset($_POST["plan_estudios"])){
          $planest = $_POST["plan_estudios"];
          $egreso = $_POST["perfEgreso"];
          $referencias = $_POST["referencias"];

          $id_carrera = mysqli_fetch_array(mysqli_query($con, "SELECT `UID` FROM `carrera_info` WHERE `nombre` = '$name'") , MYSQLI_NUM);

          mysqli_query($con, "INSERT INTO `carrera_uni`(`id_carrera`, `plan_estudio`, `perfil_egreso`, `id_universidad`, `referencias`)
                  VALUES (".$id_insert.", '$planest', '$egreso', $uni, '$referencias')");
          echo "<!--".mysqli_error($con)."-->";
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
            <form method="post" onsubmit="return validate();">
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
                Unidad Académica:
                <select type="text" name="uni" id="uni" required autocomplete="off"></select>
              </blockquote>
              <blockquote style="border-left-color: #42a5f5">
                <div class="input-field">
                  Nombre de la carrera (Licenciatura en Biología, Ingeniería en Alimentos):
                  <input type="text" name="carrera" id="name" required autocomplete="off" class="autocomplete">
                </div>
                <div class="carrIn">
                  <blockquote>
                    Descripcion general de la carrera
                    <span style="color:red">(compatible con HTML)</span>
                    <a class="material-icons tooltipped" style="font-size: 15px;" data-position="bottom" data-delay="0" data-tooltip="Es la descripcion general de la carrera. No ingresar nombres de unidades y/o instituciones ya que se ingresará una única vez y se usará para todas las universidades que impartan esta carrera.">info_outline</a>:
                    <textarea name="carreraDesc" class="uniIn carreraDesc materialize-textarea" cols="30" rows="20" required></textarea>
                    <br> Vista previa
                    <div class="carreraDesc uniIn" style="border: 1px solid red" required>

                    </div>
                    <br>
                  </blockquote>
                  <blockquote>
                    Area a la que pertenece la carrera:
                    <div class="uniIn chips chips-autocomplete"></div>
                  </blockquote>
                  <blockquote>
                    Mínimo del promedio del salario por mes
                    <a class="material-icons tooltipped" style="font-size: 15px;" data-position="bottom" data-delay="0" data-tooltip="Generalmente es el salario de un recien egresado de la carrera.">info_outline</a>:
                    <input class="uniIn" type="number" step="0.01" name="sueldo_min" min="0" required>
                    <br>
                  </blockquote>
                  <blockquote>
                    Máximo del promedio del salario por mes
                    <a class="material-icons tooltipped" style="font-size: 15px;" data-position="bottom" data-delay="0" data-tooltip="Generalmente es el salario de un senior en puestos de trabajo elevados.">info_outline</a>:
                    <input class="uniIn" type="number" step="0.01" name="sueldo_max" min="0" required>
                    <br>
                  </blockquote>
                </div>
                <blockquote>
                  Plan de estudios
                  <span style="color:red">(compatible con HTML)</span>
                  <a class="material-icons tooltipped" style="font-size: 15px;" data-position="bottom" data-delay="0" data-tooltip="Si hay un documento oficial en internet puede solo poner el enlace con una etiqueta <A></A> de HTML.">info_outline</a>:
                  <textarea name="plan_estudios" class="plan_estudios materialize-textarea" cols="30" rows="20" required></textarea> Vista previa
                  <div class="plan_estudios" style="border: 1px solid red" required>

                  </div>
                </blockquote>
                <blockquote>

                  Perfil de egreso
                  <span style="color:red">(compatible con HTML)</span>:
                  <textarea name="perfEgreso" class="perfEgreso materialize-textarea" cols="30" rows="20" required></textarea> Vista previa
                  <div class="perfEgreso" style="border: 1px solid red" required>

                  </div>
                </blockquote>

                <blockquote>
                  Referencias
                  <span style="color:red">(compatible con HTML)</span>:
                  <textarea name="referencias" class="referencias materialize-textarea" cols="30" rows="20" required></textarea> Vista previa
                  <div class="referencias" style="border: 1px solid red" required>

                  </div>
                </blockquote>
              </blockquote>

              <div align="center">
                <input type="submit" name="smt" class="btn">
              </div>
              <div id="hidden">

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
    var settingsAuto = {
      data: {
        <?php
          $query = "SELECT * FROM carrera_info ORDER BY nombre";
          $result = mysqli_query($con,$query);
          while ($r = mysqli_fetch_array($result, MYSQLI_ASSOC)){
            echo "'{$r["nombre"]}': null,";   
          }
        ?>
      },
      limit: 5,
      minLength: 1,
      onAutocomplete: function (val) {
        $("input.uniIn").attr("disabled", "");
        $("input.uniIn").attr("placeholder", "Desabilitado. Ya tenemos esta informacion.");
        $("textarea.uniIn").attr("disabled", "");
        $("textarea.uniIn").attr("placeholder", "Desabilitado. Ya tenemos esta informacion.");
        $(".chips").css("opacity", "0.4");
      }
    };
    $(document).ready(function () {
      $('select').formSelect();
      $('input.autocomplete').autocomplete(settingsAuto);
    });

    var chips = $('.chips-autocomplete').chips({
      data: [
        <?php
          $area = mysqli_query($con, "SELECT * FROM area");
          while($tag = mysqli_fetch_array($area, MYSQLI_NUM)){
              echo "{
                  tag: '{$tag[2]}',
              }, ";   
          }
        ?>
      ],
      autocompleteOptions: {
        data: {
          <?php
            $area = mysqli_query($con, "SELECT * FROM area");
            while($tag = mysqli_fetch_array($area, MYSQLI_NUM)){
                echo "'{$tag[2]}': null,";   
            }
          ?>
        },
        limit: 5,
        minLength: 1
      }
    });

    function validate() {
      if ($("#name").val() in settingsAuto.data) {
        return true;
      } else {
        var html = "";
        var res = false

        for (var i = 0; i < chips[0].M_Chips.chipsData.length; ++i) {
          res = true;
          html += "<input type='hidden' name='area[" + i + "]' value='" + chips[0].M_Chips.chipsData[i].tag + "'>";
        }
        if (!res) {
          M.toast({
            html: 'El campo de áreas está vacío.'
          });
        }
        $("#hidden").html(html);
        return res;
      }
    }
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

    function carrExist() {
      if ($("#name").val() in settingsAuto.data) {
        $("input.uniIn").attr("disabled", "");
        $("input.uniIn").attr("placeholder", "Desabilitado. Ya tenemos esta informacion.");
        $("textarea.uniIn").attr("disabled", "");
        $("textarea.uniIn").attr("placeholder", "Desabilitado. Ya tenemos esta informacion.");
        $(".chips").css("opacity", "0.4");
      }
    }

    $('#inst').change((e) => {
      $("#uni").html("");
      $("select#uni").formSelect();
      $.ajax({
        url: "ajaxUnid.php",
        data: {
          "data": $('#inst').val()
        },
        success: (result) => {
          $("#uni").html(result);
          $("select#uni").formSelect();
        }
      });
    });
    $("#name").keyup(function () {
      $("input.uniIn").removeAttr("disabled");
      $("input.uniIn").attr("placeholder", "");
      $("textarea.uniIn").removeAttr("disabled");
      $("textarea.uniIn").attr("placeholder", "");
      $(".chips").css("opacity", "1");
      carrExist();
    });

    $(".carreraDesc").keyup(e => {
      $($(".carreraDesc").get(1)).html($($(".carreraDesc").get(0)).val());
    });
    $(".uni_desc").keyup(e => {
      $($(".uni_desc").get(1)).html($($(".uni_desc").get(0)).val());
    });
    $(".plan_estudios").keyup(e => {
      $($(".plan_estudios").get(1)).html($($(".plan_estudios").get(0)).val());
    });
    $(".perfEgreso").keyup(e => {
      $($(".perfEgreso").get(1)).html($($(".perfEgreso").get(0)).val());
    });

    $(".referencias").keyup(e => {
      $($(".referencias").get(1)).html($($(".referencias").get(0)).val());
    });
  </script>

</html>