<?php
    $key = $_POST["key"];

    $consulta = mysqli_query($con, "SELECT * FROM `usuario` WHERE `UID` = '{$key}'");

    $usr = mysqli_fetch_array($consulta, MYSQLI_ASSOC);

    $fileext=NULL;
    $img = "../public/resourses/profile_pics/0.png";
    $fext = ".png";

    $ext = array(".jpg",".jpeg",".png",".gif");
    foreach($ext as &$val){
        if(file_exists("../public/resourses/profile_pics/".$key.$val)){
            $fileext = $val;
            $img = "../public/resourses/profile_pics/".$key.$val;
            $ext = $fext;
            break;
        }
    }

    array_push($usr, $img, $fext);

    echo json_encode($usr);
    
?>