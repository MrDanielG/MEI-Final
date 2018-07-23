<?php
    include '../../private/conn.php';
    $data = $_POST["data"];

    $q = "SELECT universidad.foto_url, carrera_info.nombre, universidad.nombre, institucion.name, universidad.lat, universidad.lng FROM carrera_uni
              JOIN universidad ON universidad.UID = carrera_uni.id_universidad
              JOIN carrera_info ON carrera_info.UID = carrera_uni.id_carrera
              JOIN institucion ON institucion.UID = universidad.id_institutucion WHERE carrera_info.nombre  = '$data[0]' AND universidad.nombre = '$data[1]' AND institucion.name = '$data[2]'";

    $result = mysqli_query($con,$q);

    if (mysqli_num_rows($result) > 0){
        echo "1";
    }
?>
