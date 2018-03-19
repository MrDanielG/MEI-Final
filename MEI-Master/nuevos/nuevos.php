<?php
  if(isset($_GET["id"])&&isset($_GET["token"])){
    include '../conn.php';

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
    <?php
    if(isset($_POST["smt"])){

      $name = $_POST["carrera"];//
      $uni = $_POST["unidad"];
      $inst = $_POST["inst"];

      if (isset($_POST["rank_nac"])) {
        $becas = $_POST["becas"];
        $rank_nac = $_POST["rank_nac"];
        $rank_mun = $_POST["rank_wrld"];
        $intercambio = $_POST["intercambio"];

        mysqli_query($con, "INSERT INTO `institucion`(`name`, `intercambio`, `becas`, `rank_nac`, `rank_mun`)
                            VALUES ('$inst', '$intercambio', '$becas', '$rank_nac', '$rank_mun')");

      }

      if (isset($_POST["lat"])) {
        $lat = $_POST["lat"];
        $lng = $_POST["lng"];

        if(!empty($_FILES)){
          move_uploaded_file($_FILES["imgF"]["tmp_name"], "../uni_pics/".$_FILES["imgF"]["name"]);
          $img = "../uni_pics/".$_FILES["imgF"]["name"];
        }else{
          $img = $_POST["img"];
        }

        $city = $_POST["ciudad"];
        $unidesc = $_POST["unidad_desc"];
        $autor = $_POST["img-autor"];

        $id_inst = mysqli_fetch_array(mysqli_query($con,"SELECT `UID` FROM `institucion` WHERE `name` = '$inst'") , MYSQLI_NUM);

        mysqli_query($con, "INSERT INTO `universidad`(`nombre`, `descripcion`, `lat`, `lng`, `foto_url`, `foto_autor`, `ciudad`, `id_institutucion`)
                            VALUES ('$uni', '$unidesc', '$lat', '$lng', '$img', '$autor', '$city', $id_inst[0])");

      }

      if (isset($_POST["carreraDesc"])) {
        $carrdesc = $_POST["carreraDesc"];//
        $area = $_POST["area"];//
        $sMax = $_POST["sueldo_max"];//
        $sMin = $_POST["sueldo_min"];//
        mysqli_query($con, "INSERT INTO `carrera_info`(`nombre`, `descripcion`, `id_area`, `salario_min`, `salario_max`, `keywords`)
                            VALUES ('$name','$carrdesc',$area,'$sMin','$sMax','.')" );

      }

      if(isset($_POST["plan_estudios"])){
          $planest = $_POST["plan_estudios"];
          $egreso = $_POST["perfEgreso"];

          $id_carrera = mysqli_fetch_array(mysqli_query($con, "SELECT `UID` FROM `carrera_info` WHERE `nombre` = '$name'") , MYSQLI_NUM);

          $id_uni = mysqli_fetch_array(mysqli_query($con, "SELECT `UID` FROM `universidad` WHERE `nombre` = '$uni'") , MYSQLI_NUM);

          mysqli_query($con, "INSERT INTO `carrera_uni`(`id_carrera`, `plan_estudio`, `perfil_egreso`, `id_universidad`, `referencias`)
                            VALUES ({$id_carrera[0]}, '$planest', '$egreso', {$id_uni[0]}, '')");

      }

      echo "<!--".mysqli_error($con)."-->";

    }
?>
    <div class="container">
      <div class="card">
        <div class="card-content">
          <div class="card">
            <div class="card-content">
              <h5>Expira en <span id="countdown"></span></h5>
            </div>
          </div>
          <a class="btn" href="todas.php" target="_blank">Carreras agregadas (Vista previa)</a><br><br>
          <span class="text-color-gray">Algunos son compatibles con etiquetas HTML</span>
          <blockquote style="border-left-color: #42a5f5">
            Relacionado a la carrera
          </blockquote>
          <blockquote style="border-left-color: #4db6ac">
            Relacionado a la unidad academica
          </blockquote>
          <blockquote style="border-left-color: #cddc39">
            Relacionado a la institucion
          </blockquote>
          <form method="post">
          <blockquote style="border-left-color: #42a5f5">
            Nombre de la carrera (Licenciatura en Biología, Ingeniería en Alimentos):
            <input type="text" name="carrera" id="name" required autocomplete="off">
          </blockquote>
          <blockquote style="border-left-color: #4db6ac">
            Nombre de la unidad academica (Centro Universitario de Ciencias Exactas e Ingenierías, Facultad de Medicina): <br>
            <input type="text" name="unidad" id="unid" required autocomplete="off">
          </blockquote>
          <blockquote style="border-left-color: #cddc39">
            Pertenece a (Instituto Politécnico Nacional, Universidad Nacional Autonoma de México, etc):
            <input type="text" name="inst" id="inst" required autocomplete="off">
          </blockquote>

            <blockquote style="border-left-color: #42a5f5">
              <div class="carrIn">
                <blockquote>
                  Descripcion general de la carrera <span style="color:red">(compatible con HTML)</span> <a class="material-icons tooltipped" style="font-size: 15px;" data-position="bottom" data-delay="0" data-tooltip="Es la descripcion general de la carrera. Se ingresará una única vez y se usará para todas las universidades que impartan esta carrera.">info_outline</a>:
                  <textarea name="carreraDesc" class="carreraDesc" cols="30" rows="20" required></textarea><br> Vista previa
                  <div class="carreraDesc uniIn" style="border: 1px solid red" required>

                  </div><br>
                </blockquote>
                <blockquote>
                  Area a la que pertenece la carrera:
                  <select class="browser-default" name="area" id="" required>
                      <option disabled selected>Seleccione una opción...</option>
                      <option value="1">Ciencias Quimico/Biológicas</option>
                      <option value="2">Humanidades y Artes</option>
                      <option value="3">Ciencias Fisico/Matematicas y de Ingeniería</option>
                      <option value="4">Ciencias Sociales</option>
                  </select>
                </blockquote>
                <blockquote>
                  Mínimo del promedio del salario por mes<a class="material-icons tooltipped" style="font-size: 15px;" data-position="bottom" data-delay="0" data-tooltip="Generalmente es el salario de un recien egresado de la carrera.">info_outline</a>:
                  <input class="uniIn" type="number" step="0.01" name="sueldo_min" min="0" required><br>
                </blockquote>
                <blockquote>

                  Máximo del promedio del salario por mes<a class="material-icons tooltipped" style="font-size: 15px;" data-position="bottom" data-delay="0" data-tooltip="Generalmente es el salario de un senior en puestos de trabajo elevados.">info_outline</a>:
                  <input class="uniIn" type="number" step="0.01" name="sueldo_max" min="0" required><br>
                </blockquote>
              </div>
              <blockquote>
                Plan de estudios <span style="color:red">(compatible con HTML)</span><a class="material-icons tooltipped" style="font-size: 15px;" data-position="bottom" data-delay="0" data-tooltip="Si hay un documento oficial en internet puede solo poner el enlace con una etiqueta A de HTML.">info_outline</a>:
                <textarea name="plan_estudios" class="plan_estudios" cols="30" rows="20" required></textarea> Vista previa
                <div class="plan_estudios" style="border: 2px solid red" required>

                </div>
              </blockquote>
              <blockquote>

                Perfil de egreso <span style="color:red">(compatible con HTML)</span>:
                <textarea name="perfEgreso" class="perfEgreso" cols="30" rows="20" required></textarea> Vista previa
                <div class="perfEgreso" style="border: 2px solid red" required>

                </div>
              </blockquote>
            </blockquote>
            <blockquote style="border-left-color: #4db6ac">
              <div class="uniIn">
                <blockquote>

                  Descripcion de la unidad academica <span style="color:red">(compatible con HTML)</span>:
                  <textarea type="text" name="unidad_desc" class="uni_desc" id="" required></textarea>
                  Vista previa
                  <div class="uni_desc" style="border: 2px solid red" required>

                  </div>
                </blockquote>
                <blockquote>

                  Coordenadas de la unidad academica: <br>
                  <blockquote>

                    Latitud:<input type="number" name="lat" id="lat" step="0.00000001" required>
                  </blockquote>
                  <blockquote>

                    Longitud <input type="number" name="lng" id="lng" step="0.00000001" required>
                  </blockquote>
                </blockquote>
                <blockquote>
                  Imagen de las instalaciones de la unidad academica (resolucion recomendada: 1920x1080 o superior)<br><br>
                  <input class="file-input1" type="file" name="imgF" value=""><br><br>

                  o<br><br>

                  Enlace de la imagen:
                  <input type="url" name="img" class="file-input2" required><br>
                </blockquote>
                <blockquote>

                  Autor de la foto:
                  <input type="text" name="img-autor" id="" required><br>
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
            <blockquote style="border-left-color: #cddc39 ">
              <div class="instIn">
                <blockquote>
                  Ranking nacional: <a href="https://www.topuniversities.com/university-rankings/latin-american-university-rankings/2018" target="_blank">Sacar de aquí</a>
                  <input type="number" name="rank_nac" value="" min="0" required>
                </blockquote>
                <blockquote>
                  Ranking mundial: <a href="https://www.topuniversities.com/university-rankings/latin-american-university-rankings/2018" target="_blank">Sacar de aquí</a>
                  <input type="number" name="rank_wrld" value="" min="0" required>
                </blockquote>
                <blockquote>

                  Becas que ofrece la institución <span style="color:red">(compatible con HTML)</span>:
                  <textarea name="becas" id="" class="becas" cols="30" rows="10" required></textarea> Vista previa
                  <div class="becas" style="border: 2px solid red" required>

                  </div>
                </blockquote>
                <blockquote>

                  Opciones de intercambio internacional o nacional<span style="color:red">(compatible con HTML)</span>:
                  <textarea name="intercambio" class="intercambio" cols="30" rows="20" required></textarea> Vista previa
                  <div class="intercambio" style="border: 2px solid red" required>

                  </div>
                </blockquote>
              </div>
            </blockquote>
            <input type="submit" name="smt" class="btn">
          </form>
        </div>
      </div>
    </div>
  </body>
  <script src="../js/jquery-3.2.1.min.js"></script>
  <script type="text/javascript" src="../js/materialize.js"></script>
  <script>
    var countDownDate = new Date("<?php echo $date;?>").getTime();
    var x = setInterval(function() {
      var now = new Date().getTime();
      var distance = countDownDate - now;
      var days = Math.floor(distance / (1000 * 60 * 60 * 24));
      var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
      var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
      var seconds = Math.floor((distance % (1000 * 60)) / 1000);

      document.getElementById("countdown").innerHTML = days + "d " + hours + "h "
      + minutes + "m " + seconds + "s ";
    }, 1000);
    $(".file-input1").change(e => {
      if($(".file-input1").val() == ""){
        $(".file-input2").removeAttr("disabled");
        $(".file-input2").attr("placeholder", "");
      }else{
        $(".file-input2").attr("disabled", "");
        $(".file-input2").attr("placeholder", "Desabilitado");
      }
    });

    $(".file-input2").keyup(e => {
      if($(".file-input2").val() == ""){
        $(".uniIn").find("input").removeAttr("disabled");
      }else{
        $(".file-input1").attr("disabled", "");
      }

    });

    $(".carreraDesc").keyup(e => {
      $($(".carreraDesc").get(1)).html($($(".carreraDesc").get(0)).val());
    });
    $(".uni_desc").keyup(e => {
      $($(".uni_desc").get(1)).html($($(".uni_desc").get(0)).val());
    });
    $(".becas").keyup(e => {
      $($(".becas").get(1)).html($($(".becas").get(0)).val());
    });
    $(".plan_estudios").keyup(e => {
      $($(".plan_estudios").get(1)).html($($(".plan_estudios").get(0)).val());
    });
    $(".intercambio").keyup(e => {
      $($(".intercambio").get(1)).html($($(".intercambio").get(0)).val());
    });
    $(".perfEgreso").keyup(e => {
      $($(".perfEgreso").get(1)).html($($(".perfEgreso").get(0)).val());
    });

    $(".referencias").keyup(e => {
      $($(".referencias").get(1)).html($($(".referencias").get(0)).val());
    });

    $($(".referencias").get(1)).html($($(".referencias").get(0)).val());

    $(document).ready(function() {
      $('select').material_select();
    });
    var cont = [false, false, false];
    $(document).ready(function() {
      $('input#name').autocomplete({
        data: {
          <?php
              $query = "SELECT * FROM carrera_info";
              $result = mysqli_query($con,$query);
              while ($r = mysqli_fetch_array($result, MYSQLI_ASSOC)){
                  echo "\"".$r["nombre"]."\" : null,\n";
              } ?>
        },
        limit: 5,
        onAutocomplete: function(val) {
          cont[0]=true;
          ajaxDis();
          $(".carrIn").find("input").attr("disabled", "")
          $(".carrIn").find("select").attr("disabled", "")
          $(".carrIn").find("input").attr("placeholder", "Desabilitado. Ya tenemos esta informacion")
          $(".carrIn").find("textarea").attr("disabled", "")
          $(".carrIn").find("textarea").attr("placeholder", "Desabilitado. Ya tenemos esta informacion")
        }
      });

      $('input#unid').autocomplete({
        data: {
          <?php
              $query = "SELECT * FROM universidad";
              $result = mysqli_query($con,$query);
              while ($r = mysqli_fetch_array($result, MYSQLI_ASSOC)){
                  echo "\"".$r["nombre"]."\":null,";
              } ?>
        },
        onAutocomplete: function(val) {
          cont[1]=true;
          ajaxDis();
        },
        limit: 5,
      });

      function ajaxDis(){
        if(cont[0] && cont[1] && cont[2]){
          dato = [$("#name").val(),$("#unid").val(), $("#inst").val()]
          $.ajax({
            url : "ajaxCname.php",
            type : "POST",
            data : {data:dato},
            success: function(s){
              if(s != ""){
                Materialize.toast('Parece ser que esta información ya ha sido ingresada. Recarge la página para ingresar una nueva.', 5000, 'rounded');
              }
            }
          });
        }
        if(cont[1] && cont[2]){
          dato = [$("#unid").val(), $("#inst").val()]
          $.ajax({
            url : "ajaxInst.php",
            type : "POST",
            data : {data:dato},
            success: function(s){
              if(s != ""){
                Materialize.toast('Parece ser que ya tenemos informació de '+dato[0]+' de '+dato[1]+'. Ya no es necesario ingresar su información, sólo el de la carrera.', 10000, 'rounded');
                $(".uniIn").find("input").attr("disabled", "");
                $(".uniIn").find("input").attr("placeholder", "Desabilitado. Ya tenemos esta informacion");
                $(".uniIn").find("textarea").attr("disabled", "");
                $(".uniIn").find("textarea").attr("placeholder", "Desabilitado. Ya tenemos esta informacion");
                $(".instIn").find("input").attr("disabled", "");
                $(".instIn").find("input").attr("placeholder", "Desabilitado. Ya tenemos esta informacion");
                $(".instIn").find("textarea").attr("disabled", "");
                $(".instIn").find("textarea").attr("placeholder", "Desabilitado. Ya tenemos esta informacion");
              }else{
                $(".uniIn").find("input").removeAttr("disabled");
                $(".uniIn").find("input").attr("placeholder", "");
                $(".uniIn").find("textarea").removeAttr("disabled");
                $(".uniIn").find("textarea").attr("placeholder", "");
              }
            }
          });
        }
      }

      $("#name").keyup(function(){

        $(".carrIn").find("input").removeAttr("disabled");
        $(".carrIn").find("input").attr("placeholder", "");
        $(".carrIn").find("textarea").removeAttr("disabled");
        $(".carrIn").find("textarea").attr("placeholder", "");
        $(".carrIn").find("select").removeAttr("disabled");
        ajaxDis();
      });

      $("#unid").keyup(function(){
        $(".uniIn").find("input").removeAttr("disabled");
        $(".uniIn").find("input").attr("placeholder", "");
        $(".uniIn").find("textarea").removeAttr("disabled");
        $(".uniIn").find("textarea").attr("placeholder", "");
        ajaxDis();
      });

      $("#inst").keyup(function(){
        $(".instIn").find("input").removeAttr("disabled");
        $(".instIn").find("input").attr("placeholder", "");
        $(".instIn").find("textarea").removeAttr("disabled");
        $(".instIn").find("textarea").attr("placeholder", "");
        ajaxDis();
      });

      $('input#inst').autocomplete({
        data: {
          <?php
              $query = "SELECT * FROM institucion";
              $result = mysqli_query($con,$query);
              while ($r = mysqli_fetch_array($result, MYSQLI_ASSOC)){
                  echo "\"".$r["name"]."\":null,";
              } ?>
        },
        onAutocomplete: function(val) {
          cont[2]=true;
          ajaxDis();
          $(".instIn").find("input").attr("disabled", "");
          $(".instIn").find("input").attr("placeholder", "Desabilitado. Ya tenemos esta informacion");
          $(".instIn").find("textarea").attr("disabled", "");
          $(".instIn").find("textarea").attr("placeholder", "Desabilitado. Ya tenemos esta informacion");
        },
        limit: 5,
      });
    })


    $("img").remove();
  </script>

  </html>
