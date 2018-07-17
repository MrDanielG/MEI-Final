<html>
    <head>
        <title>Perfil</title>
        <?php include '../resourses/header.html'; ?>
    </head>
    <body>
        <?php include '../resourses/menu.html'; ?>
        <div class="container" align = "center"><br>
        <?php
            $ext = array(".jpg",".jpeg",".png",".gif");
            $fileext=NULL;
            $query = "SELECT * FROM usuario WHERE email = '".$_SESSION['user']."'";
            $result = mysqli_query($con,$query);
            $usuario = mysqli_fetch_array($result, MYSQLI_ASSOC);

            foreach($ext as &$val){
                if(file_exists("../resourses/profile_pics/".$usr_uid.$val)){
                    $fileext = $val;
                    break;
                }
            }


            echo '
            <div class="carta" align="center">
            <div class="row">
            <div class="col  s6 offset-s3">
              <div class="card-panel white"> ';

            if($fileext){
                echo '<div id="profile-img" class="circle responsive-img tooltipped" data-position="bottom" data-delay="50" data-tooltip="Has click para cambiar la imagen" style="background-image: url(../resourses/profile_pics/'.$usr_uid.$fileext.'); width: 20vw;height: 20vw;background-size:cover;background-position:center;"></div><br><br>';
            }else{
                  echo '<div id="profile-img" class="circle responsive-img tooltipped" data-position="bottom" data-delay="50" data-tooltip="Has click para cambiar la imagen" style="background-image: url(../resourses/profile_pics/0.png); width:300px;height:300px;background-size:cover;background-position:center;"></div><br><br>';
            }


            echo '<br><span id="profile-nombre">'.$usuario["name"]." ".$usuario["last_name"].'</span><br>';
            echo '<span id="profile-correo">'.$usuario["email"].'</span><br>';
            echo '<span id="profile-edad">'.$usuario["edad"].' años</span><br>';
            echo '<span id="profile-ciudad">'.$usuario["ciudad"].'</span><br>

              </div>
            </div>
          </div>
          </div>

          ';

            echo '<span><h3>Examenes aplicados</h3></span><br>';

            $query = "SELECT * FROM aplicacion_examen INNER JOIN examen ON aplicacion_examen.id_examen = examen.UID WHERE id_user = '".$usuario["UID"]."'";
            $result = mysqli_query($con,$query);

            echo "<table id='examen-table' class='striped'>
                    <thead>
                        <tr>
                            <th>Examen</th>
                            <th>Fecha</th>
                            <th>Resultado</th>
                        </tr>
                    </thead>";
            while ($examen = mysqli_fetch_array($result, MYSQLI_NUM)){
                    $date = new DateTime($examen[3]);
                    $res = $date->format('d/m/Y');
                    echo
                    "<tr>
                        <td class='testName'>".$examen[6]."</td>
                        <td class='testFecha'>".$res."</td>
                        <td class='testResu'>".$examen[4]."</td>
                    </tr>";
            }

            echo '</table>';
    
        ?>
        <form enctype="multipart/form-data" action="" method="post" style="display:none">
            <input type="file" name="img" id="input-img">
        </form>
        </div><br>
        <?php include '../resourses/footer.html'; ?>
        <?php include '../resourses/scripts.html';
            if(isset($_FILES["img"])){
                $imageFileType = pathinfo($_FILES["img"]["name"], PATHINFO_EXTENSION);
                if($imageFileType == "jpg" || $imageFileType == "png" || $imageFileType == "jpeg" || $imageFileType == "gif"){
                    foreach($ext as &$val){
                        if(file_exists("../resourses/profile_pics/".$usr_uid.$val)){
                            unlink("../resourses/profile_pics/".$usr_uid.$val);
                        }
                    }
                    if(move_uploaded_file($_FILES["img"]["tmp_name"], "../resourses/profile_pics/".$usr_uid.".".$imageFileType)){
                        echo "<script> Materialize.toast('Se ha actualizado la imagen', 3000, 'rounded');
                                $('#profile-img').attr('src','../resourses/profile_pics/".$usr_uid.".".$imageFileType."');
                            </script>";
                    }else{
                        echo "<script> Materialize.toast('No se ha podido actualizar la imagen...', 3000, 'rounded');</script>";
                    }
                }else{
                    echo "<script> Materialize.toast('El archivo subido no es una imagen valida...', 3000, 'rounded');</script>";
                }
            }
        ?>

        <script>
            $("#profile-img").click(e => {
                $("#input-img").click();
            });
            $("#input-img").change(e => {
                $(e.target).parent().submit();
            });

            if(JSI){
              var imgUrl = document.getElementById('dataUser').dataset.picture;
              var name = document.getElementById('profile-nombre').innerText;
              var email = document.getElementById('profile-correo').innerText;
              var edad = document.getElementById('profile-edad').innerText;
              var city = document.getElementById('profile-ciudad').innerText;
              JSI.perfil(imgUrl,name,email,edad,city);
              var test = document.getElementsByClassName('testName');
              var fecha = document.getElementsByClassName('testFecha');
              var resu = document.getElementsByClassName('testResu');
              JSI.perfilTabla('Nombre','Fecha','Resultado');
              for(var i = 0 ; i < test.length ; ++i){
                  JSI.perfilTabla(test[i].innerText,fecha[i].innerText,resu[i].innerText);
              }
            }
        </script>
    </body>
</html>
