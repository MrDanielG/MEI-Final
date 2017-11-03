<?php
    session_start();
    if(isset($_SESSION['user'])){      /*Permite revisar si el usuario ya estaba logeado*/
       // header("Location: MEI/index.php"); /*Regresa al usuario logueado al menu*/
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
	<script type="text/javascript">
		console.log('login|');
	</script>
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
    <title>Iniciar sesión</title>
</head>
<body>
	<div class="contenido" align="center">
		<form method="post">
				<div align="center">
				<img src="MEILogo1\logo1.png" >
				</div>

				<h2>Inicio de Sesión</h2>

				<input type="email" name="usr" id="input_usuario" autofocus placeholder="Correo electrónico" autocomplete="off" required>
				<input type="password" name="pass" id="input_pass" minlength="6" placeholder="Contraseña" autocomplete="off" required>

			<input type="submit" name="sbmt" id="btn_submit">

			<div align="center">
			<a href="signin.php">¿No tienes cuenta? Registrate</a>
			</div>

		</form>
	</div>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="js/materialize.min.js"></script>
    <?php
        if(isset($consulta)){
            if(mysqli_num_rows($consulta)){
                $_SESSION['user'] = $usr;
                echo '
                    <script type="text/javascript">
                        console.log("true|{$usr}|{$pass}");
                        window.location="MEI/index.php";
                    </script>';
            }else{
                echo '
                    <script type="text/javascript">
                        console.log("false|");
                        Materialize.toast("No se pudo iniciar sesión", 3000, "rounded");
                        $("#input_usuario").val("'.$usr.'");
                    </script>';
            }
        }
    ?>
</body>
</html>
