<!DOCTYPE html>
<?php
    if(isset($_POST["sbmt"])){
        $id = sha1(time());
        $usuario = $_POST['usr'];
        $concat = "mei".$_POST['pass'];
        $pass = sha1($concat);
        $nombre = $_POST['nombre'];
        $apellido = $_POST['apellido'];
        $edad = $_POST['edad'];
        $city = $_POST['city'];

        include 'conn.php';

        mysqli_query ($con,"SET NAMES 'utf8'");
    }
?>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Registro</title>
        <meta charset="UTF-8">
        <!--Estilos-->
        <link rel="stylesheet" type="text/css" href="css/estilos_login.css">
        <!--Import Google Icon Font-->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
        <!--Import materialize.css-->
        <link type="text/css" rel="stylesheet" href="css/materialize.min.css" media="screen,projection" />
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

        <!--Let browser know website is optimized for mobile-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    </head>
    <body id="body_singin">
        <div class="container" align="center">
            <div class="row">
                <div align="center" id="card" class="col s11 m8 l5">
                    <div class="card white-1">
                        <div class="card-content" style="padding-bottom:0">
                            <form method="post" action="#" onsubmit="if(confirmForm())return true;return false;">
                                <h3>Registrar usuario</h3>

                                <div align="center">
                                    <img src="imgs\logo1.png" heigh="40%" width="40%">
                                </div>

                                <div class="input-field">
                                    <input class="validate" type="email" name="usr" id="input_usuario" autofocus autocomplete="off" required>
                                    <label for="email">E-mail</label>
                                </div>

                                <div class="input-field">
                                    <input class="validate" type="password" name="pass" id="input_pass" minlength="6" autocomplete="off" required>
                                    <label for="password">Contraseña</label>
                                </div>

                                <div class="input-field">
                                    <input class="validate" type="password" name="pass" id="input_pass2" minlength="6" autocomplete="off" required>
                                    <label for="password">Confirmar contraseña</label>
                                </div>

                                <div class="input-field">
                                    <input class="validate" type="text" name="nombre" id="input_nombre" class="input_nombre" autocomplete="off" required>
                                    <label for="text">Nombre(s)</label>
                                </div>

                                <div class="input-field">
                                    <input class="validate" type="text" name="apellido" id="input_last" autocomplete="off" required>
                                    <label for="text">Apellido(s)</label>
                                </div>

                                <div class="input-field">
                                    <input class="validate" type="number" name="edad" min="10" title="Necesitas más de 10 años para registrarte" id="input_edad" autocomplete="off" required>
                                    <label for="number">Edad</label>
                                </div>

                                <div class="input-field">
                                    <select class="validate" id="input_lugar" name="city" required>
                                      <option disabled selected>Ciudad</option>
                                      <option>Aguascalientes</option>
                                      <option>Baja California</option>
                                      <option>Baja California Sur</option>
                                      <option>Campeche</option>
                                      <option>Coahuila</option>
                                      <option>Colima</option>
                                      <option>Chiapas</option>
                                      <option>Chihuahua</option>
                                      <option>Ciudad de México</option>
                                      <option>Estado de México</option>
                                      <option>Durango</option>
                                      <option>Guanajuato</option>
                                      <option>Guerrero</option>
                                      <option>Hidalgo</option>
                                      <option>Jalisco</option>
                                      <option>Michoacán</option>
                                      <option>Morelos</option>
                                      <option>Nayarit</option>
                                      <option>Nuevo León</option>
                                      <option>Oaxaca</option>
                                      <option>Puebla</option>
                                      <option>Querétaro</option>
                                      <option>Quintana Roo</option>
                                      <option>San Luis Potosí</option>
                                      <option>Sinaloa</option>
                                      <option>Sonora</option>
                                      <option>Tabasco</option>
                                      <option>Tamaulipas</option>
                                      <option>Tlaxcala</option>
                                      <option>Veracruz</option>
                                      <option>Yucatán</option>
                                      <option>Zacatecas</option>
                                    </select>
                                </div>

                                <button class="btn waves-effect waves-light" type="submit" name="sbmt" id="btn_submit" value="Iniciar">Registrarse
                                    <i class="material-icons right">send</i>
                                </button>

                                <br><br>
                            </form>
                            <div class="card-action"  align="center">
                                <a href="login.php">¿Ya tienes cuenta? Inicia sesión</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <script type="text/javascript" src="js/materialize.min.js"></script>
        <script type="text/javascript" src="js/JSI.js"></script>
        <script>
        $(document).ready(function() {
          $("select").material_select();
          Materialize.updateTextFields();
        });
        </script>
        <script>
        $('#textarea1').val('New Text');
        $('#textarea1').trigger('autoresize');
        </script>
        <script>
            function confirmForm(){
                if($("#input_pass").val()===$("#input_pass2").val()){
                    return true;
                }else{
                    Materialize.toast("Las contraseñas no coinciden", 3000, "rounded");
                }
                return false;
            }
        </script>
        <?php
            if(isset($_POST["sbmt"])){
                $consulta = mysqli_query($con,"SELECT * FROM `usuario` WHERE `email` = '{$usuario}'");
                if(isset($usuario)&&isset($pass)&& mysqli_num_rows($consulta)<1){
                    $consulta = mysqli_query($con,"INSERT INTO `usuario`(`UID`, `email`, `pass`, `name`, `last_name`, `edad`, `ciudad`) VALUES ('$id','$usuario','$pass','$nombre','$apellido','$edad','$city') ");

                    echo '
                        <script type="text/javascript">
                            if(JSI)
                              doFunc(JSI.isRegis());
                            Materialize.toast("Se ha registrado con éxito.", 3000, "rounded");
                            Materialize.toast("Bienvenido ;)", 3000, "rounded");
                        </script>';
                }else {
                    echo '
                        <script type="text/javascript">
                            if(JSI)
                              doFunc(JSI.errorRegis());
                            Materialize.toast("No se pudo registrar, es posible que el correo ya esté siendo utilizado.", 3000, "rounded");
                            $("#input_usuario").val("'.$usuario.'");
                            $("#input_nombre").val("'.$nombre.'");
                            $("#input_last").val("'.$apellido.'");
                            $("#input_edad").val('.$edad.');
                            $("#input_lugar").val("'.$city.'");
                        </script>';
                }
            }
        ?>
    </body>
</html>
