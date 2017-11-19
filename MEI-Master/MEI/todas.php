<html>
    <head>
        <title>Todas las carreras</title>

        <script>
            console.log("todas|");
        </script>
        <?php include '../resourses/header.html'; ?>
    </head>
    <body>

        <?php include '../resourses/menu.html'; ?><br><br>

        <div class="container">
            <?php
                include '../conn.php';
                $query = "SELECT * FROM carreras";
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
                              <span class="card-title reco_carrera">'.$registro['nombre'].'</span>
                              <span class="reco_universidad">'.$registro['NombreUni'].'</span><br>
                              <span class="reco_inst">'.$uni['name'].'</span>
                          </div>
                          <div class="card-action">
                              <a href="carrera.php?carrera='.$registro["nombre"].'&uni='.$registro["NombreUni"].'" class="reco_info">Información</a>
                              <a class="modal-trigger reco_maps" data-lat="'.$univ[1].'" data-lng="'.$univ[2].'" onclick="lati = '.$univ[1].', long= '.$univ[2].';" href="#map-modal">Ubicación</a>
                          </div>
                      </div>
                  </div>';
                }

            ?>
        </div>
        <div id="map-modal" class="modal">
            <div class="modal-content" id="map-container">
                <div id="map" style="width:100%;min-height:60vh;"></div>
            </div>
        </div>
        <?php include '../resourses/footer.html'; ?>
        <?php include '../resourses/scripts.html'; ?>
        <script>

            $(document).ready(function(){
                $('.modal').modal({
                    ready: function(modal, trigger) { // Callback for Modal open. Modal and trigger parameters available.
                        console.log('mapa|'+lati+'|'+long);
                        $("#map-container").html('<div id="map" style="width:100%;min-height:54vh;"></div>');
                        var uluru = { lat: lati, lng: long };
                        map = new google.maps.Map(document.getElementById('map'), {
                            zoom: 17,
                            center: uluru
                        });
                        marker = new google.maps.Marker({
                            position: uluru,
                            map: map
                        });
                        map.setCenter(new google.maps.LatLng(lati, long));
                        marker.setPosition(new google.maps.LatLng(lati, long));
                    },
                });
            });
        </script>
    </body>
</html>
