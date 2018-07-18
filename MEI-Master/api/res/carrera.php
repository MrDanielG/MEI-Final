<?php 
    $name = $_POST["nombre"];
    $uni = $_POST["uni"];
    $inst = $_POST["inst"];

    $query = mysqli_query($con,"SELECT * FROM carrera_uni
            JOIN universidad ON universidad.UID = carrera_uni.id_universidad
            JOIN carrera_info ON carrera_info.UID = carrera_uni.id_carrera
            JOIN institucion ON institucion.UID = universidad.id_institutucion
            WHERE carrera_info.nombre  = '$name' AND universidad.nombre = '$uni' AND institucion.name = '$inst'");

    $carrera = mysqli_fetch_array($query, MYSQLI_NUM);

    echo json_encode(array($carrera[17], $carrera[8], $carrera[2],$carrera[3],$carrera[25],$carrera[24],$carrera[5]));
?>