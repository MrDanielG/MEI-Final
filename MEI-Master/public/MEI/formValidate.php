<html>
    <head>
    <title>Resultados</title>
    <?php include '../resourses/header.html'; ?>
    </head>
    <body>
        <?php include '../resourses/menu.html'; ?>
        <div class="container row">
            <div class="card col s6 offset-s3">
                <div class="card-content">
                    <?php
                        if(isset($_GET["area"])){
                            $resultado = $_GET["area"];
                            $fecha = date("Y-m-d");
                            $id = -1;

                            echo "<span class='card-title'>Resultado: {$resultado}</span>";
                            echo "Parece ser que eres bueno para {$resultado}, ve a tus recomendaciones para ver las carreras que se ofertan con tus aptitudes.";

                            $res = mysqli_fetch_array( mysqli_query($con, "SELECT `UID` FROM `area` WHERE `nombre` = '{$resultado}' LIMIT 1"), MYSQLI_NUM);
                            if(mysqli_query($con,"INSERT INTO `aplicacion_examen`(`id_examen`, `id_user`, `fecha`, `id_resultado`) VALUES ({$_GET["UID"]} ,'{$usr_uid}','$fecha','$res[0]');"))
                                $id = mysqli_insert_id($con);
                        }
                    ?>
                    <div class="card-actions">
                      <br>
                        <a href="recomendaciones.php" class="btn">Ir a recomendaciones</a>
                    </div>
                </div>
            </div>
        </div>
        <?php
            include '../resourses/footer.html';
            include '../resourses/scripts.html';
        ?>
        <script type="text/javascript">
          if(JSI){
            JSI.testResult(document.getElementById('resu').innerText, document.getElementById('resu_info').innerHTML);
          }
        </script>
    </body>
</html>
