<h5>Coincidencias:</h5>
<?php
    include '../conn.php';
    $data = $_GET["data"];
    $query = "SELECT * FROM institucion WHERE name LIKE '%$data%'";
    $result = mysqli_query($con,$query);


    while ($r = mysqli_fetch_array($result, MYSQLI_ASSOC)){
        echo $r["name"]."<br>";
    }
?>