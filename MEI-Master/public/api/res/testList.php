<?php
    $query = "SELECT * FROM examen";
    $result = mysqli_query($con,$query);
    $list = array();

    while ($registro = mysqli_fetch_array($result, MYSQLI_ASSOC)){
        $num = mysqli_fetch_array(mysqli_query($con, "SELECT COUNT(*) FROM `pregunta` WHERE `id_examen` =".$registro["UID"]),MYSQLI_NUM);
        $item = array("UID" => $registro["UID"], "name" => $registro['nombre'], "num" => $num[0]);
        array_push($list, $item);
    }

    echo json_encode($list);
?>