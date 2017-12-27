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

        public function gen_reco($idExamen,$id,$resultado,$con){
            $query = "SELECT * FROM carreras WHERE AreaNombre = '$resultado'";
            $result = mysqli_query($con,$query);
            $UsrEmail = $_SESSION["user"];

            while ($registro = mysqli_fetch_array($result, MYSQLI_ASSOC)){
                $AreaNombre = $registro['AreaNombre'];
                $NombreUni = $registro['NombreUni'];
                $nombre = $registro['nombre'];
                $query2= "INSERT INTO exam_recomendacion(UsrEmail,IdExamen,AreaNombre,NombreUni,Id_Aplicacion_Examen,Nombre_Carrera)
                VALUES ('$UsrEmail','$idExamen','$AreaNombre','$NombreUni','$id','$nombre')";
                mysqli_query($con,$query2);
            }
        }
    }
 ?>
