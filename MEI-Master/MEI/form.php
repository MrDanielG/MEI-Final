<!DOCTYPE html >
<html>

<head>
    <meta charset="UTF-8">
    <title>Test Vocaional 1</title>
    <?php include '../resourses/header.html'; ?>

    <style>
        .pregs{
            padding: 20px;
        }
    </style>
</head>
<body>
    <?php include '../resourses/menu.html'; ?>
    <div class="body container">
      <div class="card">

        <form action="formValidate.php" method="post" class="form card-content">
            <?php
              include '../conn.php';

              $result = mysqli_query($con, "SELECT * FROM `pregunta` WHERE `id_examen` = ".$_GET["id"]);
              $areas = array();
              while ($preg = mysqli_fetch_array($result, MYSQLI_NUM)) {
                printP($preg, $con, $areas);
              }

              function printP($res,$con, &$array){
                echo
                  '<div class="pregs">
                      <h5 class="preg">'.$res[2].'</h5><br />';

                printR(uniqid(),$res[0], $con,  $array);

                echo '</div>';
              }

              function printR($uid, $p_id, $con, &$areas){
                $q = mysqli_query($con, "SELECT `area`.`nombre`, `respuesta`.`respuesta`, `respuesta`.`valor` FROM `pregunta`
                                          JOIN `respuesta` ON `respuesta`.`id_pregunta` = `pregunta`.`UID`
                                          JOIN `area` ON `area`.`UID` = `pregunta`.`id_area`
                                          WHERE `respuesta`.`id_pregunta` =".$p_id);

                for ($i = 1; $res = mysqli_fetch_array($q, MYSQLI_NUM) ; $i++) {
                  if(!isset($areas[$res[0]])){
                    $areas[$res[0]] = 0;
                  }else if($i == 1){
                    $areas[$res[0]]++;
                  }
                  echo '<input required type="radio" id="op'.$uid.$i.'" name="'.$res[0].'['.$areas[$res[0]].']" value="'.$res[2].'">
                        <label class="option" for="op'.$uid.$i.'">'.$res[1].'</label>';
                }
              }
            ?>

            <div align="center">
                <button type="submit" class="btn waves-effect waves-light" name="submit" id="boton">Enviar</button>
            </div><br><br>
        </form>
      </div>
    </div>
    <?php include '../resourses/footer.html';
          include "../resourses/scripts.html"; ?>

    <script type="text/javascript">
      if(JSI){
        var pregdiv = document.getElementsByClassName('pregs');
        var radioB = document.getElementsByClassName('option');
        for(var i = 0 ; i < pregdiv.length ; ++i){
           JSI.pregunta(pregdiv[i].getElementsByClassName('preg')[0].innerText);
           JSI.radioGCreate();
           var radioBs = pregdiv[i].getElementsByClassName('option');
           for(var e = 0 ; e < radioBs.length ; ++e){
               JSI.radioCreate(radioBs[e].innerText);
           }
           JSI.separador();
        }
      }
    </script>
</body>

</html>
69
