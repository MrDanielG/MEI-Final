<!DOCTYPE html >
<html>

<head>
    <meta charset="UTF-8">
    <title>Test Vocaional 1</title>
    <script type="text/javascript">
  		console.log("testvoca|");
    </script>
    <?php include '../resourses/header.html'; ?>

    <style>
        .pregs{
            padding: 20px;
        }
    </style>
</head>
<body>
    <?php include '../resourses/menu.html'; ?>
    <div class="body container">
    <section>
        <form action="formPHP.php" method="post" class="form card">

            <div align="center" class="pregs">
                <b class="preg">¿Te interesaría organizar una cooperacion grupal para comprar algo al aula?</b><br />
                <input type="radio" id="op11" name="sociales[0]" value="-1" required>
                <label class="option" for="op11">No me interesa</label>
                <input type="radio" id="op12" name="sociales[0]" value="1">
                <label class="option" for="op12">Me interesa</label>
            </div><hr />


            <div align="center" class="pregs">
                <b class="preg">¿Te llama la atención entender lo que origina las emociones de una persona?</b><br />
                <input type="radio" id="op13" name="humanidades_artes[0]" value="-0.5">
                <label class="option" for="op13">No me interesa</label>
                <input type="radio" id="op14" name="humanidades_artes[0]" value="0.5">
                <label class="option" for="op14">Me interesa</label>
            </div><hr />

            <div align="center" class="pregs">
                <b class="preg">Al ver una pintura ¿te interesa conocer las técnicas que se emplearon para hacerla?</b><br />
                <input type="radio" id="op15" name="humanidades_artes[1]" value="-0.5">
                <label class="option" for="op15">No me interesa</label>
                <input type="radio" id="op16" name="humanidades_artes[1]" value="0.5">
                <label class="option" for="op16">Me interesa</label>
            </div><hr />


            <div align="center" class="pregs">
                <b class="preg">¿Te gustaría armar un pequeño aparato electrónico?</b><br />
                <input type="radio" id="op17" name="ingenierias[0]" value="-1">
                <label class="option" for="op17">No me interesa</label>
                <input type="radio" id="op18" name="ingenierias[0]" value="1">
                <label class="option" for="op18">Me interesa</label>
            </div><hr />


            <div align="center" class="pregs">
                <b class="preg">¿Te interesa el cuidado de los animales?</b><br />
                <input type="radio" id="op19" name="biologicas[0]" value="-1">
                <label class="option" for="op19">No me interesa</label>
                <input type="radio" id="op110" name="biologicas[0]" value="1">
                <label class="option" for="op110">Me interesa</label>
            </div><hr />

            <div align="center" class="pregs">
                <b class="preg">¿Te ha llamado la atención aprender a tocar un instrumento musical?</b><br />
                <input type="radio" id="op111" name="humanidades_artes[2]" value="-0.5">
                <label class="option" for="op111">No me interesa</label>
                <input type="radio" id="op112" name="humanidades_artes[2]" value="0.5">
                <label class="option" for="op112">Me interesa</label>
            </div><hr />

            <div align="center" class="pregs">
                <b class="preg">¿Te es interesante los diferentes comportamientos de tus compañeros de clase?</b><br />
                <input type="radio" id="op113" name="humanidades_artes[3]" value="-0.5">
                <label class="option" for="op113">No me interesa</label>
                <input type="radio" id="op114" name="humanidades_artes[3]" value="0.5">
                <label class="option" for="op114">Me interesa</label>
            </div><hr />

            <div align="center" class="pregs">
                <b class="preg">¿Te gustaría controlar tus gastos para manejar el dinero más eficientemente?</b><br />
                <input type="radio" id="op115" name="sociales[1]" value="-1">
                <label class="option" for="op115">No me interesa</label>
                <input type="radio" id="op116" name="sociales[1]" value="1">
                <label class="option" for="op116">Me interesa</label>
            </div><hr />

            <div align="center" class="pregs">
                <b class="preg">¿Te llama la atención ver y entender los componentes internos de un celular?</b><br />
                <input type="radio" id="op117" name="ingenierias[1]" value="-1">
                <label class="option" for="op117">No me interesa</label>
                <input type="radio" id="op118" name="ingenierias[1]" value="1">
                <label class="option" for="op118">Me interesa</label>
            </div><hr />

            <div align="center" class="pregs">
                <b class="preg">¿Te gustaría conocer el funcionamiento del corazón?</b><br />
                <input type="radio" id="op119" name="biologicas[1]" value="-1">
                <label class="option" for="op119">No me interesa</label>
                <input type="radio" id="op120" name="biologicas[1]" value="1">
                <label class="option" for="op120">Me interesa</label>
            </div><hr />

            <div align="center" class="pregs">
                <b class="preg">¿Te interesaría investigar una solución para disminuir la contaminación del aire?</b><br />
                <input type="radio" id="op121" name="biologicas[2]" value="-1">
                <label class="option" for="op121">No me interesa</label>
                <input type="radio" id="op122" name="biologicas[2]" value="1">
                <label class="option" for="op122">Me interesa</label>
            </div><hr />

            <div align="center" class="pregs">
                <b class="preg">Al ver el interior del cofre de un auto ¿te llaman la atención sus componentes y funcionamiento?</b><br />
                <input type="radio" id="op123" name="ingenierias[2]" value="-1">
                <label class="option" for="op123">No me interesa</label>
                <input type="radio" id="op124" name="ingenierias[2]" value="1">
                <label class="option" for="op124">Me interesa</label>
            </div><hr />

            <div align="center" class="pregs">
                <b class="preg">Si te eligieran como lider de un proyecto ¿aceptarías el puesto?</b><br />
                <input type="radio" id="op125" name="sociales[2]" value="-1">
                <label class="option" for="op125">No me interesa</label>
                <input type="radio" id="op126" name="sociales[2]" value="1">
                <label class="option" for="op126">Me interesa</label>
            </div><hr />

            <div align="center" class="pregs">
                <b class="preg">Al considerar las ineficiencias de tu ciudad ¿te gustaria proponer propuestas a los representantes de esta?</b><br />
                <input type="radio" id="op127" name="humanidades_artes[4]" value="-0.5">
                <label class="option" for="op127">No me interesa</label>
                <input type="radio" id="op128" name="humanidades_artes[4]" value="0.5">
                <label class="option" for="op128">Me interesa</label>
            </div><hr />

            <div align="center" class="pregs">
                <b class="preg">Cuando escuchas una canción ¿te interesan los instrumentos musicales y tonos que incluye la pista?</b><br />
                <input type="radio" id="op129" name="humanidades_artes[5]" value="-0.5">
                <label class="option" for="op129">No me interesa</label>
                <input type="radio" id="op130" name="humanidades_artes[5]" value="0.5">
                <label class="option" for="op130">Me interesa</label>
            </div><hr />

            <div align="center" class="pregs">
                <b class="preg">¿Te gustaría ser el lider de una empresa?</b><br />
                <input type="radio" id="op1311" name="sociales[3]" value="-1">
                <label class="option" for="op1311">No me interesa</label>
                <input type="radio" id="op1312" name="sociales[3]" value="1">
                <label class="option" for="op1312">Me interesa</label>
            </div><hr />

            <div align="center" class="pregs">
                <b class="preg">¿Te gustaría diseñar y hacer los cálculos para construir un puente?</b><br />
                <input type="radio" id="op132" name="ingenierias[3]" value="-1">
                <label class="option" for="op132">No me interesa</label>
                <input type="radio" id="op133" name="ingenierias[3]" value="1">
                <label class="option" for="op133">Me interesa</label>
            </div><hr />

            <div align="center" class="pregs">
                <b class="preg">¿Te es interesante estudiar las causas y efectos de los transtornos o enfermedades emocionales?</b><br />
                <input type="radio" id="op134" name="humanidades_artes[6]" value="-0.5">
                <label class="option" for="op134">No me interesa</label>
                <input type="radio" id="op135" name="humanidades_artes[6]" value="0.5">
                <label class="option" for="op135">Me interesa</label>
            </div><hr />

            <div align="center" class="pregs">
                <b class="preg">¿Te gustaría diseñar la publicidad para una gran empresa?</b><br />

                <input type="radio" id="op136" name="humanidades_artes[7]" value="-0.5">
                <label class="option" for="op136">No me interesa</label>
                <input type="radio" id="op137" name="humanidades_artes[7]" value="0.5">

                <label class="option" for="op137">Me interesa</label>
            </div><hr />

            <div align="center" class="pregs">
                <b class="preg">¿Te interesaría realizar el control de calidad de los alimentos?</b><br />
                <input type="radio" id="op138" name="biologicas[3]" value="-1">
                <label class="option" for="op138">No me interesa</label>
                <input type="radio" id="op139" name="biologicas[3]" value="1">

                <label class="option" for="op139">Me interesa</label>

            </div><hr />

            <div align="center" class="pregs">
                <b class="preg">¿Te gustaría aprender y estudiar otros idiomas para hablarlos casi perfectamente?</b><br />

                <input type="radio" id="op140" name="humanidades_artes[8]" value="-0.5">
                <label class="option" for="op140">No me interesa</label>
                <input type="radio" id="op141" name="humanidades_artes[8]" value="0.5">

                <label class="option" for="op141">Me interesa</label>
            </div><hr />

            <div align="center" class="pregs">
                <b class="preg">¿Aceptarías supervisar las ventas de un centro comercial?</b><br />

                <input type="radio" id="op142" name="sociales[4]" value="-1">
                <label class="option" for="op142">No me interesa</label>
                <input type="radio" id="op143" name="sociales[4]" value="1">

                <label class="option" for="op143">Me interesa</label>
            </div><hr />

            <div align="center" class="pregs">
                <b class="preg">¿Te gustaría componer la música para una película?</b><br />

                <input type="radio" id="op144" name="humanidades_artes[9]" value="-0.5">
                <label class="option" for="op144">No me interesa</label>
                <input type="radio" id="op145" name="humanidades_artes[9]" value="0.5">

                <label class="option" for="op145">Me interesa</label>
            </div><hr />

            <div align="center" class="pregs">
                <b class="preg">¿Te llama la atención el estudio de nuevas curas para las enfermedades?</b><br />

                <input type="radio" id="op146" name="biologicas[4]" value="-1">
                <label class="option" for="op146">No me interesa</label>
                <input type="radio" id="op147" name="biologicas[4]" value="1">

                <label class="option" for="op147">Me interesa</label>
            </div><hr />

            <div align="center" class="pregs">
                <b class="preg">¿Te gustaría hacer proyectos de extracción minera?</b><br />

                <input type="radio" id="op148" name="ingenierias[4]" value="-1">
                <label class="option" for="op148">No me interesa</label>
                <input type="radio" id="op149" name="ingenierias[4]" value="1">

                <label class="option" for="op149">Me interesa</label>
            </div><hr />

            <div align="center" class="pregs">
                <b class="preg">¿Te gustaría estudiar el comportamiento de los animales que viven en el mar?</b><br />

                <input type="radio" id="op150" name="biologicas[5]" value="-1">
                <label class="option" for="op150">No me interesa</label>
                <input type="radio" id="op151" name="biologicas[5]" value="1">

                <label class="option" for="op151">Me interesa</label>
            </div><hr />

            <div align="center" class="pregs">
                <b class="preg">¿Te gustaría elegir o diseñar los muebles interiores de una casa?</b><br />

                <input type="radio" id="op152" name="humanidades_artes[10]" value="-0.5">
                <label class="option" for="op152">No me interesa</label>
                <input type="radio" id="op153" name="humanidades_artes[10]" value="0.5">

                <label class="option" for="op153">Me interesa</label>
            </div><hr />

            <div align="center" class="pregs">
                <b class="preg">Te gustaría conocer las diferentes religiones, así como sus fundamentos y darlas a conocer?</b><br />

                <input type="radio" id="op154" name="humanidades_artes[11]" value="-0.5">
                <label class="option" for="op154">No me interesa</label>
                <input type="radio" id="op155" name="humanidades_artes[11]" value="0.5">

                <label class="option" for="op155">Me interesa</label>
            </div><hr />

            <div align="center" class="pregs">
                <b class="preg">¿Te gustaría crear una aplicación de organización para tu telefono celular?</b><br />

                <input type="radio" id="op156" name="ingenierias[5]" value="-1">
                <label class="option" for="op156">No me interesa</label>
                <input type="radio" id="op157" name="ingenierias[5]" value="1">

                <label class="option" for="op157">Me interesa</label>
            </div><hr />

            <div align="center" class="pregs">
                <b class="preg">¿Te gustaría organizar una excursión grupal?</b><br />

                <input type="radio" id="op158" name="sociales[5]" value="-1">
                <label class="option" for="op158">No me interesa</label>
                <input type="radio" id="op159" name="sociales[5]" value="1">

                <label class="option" for="op159">Me interesa</label>
            </div><hr />

            <div align="center" class="pregs">
                <b class="preg">¿Que area te gusta mas?</b><br />
                <input type="radio" name="ingenierias[6]" value="2" id="op160">
                <label class="option" for="op160">Ingenierias</label>
                <input type="radio" name="biologicas[6]" value="2" id="op161">
                <label class="option" for="op161">Biologicas</label>
                <input type="radio" name="sociales[6]" value="2" id="op162">
                <label class="option" for="op162">Sociales</label>
                <input type="radio" name="humanidades_artes[12]" value="2" id="op163">
                <label class="option" for="op163">Humanidades</label>
            </div><hr />
            <br><br>
            <div align="center">
                <input align="center" type="submit" class="btn waves-effect waves-light" name="submit" id="boton">
            </div><br><br>
        </form>
    </section>
    </div>
    <?php include '../resourses/footer.html';
          include "../resourses/scripts.html"; ?>
</body>

</html>
69
