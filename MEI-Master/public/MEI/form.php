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
        <form action="#!" method="post" onsubmit="result();return false;" class="form card-content">
            <?php

              $result = mysqli_query($con, "SELECT * FROM `pregunta` WHERE `id_examen` = ".$_GET["id"]);
              $areas = array();
              for ($i = 0 ; $preg = mysqli_fetch_array($result, MYSQLI_NUM) ; ++$i) {
                printP($preg, $con, $areas);
              }

              function printP($res,$con, &$array){
                echo
                  '<div class="pregs">
                      <h5>'.$res[2].'</h5><br />';

                printR(uniqid(),$res[0], $con,  $array);

                echo '</div>';
              }

              function printR($uid, $p_id, $con, &$areas){
                $q = mysqli_query($con, "SELECT `area`.`nombre`, `respuesta`.`respuesta`, `respuesta`.`valor` FROM `respuesta`
                                          JOIN `area` ON `area`.`UID` = `respuesta`.`id_area`
                                          WHERE `respuesta`.`id_pregunta` =".$p_id);

                for ($i = 1; $res = mysqli_fetch_array($q, MYSQLI_NUM) ; $i++) {
                  echo '<input required type="radio" id="op'.$uid.$i.'" name="op'.$uid.'" area-name="'.$res[0].'" value="'.$res[2].'">
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
      function result(){
        var areas = new Map();
        for(var i = 0 ; i < $(".pregs").length ; ++i){
          var radio = $($(".pregs")[i]).find("input:checked");
          for(var e = 0 ; e < radio.length ; ++e){
            var areaData = areas.get($(radio).attr("area-name"));
            if(areaData == null){
              areas.set($(radio).attr("area-name"), parseInt($(radio).prop("value")));
            }else{
              areaData += parseInt($(radio).prop("value"));
              areas.set($(radio).attr("area-name"), parseInt(areaData));
            }
          }
        }
        var resu = "";
        var temp = -100;
        for (var [clave, valor] of areas) {
          if(valor > temp){
            resu = clave;
            temp = valor;
          }
        }
        
        window.location = "formValidate.php?area="+resu+"&UID=<?php echo $_GET["id"]; ?>"+;
      }
    </script>
</body>

</html>
69
