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
        public $resultado_name;
        public $resultado_arreglo = array();
        public $areas = array();

        //Métodos
        public function __construct($resultados){
          $tmp = $resultados;
          $i = 0;
          while($var = current($tmp)){
            $this->areas[$i++] = key($tmp);
            next($tmp);
          }

          $i = 0;
          foreach ($resultados as $var) {
            $this->resultado_arreglo[$i++] = array_sum($var);
          }

          $mayor = max($this->resultado_arreglo);
          $this->resultado_id = array_search($mayor,$this->resultado_arreglo);
          $this->resultado_name = $this->areas[array_search($mayor,$this->resultado_arreglo)];
        }

        public function imprimir_resultados(){
            echo "Eres muy bueno para: <span id='resu'>".$this->resultado_name."</span><br>
                Tus resultados son<br>
                <div id='resu_info'>";

            $i = 0;
            foreach ($this->areas as $var) {
              echo $var.": ".$this->resultado_arreglo[$i++]." puntos<br>";
            }

            echo "</div>";
        }
    }
 ?>
