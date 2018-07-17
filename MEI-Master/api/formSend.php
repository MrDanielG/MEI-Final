<?php
    $resultados = $_POST;
    unset($resultados["submit"]);

    include '../public/MEI/class/form.class.php';
    $form = new Formulario($resultados); 
    $fecha = date("Y-m-d");
    $form->imprimir_resultados();
    $id = -1;

    $resultado = mysqli_fetch_array( mysqli_query($con, "SELECT `UID` FROM `area` WHERE `nombre` = ".$form->resultado_id), MYSQLI_NUM);
    mysqli_query($con,"INSERT INTO `aplicacion_examen`(`id_examen`, `id_user`, `fecha`, `id_resultado`) VALUES ({$_POST["UID"]} ,'{$_POST["key"]}','$fecha','$resultado[0]');");
    $id = mysqli_insert_id($con);

    $i = 0;
    $desc = "";
    foreach ($form->areas as $var) {
        $desc += $var.": ".$form->resultado_arreglo[$i++]." puntos.\n";
    }

    $resp = array("result" => $form->$resultado_name, "descrip" => $desc, "send" => $id > -1);
    echo json_encode($resp);
?>