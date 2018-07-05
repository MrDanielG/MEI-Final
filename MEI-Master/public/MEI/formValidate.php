<html>
    <head>
    <title>Resultados</title>
    <?php include '../resourses/header.html'; ?>
    </head>
    <body>
        <?php include '../resourses/menu.html'; ?>
        <div class="container">
            <div class="card">

                <div class="card-content">
                    <?php
                        if(isset($_POST["submit"])){
                            $resultados = $_POST;
                            unset($resultados["submit"]);

                            include 'class/form.class.php';
                            $form = new Formulario($resultados); 
                            $id_examen = 1;
                            $fecha = date("Y-m-d");
                            $form->imprimir_resultados();

        
                            $resultado = mysqli_fetch_array( mysqli_query($con, "SELECT `UID` FROM `area` WHERE `nombre` = ".$form->resultado_id), MYSQLI_NUM);
                            mysqli_query($con,"INSERT INTO `aplicacion_examen`(`id_examen`, `id_user`, `fecha`, `id_resultado`) VALUES ($id_examen ,'$usr_uid','$fecha','$resultado[0]');");
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
