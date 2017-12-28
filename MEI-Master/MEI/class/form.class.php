<?php
/*-----------------------------------------------------------------------------------|
| Esta clase permite evaluar el resultado de cualquier formulario                    |
| recibe como parametro un único arreglo multidimensional que                        |
| contenga 4 arreglos internos con referencia a las 4 áreas que se                   |
| se manejan en la aplicación ;)                                                     |
|  Usar estas lineas para crear el arreglo que recibe esta clase en su constructor   |
|  $resultados = array( 'Ingeniería' =>$_POST['Ingeniería'],                         |
|                       'Biológicas'  =>$_POST['Biológicas'],                        |
|                       'Sociales'    =>$_POST['Sociales'],                          |
|                       'Humanidades' =>$_POST['Humanidades']                        |
|  );                                                                                |
|  form = new Formulario($resultados);                                               |
|-----------------------------------------------------------------------------------*/

    class Formulario{
        //Atributos
        public $resultado_id;
        public $resultado_arreglo = array();

        //Métodos
        public function __construct($resultados){
            $this->resultado_arreglo['Ingeniería']  = array_sum($resultados['Ingeniería']);
            $this->resultado_arreglo['Biológicas']  = array_sum($resultados['Biológicas']);
            $this->resultado_arreglo['Sociales']    = array_sum($resultados['Sociales']);
            $this->resultado_arreglo['Humanidades'] = array_sum($resultados['Humanidades']);
            $mayor = max($this->resultado_arreglo);
            $this->resultado_id = array_search($mayor,$this->resultado_arreglo);
        }

        public function imprimir_resultados(){
            echo "Eres muy bueno para: <span id='resu'>".$this->resultado_id."</span><br>
                Tus resultados son<br>
                <div id='resu_info'>
                Ingenierías: ".$this->resultado_arreglo['Ingeniería']." puntos<br>
                Biológicas: ".$this->resultado_arreglo['Biológicas']." puntos<br>
                Sociales: ".$this->resultado_arreglo['Sociales']." puntos<br>
                Humanidades y Artes: ".$this->resultado_arreglo['Humanidades']." puntos<br>
                </div>";
        }

        public function gen_reco($id_examen, $id, $resultado, $con, $usr_uid){
          $area_id = array('Ingeniería'  => 0,
                          'Biológicas'  => 1,
                          'Sociales'    => 2,
                          'Humanidades' => 3);

            $query = "SELECT * FROM carrera_uni JOIN carrera_info ON carrera_info.UID = carrera_uni.id_carrera WHERE carrera_info.id_area = $area_id[$resultado]";
            $result = mysqli_query($con, $query);

            while ($registro = mysqli_fetch_array($result, MYSQLI_NUM)){
              $id_carrera = $registro[0];

              $query= "INSERT INTO `exam_recomendacion`(`id_user`, `id_examen`, `id_area`, `id_carrera`, `id_test_aplicado`)
                        VALUES ('$usr_uid', $id_examen, $area_id[$resultado], $id_carrera, $id)";

              mysqli_query($con,$query);
            }
        }
    }
 ?>
