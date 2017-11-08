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

        <div class="slider">
    <ul class="slides">
      <li>
        <img src="https://images.unsplash.com/photo-1468273519810-d3fe4c125cdb?auto=format&fit=crop&w=1050&q=60&ixid=dW5zcGxhc2guY29tOzs7Ozs%3D">
        <!-- random image -->
        <div class="caption center-align">
          <br>
          <h3>Tests Vocacionales</h3>
          <h5 class="light grey-text text-lighten-3">Hechos para Ti</h5>
        </div>
      </li>
      <li>
        <img src="https://images.unsplash.com/photo-1475092980020-2094a10518d2?auto=format&fit=crop&w=1050&q=60&ixid=dW5zcGxhc2guY29tOzs7Ozs%3D">
        <!-- random image -->
        <div class="caption left-align">
          <h3>Encuentra tu Área</h3>
          <h5 class="light grey-text text-lighten-3">Todo conforme a tus gustos</h5>
        </div>
      </li>
      <li>
        <img src="https://images.unsplash.com/16/unsplash_525d7892901ff_1.JPG?auto=format&fit=crop&w=1055&q=60&ixid=dW5zcGxhc2guY29tOzs7Ozs%3D">
        <!-- random image -->
        <div class="caption right-align">
          <h3>¿Para qué eres mejor?</h3>
          <h5 class="light grey-text text-lighten-3">¿Ingenierías, Ciencias Sociales, Humanidades?</h5>
        </div>
      </li>
      <li>
        <img src="https://images.unsplash.com/photo-1465433045946-ba6506ce5a59?auto=format&fit=crop&w=1050&q=60&ixid=dW5zcGxhc2guY29tOzs7Ozs%3D">
        <!-- random image -->
        <div class="caption center-align">
          <h3>Haz el tuyo</h3>
          <i class="large material-icons">book</i>
        </div>
      </li>
    </ul>
  </div> <br><br>

        <div class="container">
            <?php
                /*Conexión con la base de datos*/
                include '../conn.php';
                @mysqli_query($con,"SET NAMES 'utf8'");

                $user = mysqli_real_escape_string($con,$_SESSION['user']);
                $query = "SELECT * FROM examenes";
                $result = mysqli_query($con,$query);


                while ($registro = mysqli_fetch_array($result, MYSQLI_ASSOC)){

                    echo '
                    <div class="collection with-header">
                    <li class="collection-header"><h4>Tests</h4></li>';
                    echo "<a href='form.php' class='test collection-item'>" .$registro['nombre']." con ".$registro['numpreguntas']." preguntas. Tipo: ".$registro['tipo']."</a>";
                    echo '
                    <a href="#!" class="collection-item">Test 2</a>
                    <a href="#!" class="collection-item">Test 3</a>
                  </div>

                    ';
                }

            ?>
        </div>
        <?php include '../resourses/footer.html'; ?>
        <?php include '../resourses/scripts.html'; ?>
    </body>
</html>
