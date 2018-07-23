<?php

    $UID = $_POST["UID"];
    $result = mysqli_query($con, "SELECT * FROM `pregunta` WHERE `id_examen` = ".$UID);
    $pregs = array();
    while ($preg = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
        $json_arr = array();
        $q = mysqli_query($con, "SELECT `area`.`nombre`, `respuesta`.`respuesta`, `respuesta`.`valor` FROM `pregunta`
                                    JOIN `respuesta` ON `respuesta`.`id_pregunta` = `pregunta`.`UID`
                                    JOIN `area` ON `area`.`UID` = `respuesta`.`id_area`
                                    WHERE `respuesta`.`id_pregunta` =".$preg["UID"]);

        array_push($json_arr, $preg);
        $areasF = array();
        for ($i = 1; $res = mysqli_fetch_array($q, MYSQLI_NUM) ; $i++) {
            if(!isset($areas[$res[0]])){
                $areas[$res[0]] = 0;
            }else if($i == 1){
                $areas[$res[0]]++;
            }
            $areasF = array("name" => $res[0],"index" => $areas[$res[0]],"res" => $res[1], "value" => $res[2]);
            array_push($json_arr, $areasF);
        }
        array_push($pregs, $json_arr);
    }

    echo json_encode($pregs);
?>
