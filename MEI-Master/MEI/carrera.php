<html>
    <head>
        <title><?php echo $_GET["carrera"] ?></title>
        <?php include '../resourses/header.html'; ?>
    </head>
    <body>
        <?php include '../resourses/menu.html'; ?>
            <?php
                $name = $_GET['carrera'];
                $uni = $_GET['uni'];
                //echo "".$carrera."<br>".$carrera."";
                $query = mysqli_query($con,"SELECT * FROM carrera_uni
                          JOIN universidad ON universidad.UID = carrera_uni.id_universidad
                          JOIN carrera_info ON carrera_info.UID = carrera_uni.id_carrera
                          JOIN institucion ON institucion.UID = universidad.id_institutucion
                          WHERE carrera_info.nombre  = '$name' AND universidad.nombre = '$uni'");

                $carrera = mysqli_fetch_array($query, MYSQLI_NUM);
                echo '
                <div>
                  <div class=""><span style="position: absolute; padding:5px; margin:15px; background-color:#00000050; color: white; ">Foto: '.$carrera[12].'</span><img class="carrera_img" src="'.$carrera[11].'" style="width: 100%; position: fixed; top:0px; z-index: -1;"></div>
                </div>';
            ?>
            <div id="container" style="display:block;">
                <div class="container">
                    <?php
                      echo '
                      <div class="card white-1">
                        <div class="card-content">
                          <span class="right green-text text-darken-1"><h5>Promedio: $'.$carrera[19].' - $'.$carrera[20].'/mes</h5></span>
                          <span><h3 class="card-title">'.$carrera[16].'</h3></span>
                          <span class="carrera">'.$carrera[7].'</span><br>
                          <span class="carrera">'.$carrera[23].' - Ranking México: #'.$carrera[26].' / Ranking Mundo: #'.$carrera[27].'</span><br>
                          <h5>Descripción</h5>
                          <span class="carrera">'.$carrera[17].'</span>
                          <h5>'.$uni.'</h5>
                          <span class="carrera">'.$carrera[8].'</span>
                          <h5>Plan de estudios</h5>
                          <span class="carrera">'.$carrera[2].'</span>
                          <h5>Perfil de egreso</h5>
                          <span class="carrera">'.$carrera[3].'</span>
                          <h5>Becas</h5>
                          <span class="carrera">'.$carrera[25].'</span>
                          <h5>Intercambios</h5>
                          <span class="carrera">'.$carrera[24].'</span>
                          <h5>Referencias</h5>
                          <span class="carrera">'.$carrera[5].'</span>
                        </div>
                      </div>';

                    ?>
                </div>
            <?php include '../resourses/footer.html'; ?>
        </div>
        <?php include '../resourses/scripts.html'; ?>
        <script>
            var cardOffset=570;

            $("body").css("height",document.body.scrollHeight-document.getElementById("container").scrollHeight);
            $("#container").offset({top: cardOffset+(-window.pageYOffset/2)});
            $(window).scroll(e => {
                $("#container").offset({top: cardOffset+(-window.pageYOffset/2)});
            });

            (function(a){(jQuery.browser=jQuery.browser||{}).mobile=/(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|mobile.+firefox|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows ce|xda|xiino/i.test(a)||/1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-/i.test(a.substr(0,4))})(navigator.userAgent||navigator.vendor||window.opera);

            if(jQuery.browser.mobile){
                console.log("Es mobil");
                $('#modalMobile').modal('open');
                cardOffset=200;
                $("#container").offset({top: cardOffset+(-window.pageYOffset/2)});
            }
            if(JSI){
              var info = document.getElementsByClassName('carrera');
              for(var i = 0 ; i < info.length ; ++i)
                 JSI.infoCareer(info[i].innerHTML,i);
            }
        </script>
    </body>
</html>
