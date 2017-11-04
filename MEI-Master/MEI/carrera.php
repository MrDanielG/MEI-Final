<html>
    <head>
        <title><?php echo $_GET["carrera"] ?> | MEI</title>
        <?php include '../resourses/header.html'; ?>
        <script type="text/javascript">
            console.log("carrera|");
        </script>
    </head>
    <body>
        <?php include '../resourses/menu.html'; ?>
            <?php
                $carrera = $_GET['carrera'];
                $uni = $_GET['uni'];
                //echo "".$carrera."<br>".$uni."";
                $queryfoto = mysqli_query($con,"SELECT (uni_foto) FROM universidades WHERE nombre = '{$uni}'");
                
                $foto = mysqli_fetch_array($queryfoto, MYSQLI_NUM);
                echo '
                <div class="parallax-container" style="height: 400px">
                    <div class="parallax"><img src="'.$foto[0].'"></div>
                </div>';
            ?>
            <div id="container" style="display:block;">
                <div class="container">
                    <?php 
                        $query = "SELECT * FROM carreras WHERE (nombre = '$carrera' AND NombreUni = '$uni')";
                        $result = mysqli_query($con,$query);
        
                        while ($registro = mysqli_fetch_array($result, MYSQLI_ASSOC)){
                            echo '
                            <div class="card white-1">
                                <div class="card-content">
                                    <span class="card-title carrera">'.$registro['nombre'].'</span>
                                    <span class="carrera">'.$registro['NombreUni'].'</span><br>
                                    <span class="carrera">'.$registro['AreaNombre'].'</span>
                                    <h5>Descripción</h5>
                                    <span class="carrera">'.$registro['descripcion'].'</span>
                                    <h5>Plan de estudios</h5>
                                    <span class="carrera">'.$registro['planestudios'].'</span>
                                    <h5>Perfil de egreso</h5>
                                    <span class="carrera">'.$registro['perfilegreso'].'</span>
                                    <h5>Intercambios</h5>
                                    <span class="carrera">'.$registro['intercambio'].'</span>
                                </div>
                            </div>';
                        }
                    ?>
                </div>
            <?php include '../resourses/footer.html'; ?>
        </div>
        <?php include '../resourses/scripts.html'; ?>
        <script>
            $("body").css("height",document.body.scrollHeight-document.getElementById("container").scrollHeight);
            $(window).scroll(e => {
                $("#container").offset({top: 470+(-window.pageYOffset/2)});
            });
        </script>
    </body>
</html>