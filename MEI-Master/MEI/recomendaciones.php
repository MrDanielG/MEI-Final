<html>
    <head>
        <title>Recomendaciones</title>
        <?php include '../resourses/header.html'; ?>
    </head>
    <body>
        <?php include '../resourses/menu.html'; ?>
        <div class="container">
            <div class="card row">
              <div class="card-content col s12">
                <input type="checkbox" name="republica" checked id="republicaCB"><label for="republicaCB" style="z-index:10000">Toda la república mexicana</label>
                <div id="rangeRecoC" class="range-field">Rango (km.) <input type="range" id="rangeReco" value="10" min="10" max="400"></div>
                *Se necesita tener acceso a la ubicación para usar esta herramienta.
              </div>
            </div>
            <div class="tap-target" data-activates="republicaCB">
              <div class="tap-target-content">
                <h5>Rango</h5>
                <p>Puedes filtrar las carreras por la distancia entre tú y las universidades haciendo click en la palomita.</p>
              </div>
            </div>
            <div id="recoContainer">

            </div>
        </div>
        <div id="map-modal" class="modal">
            <div class="modal-content" id="map-container">
                <div id="map" style="width:100%;min-height:60vh;"></div>
            </div>
        </div>
        <?php include '../resourses/footer.html'; ?>
        <?php include '../resourses/scripts.html'; ?>
        <script>
            if(!getCookie("discover")){
              $('.tap-target').tapTarget('open');
              document.cookie = "discover=true";
            }
            $.ajax({url:"ajax/ajaxReco.php",
                    success: function(data){
                      $("#recoContainer").html(data);
                    }});


            function getCookie(cname) {
              var name = cname + "=";
              var decodedCookie = decodeURIComponent(document.cookie);
              var ca = decodedCookie.split(';');
              for(var i = 0; i <ca.length; i++) {
                  var c = ca[i];
                  while (c.charAt(0) == ' ') {
                      c = c.substring(1);
                  }
                  if (c.indexOf(name) == 0) {
                      return c.substring(name.length, c.length);
                  }
              }
              return "";
          }
            $("#rangeReco").on('input', e => {
              $.ajax({url:"ajax/ajaxReco.php?range="+e.target.valueAsNumber+"&lat="+pos.lat+"&lng="+pos.lng,
                      success: function(data){
                        $("#recoContainer").html(data);
                      }});
            });
            $("#rangeRecoC").animate({height:"0px",opacity:"0"});
            $("#republicaCB").click(e=>{
              if(e.target.checked){
                $("#rangeRecoC").animate({height:"0px",opacity:"0"});
                $.ajax({url:"ajax/ajaxReco.php",
                        success: function(data){
                          $("#recoContainer").html(data);
                        }});
              }else {
                ajaxReco(pos.lat,pos.lng,$(e.target).parent().find("#rangeReco")[0].valueAsNumber);
              }
            });

            function ajaxReco(lats,lngs,range){
              $("#rangeRecoC").animate({height:"55px",opacity:"1"});
              $.ajax({url:"ajax/ajaxReco.php?range="+range+"&lat="+lats+"&lng="+lngs,
                      success: function(data){
                        $("#recoContainer").html(data);
                      }});
            }

            (function(a){(jQuery.browser=jQuery.browser||{}).mobile=/(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|mobile.+firefox|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows ce|xda|xiino/i.test(a)||/1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-/i.test(a.substr(0,4))})(navigator.userAgent||navigator.vendor||window.opera);


            if(!jQuery.browser.mobile){
              if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(function(position) {
                  pos = {
                    lat: position.coords.latitude,
                    lng: position.coords.longitude
                  };
                }, function() {
                  handleLocationError(true, infoWindow, map.getCenter());
                });
              } else {
                // Browser doesn't support Geolocation
                handleLocationError(false, infoWindow, map.getCenter());
                $("body").remove();
              }
            }

            function modalMap(latt,lngt){
              $('.modal').modal({
                  ready: function(modal, trigger) {
                      $("#map-container").html('<div id="map" style="width:100%;min-height:54vh;"></div>');
                      var uluru = { lat: latt, lng: lngt };
                      map = new google.maps.Map(document.getElementById('map'), {
                          zoom: 17,
                          center: uluru
                      });
                      marker = new google.maps.Marker({
                          position: uluru,
                          map: map
                      });
                      map.setCenter(new google.maps.LatLng(latt, lngt));
                      marker.setPosition(new google.maps.LatLng(latt, lngt));
                  }
              });
            }

        </script>
        <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDZfDEE62mg_IxJAJctQtb7d0nUkHH1Bvo&callback=initMap"></script>
    </body>
</html>
