<?php
    session_start();
    if(isset($_SESSION['user'])){      /*Permite revisar si el usuario ya estaba logeado*/
       header("Location: MEI/index.php"); /*Regresa al usuario logueado al menu*/
    }

    include 'conn.php';

    if(isset($_POST['usr'])&&isset($_POST['pass'])){
        $usr = $_POST['usr'];
        $pass = sha1("mei".$_POST['pass']);

        $consulta = mysqli_query($con, "SELECT * FROM `usuarios` WHERE email='{$usr}' AND pass='{$pass}';");
    }
?>

<!DOCTYPE html>
<html>
<head>
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
    <title>Iniciar sesión</title>
</head>
<body id="body_login">
	<div class="container" align="center">
        <div class="row">
            <div align="center" id="card" class="col s11 m8 l5">
                <div class="card white-1">
                    <div class="card-content" style="padding-bottom:0">
                        <form method="post">
                            <h3>Inicio de sesión</h3>

                            <div align="center">
                                <img src="imgs\logo1.png" heigh="40%" width="40%">
                            </div>

                            <div class="input-field">
                                <input class="validate" data-error="Inserta Correo Valido" type="email" name="usr" id="input_usuario" autofocus  autocomplete="off" required><br>
                                <label for="email">E-mail</label>
                            </div>

                            <div class="input-field">
                                <input class="validate" type="password" name="pass" id="input_pass" minlength="6"  autocomplete="off" required>
                                <label for="password">Contraseña</label>
                            </div>

                            <button class="btn waves-effect waves-light" type="submit" name="sbmt"id="btn_submit" value="Iniciar">Ingresar
                                <i class="material-icons right">send</i>
                            </button>

                            <br><br>

                            <div class="card-action" align="center">
                                <a href="signin.php">¿No tienes cuenta? Registrate</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="js/materialize.min.js"></script>
    <script type="text/javascript" src="js/JSI.js"></script>
    <script>
      $(document).ready(function() {
        Materialize.updateTextFields();
      });
      $('#textarea1').val('New Text');
      $('#textarea1').trigger('autoresize');


      //TODO: Ver la forma de que estas partes sean privadas
      if(JSI){
        doFunc(JSI.logout);
        doFunc(JSI.pageLoaded(1));
      }
    </script>
    <?php
        if(isset($consulta)){
            if(mysqli_num_rows($consulta)){
                $_SESSION['user'] = $usr;
                echo '
                    <script type="text/javascript">
                        window.location="MEI/index.php";
                    </script>';
            }else{
                echo '
                    <script type="text/javascript">
                        if(JSI)
                          JSI.loginError();
                        Materialize.toast("No se pudo iniciar sesión", 3000, "rounded");
                        $("#input_usuario").val("'.$usr.'");
                    </script>';
            }
        }
    ?>
</body>
</html>
