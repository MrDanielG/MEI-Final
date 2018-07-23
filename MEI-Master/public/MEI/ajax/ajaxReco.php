<?php
    include '../../../private/conn.php';
    session_start();
    $user = $_SESSION['user'];
    $res = mysqli_fetch_array(mysqli_query($con, "SELECT UID FROM usuario WHERE email = '{$_SESSION["user"]}'"), MYSQLI_NUM);
    $usr_uid = $res[0];
    if(isset($_GET["lat"]) && isset($_GET["lng"])){
      $range=$_GET["range"];
      $lat=$_GET["lat"];
      $lng=$_GET["lng"];
    }
    $limite = $_GET['limit'];
    $i = $limite;

    $result = mysqli_fetch_array(mysqli_query($con,"SELECT id_resultado FROM aplicacion_examen WHERE id_user = '$usr_uid' ORDER BY UID DESC LIMIT 1"), MYSQLI_NUM);

    $q = "SELECT universidad.foto_url, carrera_info.nombre, universidad.nombre, institucion.name, universidad.lat, universidad.lng, carrera_info.salario_min, carrera_info.salario_max, carrera_uni.UID FROM carrera_uni
            JOIN universidad ON universidad.UID = carrera_uni.id_universidad
            JOIN carrera_info ON carrera_info.UID = carrera_uni.id_carrera
            JOIN institucion ON institucion.UID = universidad.id_institutucion
            JOIN carrera_area ON carrera_info.UID = carrera_area.id_carrera
            WHERE carrera_area.id_area = {$result[0]} ORDER BY carrera_info.nombre";

    $r_2 = mysqli_query($con,$q);

    echo mysqli_error($con);

    while($card = mysqli_fetch_array($r_2 , MYSQLI_NUM)){

      if(isset($range)){
        if((distancia($lat, $lng, $card[4], $card[5])/1000) <= $range){
          $i--;
          echoS($card);
        }
      }else{
        $i--;
        echoS($card);
      }
      if($i == 0){
        echo "<div class='row'><a href='#!' class='col s12 btn white red-text waves-effect more-btn' onclick='moreResult(".($limite+5).")'>Ver más</a></div>";
        break;
      }
    }

    function echoS($card){
      echo '
      <div class="card row hoverable">
          <div class="reco_foto col s12 m3" data-content="'.$card[0].'" style="background:url('.$card[0].') no-repeat center center;"></div>
          <div class="col s12 m9">
              <div class="card-content">
                <span class="right green-text text-darken-1"><h6>$'.$card[6].' - $'.$card[7].'/mes</h6></span>
                  <span class="card-title reco_carrera" data-num="'.$card[8].'">'.$card[1].'</span>
                  <span class="reco_universidad">'.$card[2].'</span><br>
                  <span class="reco_inst">'.$card[3].'</span>
              </div>
              <div class="card-action">
                  <a href="carrera.php?carrera='.$card[1].'&uni='.$card[2].'" class="reco_info">Información</a>
                  <a class="modal-trigger reco_maps" data-lat="'.$card[4].'" data-lng="'.$card[5].'" onclick="lati = '.$card[4].', long= '.$card[5].';" href="#map-modal">Ubicación</a>
              </div>
          </div>
      </div>';
    }

    function distancia($latitudeFrom, $longitudeFrom, $latitudeTo, $longitudeTo, $earthRadius = 6371000){
      $latFrom = deg2rad(floatval($latitudeFrom));
      $lonFrom = deg2rad(floatval($longitudeFrom));
      $latTo = deg2rad($latitudeTo);
      $lonTo = deg2rad($longitudeTo);

      $latDelta = $latTo - $latFrom;
      $lonDelta = $lonTo - $lonFrom;

      $angle = 2 * asin(sqrt(pow(sin($latDelta / 2), 2) +
        cos($latFrom) * cos($latTo) * pow(sin($lonDelta / 2), 2)));
      return $angle * $earthRadius;
    }
?>
<script type="text/javascript">
  function moreResult(limit){
    $.ajax({url:"ajax/ajaxReco.php?limit="+limit+<?php if(isset($_GET["lat"])&&isset($_GET["lng"])){
      echo "'&range=".$range=$_GET["range"]."&lat=".$lat=$_GET["lat"]."&lng=".$lng=$_GET["lng"]."'";
    }else{echo "''";} ?>,
            success: function(data){
              $("#recoContainer").html(data);
            }});
  }
</script>
