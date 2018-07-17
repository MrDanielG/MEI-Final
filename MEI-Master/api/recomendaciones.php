<?php
    $usr_uid = $_POST['key'];
   
    if(isset($_POST["lat"]) && isset($_POST["lng"])){
      $range=$_POST["range"];
      $lat=$_POST["lat"];
      $lng=$_POST["lng"];
    }
    $limite = $_POST['limit'];
    $i = $limite;

    $result = mysqli_fetch_array(mysqli_query($con,"SELECT id_resultado FROM aplicacion_examen WHERE id_user = '$usr_uid' ORDER BY UID DESC LIMIT 1"), MYSQLI_NUM);

    $q = "SELECT universidad.foto_url, carrera_info.nombre, universidad.nombre, institucion.name, universidad.lat, universidad.lng, carrera_info.salario_min, carrera_info.salario_max, carrera_uni.UID FROM carrera_uni
          JOIN universidad ON universidad.UID = carrera_uni.id_universidad
          JOIN carrera_info ON carrera_info.UID = carrera_uni.id_carrera
          JOIN institucion ON institucion.UID = universidad.id_institutucion WHERE carrera_info.id_area = {$result[0]} ORDER BY carrera_info.nombre";

    $r_2 = mysqli_query($con,$q);
    $carreras = array();
    while($card = mysqli_fetch_array( $r_2 , MYSQLI_NUM)){
      if(isset($range)){
        if((distancia($lat, $lng, $card[4], $card[5])/1000) <= $range){
          $i--;
          array_push($carreras,$card);
        }
      }else{
        $i--;
        array_push($carreras,$card);
      }
      if($i == 0){
        //echo "<div class='row'><a href='#!' class='col s12 btn white red-text waves-effect more-btn' onclick='moreResult(".($limite+5).")'>Ver más</a></div>";
        break;
      }
    }
    echo json_encode($carreras);

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