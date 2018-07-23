<?php
    $resultado = $_POST["area"];
    $fecha = date("Y-m-d");
    $id = -1;

    $res = mysqli_fetch_array( mysqli_query($con, "SELECT `UID` FROM `area` WHERE `nombre` = '{$resultado}' LIMIT 1"), MYSQLI_NUM);
    if(mysqli_query($con,"INSERT INTO `aplicacion_examen`(`id_examen`, `id_user`, `fecha`, `id_resultado`) VALUES ({$_POST["UID"]} ,'{$_POST["key"]}','$fecha','$res[0]');"))
        $id = mysqli_insert_id($con);

    $resp = array("result" => $resultado, "send" => $id > -1);
    echo json_encode($resp);
?>