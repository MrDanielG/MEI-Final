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
                            /*Arreglo para crear el objeto Formulario */
                            $resultados = array('Ingeniería'  =>$_POST['ingenierias'],
                                                'Biológicas'  =>$_POST['biologicas'],
                                                'Sociales'    =>$_POST['sociales'],
                                                'Humanidades' =>$_POST['humanidades_artes']);

                            include 'class/form.class.php';
                            $form = new Formulario($resultados); //Clase evaluadora de formularios
                            $idExamen = 1;
                            $UsrEmail = $_SESSION['user'];
                            $fecha = date("Y-m-d");
                            $resultado = $form->resultado_id;
                            $form->imprimir_resultados();

                            /*Conexión con la base de datos*/
                            include '../conn.php';
                            mysqli_query($con,"SET NAMES 'utf8'");

                            $consulta = " INSERT INTO aplicacion_examen (IdExamen, UsrEmail, fecha, resultado) VALUES ('$idExamen','$UsrEmail','$fecha','$resultado') ";
                            mysqli_query($con,$consulta);
                            $id = mysqli_insert_id($con);
                            $form->gen_reco($idExamen,$id,$resultado,$con);
                        }
                    ?>
                    <div class="card-actions">
                        <a href="recomendaciones.php">Ir a recomendaciones</a>
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
