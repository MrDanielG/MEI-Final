<html>
    <head>
        <title>Todas las carreras</title>
        <?php include '../resourses/header.html'; ?>
    </head>
    <body>
        <?php include '../resourses/menu.html'; ?><br><br>

        <div class="container">
            <?php
                $query = "SELECT universidad.foto_url, carrera_info.nombre, universidad.nombre, institucion.name, universidad.lat, universidad.lng, carrera_info.salario_min, carrera_info.salario_max FROM carrera_uni
                          JOIN universidad ON universidad.UID = carrera_uni.id_universidad
                          JOIN carrera_info ON carrera_info.UID = carrera_uni.id_carrera
                          JOIN institucion ON institucion.UID = universidad.id_institutucion";
                $result = mysqli_query($con,$query);
                while($card = mysqli_fetch_array($result, MYSQLI_NUM)){
                  echo '
                  <div class="card row hoverable">
                      <div class="reco_foto col s12 m3" data-content="'.$card[0].'" style="background:url('.$card[0].') no-repeat center center;"></div>
                      <div class="col s12 m9">
                          <div class="card-content">
                            <span class="right green-text text-darken-1"><h6>$'.$card[6].' - $'.$card[7].'/mes</h6></span>
                              <span class="card-title reco_carrera">'.$card[1].'</span>
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
                    ready: function(modal, trigger) {
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
        <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDZfDEE62mg_IxJAJctQtb7d0nUkHH1Bvo&callback=initMap"></script>
    </body>
</html>
