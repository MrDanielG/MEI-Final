<option selected disabled>Seleccione una institución.</option>
<?php
    include '../../private/conn.php';
    $data = $_GET["data"];
    $query = "SELECT * FROM `universidad` WHERE `id_institutucion` = ".$data;
    $result = mysqli_query($con,$query);

    while ($r = mysqli_fetch_array($result, MYSQLI_ASSOC)){
        echo "<option value='".$r["UID"]."'>".$r["nombre"]."</option>";
    }
?>