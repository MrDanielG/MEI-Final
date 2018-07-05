<?php
    if(isset($_POST["signin"])){
        $id = sha1(time());
        $usuario = $_POST['usr'];
        $concat = "mei".$_POST['pass'];
        $pass = sha1($concat);
        $nombre = $_POST['nombre'];
        $apellido = $_POST['apellido'];
        $edad = $_POST['edad'];
        $city = $_POST['city'];

        $consulta = mysqli_query($con,"SELECT * FROM `usuario` WHERE `email` = '{$usuario}'");

        if(mysqli_num_rows($consulta)<1){
            $consulta = mysqli_query($con,"INSERT INTO `usuario`(`UID`, `email`, `pass`, `name`, `last_name`, `edad`, `ciudad`) VALUES ('$id','$usuario','$pass','$nombre','$apellido','$edad','$city') ");
            echo json_encode(array("signed" => true));
        }else {
            echo json_encode(array("signed" => false, "error" => "El usuario ya existe"));
        }
    }
?>