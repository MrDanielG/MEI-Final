<!DOCTYPE html>
<?php
    if(isset($_POST["sbmt"])){
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
        <link rel="stylesheet" type="text/css" href="css/estilos.css">
        <!--Import Google Icon Font-->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
        <!--Import materialize.css-->
        <link type="text/css" rel="stylesheet" href="css/materialize.min.css" media="screen,projection" />
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

        <!--Let browser know website is optimized for mobile-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    </head>
    <body>
        <div class="contenido" align="center">
            <form method="post" action="#" onsubmit="if(confirmForm())return true;return false;">
                <h2>Registrar Usuario</h2>

                <input type="email" name="usr" id="input_usuario" autofocus placeholder="Correo electrónico" autocomplete="off" required>
                <input type="password" name="pass" id="input_pass" minlength="6" placeholder="Contraseña" autocomplete="off" required>
                <input type="password" name="pass" id="input_pass2" minlength="6" placeholder="Confirmar contraseña" autocomplete="off" required>
                <input type="text" name="nombre" id="input_nombre" class="input_nombre" placeholder="Nombre(s)" autocomplete="off" required>
                <input type="text" name="apellido" id="input_last" placeholder="Apellido(s)" autocomplete="off" required>
                <input type="number" name="edad" min="10" title="Necesitas más de 10 años para registrarte" id="input_edad" placeholder="Edad" autocomplete="off" required>
                <input type="text" name="city" id="input_lugar" placeholder="Ciudad" autocomplete="off" required>

                <input type="submit" name="sbmt" id="btn_submit">
            </form>
            <div align="center">
			    <a href="login.php">¿Ya tienes cuenta? Inicia sesión</a>
			</div>
        </div>
        <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <script type="text/javascript" src="js/materialize.min.js"></script>
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
                $consulta = mysqli_query($con,"SELECT * FROM `usuarios` WHERE `email` = '{$usuario}'");
                if(isset($usuario)&&isset($pass)&& mysqli_num_rows($consulta)<1){
                    $consulta = mysqli_query($con," INSERT INTO usuarios (email, pass, ciudad,`nombre(s)`,`apellido(s)`,edad) VALUES ('$usuario','$pass','$city','$nombre','$apellido','$edad') ");
    
                    echo '
                        <script type="text/javascript">
                            console.log("true|");
                            Materialize.toast("Se ha registrado con éxito.", 3000, "rounded");
                            Materialize.toast("Bienvenido ;)", 3000, "rounded");
                        </script>';
                }else {
                    echo '
                        <script type="text/javascript">
                            console.log("false|");
                            Materialize.toast("No se pudo registrar, por favor intentelo de nuevo.", 3000, "rounded");
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
