<?php
    $key = $_POST["key"];

    if(isset($_POST["tabla"])){
        $query = "SELECT * FROM aplicacion_examen 
                    INNER JOIN examen ON aplicacion_examen.id_examen = examen.UID 
                    INNER JOIN area ON aplicacion_examen.id_resultado = area.UID
                    WHERE id_user = '".$key."'";
        $result = mysqli_query($con,$query);
        $tabla = array();

        while ($examen = mysqli_fetch_array($result, MYSQLI_NUM)){
            $date = new DateTime($examen[3]);
            $res = $date->format('d/m/Y');
            $data = array("test" => $examen[6], "fecha" => $res, "resu" => $examen[9]);

            array_push($tabla, $data);
        }
        echo json_encode($tabla);
    }else{
        $consulta = mysqli_query($con, "SELECT * FROM `usuario` WHERE `UID` = '{$key}'");

        $usr = mysqli_fetch_array($consulta, MYSQLI_ASSOC);

        $fileext=NULL;
        $img = "/../../public/resourses/profile_pics/0.png";
        $fext = ".png";

        $ext = array(".jpg",".jpeg",".png",".gif");
        foreach($ext as &$val){
            if(file_exists("../public/resourses/profile_pics/".$key.$val)){
                $fileext = $val;
                $img = "/../../public/resourses/profile_pics/".$key.$val;
                $fext = $ext;
                break;
            }
        }

        array_push($usr, $img, $fext);

        echo json_encode($usr);
    }
    
?>