<?php
  $con = mysqli_connect("localhost","root","","id1181196_mei");

  if (!$con) {
    echo '
    <script type="text/javascript">
      document.onload = function () {
          Materialize.toast("Hubo un error en nuestros servidores, por favor intentelo más tarde.", 3000, "rounded"); 
      };
    </script>';
  }
?>
