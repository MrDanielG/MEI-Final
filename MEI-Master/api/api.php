<?php
    header("Access-Control-Allow-Origin: *");
    
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

        case "listTest":
            include "testList.php";
            break;

        case "testForm":
            include "test.php";
            break;

        case "formSend":
            include "formSend.php";
            break;

        case "recom":
            include "recomendaciones.php";
            break;
    }
?>