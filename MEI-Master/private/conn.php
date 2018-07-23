<?php
  //$con = mysqli_connect("aa1cbmojg22wdfr.cblilkyifkni.us-east-2.rds.amazonaws.com:3306","ramiroeda","Nirvana1994","mei_new");
  $con = mysqli_connect("localhost","root","","mei_new");
  @mysqli_query($con,"SET NAMES 'utf8'");

  if (!$con) {
    echo '
    <script type="text/javascript">
      document.onload = function () {
          Materialize.toast("Hubo un error en nuestros servidores, por favor intentelo más tarde.", 3000, "rounded");
      };
    </script>';
  }
?>
