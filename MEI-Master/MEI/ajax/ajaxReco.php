<?php
    include '../../conn.php';
    session_start();
    $user = $_SESSION['user'];
    if(isset($_GET["lat"])&&isset($_GET["lng"])){
      $range=$_GET["range"];
      $lat=$_GET["lat"];
      $lng=$_GET["lng"];
    }
    $fechaq = mysqli_query($con,"SELECT id FROM aplicacion_examen ORDER BY id DESC LIMIT 1");
    $fecha = mysqli_fetch_array($fechaq, MYSQLI_NUM);

    if(isset($range)){
      $query = "SELECT * FROM exam_recomendacion WHERE UsrEmail = '$user' AND Id_Aplicacion_Examen = '{$fecha[0]}'";
      $result = mysqli_query($con,$query);
      while($registro = mysqli_fetch_array($result, MYSQLI_ASSOC)){
        $univq = mysqli_query($con,"SELECT uni_foto,latitud,longitud FROM universidades WHERE nombre = '{$registro['NombreUni']}'");
        $univ = mysqli_fetch_array($univq, MYSQLI_NUM);
        $uni = mysqli_fetch_array(mysqli_query($con,"SELECT * FROM universidades INNER JOIN institucion ON institucion.id = universidades.idInstitutucion WHERE nombre =  '".$registro['NombreUni']."'"), MYSQLI_ASSOC);
        if((distancia($lat,$lng,$univ[1],$univ[2])/1000) <= $range){
          echo '
          <div class="card row hoverable">
              <div class="reco_foto col s12 m3" data-content="'.$univ[0].'" style="background:url('.$univ[0].') no-repeat center center;"></div>
              <div class="col s12 m9">
                  <div class="card-content">
                      <span class="card-title reco_carrera">'.$registro['Nombre_Carrera'].'</span>
                      <span class="reco_universidad">'.$registro['NombreUni'].'</span><br>
                      <span class="carrera">'.$uni['name'].'</span>
                  </div>
                  <div class="card-action">
                      <a href="carrera.php?carrera='.$registro["Nombre_Carrera"].'&uni='.$registro["NombreUni"].'" class="reco_info">Información</a>
                      <a class="modal-trigger reco_maps" onclick="lati = '.$univ[1].', long= '.$univ[2].';" href="#map-modal">Ubicación</a>
                  </div>
              </div>
          </div>';
        }
      }
    }else{
      $query = "SELECT * FROM exam_recomendacion WHERE UsrEmail = '$user' AND Id_Aplicacion_Examen = '{$fecha[0]}'";
      $result = mysqli_query($con,$query);
      while($registro = mysqli_fetch_array($result, MYSQLI_ASSOC)){
        $univq = mysqli_query($con,"SELECT uni_foto,latitud,longitud FROM universidades WHERE nombre = '{$registro['NombreUni']}'");
        $univ = mysqli_fetch_array($univq, MYSQLI_NUM);
        $uni = mysqli_fetch_array(mysqli_query($con,"SELECT * FROM universidades INNER JOIN institucion ON institucion.id = universidades.idInstitutucion WHERE nombre =  '".$registro['NombreUni']."'"), MYSQLI_ASSOC);
        echo '
        <div class="card row hoverable">
            <div class="reco_foto col s12 m3" data-content="'.$univ[0].'" style="background:url('.$univ[0].') no-repeat center center;"></div>
            <div class="col s12 m9">
                <div class="card-content">
                    <span class="card-title reco_carrera">'.$registro['Nombre_Carrera'].'</span>
                    <span class="reco_universidad">'.$registro['NombreUni'].'</span><br>
                    <span class="carrera">'.$uni['name'].'</span>
                </div>
                <div class="card-action">
                    <a href="carrera.php?carrera='.$registro["Nombre_Carrera"].'&uni='.$registro["NombreUni"].'" class="reco_info">Información</a>
                    <a class="modal-trigger reco_maps" data-lat="'.$univ[1].'" data-lng="'.$univ[2].'" onclick="lati = '.$univ[1].', long= '.$univ[2].';" href="#map-modal">Ubicación</a>
                </div>
            </div>
        </div>';
      }
    }
    function distancia($latitudeFrom, $longitudeFrom, $latitudeTo, $longitudeTo, $earthRadius = 6371000){
      // convert from degrees to radians
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
