<?php
    //include "../private/conn.php";
    $UID = $_POST["UID"];
    $result = mysqli_query($con, "SELECT * FROM `pregunta` WHERE `id_examen` = ".$UID);
    $pregs = array();
    while ($preg = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
        $q = mysqli_query($con, "SELECT `area`.`nombre`, `respuesta`.`respuesta`, `respuesta`.`valor` FROM `pregunta`
                                    JOIN `respuesta` ON `respuesta`.`id_pregunta` = `pregunta`.`UID`
                                    JOIN `area` ON `area`.`UID` = `pregunta`.`id_area`
                                    WHERE `respuesta`.`id_pregunta` =".$preg["UID"]);

        $areasF = array();
        for ($i = 1; $res = mysqli_fetch_array($q, MYSQLI_NUM) ; $i++) {
            if(!isset($areas[$res[0]])){
                $areas[$res[0]] = 0;
            }else if($i == 1){
                $areas[$res[0]]++;
            }

            $areasF = array("name" => $res[0].'['.$areas[$res[0]].']', "value" => $res[2]);
            
            //echo '<input required type="radio" id="op'.$uid.$i.'" name="'.$res[0].'['.$areas[$res[0]].']" value="'.$res[2].'">
                //<label class="option" for="op'.$uid.$i.'">'.$res[1].'</label>';
        }
        array_push($preg, $areasF);
        array_push($pregs, $preg);
    }

    echo json_encode($pregs);
?>