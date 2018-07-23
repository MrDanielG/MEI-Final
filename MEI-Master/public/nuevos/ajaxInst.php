<?php
    include '../../private/conn.php';
    $data = $_POST["data"];
    $query = "SELECT * FROM universidad JOIN institucion ON institucion.UID = universidad.id_institutucion WHERE nombre = '$data[0]' AND name = '$data[1]'";
    $result = mysqli_query($con,$query);

    if (mysqli_num_rows($result) > 0){
        echo "1";
    }
?>
