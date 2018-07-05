<?php
    if(isset($_POST['usr']) && isset($_POST['pass'])){
        $usr = $_POST['usr'];
        $pass = sha1("mei".$_POST['pass']);

        $consulta = mysqli_query($con, "SELECT * FROM `usuario` WHERE email='{$usr}' AND pass='{$pass}';");
    }

    if(isset($consulta)){
        if(mysqli_num_rows($consulta)){
            echo json_encode(array('login' => true, "key" => mysqli_fetch_array($consulta, MYSQLI_NUM)[0]));
            die();
        }
    }
    
    echo json_encode(array('login' => false));
?>