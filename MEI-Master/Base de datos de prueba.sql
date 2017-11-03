-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 03, 2017 at 08:02 PM
-- Server version: 10.1.20-MariaDB
-- PHP Version: 7.0.8

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
CREATE DATABASE `id1181196_mei`;
USE `id1181196_mei`;
--

-- --------------------------------------------------------

--
-- Table structure for table `aplicacion_examen`
--

CREATE TABLE `aplicacion_examen` (
  `id` int(20) NOT NULL,
  `IdExamen` int(20) NOT NULL,
  `UsrEmail` varchar(72) COLLATE latin1_spanish_ci NOT NULL,
  `fecha` date NOT NULL,
  `resultado` varchar(40) COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Dumping data for table `aplicacion_examen`
--

INSERT INTO `aplicacion_examen` (`id`, `IdExamen`, `UsrEmail`, `fecha`, `resultado`) VALUES
(1, 1, 'luis@gmail.com', '2017-03-24', 'Ingeniería'),
(2, 1, 'luis@gmail.com', '2017-03-24', 'Biológicas'),
(3, 1, 'luis@gmail.com', '2017-03-24', 'humanidades_artes'),
(4, 1, 'luis@gmail.com', '2017-03-24', 'Sociales'),
(5, 1, 'prueba@prue.com', '2017-03-24', 'Ingeniería'),
(6, 1, 'prueba@prue.com', '2017-03-24', 'Sociales'),
(7, 1, 'prueba@prue.com', '2017-03-25', 'Ingeniería'),
(8, 1, 'prueba@prue.com', '2017-03-25', 'Biológicas'),
(9, 1, 'prueba@prue.com', '2017-03-25', 'Humanidades'),
(10, 1, 'prueba@prue.com', '2017-03-25', 'Sociales'),
(11, 1, 'prueba@prue.com', '2017-03-25', 'Sociales'),
(12, 1, 'prueba@prue.com', '2017-03-25', 'Sociales'),
(13, 1, 'prueba@prue.com', '2017-03-25', 'Sociales'),
(14, 1, 'prueba@prue.com', '2017-03-25', 'Sociales'),
(15, 1, 'prueba@prue.com', '2017-03-25', 'Sociales'),
(16, 1, 'prueba@prue.com', '2017-03-25', 'Sociales'),
(17, 1, 'prueba@prue.com', '2017-03-25', 'Ingeniería'),
(18, 1, 'prueba@prue.com', '2017-03-25', 'Ingeniería'),
(19, 1, 'prueba@prue.com', '2017-03-25', 'Ingeniería'),
(20, 1, 'prueba@prue.com', '2017-03-25', 'Ingeniería'),
(21, 1, 'prueba@prue.com', '2017-03-25', 'Ingeniería'),
(22, 1, 'prueba@prue.com', '2017-03-25', 'Ingeniería'),
(23, 1, 'prueba@prue.com', '2017-03-25', 'Ingeniería'),
(24, 1, 'prueba@prue.com', '2017-03-25', 'Ingeniería'),
(25, 1, 'prueba@prue.com', '2017-03-25', 'Ingeniería'),
(26, 1, 'prueba@prue.com', '2017-03-25', 'Ingeniería'),
(27, 1, 'prueba@prue.com', '2017-03-25', 'Ingeniería'),
(28, 1, 'gerardo@gmail.com', '2017-03-25', 'Ingeniería'),
(29, 1, 'gerardo@gmail.com', '2017-03-25', 'Ingeniería'),
(30, 1, 'prueba@prue.com', '2017-03-26', 'Humanidades'),
(31, 1, 'prueba@prue.com', '2017-04-06', 'biologicas'),
(32, 1, 'larraldeortizemmanuelalejandro@gmail.com', '2017-04-06', 'sociales'),
(33, 1, 'prueba@prue.com', '2017-04-06', 'biologicas'),
(34, 1, 'larraldeortizemmanuelalejandro@gmail.com', '2017-04-06', 'biologicas'),
(35, 1, 'prueba@prue.com', '2017-04-06', 'ingenierias'),
(36, 1, 'tuptm@gmail.com', '2017-06-14', 'ingenierias'),
(37, 1, 'prueba@prue.com', '2017-06-14', 'ingenierias'),
(38, 1, 'prueba@prue.com', '2017-06-14', 'ingenierias'),
(39, 1, 'prueba@prue.com', '2017-06-14', 'ingenierias'),
(40, 1, 'prueba@prue.com', '2017-10-27', 'humanidades_artes');

-- --------------------------------------------------------

--
-- Table structure for table `areas`
--

CREATE TABLE `areas` (
  `nombre` varchar(72) COLLATE latin1_spanish_ci NOT NULL,
  `descripcion` mediumtext COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Dumping data for table `areas`
--

INSERT INTO `areas` (`nombre`, `descripcion`) VALUES
('Biológicas ', 'Las ciencias biológicas son aquellas que se dedican a estudiar la vida y sus procesos. Se trata de una rama de las ciencias naturales que investiga el origen, la evolución y las propiedades de los seres vivos.\r\n'),
('Humanidades', 'Relacion con las humanidades'),
('Ingeniería', 'La ingeniería es el conjunto de conocimientos científicos y tecnológicos para la innovación, invención, desarrollo y mejoramiento de técnicas y herramientas para satisfacer las necesidades de las empresas y la sociedad.\r\nEl ingeniero utiliza las matemáticas, las matemáticas aplicadas, la física, química y otras ciencias tanto para el desarrollo de tecnologías, como para el manejo eficiente y productivo de recursos y fuerzas de la naturaleza en beneficio de la sociedad. La ingeniería es una actividad que transforma el conocimiento en algo práctico.\r\nLa ingeniería aplica los conocimientos y métodos científicos a la invención o perfeccionamiento de tecnologías de manera pragmática y ágil, adecuándose a las limitaciones de tiempo, recursos, requerimientos legales, requerimientos de seguridad, ecológicos, etc.\r\n'),
('Sociales', 'Relacion con las sociales');

-- --------------------------------------------------------

--
-- Table structure for table `carreras`
--

CREATE TABLE `carreras` (
  `AreaNombre` varchar(72) COLLATE latin1_spanish_ci NOT NULL,
  `NombreUni` varchar(72) COLLATE latin1_spanish_ci NOT NULL,
  `nombre` varchar(72) COLLATE latin1_spanish_ci NOT NULL,
  `descripcion` mediumtext COLLATE latin1_spanish_ci NOT NULL,
  `planestudios` mediumtext COLLATE latin1_spanish_ci NOT NULL,
  `intercambio` mediumtext COLLATE latin1_spanish_ci NOT NULL,
  `perfilegreso` mediumtext COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Dumping data for table `carreras`
--

INSERT INTO `carreras` (`AreaNombre`, `NombreUni`, `nombre`, `descripcion`, `planestudios`, `intercambio`, `perfilegreso`) VALUES
('Humanidades', 'Universidad Nacional Autónoma de México', 'Cinematografía (UNAM)', 'La licenciatura de Cinematografía de la UNAM se imparte en el Centro Universitario de Estudios Cinematográficos (CUEC) ubicado en el Circuito Mario de la Cueva s/n en Ciudad Universitaria, CDMX. El CUEC ofrece la infraestructura apropiada para que los alumnos se puedan desenvolver adecuadamente, en estos se incluyen: biblioteca, videoteca, sets, sala de exhibición y postproducción, cubículos de edición, imagen y sonido.\r\nDentro de esta carrera se forman los profesionales que se encargan de desarrollar proyecto cinematográficos, como de animación, ficción o documentales. En dichos proyectos se plasman sus conocimientos y sensibilidad. Los alumnos que ingresan pueden escoger entre 9 campos de conocimiento: animación, ficción y animación; guión, montaje, dirección de fotografía y de arte, producción, y diseño de sonido.<ul>\r\n<li>Duración: 8 semetres.</li><li>Servicio social: dura un periodo no menor a 6 meses y no mayor a 2 años y puede iniciarse al contar con 70% de los créditos totales.</li><li>Titulación: El alumno tiene la opción de titularse mediante una tesis fílmica (proyecto de cortometraje), tesis escrita o informe académico de experiencia profesional.</li>\r\n</ul>', 'La licenciatura de Cinematografía consta de 8 semestres, con un total de 352 a 356 créditos, el total de créditos dependerá del campo de conocimientos que escoja el alumno durante el desarrollo de la carrera. La asignaturas se dividen en: obligatorias (34 con 244 créditos), obligatorias de elección (de 15 a 20 con 100 a 120 créditos) y optativas (2 a 5 con 12 a 30 créditos).<br><br>\r\nLa carrerar consta de dos etapas de formación:\r\n<ul>\r\n<li> Formación básica: dentro de esta etapa el alumno obtiene conocimientos básicos de cinematografía profesional, además de una concepción teórica, artística y técnica sobre los procesos de la creación cinematográfica. Tiene una duración de 4 semestres y se compone en su mayoría de asignaturas obligatorias, pero también tiene asignaturas obligatorias de elección.</li>\r\n<li>Formación de profundización: el principal objetivo de esta etapa es capacitar a los alumnos para ejercer su profesión, además de darles fundamentos para cursar un\r\nposgrado. Tiene una duración de 4 semestres y se compone en su mayoría de asignaturas obligatorias de elección y en menor medida de asignaturas obligatorias y optativas.</li>\r\n</ul>\r\n\r\nLos conocimientos que el alumno obtendrá al terminar esta licenciatura son altamente variados, sin embargo dentro de ellos podemos mencionar: realización de cine de animación, realización de cine documental, realización de cine de ficción, desarrollo de un guión, dirección de fotografía, producción, dirección de arte y diseño de sonido.<br><br>\r\nPara saber más sobre el plan de estudios de la carrera de Cinematografía de la UNAM te sugerimos visitar el sitio:\r\n<a href=\"http://oferta.unam.mx/carreras/98/cinematografia\" target=\"_blank\">Oferta</a>', 'El alumno podrá realizar un programa de intercambio en cualquiera de las escuelas del Centre International de Liaison des Ecoles de Cinéma et de Télévision (CILET), en el cual, se encuentran un total de 131 escuelas de cine de 55 países de todos los continentes. Como si no fuera suficiente, la UNAM también le da la oportunidad a sus alumnos de realizar un programa con la Federación de las Escuelas de la Imagen y el Sonido de América Latina (FEISAL), la cual aglutina a más de 30 escuelas de cine en Latinoamérica.<br><br>Además, la UNAM posee varias opciones de estudio fuera de la propia escuela, en las cuales se incluyen varios institutos, centros y otras universidades, como: Centro de Capacitación Cinematográfica (Conaculta/SEP), Centro de Estudios Cinematográficos (plantel Coyoacán), Asociación Mexicana de Cineastas Independientes (AMCI), Universidad Iberoamericana,, Universidad Autónoma de Guadalajara (Zapopan, Jalisco) y el Centro de Estudios Cinematográficos (plantel Guadalajara, Jalisco).<br><br>', '\"Al finalizar sus estudios el alumno habrá obtenido.<br><ul>\r\n<h3>Conocimiento para:</h3>\r\n<li>Clasificar y criticar las teorías, métodos, escuelas y técnicas de la cinematografía nacional y mundial.</li>\r\n<li>Interpretar con lenguaje cinematográfico las artes narrativas y dramáticas.</li>\r\n<li>Argumentar, a través de las producciones cinematográficas, sobre la situación económica, social, política y cultural de México y el mundo.</li><br><h3>Habilidades para la creación de cinematografía:</h3>\r\n<li>Convertir ideas y conceptos en elementos concretos, visuales y sonoros.</li>\r\n<li>Aplicar instrumentos tecnológicos en la realización cinematográfica.</li>\r\n<li>Adaptarse visual y auditivamente a las nuevas tecnologías videocinematográficas.</li><h3>Actitudes de:</h3><li>Compromiso con la propia expresión artística y los valores estéticos de la cinematografía, así como con las problemáticas sociales más cercanas.</li>\r\n<li>Reflexión crítica sobre su trabajo y la producción cinematográfica en general.</li>\r\n<li>Templanza y racionalidad ante las presiones externas a la creación cinematográfica.</li>\r\n</ul>'),
('Sociales', 'El Colegio de México', 'Economía (COLMEX)', 'La licenciatura de Economía se imparte en el COLMEX y es de excelencia académica. Contando con egresados notables que se desarrollan en el ámbito público y privado del país.\r\n\r\n<ul>\r\n<li>Duración: 9 semestres.</li>\r\n\r\n<li>Servicio social: se lleva a cabo en un tiempo mayor a 6 meses, cumpliendo 480 horas.</li>\r\n\r\n<li>Titulación: El alumno tiene la opción de titularse mediante una tesis.</li>\r\n</ul>', 'El plan de estudios ofrece las siguientes características:<br><br>\r\n<ul>\r\n<li> Formación técnica de primer nivel.</li>\r\n<li>Fundamentos en ciencias sociales y humanidades.</li>\r\n<li>Análisis de la realidad política y económica contemporánea.</li>\r\n<li>Entrenamiento en la producción de conocimientos innovadores y relevantes.</li>\r\n<li>El programa tiene una duración de ocho semestres académicos más un semestre de servicio social. En los últimos semestres, el alumno puede realizar un intercambio académico en alguna de las universidades extranjeras con las que se tiene convenio.</li>\r\n</ul>', 'El alumno podrá realizar un programa de intercambio en cualquiera de las escuelas del Centre International de Liaison des Ecoles de Cinéma et de Télévision (CILET), en el cual, se encuentran un total de 131 escuelas de cine de 55 países de todos los continentes. Como si no fuera suficiente, la UNAM también le da la oportunidad a sus alumnos de realizar un programa con la Federación de las Escuelas de la Imagen y el Sonido de América Latina (FEISAL), la cual aglutina a más de 30 escuelas de cine en Latinoamérica.<br><br>\r\nPara saber más, te sugerimos visitar :\r\n<a href=\"http://oia.colmex.mx/index.php/el-colegio-de-mexico-y-el-mundo\" target=\"_blank\">Aquí</a>', 'Al finalizar sus estudios el alumno habrá obtenido.<br>\r\nLos estudiantes egresados de la Licenciatura en Economía serán profesionales con conocimientos en la teoría y el análisis económico, con capacidad de análisis crítico e independiente basado en el conocimiento de amplio espectro de las diferentes ramas de las ciencias sociales.<br>\r\nLos egresados estarán en capacidad de elaborar diagnósticos de situaciones y escenarios micro y macroeconómicos y de implementar políticas en el ámbito público y privado. Tendrán las habilidades y conocimientos necesarios para ocupar cargos de liderazgo en organismos públicos nacionales e internacionales, empresas y consultorías, así como en instituciones de investigación.<br>\r\nAsimismo, nuestro programa de Licenciatura en Economía brinda la preparación necesaria para que los egresados puedan continuar sus estudios de posgrado en las más prestigiosas universidades a nivel nacional e internacional.<br>'),
('Humanidades', 'Universidad Nacional Autónoma de México', 'Historia', 'La licenciatura de Historia de la UNAM se imparte en la Facultad de Filosofía y Letras ubicado en el Circuito Interior en Ciudad Universitaria, CDMX. Dentro de la Facultad los alumnos tienen acceso a la biblioteca \"\"Samuel Ramos\"\", salas de cómputo, mapoteca, laboratorios de cartografía, teatros y la librería \"\"Mascarones\"\", en la cual pueden encontrar libros y revistas editados por la Facultad.\r\nDe igual forma, se imparte en la Facultad de Estudios Superiores de Actlán ubicado en la Av. Alcanfores y San Juan Totoltepec s/n, Santa Cruz Acatlán, 53150 Naucalpan, CDMX. La facultad se conforma de 26 edificios y amplias áreas para actividades académicas, deportivas, recreativas y culturales, conformando más de 30 hectáreas.\r\n\"\"En el ciclo escolar 2013-2014 el total de aspirantes a ingresar a esta licenciatura fue de 1,987. De cada 4 estudiantes que demandaron la carrera ingresó 1. Del total de alumnos de primer ingreso 44% son mujeres y 56% hombres.\"\" (UNAM)\r\nDentro de esta carrera se forman los profesionales encargados de aplicar las herramientas conceptuales y técnicas, para investigar críticamente los hechos ocurridos en el pasado desde diversas perspectivas y reflexionar entorno a estos, relacionándolo con el presente. En otra parte, estudia las transformaciones de la sociedad, provocadas por un acontecimiento o proceso, acontecido en una época y lugar geográfico determinado.\r\n<ul>\r\n<li>Duración: 8 semetres.</li><li>Servicio social: dura un periodo no menor a 6 meses y no mayor a 2 años y puede iniciarse al contar con 70% de los créditos totales.</li><li>Titulación: El alumno puede titularse mediante tesis, tesina, informe académico de actividad profesional, informe académico por Servicio Social o informe académico por artículo académico, cualquiera que sea la opción elegida debe ser acompañada por una réplica oral./li>\r\n</ul>\r\n', 'La licenciatura de Historia tiene una duración de 8 semestres, con un total de créditos de 304. Posee 52 asignaturas: 26 son obligatorias (196 créditos) y 26 optativas (108 créditos). Las asignaturas desarrollan las siguientes áreas temáticas: Historiografía; Investigación, Docencia y Difusión; Teoría, Conocimiento Histórico.<br><br>\r\nLa carrera consta de varias etapas de formación:\r\n<ul>\r\n<li> Primera: en los primeros dos semestres se toman 5 asignaturas obligatorias y solamente una optativa, ya que se hace un énfasis en los conocimientos básicos que debe de poseer un historiador.</li>\r\n<li>Segunda: de tercer al sexto semestre se toman 7 asignaturas.</li>\r\n<li>Tercera: Mientras que los últimos dos semestres están conformados por seis materias cada uno, donde deberá cursar un seminario de investigación obligatorio, con opción temática. Para inscribirse al séptimo semestre se necesita aprobar un examen de comprensión de lectura de una lengua extranjera moderna, en el Departamento de Lenguas Extranjeras de la Facultad de Filosofía y Letras, o en el Centro de Enseñanza de Lenguas Extranjeras de la UNAM.</li>\r\n</ul>Nota: el programa académico varía según la facultad donde se desarrolle la carrera.\r\n', 'La Facultad de Filosofía y Letras de la UNAM le da la oportunidad a sus estudiantes de realizar un intercambio de movilidad estudiantil a más de 30 universidades de Estados Unidos, Canadá, América Latina y algunos países de Asia. Si el estudiante lo necesita, también puede aspirar a una beca.\r\nD0e igual forma, la Facultad de da la posibilidad como estudiante de hacer un intercambio de movilidad a nivel nacional, en 25 universidades al interior de la República Mexicana, entre ellas se encuentra el Instituto Politécnico Nacional, la Universidad Autónoma de México y el Colegio de\r\nMéxico. La convocatoria es publicada por la Oficina de Colaboración Interinstitucional, en la Gaceta UNAM.<br><br>Para saber más sobre los programas de Intercambio de la carrera de Historia de la UNAM te sugerimos visitar el sitio:\r\n<a href=\"\"http://www.global.unam.mx/\"\" target=\"\"_blank\"\">Aquí</a>', 'Al finalizar sus estudios el alumno .<br> \r\n\r\n<ul> \r\n<li>Recopilar, ordenar, sistematizar e interpretar los hechos humanos del pasado para interactuar eficazmente con egresados de otras disciplinas.</li> \r\n<li>Dar prioridad a tareas que favorezcan, preserven, refuercen y enriquezcan la identidad multicultural del país.</li> \r\n<li>Manejar aspectos conceptuales básicos de la historiografía y de la teoría de la historia para analizar las diversas formas del discurso histórico y su interpretación.</li> \r\n<li>Dominar los fundamentos metodológicos y didácticos para el ejercicio de la docencia.</li> \r\n<li>Aplicar los principios metodológicos y de manejo de fuentes en la investigación histórica.</li> \r\n<li>Enfrentar los problemas que se presenten en la vida profesional de manera crítica y creativa.</li> \r\n<li>Mantener una actitud de apertura y crítica hacia nuevas corrientes de interpretación histórica.</li> \r\n</ul>'),
('Humanidades', 'Universidad Nacional Autónoma de México', 'Letras Clásicas', 'La licenciatura de Letras clásicas de la UNAM se imparte en la Facultad de Filosofía y Letras ubicado en el Circuito Interior en Ciudad Universitaria, CDMX. Dentro de la Facultad los alumnos tienen acceso a la biblioteca \"\"Samuel Ramos\"\", salas de cómputo, mapoteca, laboratorios de cartografía, teatros y la librería \"\"Mascarones\"\", en la cual pueden encontrar libros y revistas editados por la Facultad. De igual forma, se imparte en la Facultad de Estudios Superiores de Actlán ubicado en la Av. \r\nAlcanfores y San Juan Totoltepec s/n, Santa Cruz Acatlán, 53150 Naucalpan, CDMX. La facultad se conforma de 26 edificios y amplias áreas para actividades académicas, deportivas, recreativas y culturales, conformando más de 30 hectáreas. \r\n\"\"En 2013-2014 el número de aspirantes a ingresar a esta licenciatura fue de 296. De cada 5 estudiantes que demandaron la carrera ingresó 1. Del total de alumnos de primer ingreso 58% son mujeres y 42% hombres.\"\" (UNAM) \r\nEn la carrera de Letras clásicas se desarrollan los profesionales que se dedican a estudiar los diversos campos culturales griegos y latinos en un contexto histórico-social. Como resultado, el egresado podrá analizar la influencia que han tenido estos factores dentro de la cultura occidental, en especial, la cultura mexicana\r\n<ul>\r\n<li>Duración: 8 semestres.</li>\r\n<li>Servicio social: se lleva a cabo en un tiempo mayor a 6 meses pero menor a 2 años, y puede iniciarse al contar con 70% de los créditos totales. Se puede llevar a cabo este requisito haciendo actividades de docencia, apoyo a investigación y edición de textos..</li>\r\n<li>Titulación: El alumno tiene la opción de titularse mediante una tesis, tesina, informe académico o traducción comentada, cualquiera que sea la opción elegida debe acompañarse con una réplica oral de la misma.</li>\r\n</ul>\r\n', 'La licenciatura en Letras clásicas consta de 6 semestres. Las materias se dividen en: obligatorias y optativas. Abarcando las áreas de conocimiento de Lengua, Literatura, Historia y Cultura. En todos los semestres de la carrera se imparten las asignaturas de Griego y Latín, ya que son consideradas conocimientos básicos para las Lenguas clásicas. La carrera consta de 3 niveles de formación:\r\n<ul>\r\n<li>Primer nivel: se lleva a cabo en los primeros 4 semestres y tiene como objetivo acercar al alumno a un conocimiento lingüístico, literario,teórico-metodológico e histórico de las letras clásicas>.</li>\r\n<li>Segundo nivel: se lleva a cabo en el quinto y sexto semestre. Tiene como objetivo completar la formación general en las cuatro áreas de conocimiento de la licenciatura.</li>\r\n<li> Tercer nivel: se lleva a cabo en el séptimo y octavo semestre. Tiene como objetivo especializar al alumno de acuerdo al campo de estudio que él escoja.</li>\r\n<li> La cuarta fase (doceavo y treceavo semestres) es la última fase, la cual le corresponde al an?o del Servicio Social. Esta fase da cumplimiento al 5to artículo constitucional. Esta fase es un seguimiento del internado médico, lo cual complementa las habilidades sociales del estudiante.</li>\r\n</ul>\r\nNota: el programa académico varía según la facultad donde se desarrolle la carrera. \r\nPara saber más sobre el plan de estudios de la carrera de Letras Clásicas de la UNAM te sugerimos visitar el sitio:\r\n<a href=http://oferta.unam.mx/carreras/30/letras-clasicas target=\"\"_blank\"\">Oferta</a>', 'La Facultad de Filosofía y Letras de la UNAM le da la oportunidad a sus estudiantes de realizar un intercambio de movilidad estudiantil a más de 30 universidades de Estados Unidos, Canadá, América Latina y algunos países de Asia. Si el estudiante lo necesita, también puede aspirar a una beca. De igual forma, la Facultad de da la posibilidad como estudiante de hacer un intercambio de movilidad a nivel nacional, en 25 universidades al interior de la República Mexicana, entre ellas se encuentra el Instituto Politécnico Nacional, la Universidad Autónoma de México y el Colegio de México. La convocatoria es publicada por la Oficina de Colaboración Interinstitucional, en la Gaceta UNAM.<br><br>\r\nPara saber más sobre los programas de Intercambio de la carrera de Letras Clásicas de la UNAM te \r\nsugerimos visitar el sitio: \r\n<a href=http://www.global.unam.mx/ target=\"\"_blank\"\">Aquí</a>', 'Al finalizar sus estudios el alumno habrá obtenido1: <br>\r\n<ul>\r\n<h3>Conocimientos:</h3>\r\n<li>De las lenguas y las literaturas griega y latina que lo capaciten para leer y analizar los textos de los autores clásicos, comprender su estructura gramatical, traducirlos y situarlos en el contexto de la historia literaria. </li>\r\n<li>De los principios básicos de la metodología de la investigación lingüística y literaria para realizar trabajos individuales o colectivos en el ámbito de las letras clásicas</li>\r\n<h3>Habilidades:</h3>\r\n<li>En el manejo de las técnicas, métodos y procedimientos didácticos requeridos para ejercer la docencia</li>\r\n<li>En el empleo de las técnicas de investigación necesarias para el análisis y la traducción de textos literarios, filosóficos y jurídicos, entre otros.</li>\r\n<h3>Actitudes:</h3>\r\n<li>Disposición favorable hacia la búsqueda independiente del conocimiento para enriquecerse como profesionista y fomentar el desarrollo de un pensamiento reflexivo, crítico y productivo mediante la docencia o la investigación. </li>\r\n</ul>'),
('Biológicas ', 'Universidad Nacional Autónoma de México', 'Medicina', 'La medicina es aquella disciplina científica cuyo objetivo es promover, conservar y restaurar la salud de las personas (seres humanos), actuando bajo un marco de referencia humanística. El ejercicio profecional de un médico se orienta a la práctica clínica, guiándose por principios éticos bajo el cual la vida humana es la prioridad.\r\nLa licenciatura en Medicina de la UNAM se imparte en el centro interdisciplinario de Ciencias de la Salud, dispone de 48 aulas, laboratorios, quirófanos, 63 sedes hospitalarias, bioterios, anfiteatro, hemerobiblioteca, biblioteca médica digital, auditorios, centro de medios, radioteca y cafeterías, todo eso en cuanto a servicios que ofrece la institución.\r\n\r\n<ul>\r\n<li>Duración: Dicha licenciatura consta de 9 semestres (5 años) y un año de servicio social.</li>\r\n\r\n<li>Servicio social: El servicio social dura un periodo no menor a 6 meses y no mayor a 2 años y se debe cubrir el 100% de los créditos de los años previos del plan de estudio vigente.</li>\r\n\r\n<li>Titulación: El alumno tiene la opción de titularse mediante actividad de investigación (tesisi), por estudios del posgrado o por totalidad de créditos y alto nivel académico.</li>\r\n</ul>\r\n', 'La carrera de Medicina consta de 9 semestres, con un total de créditos es de 431, el total de créditos dependerá del campo de conocimientos que escoja el alumno durante el desarrollo de la carrera. Las asignaturas se dividen en: 57 asignaturas , las cuales 55 son obligadas y dos optativas.<br><br>\r\nLa carrerar consta de cuatro etapas de formación:\r\n<ul>\r\n<li> La primera fase (primero y segundo an?o) El alumno logra incorporar el conocimiento con predominio de los aspectos teo?ricos biomédicos y sociome?dicos e introduce progresivamente pra?cticas de salud pública y habilidades clínicas.</li>\r\n<li>En la segunda fase (quinto al noveno semestre) el alumno adquiere conocimientos, habilidades, destrezas, actitudes y aptitudes necesarias para la pra?ctica de la medicina general en ambientes reales. Dentro de esta fase se llevan la mayoría de las materias que ayudarán al estudiante a tener una base sólida para ejercer en su área.</li>\r\n<li> La tercera fase (de?cimo y onceavo semestres) corresponde al Internado me?dico del alumno, donde desarrollará las habilidades y aptitudes prácticas de la carrerar, dentro de las prácticas se engloban los temas de: Cirugi?a, Ginecologi?a y Obstetricia, Medicina Interna, Pediatri?a, Urgencias y Medicina Familiar y la actividad cli?nica complementaria.</li>\r\n<li> La cuarta fase (doceavo y treceavo semestres) es la última fase, la cual le corresponde al an?o del Servicio Social. Esta fase da cumplimiento al 5to artículo constitucional. Esta fase es un seguimiento del internado médico, lo cual complementa las habilidades sociales del estudiante.</li>\r\n</ul>\r\n\r\nLos conocimientos que el alumno obtendrá al terminar esta licenciatura son altamente variados, sin embargo dentro de ellos podemos mencionar: Conocimientos generales y específicos del cuerpo humano, desarrollo de prácticas quirúrgicas, pediátricas, de urgencias etc.<br><br>\r\nPara saber más sobre el plan de estudios de la carrera de medicina de la UNAM te sugerimos visitar el sitio:\r\n<a href=\"http://oferta.unam.mx/carrera/archivos/planes/medicina-fmedicina-planestudio13.pdf\" target=\"_blank\">Oferta</a>', 'El Programa se ha desarrollado en los últimos años con los alumnos que obtienen mejor promedio en la carrera y además dominan el idioma inglés, condición que no variará, pues serán este mismo tipo de alumnos los que accederán al programa. (UNAM, 2016)<br><br>\r\n\r\nSe pueden hacer estancias clínicas y de investigación en las siguientes Universidades, cabe recalcar que se deben de cumplir los requisitos establecidos por cada una de las universidades e instiruciones.<br><br>\r\n<ul>\r\n<li> Universidad de Nuevo México (EE.UU.) <a href=\"http://hsc.unm.edu\" target=\"_blank\">http://hsc.unm.edu</a> </li>\r\n<li>Universidad de Mc Gill (Canada) <a href=\"http://cyberus.mcgill.ca\" target=\"_blank\">http://cyberus.mcgill.ca</a> </li>\r\n<li>Escuela de Medicina de Baylor (EE.UU.) <a href=\"http://bcem.edu\" target=\"_blank\"></a> </li>\r\n<li>Hospital General de Massachusetts (EE.UU.) <a href=\"http://umassmed.edu\" target=\"_blank\">http://umassmed.edu</a> </li>\r\n<li>Universidad de Yale (EE.UU.) <a href=\"http://yale.edu\" target=\"_blank\">http://hsc.yale.edu</a> </li>\r\n<li>Universidad Complutense de Madrid (España)</li>\r\n<li>Universidad de California en los Angeles (EE.UU.) <a href=\"http://hsc.ucla.edu\" target=\"_blank\">http://hsc.ucla.edu</a> </li>\r\n<li>Universidad de Cambridge (Inglaterra) <a href=\"http://cambridge.rcog.org.uk\" target=\"_blank\">http://cambridge.rcog.org.uk</a> </li>\r\n<li>Universidad de la República de Uruguay</li>\r\n<li>Universidad de Washington (EE.UU.) <a href=\"http://hsc.uw.edu\" target=\"_blank\">http://hsc.uw.edu</a> </li>\r\n<li>Universidad de John Hopkins (EE.UU.) <a href=\"http://hsc.jhu.edu\" target=\"_blank\">http://hsc.jhu.edu</a> </li>\r\n<li>Universidad de Charles Sturt (Australia) Instituto Levinson (Israel)</li>\r\n</ul>', 'Algunas de las competencias del egresado de la Facultad de Medicina son:<br>\r\n\r\n<ul>\r\n<h5>Comunicación efectiva.</h5>\r\n<li>Establece una comunicación atenta con los pacientes basada en el respeto a sus creencias y cultura, así como en la confidencialidad, la empatía y la confianza.</li>\r\n<li>Conocimiento y aplicación de las ciencias biomédicas, sociomédicas y clínicas en el ejercicio de la medicina.</li>\r\n<li>Realiza su práctica clínica y la toma de decisiones con base en el estudio de problemas de salud, contacto con pacientes y las causas de atención más frecuentes en la medicina general. (UNAM, 2016)</li><br>\r\n\r\n<h5>Profesionalismo, aspectos éticos y responsabilidades legales.</h5>\r\n<li>Ejerce su práctica con base en principios éticos y jurídicos, con vocación de servicio, humanismo y responsabilidad social.</li>\r\n<h5>\r\nSalud poblacional y sistema de salud: promoción de la salud y prevención de la enfermedad.</h5>\r\n\r\n<li>Aplica estrategias de salud pública dirigidas a la promoción de la salud, prevención de enfermedades, y actúa con prontitud ante contingencias epidemiológicas y sociales.</li>\r\n</ul>'),
('Biológicas', 'Universidad Nacional Autónoma de México', 'Odontología (UNAM)', 'Odontología es una profesión que brinda atención bucodental integral a la población, en los niveles de diagnóstico, prevención, restauración y mantenimiento, con base en los avances científicos y tecnológicos, tanto a nivel individual como colectivo.  \r\nEl profesional de esta carrera presta sus servicios además a nivel comunitario, en programas de promoción y atención a la salud. Asimismo contribuye en la formación profesional de otros odontólogos, al ejercer la profesión en el ámbito de la docencia.  \r\nEsta carrera únicamente se imparte en la ENES León. La institución está equipada con laboratorios, así como con tres clínicas: una odontológica con unidades dentales, otra de admisión y diagnóstico, y una más de educación continua. ', 'La carrera de Odontología consta de 8 semestres, con un total de 350 a 371 cre?ditos, el total de créditos dependerá del campo de conocimientos que escoja el alumno durante el desarrollo de la carrera. Las asignaturas se dividen en: 58 asignaturas, de las cuales 37 son obligatorias, nueve son obligatorias por área de profundización y 12 optativas de elección <br><br>\r\n\r\nEl plan de estudios esta? constituido por un tronco comu?n de tres an?os. Posteriormente, para iniciar el cuarto an?o de la licenciatura, el estudiante podra? elegir de entre cuatro opciones, una a?rea de profundizacio?n que aborde los contenidos odontolo?gicos de su intere?s.\r\n\r\n<ul>\r\n<li> Salida formativa final para Te?cnico Dental. </li>\r\n<li> Salida formativa final para Te?cnico Higienista Dental.  </li>\r\n</ul>\r\n\r\nPara saber más sobre el plan de estudios de la carrera de odontología de la UNAM te sugerimos visitar el sitio:  \r\n<a href=\"http://oferta.unam.mx/carrera/archivos/planes/odonto-enesleon-planestudios13.pdf \" target=\"_blank\">Oferta</a>', 'La Feria Educativa Estudia sin Fronteras es un esfuerzo inédito en la UNAM, con el objetivo de difundir entre la comunidad universitaria la oferta educativa de instituciones y organismos nacionales e internacionales: cursos de idiomas, movilidad estudiantil, intercambios, posgrados, pasantías, investigaciones, becas y financiamientos. <br><br>\r\n\r\nVisita la liga si deseas saber más al respecto<br><br>\r\n<ul>\r\n<li><a href=\"http://www.estudiasinfronteras.unam.mx\" target=\"_blank\">http://www.estudiasinfronteras.unam.mx</a> </li>\r\n</ul>', 'Algunas de las competencias del egresado de la Facultad de odontología a son: <br>\r\n\r\n<ul>\r\n<li>Diseñará estrategias para prevenir problemas de salud bucodental. </li>\r\n<li>Identificará y diagnosticará las principales alteraciones bucodentales. </li>\r\n<li>Tratará y rehabilitará las alteraciones de la cavidad oral más frecuentes, con un enfoque integrador. </li>\r\n<li>Evaluará la problemática de salud bucodental desde la perspectiva biológica, psicológica y social, con un enfoque multidisciplinario. </li>\r\n<li>Incorporará los avances científicos y tecnológicos al ámbito de la odontología. </li>\r\n<li>Integrará el diagnóstico de salud bucodental de la comunidad aplicando el método epidemiológico como base para identificar los problemas del proceso salud-enfermedad.  </li>\r\n<li>Integrará los conocimientos obtenidos, y los aplicará en el establecimiento de un pronóstico y plan de tratamiento.  </li>\r\n<li>Se desempeñará como promotor de la salud para mejorar las condiciones bucodentales de la población. </li>\r\n<li>Mostrará espíritu de servicio. </li>\r\n<li>Estará éticamente comprometido para brindar una atención con calidad y calidez. </li>\r\n\r\n</ul>'),
('Sociales', 'El Colegio de Mexico', 'Politica y Administracion Publica (COLMEX)', 'La Licenciatura en Política y Administración Pública brinda al estudiante el conocimiento especializado para el diseño y formulación de políticas, y el manejo de recursos públicos, desde un punto de vista amplio, que incluye elementos políticos, económicos y sociales más allá de lo que es estrictamente la cuestión gubernamental.\r\n\r\n<ul>\r\n<li>Duración: 9 semestres</li>\r\n\r\n<li>Servicio social: dura un periodo no menor a 6 meses, cumpliendo 480 horas.</li>\r\n\r\n<li>Titulación: El alumno tiene la opción de titularse mediante una tesis.</li>\r\n</ul>', 'El plan de estudios cuenta con nueve semestres, en los cuales se cargan hasta 5 materias, entre las que destacan historia, matemáticas y ciencias sociales, además de micro y macro economía.', 'En los últimos semestres, el alumno puede realizar un intercambio académico en alguna de las universidades extranjeras con las que se tiene convenio. Existen convenios con universidades de América, Europa y Asia. Te sugerimos visitar:\r\n<a href=\"http://oia.colmex.mx/index.php/el-colegio-de-mexico-y-el-mundo\" target=\"_blank\">http://oia.colmex.mx/index.php/el-colegio-de-mexico-y-el-mundo</a>', 'El campo natural para los egresados de Política y Administración Pública es el sector público. La exigencia de una gestión pública eficiente, responsable y equitativa para atender los problemas de la ciudadanía requiere profesionistas especializados en las disciplinas básicas del proceso administrativo y capaces de entender la complejidad de la acción gubernamental. No obstante, las opciones de desarrollo profesional son múltiples, tanto en las dependencias federales como en las administraciones locales. Los organismos financieros internacionales, las organizaciones de desarrollo económico y promoción social, las empresas públicas, las consultorías, la cátedra universitaria y la investigación constituyen posibilidades de desempeño profesional.'),
('Biológicas ', 'Universidad Nacional Autónoma de México', 'Química (UNAM)', 'La química es aquella profesión que conjuga la formación científica y tecnológica, enfocada en el estudio científico de la materia, su estructura, transformaciones y relaciones con la energía, a fin de crear nuevos productos, modificar los ya existentes. \r\nUna de las aplicaciones que los egresados ejercen es la protección al ambiente, mediante el control o mejora de procesos y el establecimiento de medidas de seguridad para la salud. También son capacitados para el manejo y operación de técnicas, instrumentos y equipos en las áreas específicas de su profesión. \r\nLa licenciatura en Química de la UNAM se imparte en las instalaciones designadas a la facultad de Química (Ciudad Universitaria) Coyoacán, la cual posee una amplia infraestructura que consta de aulas, laboratorios, bibliotecas y auditorios. \r\n<ul>\r\n<li>Duración:Dicha licenciatura consta de 9 semestres. </li>\r\n\r\n<li>Servicio social: El servicio social dura un periodo no menor a 6 meses y no mayor a 2 años , es decir, se debe cumplir un mínimo de 480 horas. También se tiene que cubrir el 70% de los créditos de los años previos del plan de estudio vigente. </li>\r\n\r\n<li>Titulación:El alumno tiene la opción de titularse por tesis, por actividades de investigación, informe de práctica profesional o Alto nivel académico. </li>\r\n</ul>', 'La carrera de Química de la UNAM consta de 9 semestres, con un total de 397 cre?ditos, de los cuales 345 son obligatorios y 52 créditos de optativas, el total de créditos dependerá del campo de conocimientos que escoja el alumno durante el desarrollo de la carrera. Las asignaturas se dividen en: 51 asignaturas, de las cuales 43 son materias obligatorias, 8 asignaturas optativas (dos socio?humani?sticas, una teo?rico?pra?ctica, y cinco teo?ricas) \r\nDentro del plan de estudios de la carrera, de las 43 asignaturas obligatorias, 13 son teo?ricas, 22 teo?rico?pra?cticas y ocho pra?cticas. <br><br>\r\nEl plan de estudios de la carrera de química tiene siete a?reas y seis suba?reas distribuidas en tres ciclos, los cuales son: \r\n<ul>\r\n<li> Tronco Común </li>\r\n<li>Fundamental de la Profesión </li>\r\n<li> Terminal y de Preespecializacio?n. </li>\r\n\r\n\r\nPara saber más sobre el plan de estudios de la carrera de Química de la UNAM te sugerimos visitar el sitio:\r\n<a http://oferta.unam.mx/carrera/archivos/planes/quim-fquimica-planestudios13.pdf.>Oferta</a>', 'La Universidad Nacional Autónoma de México (UNAM), sustentada en su reconocido prestigio a nivel mundial, se ha vinculado exitosamente con muchas otras instituciones de educación superior, tanto nacionales como del extranjero. (IntercambiosQuímica, 2015) \r\nla Dirección General de Estudios de Posgrado (DGEP) en conjunto con la Dirección General de Asuntos del Personal Académico (DGAPA), han mandado alrededor de 50 estudiantes de la Facultad de Química a cursar un semestre de su licenciatura en instituciones de EUA y Canadá, sobre todo en las Universidades de California (campi Davis, Berkeley y Santa Bárbara), McGill, Toronto, Calgary y Ottawa, aunque algunos otros lo hicieron en las de Navarra y Compostela, ambas en España, y en la de Buenos Aires, Argentina.<br><br>', 'El egresado de la Facultad de Química es un profesional con una sólida formación científica y tecnológica, que posee:<br>\r\n\r\n<ul>\r\n<h3>Sólidos conocimientos en: matemáticas, física, química orgánica, fisicoquímica y estadística.</h3>\r\n<li>Conocimientos teórico-prácticos fundamentales con una metodología científica que aplica para identificar, resolver y prevenir problemas en su área profesional. </li>\r\n<li>Capacidad de comunicación oral y escrita. (PerfilQuímicaUNAM, 2016</li>\r\n<li>Realiza su práctica clínica y la toma de decisiones con base en el estudio de problemas de salud, contacto con pacientes y las causas de atención más frecuentes en la medicina general. (UNAM, 2016)</li><br>\r\n\r\n\r\n<li>Igualmente el egresado realiza la síntesis, caracterización, y análisis adecuados de productos naturales o sintéticos, puros o mezclados. Tambien participa en el desarrollo de nuevas metodologías para la realización de síntesis y análisis químicos, así como en el de nuevas tecnologías relacionadas con productos químicos; se tiene una conciencia con respecto al medio ambiente y al desarrollo sustentable.</li>\r\n</ul>'),
('Biológicas ', 'Universidad Nacional Autónoma de México', 'Química en Alimentos (UNAM)', 'La Química de Alimentos aplican conocimientos de química y biología al desarrollo, optimización y control de productos alimenticios, desde la materia prima hasta el producto almacenado, incluyendo su comercialización. \r\nSu función social está orientada a lograr una mejor alimentación para toda la población, perfeccionando el aprovechamiento y la distribución de la producción primaria de alimentos, mediante el desarrollo, conservación y control de productos alimenticios más estables, seguros y con mejores características. (QuímicaAlimentos, 2015) \r\nLa licenciatura en Química en alimentos de la UNAM se imparte en las instalaciones designadas a la facultad de Química (Ciudad Universitaria) Coyoacán , la cual posee una amplia infraestructura que consta de aulas, laboratorios, bibliotecas y auditorios. \r\n<ul>\r\n<li>Duración:Dicha licenciatura consta de 9 semestres. </li>\r\n\r\n<li>Servicio social: El servicio social dura un periodo no menor a 6 meses y no mayor a 2 años , es decir, se debe cumplir un mínimo de 480 horas. También se tiene que cubrir el 70% de los créditos de los años previos del plan de estudio vigente. </li>\r\n\r\n<li>Titulación: El alumno tiene la opción de titularse por tesis, por actividades de investigación, informe de práctica profesional o Alto nivel académico. </li>\r\n</ul>', 'La carrera de química en alimentos de la UNAM consta de 9 semestres, con un total de 397 cre?ditos, de los cuales 331 son obligatorios y 66 créditos de optativas, el total de créditos dependerá del campo de conocimientos que escoja el alumno durante el desarrollo de la carrera. Los créditos se dividen en: 331 créditos son obligatorios y 66 créditos se asignan a materias optativas, de las cuales 18 son de corte sociohumani?stico y 48 disciplinarios que pueden ser seleccionados de un plan terminal, sin limitar que los alumnos puedan cursar asignaturas de otros planes de estudio. <br><br>\r\nEl plan de estudios de la carrera de Química en alimentos consta de tres ciclos, los cuales son: \r\n<ul>\r\n<li> Tronco Común </li>\r\n<li>Fundamental de la Profesión </li>\r\n<li> Terminal y de Preespecializacio?n. </li>\r\n\r\n\r\nPara saber más sobre el plan de estudios de la carrera de Química en alimentos de la UNAM te sugerimos visitar el sitio\r\n<a http://oferta.unam.mx/carrera/archivos/planes/quiali-fquimicaplanestudios13 </a>', 'La Universidad Nacional Autónoma de México (UNAM), sustentada en su reconocido prestigio a nivel mundial, se ha vinculado exitosamente con muchas otras instituciones de educación superior, tanto nacionales como del extranjero. (IntercambiosQuímica, 2015) \r\nla Dirección General de Estudios de Posgrado (DGEP) en conjunto con la Dirección General de Asuntos del Personal Académico (DGAPA), han mandado alrededor de 50 estudiantes de la Facultad de Química a cursar un semestre de su licenciatura en instituciones de EUA y Canadá, sobre todo en las Universidades de California (campi Davis, Berkeley y Santa Bárbara), McGill, Toronto, Calgary y Ottawa, aunque algunos otros lo hicieron en las de Navarra y Compostela, ambas en España, y en la de Buenos Aires, Argentina. \r\n\r\nVisita esta página si deseas conocer los programas interinstitucionales que ofrece la UNAM: http://quimica.unam.mx/cont_espe2.php?id_rubrique=21&id_article=918&color=526C11&rub2=3 75.<br><br>', 'El egresado tendrá conocimientos y habilidades necesarios para:<br>\r\n\r\n<ul>\r\n<h3>Realizar el control químico, fisicoquímico, microbiológico, nutricional, toxicológico y de calidad de los alimentos, desde las materias primas durante el proceso, hasta los productos terminados y en anaquel.</h3>\r\n<li>Desarrollar nuevos productos alimenticios procesados y biosintéticos. </li>\r\n<li>Evaluar, controlar, mejorar y adaptar: alimentos, aditivos, así como colaborar en su diseño.</li>\r\n<li>Participar en equipos interdisciplinarios para establecer y verificar normas y medidas legales, educación nutricional, detección y solución de problemas alimentarios; además de planeación y operación de procesos de alimentos.</li><br>\r\n\r\n\r\n<li>El egresado deberá mantenerse actualizado, además de valorar su función social y sabrá desempeñarse con honestidad, ajustándose a los códigos de ética de la comunidad y de la profesión. (PerfilAlimentos, 2015). </li>\r\n</ul>'),
('Biológicas', 'Universidad Autónoma de Nuevo León', 'Químico Bacteriólogo Parasitólogo (UANL)', 'Los estudiantes de la carrera de Químico Bacteriólogo Parasitólogo (QBP) reciben formación y entrenamiento en los principios fundamentales y aspectos aplicados de microbiología (bacterias, hongos, virus, algas y protozoarios) y biología celular. La carrera de QBP busca formar profesionistas de alto nivel científico y tecnológico así como emprendedores comprometidos socialmente.\r\nLa licenciatura en Químico bacteriólogo parasitólogo de la UALN se imparte Facultad de Ciencias Biológicas de la UANL, el centro que alberga la biblioteca y laboratorios aptos para enseñar las asignaturas pertinentes a la carrera.\r\n<ul>\r\n<li>Duración: 10 semestres.</li><li>Servicio social: Dura un periodo no menor a 6 meses y no mayor a 2 años , es decir, se debe cumplir un mínimo de 480 horas. También se tiene que cubrir el 70% de los créditos de los años previos del plan de estudio vigente.</li><li>Titulación: El alumno tiene la opción de titularse por tesis, por prácticas profecionales o por alto nivel académico.</li>\r\n</ul>', 'La carrera de Químico bacteriólogo parasitólogo de la UANL consta de 10 semestres, con un total de 397 cre?ditos, de los cuales 370 son obligatorios y 27 optativas, el total de créditos dependerá del campo de conocimientos que escoja el alumno durante el desarrollo de la carrera. Las asignaturas se dividen en: 58 asignaturas, de las cuales 46 son obligatorias y 13 asignaturas optativas, contempla materias en las áreas la industria cervecera, vitivinícola, lácteos, alimentos, producción de antibióticos, en laboratorios clínicos e inmunología, en sanidad vegetal, animal y acuícola, control biológico, programas de evaluación y protección del medio ambiente, entre otros.<br><br>\r\nPara saber más sobre el plan de estudios de la carrera de Químico bacteriólogo parasitólogo de la UANL te sugerimos visitar el sitio:\r\n<a href=\"http://oia.colmex.mx/index.php/el-colegio-de-mexico-y-el-mundo\" target=\"_blank\">Aquí</a>', 'A través de este sistema, el alumno podrá estudiar en el extranjero mediante convenios y programas que la UANL tiene con diversas instituciones y organismos.<br><br>\r\n<ul>\r\n<li>CREPUQ (sólo en la provincia de Quebec, Canadá): este programa abarca todas las áreas del conocimiento.</li>\r\n<li>CONAHEC (en Estados Unidos y Canadá): este programa comprende todas las áreas del conocimiento.</li>\r\n<li>DAAD: becas del programa del Gobierno alemán de intercambio académico.</li>\r\n</ul>\r\nTambién pueden realizarse intercambios con instituciones del extranjero con las que la UANL tenga acuerdos de colaboración conjunta.', 'El Químico Bacteriólogo Parasitólogo es un profesionista competitivo, emprendedor e innovador, con principios éticos y de responsabilidad social con una visión integral en el uso sustentable de la diversidad microbiológica que le permite aplicar el conocimiento en la implementación y validación de métodos de laboratorio, evaluar riesgos para la prevención y control de enfermedades de origen microbiano y parasitario, implementar sistemas de gestión de la calidad y procesos biotecnológicos para el bienestar de la comunidad, a través de la solución de problemas en el área de salud, medio ambiente, ciencias agropecuarias e industria con enfoques inter, intra y transdisciplinarios. (PerfilBiologoBacteUANL, 2015)<br>\r\n<ul>\r\n<li>Un egresado de QBP posee conocimientos y habilidades en química, microbiología, biología molecular, análisis clínicos y biotecnología, esta familiarizado con las técnicas de investigación y analíticas, así como con equipos de laboratorio. Los egresados pueden trabajar en la industria cervecera, vitivinícola, lácteos, alimentos, producción de antibióticos, en laboratorios clínicos e inmunología, en sanidad vegetal, animal y acuícola, control biológico, programas de evaluación y protección del medio ambiente, entre otros. También pueden incursionar en la Investigación básica y aplicada o emprender su propia empresa.</li>\r\n</ul>');

-- --------------------------------------------------------

--
-- Table structure for table `examenes`
--

CREATE TABLE `examenes` (
  `id` int(20) NOT NULL,
  `nombre` varchar(72) COLLATE latin1_spanish_ci NOT NULL,
  `numpreguntas` varchar(72) COLLATE latin1_spanish_ci NOT NULL,
  `tipo` varchar(72) COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Dumping data for table `examenes`
--

INSERT INTO `examenes` (`id`, `nombre`, `numpreguntas`, `tipo`) VALUES
(1, 'Test vocacional 1', '30', 'general');

-- --------------------------------------------------------

--
-- Table structure for table `exam_recomendacion`
--

CREATE TABLE `exam_recomendacion` (
  `Id` int(32) NOT NULL,
  `UsrEmail` varchar(72) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `IdExamen` int(20) NOT NULL,
  `AreaNombre` varchar(72) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `NombreUni` varchar(72) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `Id_Aplicacion_Examen` int(20) NOT NULL,
  `Nombre_Carrera` varchar(72) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `exam_recomendacion`
--

INSERT INTO `exam_recomendacion` (`Id`, `UsrEmail`, `IdExamen`, `AreaNombre`, `NombreUni`, `Id_Aplicacion_Examen`, `Nombre_Carrera`) VALUES
(46, 'prueba@prue.com', 1, 'Humanidades', 'Universidad Nacional Autónoma de México', 30, 'Cinematografía (UNAM)'),
(47, 'prueba@prue.com', 1, 'Humanidades', 'Universidad Nacional Autónoma de México', 30, 'Historia'),
(48, 'prueba@prue.com', 1, 'Humanidades', 'Universidad Nacional Autónoma de México', 30, 'Letras Clásicas'),
(49, 'prueba@prue.com', 1, 'Biológicas ', 'Universidad Nacional Autónoma de México', 31, 'Medicina'),
(50, 'prueba@prue.com', 1, 'Biológicas', 'Universidad Nacional Autónoma de México', 31, 'Odontología (UNAM)'),
(51, 'prueba@prue.com', 1, 'Biológicas ', 'Universidad Nacional Autónoma de México', 31, 'Química (UNAM)'),
(52, 'prueba@prue.com', 1, 'Biológicas ', 'Universidad Nacional Autónoma de México', 31, 'Química en Alimentos (UNAM)'),
(53, 'prueba@prue.com', 1, 'Biológicas', 'Universidad Autónoma de Nuevo León', 31, 'Químico Bacteriólogo Parasitólogo (UANL)'),
(54, 'larraldeortizemmanuelalejandro@gmail.com', 1, 'Sociales', 'El Colegio de México', 32, 'Economía (COLMEX)'),
(55, 'larraldeortizemmanuelalejandro@gmail.com', 1, 'Sociales', 'El Colegio de Mexico', 32, 'Politica y Administracion Publica (COLMEX)'),
(56, 'prueba@prue.com', 1, 'Biológicas ', 'Universidad Nacional Autónoma de México', 33, 'Medicina'),
(57, 'prueba@prue.com', 1, 'Biológicas', 'Universidad Nacional Autónoma de México', 33, 'Odontología (UNAM)'),
(58, 'prueba@prue.com', 1, 'Biológicas ', 'Universidad Nacional Autónoma de México', 33, 'Química (UNAM)'),
(59, 'prueba@prue.com', 1, 'Biológicas ', 'Universidad Nacional Autónoma de México', 33, 'Química en Alimentos (UNAM)'),
(60, 'prueba@prue.com', 1, 'Biológicas', 'Universidad Autónoma de Nuevo León', 33, 'Químico Bacteriólogo Parasitólogo (UANL)'),
(61, 'larraldeortizemmanuelalejandro@gmail.com', 1, 'Biológicas ', 'Universidad Nacional Autónoma de México', 34, 'Medicina'),
(62, 'larraldeortizemmanuelalejandro@gmail.com', 1, 'Biológicas', 'Universidad Nacional Autónoma de México', 34, 'Odontología (UNAM)'),
(63, 'larraldeortizemmanuelalejandro@gmail.com', 1, 'Biológicas ', 'Universidad Nacional Autónoma de México', 34, 'Química (UNAM)'),
(64, 'larraldeortizemmanuelalejandro@gmail.com', 1, 'Biológicas ', 'Universidad Nacional Autónoma de México', 34, 'Química en Alimentos (UNAM)'),
(65, 'larraldeortizemmanuelalejandro@gmail.com', 1, 'Biológicas', 'Universidad Autónoma de Nuevo León', 34, 'Químico Bacteriólogo Parasitólogo (UANL)');

-- --------------------------------------------------------

--
-- Table structure for table `universidades`
--

CREATE TABLE `universidades` (
  `nombre` varchar(72) COLLATE latin1_spanish_ci NOT NULL,
  `descripcion` mediumtext COLLATE latin1_spanish_ci NOT NULL,
  `ciudad` varchar(72) COLLATE latin1_spanish_ci NOT NULL,
  `latitud` varchar(72) COLLATE latin1_spanish_ci NOT NULL,
  `longitud` varchar(72) COLLATE latin1_spanish_ci NOT NULL,
  `becas` mediumtext COLLATE latin1_spanish_ci NOT NULL,
  `uni_foto` varchar(80) COLLATE latin1_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Dumping data for table `universidades`
--

INSERT INTO `universidades` (`nombre`, `descripcion`, `ciudad`, `latitud`, `longitud`, `becas`, `uni_foto`) VALUES
('Centro de Investigación y Docencia Económicas', 'El CIDE forma parte del Sistema de Centros Públicos de Investigación de CONACYT. El 95% de su planta docente cuenta con doctorado y el 74% es miembro del Sistema Nacional de Investigadores (SNI). Ofrece 3 programas académicos a nivel licenciatura.', 'Ciudad de México', '19.374624', '-99.264082', '<ul>\r\n<li>Beca de Manutención</li>\r\n<li>Beca por excelencia académica</li>\r\n</ul>', 'http://mapp.cide.edu/documents/93422/93785/CIDE-CIB.jpg?t=1474918790373'),
('El Colegio de México', 'Creado en 1940, puntera en las ciencias sociales y humanidades, según el ranking de Américaeconomía Intelligence, en 2016 es el único centro del país con una calidad docente del 100%. Cuenta con una matrícula de poco menos de 400 alumnos y un porcentaje de admisión del 11%. Ofrece 3 programas académicos a nivel licenciatura.', 'Ciudad de México', '19.303506', '-99.207867', '<ul>\r\n<li>Beca COLMEX</li>\r\n</ul>\r\n', 'http://www.educacionyculturaaz.com/wp-content/uploads/2015/08/colmex1.jpg'),
('Instituto Politécnico Nacional', 'El Instituto Politécnico Nacional (IPN), es una institución pública mexicana de investigación y educación en niveles medio superior, superior y posgrado; fundada en la Ciudad de México en 1936 durante el gobierno del presidente Lázaro Cárdenas del Río.\r\nEl IPN tiene como misión institucional contribuir al desarrollo económico y social de la nación, a través de la formación integral de personas competentes; de la investigación, el desarrollo tecnológico y la innovación; y tiene reconocimiento internacional por su calidad e impacto social. (IPN, Misión y VIsión, 2015)\r\nEl Instituto Politécnico Nacional es considerado una de las instituciones educativas más importantes de México y América Latina por su nivel académico, y su matrícula inscrita de más de 160.000 alumnos en sus 293 programas educativos impartidos en sus 82 unidades académicas. Es una de las principales instituciones mexicanas en la formación de técnicos y profesionales en los campos de la administración, la ciencia, la ingeniería y las nuevas tecnologías.', 'Ciudad de México', '19.497546', '-99.135349', '<ul>\r\n<li>Beca manutención IPN</li>\r\n<li>fundación bécalos alto rendimiento</li>\r\n<li>Beca institucional IPN</li>\r\n<li>Probems</li>\r\n<li>Universitarios Prepa-Sí</li>\r\n<li>Apoyo de trasporte</li>\r\n</ul>', 'http://chidoychale.mx/wp-content/uploads/2016/12/32607753.jpg'),
('Universidad Autónoma de Nuevo León', 'La Universidad Autónoma de Nuevo León (UALN) entra en ranking de las mejores instituciones para estudiar en el área de biológicas en México, esto según la revista el universa (ElUniversal, 2016). Actualmente la universidad cuenta con alrededor de 183 mil estudiantes, que cursan 280 programas educativos en los niveles medio superior, superior y posgrado y que son atendidos por 6 mil 852 docentes.\r\nTiene presencia en todo el estado de Nuevo León, y entre sus sedes se destacan siete campus universitarios: Ciudad Universitaria, Ciencias de la Salud, Mederos, Marín, Ciencias Agropecuarias, Sabinas Hidalgo y Linares, con 26 facultades y 29 preparatorias.\r\nLa UANL tiene 38 centros de investigación, donde trabajan expertos investigadores, de los cuales 692 son reconocidos por el Sistema Nacional de Investigadores. Además de 84 bibliotecas en que se resguardan 2 millones 238 mil volúmenes de consulta. (UANL, 2016)', 'Monterrey', '25.728228', '-100.311993', '<ul>\r\n<li>Beca manutención UALN</li>\r\n<li>Beca fundación UALN</li>\r\n<li>Beca deportiva</li>\r\n<li>Beca de escasos recursos</li>\r\n<li>Beca por promedio académico</li>\r\n</ul>', 'http://ftsydh.uanl.mx/wp-content/uploads/2011/09/uanl-016.jpg'),
('Universidad Nacional Autónoma de México', 'La Universidad Autónoma de México (UNAM) es la única universidad del país que aparece en el ranking de Times Higher Education 2016-2016 en la clasificación de Artes y Humanidades, apareciendo en el puesto 77 de un total de 100 universidades. (Times Higher Education, 2015-2016)\r\nLa UNAM imparte un total de 37 licenciaturas en el área de Humanidades y Artes. Dentro de la oferta educativa que proporciona la UNAM se encuentran carreras como: composición, diseño gráfico, filosofía, historia, letras clásicas, literatura dramática y teatro, piano, cinematografía, música y tecnología artística, entre muchas otras. \r\n', 'Ciudad de México', '19.323510', '-99.186789', '<ul>\r\n<li>Programa de apoyo nutricional</li>\r\n<li>Manutención UNAM</li>\r\n<li>Excelencia Bécalos</li>\r\n<li>Probemex</li>\r\n<li>Beca apoyo para trasporte “Tarjeta CDMX”</li>\r\n<li>Universitarios Prepa-Sí</li>\r\n<li>Programa Nacional de Becas (PRONABES)</li>\r\n<li>Programa de Fortalecimiento de Estudios de Licenciatura (PFEL)</li>\r\n<li>Programa México Nación Multicultural (para alumnos indígenas)</li>\r\n</ul>', 'https://www.siass.unam.mx/images/home_alumnos/siass_unam_1.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `email` varchar(72) COLLATE latin1_spanish_ci NOT NULL,
  `pass` varchar(40) CHARACTER SET latin1 NOT NULL,
  `nombre(s)` varchar(72) CHARACTER SET latin1 NOT NULL,
  `apellido(s)` varchar(72) CHARACTER SET latin1 NOT NULL,
  `edad` int(72) NOT NULL,
  `ciudad` varchar(72) CHARACTER SET latin1 NOT NULL,
  `latitud` varchar(72) CHARACTER SET latin1 NOT NULL,
  `longitud` varchar(72) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`email`, `pass`, `nombre(s)`, `apellido(s)`, `edad`, `ciudad`, `latitud`, `longitud`) VALUES
('ale.xd@gmail.com', '45e21a218117679d7bf5bacae2a8e1b23935e792', 'Alexis', 'Carranza', 17, 'Zacatecas', '', ''),
('gerardo.ayala.juarez@gmail.com', 'e6bd18a160b610e8699bed9834953a5a6d527340', 'Gerar', 'at', 19, 'Zacatecas ', '', ''),
('gerardo@gmail.com', 'e73f648bfe090ce50ef6bb70cee66916848ab0f8', 'a', 'a', 180, 'Zacatecas', '', ''),
('holi@holi.com', 'ef163fb6406c786402863dc6fb56472c53e85eda', 'Ramiro', 'Estrada', 12, 'Zacatecas', '', ''),
('larraldeortizemmanuelalejandro@gmail.com', '4826690bf385080f1391e6e14fd9ca1c7f65bf56', 'ste', 'men', 10, 'Baja California Sur', '', ''),
('luis@gmail.com', 'd59759e4f9ae16e9329c12339eab153029dfbfd3', 'Luis', 'Trejo', 18, 'zac', '', ''),
('maquinadefuego2000@hitmail.com', '86d27ed8463dce13e0f767ea20aa03bca9844e57', 'Este ', 'Men', 69, 'Sonora', '', ''),
('prueba@prue.com', 'ef163fb6406c786402863dc6fb56472c53e85eda', 'Ramiro', 'Estrada', 17, 'Zacatecas', '', ''),
('prueba@prueba.com', 'ac1fdcdc0463af87ee924c6dc526c01039b2a630', 'Ramiro2', 'Estrada2', 12, 'Zacatecas', '', ''),
('tuptm@gmail.com', 'dd3767ec503c35065a85355a10bee48f1ccc6f51', 'yo', 'pos yo', 1000, 'Zacatecas', '', ''),
('xdxd@gmail.com', '9042f8f6be87187946920d9d03a2bb0226186549', 'Emmanuel', 'larralde', 17, 'Zacatecas', '', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aplicacion_examen`
--
ALTER TABLE `aplicacion_examen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `UsrEmail` (`UsrEmail`),
  ADD KEY `IdExamen` (`IdExamen`) USING BTREE;

--
-- Indexes for table `areas`
--
ALTER TABLE `areas`
  ADD PRIMARY KEY (`nombre`);

--
-- Indexes for table `carreras`
--
ALTER TABLE `carreras`
  ADD PRIMARY KEY (`nombre`),
  ADD KEY `AreaNombre` (`AreaNombre`),
  ADD KEY `NombreUni` (`NombreUni`);

--
-- Indexes for table `examenes`
--
ALTER TABLE `examenes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exam_recomendacion`
--
ALTER TABLE `exam_recomendacion`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `UsrEmail` (`UsrEmail`),
  ADD KEY `IdExamen` (`IdExamen`),
  ADD KEY `AreaNombre` (`AreaNombre`),
  ADD KEY `NombreUni` (`NombreUni`),
  ADD KEY `Nombre_Carrera` (`Nombre_Carrera`),
  ADD KEY `exam_recomendacion_ibfk_3` (`Id_Aplicacion_Examen`);

--
-- Indexes for table `universidades`
--
ALTER TABLE `universidades`
  ADD PRIMARY KEY (`nombre`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `aplicacion_examen`
--
ALTER TABLE `aplicacion_examen`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT for table `exam_recomendacion`
--
ALTER TABLE `exam_recomendacion`
  MODIFY `Id` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `aplicacion_examen`
--
ALTER TABLE `aplicacion_examen`
  ADD CONSTRAINT `aplicacion_examen_ibfk_1` FOREIGN KEY (`IdExamen`) REFERENCES `examenes` (`id`),
  ADD CONSTRAINT `aplicacion_examen_ibfk_2` FOREIGN KEY (`UsrEmail`) REFERENCES `usuarios` (`email`);

--
-- Constraints for table `carreras`
--
ALTER TABLE `carreras`
  ADD CONSTRAINT `carreras_ibfk_1` FOREIGN KEY (`AreaNombre`) REFERENCES `areas` (`nombre`),
  ADD CONSTRAINT `carreras_ibfk_2` FOREIGN KEY (`NombreUni`) REFERENCES `universidades` (`nombre`);

--
-- Constraints for table `exam_recomendacion`
--
ALTER TABLE `exam_recomendacion`
  ADD CONSTRAINT `exam_recomendacion_ibfk_1` FOREIGN KEY (`UsrEmail`) REFERENCES `aplicacion_examen` (`UsrEmail`),
  ADD CONSTRAINT `exam_recomendacion_ibfk_2` FOREIGN KEY (`IdExamen`) REFERENCES `aplicacion_examen` (`IdExamen`),
  ADD CONSTRAINT `exam_recomendacion_ibfk_3` FOREIGN KEY (`Id_Aplicacion_Examen`) REFERENCES `aplicacion_examen` (`id`),
  ADD CONSTRAINT `exam_recomendacion_ibfk_4` FOREIGN KEY (`AreaNombre`) REFERENCES `carreras` (`AreaNombre`),
  ADD CONSTRAINT `exam_recomendacion_ibfk_5` FOREIGN KEY (`NombreUni`) REFERENCES `carreras` (`NombreUni`),
  ADD CONSTRAINT `exam_recomendacion_ibfk_6` FOREIGN KEY (`Nombre_Carrera`) REFERENCES `carreras` (`nombre`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
