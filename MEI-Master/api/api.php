<?php
    header("Access-Control-Allow-Origin: *");
    
    if(!isset($_POST["req"])&&!isset($_POST["device"])){
        die("acceso_denegado");
    }

    include "../private/conn.php";

    switch($_POST["req"]){
        case "login":
            include "res/login.php";
            break;
        
        case "signin":
            include "res/signin.php";
            break;

        case "perfil":
            include "res/perfil.php";
            break;

        case "listTest":
            include "res/testList.php";
            break;

        case "testForm":
            include "res/test.php";
            break;

        case "formSend":
            include "res/formSend.php";
            break;

        case "recom":
            include "res/recomendaciones.php";
            break;

        case "carrera":
            include "res/carrera.php";
            break;
    }
?>