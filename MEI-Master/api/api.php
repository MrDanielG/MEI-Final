<?php
    if(!isset($_POST["req"])&&!isset($_POST["device"])){
        die("acceso_denegado");
    }

    include "../private/conn.php";

    switch($_POST["req"]){
        case "login":
            include "login.php";
            break;
        
        case "signin":
            include "signin.php";
            break;

        case "perfil":
            include "perfil.php";
            break;
    }
?>