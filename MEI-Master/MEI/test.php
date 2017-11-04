<html>
    <head>
        <title>Test | MEI</title>
        <?php include '../resourses/header.html'; ?>
        <script type="text/javascript">
            console.log("test|");
        </script>
    </head>
    <body>
        <?php include '../resourses/menu.html'; ?>
        <div class="container">
            <?php
                /*Conexión con la base de datos*/
                include '../conn.php';
                @mysqli_query($con,"SET NAMES 'utf8'");

                $user = mysqli_real_escape_string($con,$_SESSION['user']);
                $query = "SELECT nombre FROM examenes";
                $result = mysqli_query($con,$query);


                while ($registro = mysqli_fetch_array($result, MYSQLI_ASSOC)){
                    echo "<a href='form.html' class='test'>".$registro['nombre']."</a>";
                }

            ?>
        </div>
        <?php include '../resourses/footer.html'; ?>
        <?php include '../resourses/scripts.html'; ?>
    </body>
</html>