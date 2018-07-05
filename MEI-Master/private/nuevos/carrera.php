<?php
  include '../conn.php';
  $name = $_GET['carrera'];
  $uni = $_GET['uni'];
  //echo "".$carrera."<br>".$carrera."";
  $query = mysqli_query($con,"SELECT * FROM carrera_uni
            JOIN universidad ON universidad.UID = carrera_uni.id_universidad
            JOIN carrera_info ON carrera_info.UID = carrera_uni.id_carrera
            JOIN institucion ON institucion.UID = universidad.id_institutucion
            WHERE carrera_info.nombre  = '$name' AND universidad.nombre = '$uni'");

  $carrera = mysqli_fetch_array($query, MYSQLI_NUM);
  ?>
<html>
    <head>
        <title><?php echo $_GET["carrera"] ?></title>
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
    <body style="background-image: url('<?php echo $carrera[11]; ?>');background-size: cover;background-attachment: fixed; background-position: center center;">
        <?php
            echo '
            <div>
              <div class=""><span style="position: absolute; padding:5px; margin:15px; background-color:#00000050; color: white; ">Foto: '.$carrera[12].'</span></div>
            </div>';
        ?>
        <div id="container" style="display:block;">
            <div class="container">
                <?php
                  echo '
                  <div class="card white-1">
                  <span class="right" style="margin-right:6px"><a href="#modal-email" class="modal-trigger">¿Hay algo incorrecto? Contactanos</a></span>
                  <div id="modal-email" class="modal">
                    <div class="modal-content">
                      <h4>Enviar email</h4>
                      <div class="input-field col s6">
                          <input id="subject" type="text" class="validate">
                          <label for="subject">Asunto</label>
                        </div>
                        <div class="input-field col s12">
                          <textarea id="textarea1" class="materialize-textarea"></textarea>
                          <label for="textarea1">Mensaje</label>
                        </div>
                    </div>
                    <div class="modal-footer">
                      <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat" onclick="sendEmail()">Enviar</a>
                    </div>
                  </div>
                    <div class="card-content">
                      <span class="right green-text text-darken-1"><h5>Promedio: $'.$carrera[19].' - $'.$carrera[20].'/mes <i class="material-icons tooltipped" style="font-size: 20px;" data-position="bottom" data-delay="0" data-tooltip="El promedio depende de la experiencia, el puesto, la preparación profesional y del trabajo realizado en el mes.">info_outline</i></h5></span>
                      <span><h3 class="card-title">'.$carrera[16].'</h3></span>
                      <span class="carrera">'.$carrera[7].'</span><br>
                      <span class="carrera">'.$carrera[23].' - Ranking México: #'.$carrera[26].' / Ranking Mundo: #'.$carrera[27].'</span><br>
                      <h5>Descripción</h5>
                      <span class="carrera">'.$carrera[17].'</span>
                      <h5>'.$uni.'</h5>
                      <span class="carrera">'.$carrera[8].'</span>
                      <h5>Plan de estudios</h5>
                      <span class="carrera">'.$carrera[2].'</span>
                      <h5>Perfil de egreso</h5>
                      <span class="carrera">'.$carrera[3].'</span>
                      <h5>Becas</h5>
                      <span class="carrera">'.$carrera[25].'</span>
                      <h5>Intercambios</h5>
                      <span class="carrera">'.$carrera[24].'</span>
                      <h5>Referencias</h5>
                      <span class="carrera">'.$carrera[5].'</span>
                    </div>
                  </div>';

                ?>
            </div>

            <?php include '../resourses/footer.html'; ?>
        </div>
        <?php include '../resourses/scripts.html'; ?>
        <script>
            $(document).ready(function(){
                $("#modal-email").modal();
            });
            var cardOffset=570;

            $("#container").offset({top: cardOffset+(-window.pageYOffset/2)});

            function sendEmail(){
                $.ajax({
                    url:"mailto.php",
                    type:"POST",
                    data:{"sub":$("#subject").val(),"msg":$("#textarea1").val()},
                    complete: function(){console.log("Closed");$("#subject").val("");$("#textarea1").val("");}
                });
            }
        </script>
    </body>
</html>
