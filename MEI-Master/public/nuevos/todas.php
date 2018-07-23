<html>
    <head>
        <title>Todas | MEI</title>

        <!--Estilos-->
    <link rel="stylesheet" type="text/css" href="../../assets/css/estilos.css">
    <!--Import Google Icon Font-->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
    <!--Import materialize.css-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-rc.2/css/materialize.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <meta charset="utf-8" />

    <!--Let browser know website is optimized for mobile-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    </head>
    <body>

        <div class="container">
          <div class="card">
            <div class="card-content">
              <div id="heatmap" style="height: 500px"></div>
              <?php
                  include '../../private/conn.php';

                  $q = mysqli_query($con, "SELECT UID FROM carrera_uni");
                  echo "Total de carreras: ".mysqli_num_rows($q);

                  $q = mysqli_query($con, "SELECT UID FROM carrera_info");
                  echo "<br>Total de carreras únicas: ".mysqli_num_rows($q);

                  $q = mysqli_query($con, "SELECT UID FROM universidad");
                  echo "<br>Total de unidades academicas: ".mysqli_num_rows($q);

                  $q = mysqli_query($con, "SELECT UID FROM institucion");
                  echo "<br>Total de instituciones: ".mysqli_num_rows($q);

                  $q = mysqli_query($con, "SELECT UID FROM carrera_area WHERE id_area = 1");
                  echo "<br>Total de carreras únicas de Ciencias Quimico/Biologicas: ".mysqli_num_rows($q);

                  $q = mysqli_query($con, "SELECT UID FROM carrera_area WHERE id_area = 2");
                  echo "<br>Total de carreras únicas de Humanidades y Artes: ".mysqli_num_rows($q);

                  $q = mysqli_query($con, "SELECT UID FROM carrera_area WHERE id_area = 3");
                  echo "<br>Total de carreras únicas de Ciencias Fisico/Matemáticas y de Igeniería: ".mysqli_num_rows($q);

                  $q = mysqli_query($con, "SELECT UID FROM carrera_area WHERE id_area = 4");
                  echo "<br>Total de carreras únicas de Ciencias Sociales: ".mysqli_num_rows($q); ?>
            </div>
          </div>
          <?php
                $query = "SELECT universidad.foto_url, carrera_info.nombre, universidad.nombre, institucion.name, universidad.lat, universidad.lng, carrera_info.salario_min, carrera_info.salario_max FROM carrera_uni
                          JOIN universidad ON universidad.UID = carrera_uni.id_universidad
                          JOIN carrera_info ON carrera_info.UID = carrera_uni.id_carrera
                          JOIN institucion ON institucion.UID = universidad.id_institutucion ORDER BY carrera_uni.UID DESC";
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
        <script src="../js/jquery-3.2.1.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-rc.2/js/materialize.min.js"></script>
        <script>
        var map, marker,lati,long;;
        function initMap() {
          var uluru = { lat: 24.0983213, lng: -101.5415634 };
          map = new google.maps.Map(document.getElementById('map'), {
            zoom: 17,
            center: uluru
          });

          map2 = new google.maps.Map(document.getElementById('heatmap'), {
            zoom: 5,
            center: uluru
          });

          heatmap = new google.maps.visualization.HeatmapLayer({
              data: getPoints(),
              map: map2
            });

            heatmap.set('radius', heatmap.get('radius') ? null : 39);
        }

        function getPoints() {
            return [<?php
                $result = mysqli_query($con,"SELECT lat, lng FROM universidad");
                while($card = mysqli_fetch_array($result, MYSQLI_NUM)){
                    echo "new google.maps.LatLng(".$card[0].", ".$card[1]."),";
                } ?>];
        }
</script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDZfDEE62mg_IxJAJctQtb7d0nUkHH1Bvo&libraries=visualization&callback=initMap"></script>
        <script>
            (function(a){(jQuery.browser=jQuery.browser||{}).mobile=/(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|mobile.+firefox|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows ce|xda|xiino/i.test(a)||/1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-/i.test(a.substr(0,4))})(navigator.userAgent||navigator.vendor||window.opera);

            if(jQuery.browser.mobile){
                console.log("Es mobil");
                $('#modalMobile').modal('open');
            }



            $(document).ready(function(){
                $(".reco_foto").height($($(".reco_foto").parent()).height());
              $("#map-container").animate({height: "0px"});
                $('.modal').modal({
                    ready: function(modal, trigger) {
                      $("#map-container").css("height", "0px");
                        $("#map-container").html('<div id="map" style="width:100%;min-height:54vh;display:none;"></div>');
                        $("#map-container").animate({height: "60vh"});
                        $("#map").fadeIn("slow");
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
                    complete: function(){
                      $("#map-container").animate({height: "0px"});
                      $("#map").fadeOut("fast");
                    }
                });
            });
        </script>
    </body>
</html>
