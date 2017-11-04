<html>
    <head>
        <title>Recomendaciones | MEI</title>
        <?php include '../resourses/header.html'; ?>
        <script>
            console.log("recomendaciones|");
        </script>
    </head>
    <body>
        <?php include '../resourses/menu.html'; ?>
        <div class="container">
            <?php
                $query = "SELECT * FROM exam_recomendacion WHERE UsrEmail = '$user'";
                $result = mysqli_query($con,$query);


                while ($registro = mysqli_fetch_array($result, MYSQLI_ASSOC)){
                    $univq = mysqli_query($con,"SELECT uni_foto,latitud,longitud FROM universidades WHERE nombre = '{$registro['NombreUni']}'");
                    $univ = mysqli_fetch_array($univq, MYSQLI_NUM);
                    echo '
                    <div class="card horizontal">
                        <div class="card-image reco_foto" data-content="'.$univ[0].'" style="width:200px;height:200px;overflow:hidden;background:url('.$univ[0].') no-repeat center center;background-size: auto 100%;"></div>
                        <div class="card-stacked">
                            <div class="card-content">
                                <span class="card-title reco_carrera">'.$registro['Nombre_Carrera'].'</span>
                                <span class="reco_universidad">'.$registro['NombreUni'].'</span>
                            </div>
                            <div class="card-action">
                                <a href="carrera.php?carrera='.$registro["Nombre_Carrera"].'&uni='.$registro["NombreUni"].'" class="reco_info">Información de la carrera</a>
                                <a class="modal-trigger reco_maps" onclick="lati = '.$univ[1].', long= '.$univ[2].';" href="#map-modal">Ubicación</a>
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

            function centrarMapa(lati, long){
                
            }
        </script>
    </body>
</html>