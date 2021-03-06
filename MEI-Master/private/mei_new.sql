-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-07-2018 a las 21:22:11
-- Versión del servidor: 10.1.28-MariaDB
-- Versión de PHP: 7.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `mei_new`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aplicacion_examen`
--

CREATE TABLE `aplicacion_examen` (
  `UID` int(11) NOT NULL,
  `id_examen` int(20) NOT NULL,
  `id_user` varchar(40) NOT NULL,
  `fecha` date NOT NULL,
  `id_resultado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `aplicacion_examen`
--

INSERT INTO `aplicacion_examen` (`UID`, `id_examen`, `id_user`, `fecha`, `id_resultado`) VALUES
(1, 1, '4d09640e908161ae1c2098e0fcadb73d91a4b304', '2018-02-22', 3),
(5, 1, '4d09640e908161ae1c2098e0fcadb73d91a4b304', '2018-02-23', 1),
(10, 1, '4d09640e908161ae1c2098e0fcadb73d91a4b304', '2018-07-17', 4),
(11, 1, '885a5a6e26f1d9b3efaf99f828d7b30751137082', '2018-07-19', 4),
(12, 1, '4d09640e908161ae1c2098e0fcadb73d91a4b304', '2018-07-19', 4),
(13, 1, '4d09640e908161ae1c2098e0fcadb73d91a4b304', '2018-07-19', 1),
(14, 1, '885a5a6e26f1d9b3efaf99f828d7b30751137082', '2018-07-19', 4),
(15, 1, '4d09640e908161ae1c2098e0fcadb73d91a4b304', '2018-07-20', 4),
(16, 1, '4d09640e908161ae1c2098e0fcadb73d91a4b304', '2018-07-21', 1),
(17, 1, '4d09640e908161ae1c2098e0fcadb73d91a4b304', '2018-07-21', 1),
(18, 1, '4d09640e908161ae1c2098e0fcadb73d91a4b304', '2018-07-21', 1),
(19, 1, '4d09640e908161ae1c2098e0fcadb73d91a4b304', '2018-07-21', 1),
(20, 1, '4d09640e908161ae1c2098e0fcadb73d91a4b304', '2018-07-21', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `area`
--

CREATE TABLE `area` (
  `UID` int(11) NOT NULL,
  `nombre` varchar(72) NOT NULL,
  `nombre_completo` tinytext NOT NULL,
  `descripcion` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `area`
--

INSERT INTO `area` (`UID`, `nombre`, `nombre_completo`, `descripcion`) VALUES
(1, 'biologicas', 'Ciencias Quimico/Biologicas', 'Las ciencias biológicas son aquellas que se dedican a estudiar la vida y sus procesos. Se trata de una rama de las ciencias naturales que investiga el origen, la evolución y las propiedades de los seres vivos.\r\n'),
(2, 'humanidades', 'Humanidades y Artes', 'Relacion con las humanidades'),
(3, 'ingenieria', 'Ciencias Fisico/Matemáticas y de Igeniería', 'La ingeniería es el conjunto de conocimientos científicos y tecnológicos para la innovación, invención, desarrollo y mejoramiento de técnicas y herramientas para satisfacer las necesidades de las empresas y la sociedad.\r\nEl ingeniero utiliza las matemáticas, las matemáticas aplicadas, la física, química y otras ciencias tanto para el desarrollo de tecnologías, como para el manejo eficiente y productivo de recursos y fuerzas de la naturaleza en beneficio de la sociedad. La ingeniería es una actividad que transforma el conocimiento en algo práctico.\r\nLa ingeniería aplica los conocimientos y métodos científicos a la invención o perfeccionamiento de tecnologías de manera pragmática y ágil, adecuándose a las limitaciones de tiempo, recursos, requerimientos legales, requerimientos de seguridad, ecológicos, etc.\r\n'),
(4, 'sociales', 'Ciencias Sociales', 'Relacion con las sociales');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrera_area`
--

CREATE TABLE `carrera_area` (
  `UID` int(11) NOT NULL,
  `id_carrera` int(11) NOT NULL,
  `id_area` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `carrera_area`
--

INSERT INTO `carrera_area` (`UID`, `id_carrera`, `id_area`) VALUES
(3, 1, 1),
(4, 11, 1),
(5, 11, 1),
(6, 15, 3),
(7, 15, 3),
(8, 16, 1),
(9, 17, 1),
(10, 18, 3),
(11, 20, 3),
(12, 21, 3),
(13, 22, 3),
(14, 21, 3),
(15, 22, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrera_info`
--

CREATE TABLE `carrera_info` (
  `UID` int(11) NOT NULL,
  `nombre` varchar(72) NOT NULL,
  `descripcion` mediumtext NOT NULL,
  `salario_min` float DEFAULT NULL,
  `salario_max` float DEFAULT NULL,
  `keywords` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `carrera_info`
--

INSERT INTO `carrera_info` (`UID`, `nombre`, `descripcion`, `salario_min`, `salario_max`, `keywords`) VALUES
(1, 'Cirujano Dentista', 'La licenciatura de Cirujano Dentista forma profesionistas capaces de resolver las necesidades de salud bucodental de la población, mediante un criterio clínico integral. Su labor se enfoca hacia la solución de: caries dental, enfermedad periodontal (tejidos de sostén del diente), malposiciones dentarias, alteraciones de la articulación temporomandibular, cáncer bucal y malformaciones de labio y paladar.', 7000, 30000, 'biologicas,odontología,diente,dentista'),
(11, 'Licenciatura en Biología', 'El egresado de la licenciatura en Biología es concebido como una persona cuyo bagaje intelectual incluya un espectro de conocimientos básicos desde el nivel molecular y celular, hasta visiones integrativas que le permitan comprender los procesos de cambio de la biosfera en el tiempo y en el espacio. Debe ser una persona consciente no sólo de la extraordinaria diversidad biológica que caracteriza al país, sino también de la riqueza que el uso y preservación de ésta representan para mantener y desarrollar nuestra identidad nacional. El egresado de Biología es un profesional que por sus conocimientos profundos de la ciencia de la vida, realiza docencia e investigación y colabora adecuadamente aplicando sus conocimientos para resolver problemas de investigación o aplicaciones de otras disciplinas vinculadas.', 5500, 12000, 'biológicas,biologo,zoologo,microorganismos,programación,python,zacatecas'),
(15, 'Ingeniería en Sistemas Computacionales', 'El ingeniero en sistemas computacionales es un experto en el manejo de sistemas de programación (software) o sistemas electrónicos (hardware), capaz de diseñar, desarrollar, implantar y mantener actualizadas las infraestructuras de cómputo y comunicación; promoviendo así, la modernización y optimización de procesos en las empresas, organismos e instituciones donde preste sus servicios.', 8000, 50000, 'computacion,sistemas,upiiz,ipn,programacion,software,industria,ingenieria'),
(16, 'Ingeniería Ambiental', 'La ingeniería ambiental es un área y rama de las ciencias ambientales que se basa en el diseño, la aplicación, y la gestión de procesos, productos y servicios tecnológicos para la prevención, el control y remedio de problemas de degradación ambiental; para el desarrollo del uso sustentable de recursos naturales en procesos productivos y de consumo, teniendo siempre como prioridad la excelente calidad de vida en nuestro entorno.<br>\r\n\r\nLa ingeniería ambiental contribuye a garantizar, mediante la conservación y preservación de los recursos naturales, una mejor calidad de vida para la generación actual y para las generaciones futuras. Esta disciplina, en pleno desarrollo, ve cada vez más claro su objetivo y ha venido consolidándose como una necesidad, ya que proporciona una serie de soluciones propicias para enfrentar la actual crisis ecológica que vive el planeta. Por esto, es considerada por muchas personas como una profesión de gran futuro.', 10000, 45000, 'ingeniería,biologica,ambiente,zacatecas,industria'),
(17, 'Ingeniería en Alimentos', 'La ingeniería en alimentos es la rama multidisciplinaria de la ingeniería que tiene como función el estudio de la transformación y procesos de materias primas de consumo humano en la innovación de productos con una vida útil más prolongada fundamentada en la comprensión de fenómenos de la química, la biología y la física de los alimentos. Esto se realiza con distintos fines, siendo el más importante que el producto pueda conservarse el mayor tiempo posible, sin que pierda su valor nutritivo, reduciendo costos de elaboración y transporte ; deshidratación es el ejemplo más común: leche, frutas.<br>\r\nEl ingeniero en alimentos tiene como trabajo el solucionar los problemas que se presentan en todo el proceso de creación de los alimentos teniendo como objetivo el reducir el impacto al medio ambiente, los desperdicios y costos de producción, otorgando productos de calidad y valor nutrimental satisfaciendo las demandas de los consumidores, desarrollando y mejorando las tecnologías aplicadas en el proceso de producción.', 6000, 17000, 'alimentos,ingenieria,industria,procesamiento,conservacion,biologica,quimica'),
(18, 'Ingeniería Mecatrónica', 'La ingeniería mecatrónica es una disciplina que sirve para diseñar y desarrollar productos que involucren sistemas de control para el diseño de productos o procesos inteligentes, lo cual busca crear maquinaria más compleja para facilitar las actividades del ser humano a través de procesos electrónicos en la industria mecánica, principalmente. Esta disciplina une la ingeniería mecánica, ingeniería electrónica, ingeniería de control e ingeniería informática. Debido a que combina varias ingenierías en una sola, su punto fuerte es la versatilidad.', 7000, 50000, 'mecaniaca,electronica,ingeniería,software,hardware,informaica,control,automatizacion'),
(20, 'Ingeniería Metalúrgica', 'La Ingeniería Metalúrgica es la actividad enfocada a la selección y operación de los procesos de manufactura, que comprenden las áreas de conocimiento de metalurgia extractiva, metalurgia química, metalurgia física, los procesos de refinación por electrolisis, la fundición, la soldadura y la metalurgia de polvos; el establecimiento y operación de métodos de control de calidad de materia prima, procesos y productos terminados; la protección de estructuras y partes contra la oxidación y corrosión, la selección de materiales y el análisis de fallas.', 8000, 50000, 'metales,ingenieria,minas,oro,plata,extracción,quimica'),
(21, 'Arquitectura', 'La arquitectura es el arte y la técnica de proyectar, diseñar, construir y modificar el hábitat humano, incluyendo edificios de todo tipo, estructuras arquitectónicas, espacios arquitectónicos y urbanos. Así, para los antiguos griegos, el arquitecto era el jefe o director de la construcción, y la arquitectura la técnica o arte de quien realizaba el proyecto y dirigía la construcción de los edificios y estructuras, ya que la palabra ????? (techné) significa ‘creación, invención o arte’.', 7000, 50000, 'arte,arquitectura,ingenieria,griego,creacion,construcción,habitat,humano,edificios'),
(22, 'Arquitectura de Paisaje', 'Planifica, diseña, construye y maneja espacios abiertos como parte del sistema natural y humano, desde una perspectiva responsable, incluyente y significativa en lo ambiental, social y cultural.<br>\r\n\r\nSu trabajo parte del entendimiento y reconocimiento de las condiciones del medio, que obtiene a través de trabajo de campo y estudios de gabinete, para realizar, dentro del taller de diseño, propuestas que satisfagan las necesidades humanas, y potencialicen la vocación del sitio. Conjuga medio natural y antrópico, construyendo con materiales inertes y elementos de la naturaleza (viento, vegetación, agua), los cuales proveen condiciones de confort físico, psíquico y emocional.', 8000, 40000, 'arte,naturaleza,arquitectura'),
(23, 'Diseño Industrial', 'El diseñador industrial genera objetos y productos de fabricación industrial que tienen contacto directo con el hombre, realiza mejoras a los ya existentes, haciéndolos atractivos para que satisfagan las necesidades de una sociedad que está en constante cambio.<br>\r\n\r\nCrea nuevas propuestas y soluciones acordes con los requerimientos de los diferentes mercados que demandan productos mejor planeados y diseñados, con el objeto de lograr el óptimo aprovechamiento de la infraestructura nacional.<br>\r\n\r\nDesarrolla su actividad en tres áreas principales: dentro de una industria o empresa, en actividades de consultoría, o bien, como empresario productor.', 12000, 40000, 'ingenieria,industria,diseño,fabricacion,productos,necesidad'),
(24, 'Urbanismo', 'El urbanista diseña la imagen de las ciudades y de los asentamientos rurales, tomando en cuenta la problemática integral de éstas y de sus pobladores. Su objetivo fundamental es el diseño de nuevos espacios urbanos, la ampliación y mejoramiento de los existentes y la remodelación o conservación del patrimonio histórico, cultural y ecológico de las ciudades. Además, brinda soluciones en aspectos relacionados con la vivienda, la industria, el transporte, vialidad, reservas territoriales, ecología.', 9000, 30000, 'urbano,arquitectura,ingenieria,ciudades,ecologia,rural'),
(25, 'Licenciatura en Arte y Diseño', 'En la actualidad, el arte y las expresiones del diseño aportan nuevas experiencias y formas de interacción con el entorno y con el hombre para sensibilizar, comunicar, transformar y humanizar a la sociedad a través de los lenguajes y expresiones de la imagen, ya sea con recursos tradicionales o de la tecnología digital.<br>\r\n\r\nEn esta licenciatura se forman los profesionales que, con una capacidad crítica y de análisis del contexto, conjugan los conocimientos, habilidades y técnicas de vanguardia del arte y el diseño, así como las herramientas tradicionales y digitales propias de ambas disciplinas con el trabajo interdisciplinario para propiciar las condiciones de integración y transformación de la región.<br>\r\n\r\nProporciona una preparación única en su género y una visión integradora que permite a sus egresados vincular las actividades distintivas de la carrera con las principales problemáticas sociales y participar en el desarrollo de los diversos sectores de la sociedad.', 7000, 40000, 'arte,diseño,licenciatura,tecnología,desarrollo'),
(26, 'Licenciatura en Artes Visuales', 'En esta carrera se forman los profesionales comprometidos, con una visión humanística-social de las artes visuales, que adquieren una formación teórico-conceptual y la incorporan para llevar a cabo un profundo ejercicio de búsqueda de los distintos procesos y recursos involucrados en la disciplina, para aplicarlos directamente en su obra personal y en proyectos colectivos que transformen y beneficien la vida pública de su entorno y de la sociedad.', 5000, 30000, 'humanidades,artes,social,visual,licenciatura'),
(27, 'Licenciatura en Diseño y Comunicación Visual', 'Esta carrera forma al profesional que aplica procedimientos y técnicas para investigar, producir y difundir mensajes visuales y audiovisuales que sirvan, no sólo para informar a los distintos sectores de la sociedad, sino para apoyar sus necesidades e impulsar su desarrollo. En ella se emplean técnicas tradicionales, digitales, híbridas y de nueva creación en áreas muy diversas: Audiovisual, Editorial, Gráfica e Ilustración, Iconicidad y Entornos, Simbología y Diseño Tridimensional.<br>\r\n\r\nEl diseñador de la comunicación visual realiza sus actividades con sensibilidad, capacidad creativa y conocimiento de los medios de comunicación masiva, lo cual aplica en proyectos de diversas magnitudes.<br>\r\n\r\nSu formación le permite desempeñar una amplia gama de posibilidades profesionales como fotógrafo, ilustrador, director de arte, o directivo en departamentos de diseño, publicidad y comunicación, y cuenta con disposición para el trabajo interdisciplinario y vocación para la investigación.', 5000, 30000, 'arte,diseño,visual,licenciatura,humanidad,creativo'),
(28, 'Actuaría', 'Los actuarios son profesionistas que estudian, plantean, formulan y aplican modelos de contenido matemático con el fin de proveer información para la planeación, previsión y toma de decisiones, y para resolver problemas económicos y sociales que involucran riesgos. Intervienen en prácticamente todos los campos del quehacer humano interactuando con los profesionales que ahí se desempeñen.<br>\r\n\r\nLlevan a cabo una labor sumamente diversa y relacionada principalmente con: seguros y planes de beneficio, demografía, finanzas, computación, administración, estadística, investigación de operaciones, economía, docencia e investigación.', 10000, 50000, 'matiematicas,estadistica,prevencion,administracion,investigacion'),
(29, 'Licenciatura en Ciencias de la Computación', 'Esta carrera forma al profesional con conocimientos teóricos sólidos en la disciplina y con habilidades de programación; capaz de desarrollar soluciones computacionales de frontera. Proporciona los fundamentos que le permiten adaptarse a tecnologías emergentes e ideas nuevas, y la preparación para:<br>\r\n* Analizar, diseñar y construir sistemas de software complejos.<br>\r\n* Desarrollar mecanismos para resolver problemas relacionados con: seguridad, almacenamiento de información en bases de datos y envío de información a través de redes de computadoras.<br>\r\n* Atender áreas particulares como la inteligencia artificial.', 12000, 70000, 'computacion,ciencia,software,licenciatura,ia,red,neuronal'),
(30, 'Licenciatura en Ciencias de la Tierra', 'Las ciencias de la Tierra abarcan el estudio temporal y espacial del planeta desde un punto de vista físico, incluyendo su interacción con los seres vivos. Las variadas escalas espacio-temporales de la estructura y la historia de la Tierra hacen que los procesos que en ella tienen lugar sean resultado de una compleja interacción entre procesos de distintas escalas espaciales (desde el milímetro hasta los miles de kilómetros) y escalas temporales que abarcan desde las centésimas de segundo hasta los miles de millones de años. Un ejemplo de esta complejidad es el distinto comportamiento mecánico que algunas rocas tienen en función de los procesos que se estudien: mientras las rocas que componen el manto superior responden elásticamente al paso de las ondas sísmicas (con periodos típicos de fracciones de segundo), responden como un fluido en las escalas de tiempo de la tectónica de placas. Otro ejemplo del amplio abanico de escalas temporales es el cambio climático, que se produce en periodos de entre millones de años a unos pocos años, cuando se confunde con las escalas propias del cambio meteorológico.', 8000, 50000, 'tierra,ciencia,mineria,planeta,rocas,estudio,licenciatura'),
(31, 'Física', 'La Física estudia propiedades y transformaciones de la materia, fenómenos de todo tipo, e interroga experimental y teóricamente a la naturaleza, desde las partículas elementales hasta las galaxias. Apoya a otras ciencias para su desarrollo y elaboración de teorías.<br>\r\n\r\nLos físicos explican los fenómenos mediante teorías basadas en modelos matemáticos y adquieren conocimientos en: Mecánica Clásica y Relativista, Termodinámica, Electromagnetismo, Física Estadística y Cuántica que les brindan una imagen general de las leyes de la naturaleza, y les permiten desarrollar aplicaciones en investigación, docencia, difusión y divulgación de la Física, así como en el ejercicio libre de la profesión.', 8000, 40000, 'fisica,ciencia,fenomenos,matematicas,investigacion,docencia'),
(32, 'Física Biomédica', 'Las demandas actuales en la constante especialización de los equipos médicos de radioterapia y el avance de las técnicas terapéuticas requieren del apoyo del un profesional como el físico biomédico quien con su formación interdisciplinaria aplique sus conocimientos para participar en diversos ámbitos y sea capaz de:<br>\r\n* Participar en la adquisición, procesamiento y optimización de imágenes para el diagnóstico clínico.<br>\r\n* Colaborar en la detección temprana de enfermedades y la planificación de tratamientos médicos.<br>\r\n* Utilizar, crítica y responsablemente, nuevas tecnologías para la terapia y diagnóstico médico.<br>\r\n* Colaborar con grupos de investigación en departamentos de ciencia básica en el sector salud.<br>\r\n* Realizar labores de seguridad y protección radiológica.<br>\r\n* Colaborar con grupos de investigación en la modelación de sistemas biológicos.<br>\r\n* Participar en la planeación y diseño de instalaciones para el uso de fuentes de radiación.<br>\r\n* Colaborar con grupos interdisciplinarios en ciencias del deporte.', 9500, 60000, 'ciencia,terapia,fisica,medica,biomedica,biologicas'),
(33, 'Licenciatura en Matemáticas', 'El matemático es el profesionista capaz de encontrar analogías y de modelar situaciones reales, aprende las matemáticas y sus relaciones con otras disciplinas tanto científicas como sociales, en las cuales motiva y resuelve problemas.\r\n<br>\r\nParticipa en equipos interdisciplinarios dedicados a resolver diversos problemas, así como en actividades de docencia y difusión de la matemática en diferentes niveles.', 5000, 45000, 'matematicas,numeros,licenciatura,ciencia'),
(34, 'Licenciatura en Matemáticas Aplicadas', 'Esta carrera forma al profesional que será capaz de:<br>\r\n\r\n* Participar en proyectos en los que sus conocimientos y habilidades matemáticas sean de utilidad, ya sea dentro del ámbito puramente académico, y en los sectores, productivo y de servicios.<br>\r\n* Detectar situaciones en donde, por su formación, pueda incidir en la solución de problemas concretos, de distintos orígenes, ya sean: científicos, tecnológicos y socioeconómicos.<br>\r\n* Colaborar con otros profesionistas en la formulación de problemas reales en términos matemáticos, así como en su resolución, o en la determinación del tipo de matemáticas que se requerirían.<br>\r\n* Interpretar matemáticamente descripciones de fenómenos de otras disciplinas.<br>\r\n* Intervenir en el desarrollo de enfoques, modelos y procedimientos novedosos que le permitan tratar un problema.<br>\r\n* Impartir cátedra en distintos niveles educativos, y participar, especialmente, en la formación matemática de otras disciplinas.', 6000, 50000, 'matematicas,ciencia,aplicado,industria,producto,licenciatura'),
(35, 'Licenciatura en Antropología', 'La carrera de Antropología contribuye a la formación de profesionales con una perspectiva integral de la disciplina, con capacidad para generar conocimientos sobre las sociedades y culturas del presente y del pasado, con capacidad para establecer el diálogo y el trabajo interdisciplinario con un pensamiento crítico y humanista.<br>\r\n\r\nEn ella se forman profesionales capaces de comprender y brindar soluciones acordes a las necesidades y problemáticas del entorno social y cultural, tomando como punto de partida la diversidad étnica y cultural del mundo contemporáneo, respetuosos de la diversidad social y cultural, con una perspectiva integral de la antropología.', 7000, 60000, 'social,profesional,disciplina,saciedad,humanista,licenciatura'),
(36, 'Licenciatura en Ciencias de la Comunicación', 'Con un enfoque creativo, responsable y crítico, en Ciencias de la Comunicación se analiza y difunde la problemática social mediante mensajes y contenidos informativos, escritos y audiovisuales y se estudian los orígenes, la estructura, el desarrollo y los cambios en los procesos de la comunicación humana, tanto interpersonales como grupales, organizacionales, colectivos o masivos.\r\n<br>\r\nEn esta carrera es fundamental estudiar los procesos de la comunicación colectiva, a través de investigar y analizar la información y los mensajes emitidos por los medios de comunicación social, para valorar sus repercusiones sobre los individuos y la sociedad, y no menos importante es contribuir a la adecuada producción y difusión de mensajes para la sociedad, a fin de que ésta disponga de elementos necesarios para la formación de la opinión pública.', 8000, 40000, 'social,comunicacion,licenciatura,medios,tecnología,audiovisual'),
(37, ' Licenciatura en Ciencias Políticas y Administración Pública', 'Esta licenciatura forma profesionistas expertos en el análisis de la realidad social de las instituciones, procesos y actores que intervienen en la definición de los asuntos públicos.\r\n<br>\r\nActúan con iniciativa, equidad y responsabilidad en función del interés común, y utilizan recursos científicos para identificar, plantear y ofrecer soluciones viables a problemáticas de los procesos e instituciones en que se expresa la vida política y social.\r\n<br>\r\nTienen una visión multidisciplinaria, que conlleva a un razonamiento crítico e inclusivo, para construir modelos y teorías que tienen como referente las demandas de la sociedad.', 8000, 30000, 'social,licenciatura,politica,administracion'),
(38, 'Licenciatura en Relaciones Internacionales', 'En su expresión más sintética, el objeto de estudio de las Relaciones Internacionales es la realidad internacional y su análisis, por tanto, proporciona los elementos teórico-metodológicos que permiten el análisis y la interpretación en los ámbitos político, económico, jurídico, social y cultural.\r\n<br>\r\nAsimismo contempla los aspectos técnico-prácticos requeridos, tanto a nivel operativo como propositivo, en el proceso de toma de decisiones, vinculando los hechos y los problemas internacionales, por lo que considera el estudio de los procesos históricos y sus consecuencias.\r\n<br>\r\nComo disciplina científica, estudia de manera sistemática y rigurosa las relaciones, los protagonistas, los procesos, los fenómenos y las tendencias que inciden en forma relevante y determinante en la realidad mundial, como una totalidad dinámica, en constante cambio e interdependiente.', 8000, 40000, 'social,internacional,relacion,politica,mundial'),
(39, 'Licenciatura en Sociología', 'La complejidad en los acontecimientos sociales de fin de siglo demanda una disciplina científica como la Sociología, que proporcione un conocimiento científico y racional de los cambios sociales y políticos contemporáneos, sobre una aplicación sistemática de métodos, teorías e instrumental técnico.\r\n<br><br>\r\nEl objetivo fundamental de la Sociología es comprender, explicar y diagnosticar el entorno de la vida social en todas sus manifestaciones, utilizando una combinación de datos. Dicho conocimiento permite elaborar diagnósticos para la toma de decisiones.\r\n<br><br>\r\nEl sociólogo genera respuestas eficaces a los desafíos que han de enfrentar las sociedades contemporáneas, tanto a nivel macro, como de comunidades y organizaciones pequeñas.', 7500, 40000, 'sociedad,vida,social,licenciatura,datos,decisiones'),
(40, 'Licenciatura en Administración', 'Profesión especializada en dirigir grupos de trabajo hacia el logro de objetivos de organizaciones privadas, públicas y sociales, optimizando el empleo de recursos, mediante aplicación de técnicas de planeación, organización, dirección y control, utilizadas en las distintas áreas funcionales, tales como: recursos humanos, finanzas, mercadotecnia, producción e informática.<br><br>\r\n\r\nEl licenciado en Administración trabaja en equipos multidisciplinarios en la aplicación de distintas técnicas administrativas; se caracteriza por su visión humanística y emprendedora, vocación de servicio y orientación ética de las organizaciones hacia la creatividad, competitividad y productividad en el ámbito nacional e internacional.', 6000, 30000, 'social,administrar,matematicas,finanzas,mercadotecnia'),
(41, 'Licenciatura en Informática', 'La licenciatura en Informática forma expertos que aplican y desarrollan tecnologías de información apropiadas para la administración eficiente de las organizaciones, integrando las Tecnologías de Información y Comunicación en sus procesos operativos, valorando nuevos modelos de negocio basados en la innovación tecnológica, con un compromiso social y una visión global.\r\n<br><br>\r\nAsimismo es el profesionista responsable de la creación de las estrategias para la implementación y la administración de Tecnologías de Información en la empresa, así como del mantenimiento de servicios tecnológicos y sistemas de tratamiento de la información de manera integral y eficiente.\r\n<br><br>\r\nEs un agente de cambio, creativo, y multicultural que puede desarrollarse y adaptarse en cualquier ambiente laboral, además es un profesionista analítico, crítico, objetivo, reflexivo, abierto a diferentes alternativas, responsable, creativo, propositivo, emprendedor y, en consecuencia, una autoridad profesional en su área.', 12000, 60000, 'informatca,sistemas,licenciatura'),
(42, 'Licenciatura en Contaduría', 'El licenciado en Contaduría satisface las necesidades de las organizaciones y los individuos relacionadas con la toma de decisiones sobre su patrimonio, expresado en valores financieros, en la que se determinan medidas sobre el dinero en sus distintas formas de expresión, a fin de incrementar el patrimonio, pagar contribuciones, y llevar un registro de dichas operaciones financieras. Posee además una perspectiva del contexto de las organizaciones con fines económicos o sociales. <br>\r\n<br>\r\nCon vocación de servicio, visión humanística y ética, y capacidad para analizar y dictaminar la información financiera para la toma de decisiones, el egresado de esta carrera cumple con los objetivos establecidos por las organizaciones en un ámbito cambiante debido a los avances en la ciencia y la tecnología, así como a la evolución de la economía. \r\n<br><br>\r\nAdemás expresa su opinión sobre la situación financiera de las organizaciones y se desempeña con un sentido ético y de responsabilidad social.', 6000, 30000, 'social,contador,economia,organizacion,finanzas'),
(43, 'Licenciatura en Negocios Internacionales', 'La licenciatura en Negocios Internacionales forma profesionistas con una visión interdisciplinaria y global, capaces de diseñar modelos de negocios, generar soluciones creativas a las necesidades de las empresas que participan en el mercado mundial y promover el logro de objetivos en organizaciones públicas, privadas y sociales vinculadas con los negocios internacionales.\r\n<br><br>\r\nPor tanto, el egresado gestiona y promueve organizaciones y negocios que compitan en el mercado global a través de la integración multicultural de equipos de trabajo, además de diseñar e instrumentar estrategias y modelos administrativos que respondan ante un contexto económico internacional cambiante y complejo.\r\n<br><br>\r\nNegocios Internacionales atiende las necesidades y los requerimientos de las organizaciones públicas y privadas que participan en el mercado global en materia de negocios y administración y contribuye a la creación de nuevas fuentes de empleo que produzcan bienes y servicios competitivos internacionalmente.', 5000, 20000, 'social,internacional,relaciones'),
(44, 'Licenciatura en Derecho', 'En la carrera de Derecho se forman juristas con sentido humanista y responsabilidad social, capaces de generar propuestas de solución a los problemas jurídicos de la sociedad.\r\n<br><br>\r\nEl egresado comprende y resuelve la problemática de la disciplina jurídica, con una sólida conciencia de su responsabilidad y compromiso social para el logro de los fines y principios del Derecho: justicia, equidad, bien común y paz social.\r\n<br><br>\r\nEl licenciado en Derecho debe mantener una actualización integral, científica y humanística en lo teórico y en lo práctico, a fin de contribuir al desarrollo y búsqueda de ordenamientos jurídicos que posibiliten el desenvolvimiento pleno de las capacidades y habilidades humanas; además es capaz de interpretar y aplicar adecuadamente la normatividad jurídica.', 6000, 50000, 'derecho,social,lienciatura'),
(45, 'Licenciatura en Economía', 'Profesión en la que son evaluados científicamente los fenómenos económicos de la realidad mexicana, mediante la comprensión de: la producción, distribución, intercambio y consumo de bienes y servicios que satisfacen las necesidades del hombre y la sociedad.\r\n<br><br>\r\nEn ella son diseñados e instrumentados modelos económicos con el fin de recomendar, en lo particular y colectivamente, acciones para el mejor empleo de los recursos productivos y la óptima distribución del ingreso en la sociedad.\r\n<br><br>\r\nEl egresado de esta carrera formula soluciones a los problemas económicos que plantea la economía, a partir del análisis de los fenómenos productivos y de los mercados –de bienes y servicios– en los ámbitos nacional e internacional.', 10000, 50000, 'social,economia,dinero,empleo'),
(46, 'Licenciatura en Comunicación', 'El profesionista de la Comunicación recopila, analiza y sistematiza información para generar mensajes para prensa, radio, televisión, cine o Internet, estudia los fenómenos de la comunicación en sus distintos niveles y medios para aplicar estos conocimientos en las áreas de docencia, investigación, producción, análisis, evaluación de mensajes, diseño de estrategias, campañas de publicidad, de comunicación política y organizacional. Planea, organiza y dirige las estructuras administrativas y organizacionales de los medios de difusión y empresas afines; aplica las metodologías de investigación científica para el análisis y la evaluación de acontecimientos y fenómenos.\r\n<br><br>\r\nDesempeña funciones: académicas, de investigación, de análisis e interpretación de lenguajes escritos e icónicos, en la producción de medios electrónicos y como comentarista, editorialista y articulista. El comunicólogo desarrolla y aplica técnicas, métodos, metodologías y teorías sobre su especialidad en diversos campos.', 7000, 30000, 'comunicacion,licenciatura,analisis,informacion'),
(47, 'Licenciatura en Diseño Gráfico', 'El profesional del Diseño Gráfico genera formas gráfico-expresivas que satisfacen las necesidades de comunicación visual que hoy en día demandan los distintos sectores sociales, valiéndose de procesos metodológicos y técnicas instrumentales, imágenes, signos, señales, símbolos, ideas y conceptos novedosos y creativos que representen y emitan sensaciones, emociones, información y conocimiento.\r\n<br><br>\r\nLa formación que recibe le permite llevar a cabo con espíritu crítico, propositivo e innovador diversas actividades: diseña carteles, anuncios espectaculares, envases y embalajes de productos, juegos y materiales didácticos; realiza animación en el cine o en la televisión, y efectúa labores relacionadas con el diseño museográfico y de galerías de arte.', 5000, 40000, 'diseño,arte,licenciatura,creativo,grafico,TI'),
(48, 'Licenciatura en Filosofía', 'El filósofo tiene como tarea la búsqueda de los elementos que fundamentan la comprensión del ser humano y de su entorno.\r\n<br><br>\r\nA través de la enseñanza, la investigación y la difusión de teorías, argumentos y problemas filosóficos, la licenciatura en Filosofía transmite los valores fundamentales de la cultura, gracias a su constante y sistemática reflexión de la realidad –elemento fundamental en esta carrera–, cuestiona las diversas problemáticas de la época actual, desarrolla la conciencia crítica e histórica de la sociedad y contribuye a la formación integral de las personas.\r\n<br><br>\r\nLa preparación profesional del filósofo le da la creatividad necesaria para: enriquecer proyectos e instituciones culturales; impartir docencia a nivel medio superior y superior; dedicarse a la investigación filosófica e interdisciplinaria, y para participar en actividades relacionadas con la difusión de la cultura, por lo que labora en espacios diversos.', 7000, 30000, 'filosofia,humanidad,pregunta,duda'),
(49, 'Licenciatura en Historia', 'El historiador es capaz de transmitir los conocimientos históricos y de aplicar las herramientas conceptuales y técnicas para investigar e interpretar críticamente el pasado de los hombres desde diversas perspectivas, reflexionar sobre él y relacionarlo con el presente.\r\n<br><br>\r\nAsimismo, se especializa en una época y lugar geográfico determinados, en una corriente histórica, en un algún acontecimiento o proceso, gracias a lo cual colabora en la solución de diversas problemáticas y en la transformación de la sociedad.\r\n<br><br>\r\nParticipa fundamentalmente en la investigación, la docencia y la difusión de la historia y la cultura en los medios masivos de comunicación.', 7000, 30000, 'historia,docencia,licencitura,hechos'),
(50, 'Ingeniería Civil', 'El ingeniero civil obtiene conocimientos generales de matemáticas, física y química, computación, informática, administración y evaluación de proyectos que lo capacitan para participar en la planeación, organización, construcción, operación y conservación de obras civiles de infraestructura y desarrollo urbano que el país requiere en las áreas de construcción, estructuras, ingeniería sanitaria y ambiental, e ingeniería de sistemas, planeación y transporte.\r\n<br><br>\r\nEs el profesional que gracias a su formación multidisciplinaria entiende el comportamiento de estructuras y obras en construcción; prevé los impactos sociales, ecológicos y económicos que pueden ocasionar; y planea un uso más conveniente de recursos naturales y humanos de grandes áreas, por lo que su tarea es de gran importancia y responsabilidad para las poblaciones urbanas y rurales que conforman nuestro país.', 8000, 60000, 'civil,sociedad,ingenieria,matematicas'),
(51, 'Licenciatura en Lengua y Literatura Hispánicas', 'Esta carrera forma profesionistas que estudian la estructura y el desarrollo histórico de la lengua española, así como de las literaturas hispánicas (mexicana, española e iberoamericana) como manifestaciones más acabadas de la lengua.\r\n<br><br>\r\nAsimismo los capacita para analizar, interpretar y difundir ––mediante técnicas de investigación documental y bibliográfica; análisis teórico y lingüístico; crítica; creación literaria y docencia––, el valor cultural de la lengua y las literaturas hispánicas.\r\n<br><br>\r\nSu campo laboral es muy amplio, ya que incluye centros educativos y de investigación, bibliotecas, editoriales, agencias de publicidad, o medios de difusión como radio, televisión, revistas y periódicos.', 8000, 20000, 'humanidad,literatura,lengua,hispano'),
(53, 'Licenciatura en Matemáticas Aplicadas y Computación', 'El licenciado en Matemáticas Aplicadas y Computación aplica creativamente las diversas técnicas matemáticas y computacionales para analizar, evaluar y resolver, por medio de modelos, problemas en diversas áreas de conocimiento que afectan de manera directa o indirecta a la sociedad.<br><br>\r\n\r\nAnalista bursátil y financiero, catedrático, investigador, consultor en diversas áreas y proyectos, o diseñador de software son algunas de las actividades que puede desempeñar este profesionista.', 6000, 50000, 'matematicas,computacion,licenciatura,aplicada'),
(54, 'Licenciatura en Pedagogía', 'El pedagogo estudia integralmente la educación para describir, comprender, explicar, evaluar e intervenir en el fortalecimiento y mejora de los procesos educativos, analiza y propone alternativas de solución en problemas relacionados con el campo educativo, además de atender a diversos sectores de la población que requieren ayuda pedagógica.\r\n<br><br>\r\nDesarrolla actividades de docencia, orientación educativa, educación permanente y capacitación, administración y gestión educativas, desarrollo curricular, comunicación e investigación en este campo, en instituciones públicas y privadas o en el ejercicio libre de la profesión, atendiendo las distintas orientaciones de la práctica profesional.', 12000, 40000, 'educacion,pedagogia,orientacion,profesional'),
(55, ' Licenciatura en Comunicación y Periodismo', 'El licenciado en Comunicación y Periodismo formado en FES Aragón es el profesional que entiende que la comunicación es un proceso. En este sentido, lo conoce puntualmente en todas sus formas y niveles, por lo que es capaz de analizar y evaluar el fenómeno comunicacional.<br>\r\n\r\nAsimismo, está al tanto de las formas adecuadas que deben tener los mensajes, determina a través de qué medios conviene difundirlos para que cubran mejor las necesidades de información de la sociedad y explica los problemas de la comunicación, el desarrollo del individuo y de la sociedad.\r\n<br>\r\nCon el dominio de las relaciones existentes entre los procesos de la comunicación y otras disciplinas del área social, este profesionista resuelve de manera adecuada las necesidades que la realidad exige.\r\n<br>\r\nEl estudio de los procesos de la comunicación colectiva implica investigar y analizar la información y los mensajes emitidos por los medios de comunicación social para proceder a la valoración de sus repercusiones sobre la sociedad.', 5000, 20000, 'periodismo,comunicacion,social,television,licenciatura'),
(56, 'Prueba', 'asdasd', 123, 123, '.'),
(57, '1', '1', 1, 1, ''),
(60, 'asd', 'asdasd', 123123, 123, ''),
(63, '111111', '111111', 11111, 111111, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrera_uni`
--

CREATE TABLE `carrera_uni` (
  `UID` int(11) NOT NULL,
  `id_carrera` int(11) NOT NULL,
  `plan_estudio` mediumtext NOT NULL,
  `perfil_egreso` mediumtext NOT NULL,
  `id_universidad` int(11) NOT NULL,
  `referencias` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `carrera_uni`
--

INSERT INTO `carrera_uni` (`UID`, `id_carrera`, `plan_estudio`, `perfil_egreso`, `id_universidad`, `referencias`) VALUES
(2, 1, 'Toda la información relacionada al plan de estudios está <a href=\"http://oferta.unam.mx/carrera/archivos/planes/cdentista-fodontologia-planestudios15.pdf\">aquí</a>', 'Los egresados de la Facultad de Odontología poseen conocimientos científicos, habilidades técnicas y actitudes humanísticas para conservar y mantener la salud bucal de las personas, bajo una concepción vinculada con la realidad del país.<br>\r\nPredomina en su práctica la prevención, lo que permite atender los problemas de inequidad, costo e inaccesibilidad que prevalecen en más del 50% de la población mexicana.<br>\r\nEste perfil lo respalda la sólida formación científica, tecnológica y clínica que ofrece esta Facultad, lo que le permite al egresado emitir un diagnóstico integral e instituir un plan de tratamiento completo, atendiendo todas las fases que implica una práctica profesional responsable y humanística, bajo una concepción amplia del proceso de salud-enfermedad, y aplicando todas las áreas de la odontología.<br>\r\nEn términos generales, el egresado de la carrera será capaz de trabajar en distintos modelos de servicios de salud e identificar las características biopsicosociales del individuo.', 4, ''),
(3, 11, 'Para ver el plan de estudios de Licenciatura en Biología presione <a href=\"http://cienciasbiologicas.uaz.edu.mx/plandeestudiolic\">aquí</a>.', '<ol>\r\n<li> Estará calificado para incorporarse a estudios de postgrado, realizar aportes en el área de la investigación o integrarse a actividades productivas como un profesional en su campo.</li><br>\r\n\r\n<li>Tendrá los conocimientos básicos y aplicados de la Biología celular y molecular para participar en el desarrollo de metodologías de Ingeniería Genética, Biotecnología, Medicina molecular, Microbiología y Ecología sustentable entre otras, se involucrará generando corriente de opinión en la planeación y diseño de estudios integrales sobre los seres vivos y los recursos bióticos.</li><br>\r\n\r\n<li> Formulará, coordinará y evaluará proyectos sobre problemática relativas a los recursos naturales.</li><br>\r\n\r\n<li> Analizará la estructura y funcionamiento de los seres vivos, así como sus interacciones con el medio ambiente (capacidad de observar, describir, analizar y explicar los fenómenos biológicos).</li><br>\r\n\r\n<li> Planeará, realizará y coordinará proyectos de investigación básica y aplicada que propongan soluciones a problemas científicos y generen conocimientos biológicos. Participará en investigación de vanguardia en áreas como genética, biotecnología y biomedicina, entre otras.</li><br>\r\n\r\n<li> Llevará a cabo análisis de ecosistemas con el objeto de elaborar y/o completar los catálogos de los recursos naturales y lograr su conservación y sustentabilidad, tanto en áreas silvestres como protegidas. Planeará estrategias que conlleven a la recuperación y rehabilitación de ecosistemas deteriorados. Manejará, utilizará y aplicará técnicas adecuadas para prevenir o disminuir la acción de los agentes contaminantes.</li><br>\r\n\r\n<li> Realizará con destreza programas de control de plagas que afectan la producción agropecuaria y forestal. Trabajará en equipos multidisciplinarios en la docencia, investigación y difusión científica. Logrará un manejo eficiente de instrumentos y equipo científico, así como la habilidad de preparar soluciones, reactivos y medios de cultivo.</li><br>\r\n\r\n<li> Empleará la informática y la tecnología de cómputo en su trabajo cotidiano. Manejará adecuadamente el idioma español en sus comunicaciones verbales y escritas y el inglés será su segundo lengua. Se vinculará a la problemática social orientada al conocimiento y solución de problemas nacionales relacionados con la Biología como son alimentación, salud y medioambiente; es decir, conciencia de su papel como profesionista comprometido.\r\n<br>\r\nLogrará una formación continua y permanente en el campo de la Biología. Ejercerá su profesión con ética, responsabilidad y honestidad, impulsando siempre los valores universales de la sociedad. Buscará la verdad a través de la investigación y la difusión de la cultura en equipos multidisciplinarios de la investigación, docencia y la divulgación científica.</li><br>\r\n\r\n<li> Estará capacitado para llevar a cabo inventarios de biota, evaluaciones de impacto ambiental y planes de manejo de áreas naturales y de recursos renovables. Estará capacitado para la creación de su propia empresa, fincada en el aprovechamiento sensato de los recursos biológicos ambientales.</li><br>\r\n\r\n<li> Podrá diseñar y adaptar sistemas biotecnológicos que utilicen a los organismos como productores de bienes y servicios. Dispondrá de las herramientas conceptuales, normativas, legislativas y metodológicas para generar corrientes de opinión sobre la temática biotecnológica, medicina molecular, ambiental, ecológica, así como asesorar a instituciones gubernamentales y privadas sobre decisiones en esta materia.</li>\r\n</ol>', 9, '<ul>\r\n<li>http://cienciasbiologicas.uaz.edu.mx/licenciatura-en-biologia</li>\r\n<li>http://cienciasbiologicas.uaz.edu.mx/index</li>\r\n<li>http://cienciasbiologicas.uaz.edu.mx/biologia1</li>\r\n<li>http://ljz.mx/2017/08/22/detienen-labores-docentes-de-ciencias-biologicas-de-la-uaz-por-falta-de-asignacion-de-carga-de-trabajo/</li>\r\n</ul>'),
(5, 15, 'Para ver información sobre el plan de estudios presione <a href=\"http://www.zacatecas.ipn.mx/OfertaEducativa/Paginas/MapaCurricularSistemas.aspx\">aquí</a>.', '<ul>\r\n <li> Conocer las metodologías de desarrollo de software para seleccionar la adecuada en el análisis, diseño, desarrollo e implementación de un sistema computacional.</li> \r\n <li> Conocer las normas y estándares de calidad, nacionales e internacionales para el desarrollo de sistemas computacionales.</li> \r\n <li> Conocer los fundamentos de análisis de algoritmos para seleccionar la opción más adecuada en la solución de problemas algorítmicos.</li> \r\n <li> Conocer los modelos de datos para representar la información de una organización.</li> \r\n <li> Conocer los lenguajes de los Sistemas Gestores de Bases de Datos (SGBD) para la definición, manipulación y control de bases de datos.</li> \r\n <li> Conocer las características de las diversas herramientas para la administración de bases de datos.</li> \r\n <li> Describir los distintos tipos de redes, protocolos y esquemas de seguridad para garantizar el intercambio de información de manera confiable.</li> \r\n <li> Conocer las características de los paradigmas de programación para el desarrollo de un sistema computacional.</li>\r\n <li> Conocer las tecnologías de Internet para el desarrollo de aplicaciones Web.</li> <li> Conocer las metodologías para el desarrollo de software embebido.</li> \r\n <li> Identificar los distintos dispositivos lógicos programables para ofrecer soluciones de circuitos lógicos para una aplicación especifica.</li>\r\n</ul>', 7, '<ul>\r\n  <li><a href=\"http://www.icel.edu.mx/oferta-academica/desarrollo-ejecutivo/item/623-ingenieria-en-sistemas-computacionales-desarrollo-ejecutivo\">http://www.icel.edu.mx/oferta-academica/desarrollo-ejecutivo/item/623-ingenieria-en-sistemas-computacionales-desarrollo-ejecutivo</a></li>\r\n  <li><a href=\"http://www.zacatecas.ipn.mx/OfertaEducativa/Paginas/EgresoSistemas.aspx\">http://www.zacatecas.ipn.mx/OfertaEducativa/Paginas/EgresoSistemas.aspx</a></li>\r\n</ul>'),
(6, 16, 'Para ver información sobre el plan de estudios presiona <a href=\"http://www.zacatecas.ipn.mx/OfertaEducativa/Paginas/MapaCurricularAmbiental.aspx\">aquí</a>.', 'Conocimientos Los fundamentos fisicoquímicos y biológicos relacionados con la estructura y función de los organismos. La biodiversidad desde el punto de vista molecular, celular, individual, poblacional y comunitario Las relaciones de los organismos con el medio en el que viven y manejo y conservación de los recursos naturales. Caracterización fisicoquímica y biológica del suelo, el agua y del aire Tipos de contaminantes, modelos de dispersión de contaminantes y Prevención de la contaminación en aire, agua y suelo. Tipos y diseño de equipos y procesos para la prevención y control de la contaminación en aire, agua y suelo, con bases de Ingeniería Normatividad y legislación relacionada con el Medioambiente. Diseñar y utilizar procesos y tecnologías para prevenir, diagnosticar y controlar, la contaminación del medioambiente generado por las actividades humanas. Administrar los recursos naturales del territorio nacional en forma eficiente que conduzca al desarrollo sustentable y sostenible de los mismos. Detectar, monitorear y remediar sitios contaminados en agua y suelos.', 7, '<ul>\r\n  <li><a href=\"https://es.wikipedia.org/wiki/Ingenier%C3%ADa_ambiental\">https://es.wikipedia.org/wiki/Ingenier%C3%ADa_ambiental</a></li>\r\n  <li><a href=\"http://www.zacatecas.ipn.mx/OfertaEducativa/Paginas/ObjetivoAmbiental.aspx\">http://www.zacatecas.ipn.mx/OfertaEducativa/Paginas/ObjetivoAmbiental.aspx</a></li>\r\n<li><a href=\"http://dingox.com/sueldos-y-salarios/cuanto-gana-un-ingeniero-ambiental-en-mexico.html\">http://dingox.com/sueldos-y-salarios/cuanto-gana-un-ingeniero-ambiental-en-mexico.html</a></li>\r\n<ul>\r\n              '),
(7, 17, 'Para ver información sobre el plan de estudios de Ingeniería en Alimentos presione <a href=\"http://www.zacatecas.ipn.mx/OfertaEducativa/Paginas/MapaCurricularAlimentos.aspx\">aquí</a>.', 'El egresado de la carrera de Ingeniería en Alimentos participa en todas las fases del desarrollo de plantas procesadoras de alimentos lo que implica: \"Participar en el diseño, localización, evaluación, distribución, instalación y puesta en marcha de plantas procesadoras de alimentos. \"Aplicar técnicas para adaptación y evaluación de procesos, equipo y maquinaria con relación a la calidad requerida de alimentos procesados. \"Aplicar técnicas, sistemas y procedimientos que optimicen la eficiencia que incrementen la productividad en la industrialización de alimentos integrando y articulando la cadena productiva. \"Supervisar y controlar procesos, maquinaria, equipo y las condiciones generales de operación en las plantas y unidades procesadoras de alimentos. \"Diseñar sistemas y procesos que inciden en la mejora en las condiciones de almacenamiento, distribución y manejo de alimentos a fin de disminuir las pérdidas en el campo y las zonas productoras de perecederos. \"Utilizar las técnicas de simulación en el desarrollo y optimización de procesos y productos alimenticios.', 7, '<ul>\r\n  <li><a href=\"https://es.wikipedia.org/wiki/Ingenier%C3%ADa_alimentaria\">https://es.wikipedia.org/wiki/Ingenier%C3%ADa_alimentaria</a></li>\r\n  <li><a href=\"https://www.indeed.com.mx/salaries/Ingeniero/a-de-alimentos-Salaries\">https://www.indeed.com.mx/salaries/Ingeniero/a-de-alimentos-Salaries</a></li>\r\n<li><a href=\"http://www.zacatecas.ipn.mx/OfertaEducativa/Paginas/EgresoAlimentos.aspx\">http://www.zacatecas.ipn.mx/OfertaEducativa/Paginas/EgresoAlimentos.aspx</a></li>\r\n<ul>\r\n              '),
(8, 18, 'Para ver información relacionada al plan de estudios de esta carrera haz click <a href=\"http://www.zacatecas.ipn.mx/OfertaEducativa/Paginas/MapaCurricularMecatronica.aspx\">aquí</a>.', 'Es un profesional interdisciplinario capaz de diseñar, manufacturar y construir dispositivos y sistemas mecatrónicos, así como automatizar procesos industriales, con dominio de una segunda lengua y la habilidad de integrarse en equipos de trabajo, para desarrollar y emplear nueva tecnología, que esté aplicada de manera ética y responsable en la solución de las necesidades del entorno social y en armonía con el medio ambiente.', 7, '<ul>\r\n  <li><a href=\"https://es.wikipedia.org/wiki/Ingenier%C3%ADa_mecatr%C3%B3nica\">https://es.wikipedia.org/wiki/Ingenier%C3%ADa_mecatr%C3%B3nica</a></li>\r\n  <li><a href=\"https://www.indeed.com.mx/salaries/Ingeniero/a-en-mecatronica-Salaries\">https://www.indeed.com.mx/salaries/Ingeniero/a-en-mecatronica-Salaries</a></li>\r\n<li><a href=\"https://neuvoo.com.mx/salario/salario-Ing-Mecatr%C3%B3nica\">https://neuvoo.com.mx/salario/salario-Ing-Mecatr%C3%B3nica</a></li>\r\n</ul>'),
(10, 20, 'Para ver información sobre el plan de estudios de esta carrera haz click <a href=\"http://www.zacatecas.ipn.mx/OfertaEducativa/Paginas/MapaCurricularMetal%C3%BArgica.aspx\">aquí</a>', 'El perfil de egreso del Programa Académico de Ingeniería Metalúrgica se caracteriza por desarrollar competencias profesionales enfocadas al proceso productivo de la Metalurgia Extractiva en la obtención de metales y aleaciones, diseño y operación de plantas de procesamiento de minerales o metales de reciclado y en el proceso productivo de la Metalurgia Adaptativa en la obtención de productos metálicos terminados a través de los procesos de conformado, maquinado, tratamiento térmico, recubrimiento y soldadura; en ambos procesos productivos para generar bienes y servicios sustentables, preservando la diversidad de los ecosistemas industriales y naturales, bajo estándares y normas nacionales e internacionales.', 7, '<ul>\r\n  <li><a href=\"http://cbi.azc.uam.mx/es/CBI/Ingenieria_Metalurgica\">http://cbi.azc.uam.mx/es/CBI/Ingenieria_Metalurgica</a></li>\r\n  <li><a href=\"https://neuvoo.com.mx/salario/salario-Ingeniero-Metal%C3%BArgico\">https://neuvoo.com.mx/salario/salario-Ingeniero-Metal%C3%BArgico</a></li>\r\n</ul>'),
(11, 21, 'Para ver información relacionada al plan de estudios ve al siguiente <a href=\"http://oferta.unam.mx/carrera/archivos/planes/arquitectura-farquitectura-planestudios17.pdf\">enlace</a>.', 'Al término de la carrera, este profesional podrá:\r\n<br>\r\n* Llevar a cabo su trabajo con alto sentido ético y humanístico ante las soluciones de uso, expresión y realización dentro del medio físico y cultural en el que actuará, y desarrollar de manera íntegra los pasos del proyecto arquitectónico, desde el acercamiento al problema, hasta la solución de detalles.<br>\r\n* Contar con conocimientos científicos, teóricos y humanísticos que le permitan comprender, explicar, analizar y sintetizar los fenómenos arquitectónicos, con las características específicas de los distintos grupos humanos, para concretarlas en sitios habitables que respondan a las demandas sociales y culturales.<br>\r\n* Desarrollar las soluciones arquitectónicas que consideren los requisitos técnicos, constructivos, estructurales y de impacto ambiental que intervienen en el proyecto.', 11, '<ul>\r\n  <li><a href=\"http://oferta.unam.mx/escuela-facultad/11/facultad-de-arquitectura\">http://oferta.unam.mx/escuela-facultad/11/facultad-de-arquitectura</a></li>\r\n  <li><a href=\"https://es.wikipedia.org/wiki/Arquitectura\">https://es.wikipedia.org/wiki/Arquitectura</a></li>\r\n  <li><a href=\"https://www.cuanto-gana.com/cuanto-gana-un-arquitecto/\">https://www.cuanto-gana.com/cuanto-gana-un-arquitecto/</a></li>\r\n</ul>'),
(12, 22, 'Para ver información relacionada al plan de estudios ve al siguiente <a href=\"http://oferta.unam.mx/carrera/archivos/planes/arquitecturapaisaje-farquitectura-planestudios17.pdf\">enlace</a>.', 'Al finalizar la carrera, el egresado podrá:<br>\r\n* Utilizar un método de trabajo que le permita conocer las características del medio a través del análisis, diagnóstico e identificación del potencial del espacio y los elementos que lo conforman.<br>\r\n* Realizar proyectos ejecutivos con planos constructivos claros y precisos que permitan interpretar adecuadamente las especificaciones del proyecto en la construcción.<br>\r\n* Elaborar un programa arquitectónico paisajístico y trabajar a partir de un concepto de diseño.<br>\r\n* Definir correctamente especificaciones, cuantificaciones de materiales, cálculo de presupuestos, así como establecer contratos.<br>\r\n* Coordinar grupos multidisciplinarios de trabajo en las fases de proyecto y construcción.<br>\r\n<br>\r\nAdemás, será capaz de:<br>\r\n* Exponer oral, gráficamente y por escrito los proyectos que genere.<br>\r\n* Conocer sobre derecho, legislación e impacto ambiental, métodos de gestión del espacio abierto y formas de generar sustentabilidad en todas las escalas.<br>', 11, '<ul>\r\n  <li><a href=\"http://oferta.unam.mx/carreras/2/arquitectura-de-paisaje\">http://oferta.unam.mx/carreras/2/arquitectura-de-paisaje</a></li>\r\n  <li><a href=\"https://www.indeed.com.mx/salaries/Paisajista-Salaries\">https://www.indeed.com.mx/salaries/Paisajista-Salaries</a></li>\r\n</ul>'),
(13, 23, 'Para ver información relacionada al plan de estudios ve al siguiente <a href=\"http://oferta.unam.mx/carrera/archivos/planes/disenoindustrialplanestudiosfacarq13.pdf\">enlace</a>.', 'El diseñador industrial reunirá hábitos, habilidades, actitudes y conocimientos que le permitirán realizar su actividad de manera eficiente y con un alto nivel de calidad.\r\n<br>\r\nAsí, poseerá aptitudes creativas para concebir y desarrollar productos atractivos que satisfagan las demandas de los diferentes mercados.\r\n<br>\r\nMostrará una actitud comprometida para planear y administrar los recursos, para lograr un alto nivel de productividad, calidad y competitividad en los productos diseñados.', 11, '<ul>\r\n  <li><a href=\"https://www.facebook.com/\">Ejemplo de referencias</a></li>\r\n  <li><a href=\"https://www.google.com.mx/\">https://www.google.com/</a></li>\r\n</ul>'),
(14, 24, 'Para ver información relacionada al plan de estudios ve al siguiente <a href=\"http://oferta.unam.mx/carrera/archivos/planes/urbanismoplanestudiosfacarq13.pdf\">enlace</a>.', 'Al concluir la carrera, el egresado contará con una serie de conocimientos, competencias y actitudes que le permitirán desempeñarse exitosamente como profesional:<br>\r\n\r\nConocimientos:<br>\r\n* Entender la naturaleza compleja y multidimensional de los problemas urbanos en las diferentes escalas en las que se presentan.<br>\r\n* Dominio conceptual en sus planteamientos de solución sobre aspectos demográficos, físico-ambientales, jurídico-administrativos, tecnológicos, financieros y de diseño.<br>\r\n\r\nCompetencias:<br>\r\n* Planteamiento de soluciones a problemas específicos del Desarrollo Urbano, sin perder la conciencia de los aspectos globales, ambientales y otros de carácter local.<br>\r\n* Selección de las mejores soluciones tecnológicas atendiendo a las condiciones culturales específicas, y la optimización de los recursos disponibles.\r\n\r\nActitudes:\r\n* Capacidad para coordinar y/o colaborar en equipos multidisciplinarios y redes profesionales y de investigación.\r\n* Convicción y disciplina por mantenerse permanentemente actualizado.', 11, '<ul>\r\n  <li><a href=\"http://oferta.unam.mx/carreras/7/urbanismo\">http://oferta.unam.mx/carreras/7/urbanismo</a></li>\r\n  <li><a href=\"https://misalario.org/main/tu-salario/comparatusalario?job-id=2164010000000#/\">https://misalario.org/main/tu-salario/comparatusalario?job-id=2164010000000#/</a></li>\r\n</ul>'),
(15, 25, 'Para ver información relacionada al plan de estudios entra al siguiente <a href=\"http://oferta.unam.mx/carrera/archivos/planes/arteydiseo-fad-plandeestudios.pdf\">enlace</a>.', 'Al finalizar la carrera, el egresado demostrará:<br><br>\r\n\r\nConocimientos de:<br>\r\n\r\n*Teoría y filosofía del arte y el diseño.<br>\r\n*Administración y estrategias de producción en el ejercicio profesional.<br>\r\n*Dinámica social con un enfoque antropológico, sociológico y cultural para aplicarla en proyectos de intervención visual del entorno.<br>\r\n<br>\r\nHabilidades para:\r\n<br>\r\n*Planear e integrar proyectos que impliquen experimentación e investigación-producción en el campo del arte y diseño.<br>\r\n*Proponer soluciones integrales a problemas de comunicación y de expresión visual que atiendan las necesidades de la región.<br>\r\n*Visualizar estrategias de investigación-producción visual que coadyuven al desarrollo humano de la sociedad.<br>\r\n<br>\r\nActitudes:<br>\r\n\r\n*Disposición para la experimentación con técnicas, materiales y procesos relacionados con la producción artística y de comunicación visual.', 12, '<ul>\r\n  <li><a href=\"http://oferta.unam.mx/escuela-facultad/7/facultad-de-artes-y-diseno\">http://oferta.unam.mx/escuela-facultad/7/facultad-de-artes-y-diseno</a></li>\r\n  <li><a href=\"http://oferta.unam.mx/carreras/93/arte-y-diseno\">http://oferta.unam.mx/carreras/93/arte-y-diseno</a></li>\r\n</ul>'),
(16, 26, 'Para ver información relacionada al plan de estudios ve al siguiente <a href=\"http://oferta.unam.mx/carrera/archivos/planes/artvis-plan-de-estudios14.pdf\">enlace</a>.', 'Al término de los estudios, el alumno habrá adquirido la formación que le permitirá:<br>\r\n\r\n* Comprender y asociar las bases teóricas y los procesos metodológicos para la creación-producción artística.<br>\r\n* Dominar los conocimientos para el ejercicio de los procesos de indagación y de exploración-producción en proyectos individuales o colectivos.<br>\r\n* Estructurar y proponer, crítica y creativamente, proyectos de investigación-producción, individuales o colectivos.<br>\r\n* Coordinar y fundamentar proyectos y desarrollos artísticos.<br>\r\n* Trabajar de forma colaborativa valorando, no sólo su propia aportación sino la de sus compañeros.<br>\r\n* Reflexionar y analizar sobre el entorno social y cultural para proponer soluciones a problemas de expresión visual.<br>\r\n* Adoptar una actitud ética y responsable como operador del fenómeno del arte y la cultura dentro de la dinámica y el cambio social.<br>\r\n* Investigación.<br>\r\n* Asumir su compromiso con la vida académica y el desarrollo del arte como factores de proyección y trascendencia en el campo profesional.', 12, '<ul>\r\n  <li><a href=\"http://www.elfinanciero.com.mx/economia/trabajos-de-mucho-glamour-y-poco-sueldo.html\">http://www.elfinanciero.com.mx/economia/trabajos-de-mucho-glamour-y-poco-sueldo.html</a></li>\r\n  <li><a href=\"https://misalario.org/main/tu-salario/comparatusalario?job-id=2651010000000#/\">https://misalario.org/main/tu-salario/comparatusalario?job-id=2651010000000#/</a></li>\r\n<li><a href=\"http://oferta.unam.mx/carreras/41/artes-visuales\">http://oferta.unam.mx/carreras/41/artes-visuales</a></li>\r\n</ul>'),
(17, 27, 'Para ver el plan de estudios ve al siguienge <a href=\"http://oferta.unam.mx/carrera/archivos/planes/disycomunvis-plan-de-estudios14.pdf\">enlace</a>.', 'Al finalizar la licenciatura, el alumno habrá adquirido conocimientos para:<br><br>\r\n\r\n* Organizar y relacionar los conocimientos teórico-conceptuales del diseño y la comunicación visual, para crear, proponer y producir en diversos soportes soluciones funcionales en este campo.<br>\r\n* Distinguir las posibilidades de desarrollo y aplicación de herramientas, ya sean tradicionales, digitales o de nueva creación.<br>\r\n\r\nHabilidades para:\r\n<br>\r\n* Gestionar su producción personal de diseño para proyectarla al medio profesional.<br>\r\n* Manejar con precisión las herramientas y recursos análogos, digitales y de nueva creación, para aplicarlos en la elaboración de su obra.<br>\r\n\r\nActitudes:\r\n<br>\r\n* Mostrar una actitud propositiva, creadora y transformadora que suscite el cambio y la innovación en el campo del diseño y la comunicación visual y la cultura.<br>\r\n* Proponer soluciones de diseño para el desarrollo humano, y de comunicación visual para los ámbitos sociales, culturales, políticos y educativos, manifestando siempre un compromiso humanístico.<br>', 12, '<ul>\r\n  <li><a href=\"http://oferta.unam.mx/carreras/45/diseno-y-comunicacion-visual\">http://oferta.unam.mx/carreras/45/diseno-y-comunicacion-visual</a></li>\r\n</ul>'),
(18, 28, 'Para ver el plan de estudios ve al siguiente <a href=\"http://oferta.unam.mx/carrera/archivos/planes/actuaria-fciencias-planestudios17.pdf\">enlace</a>.', 'Al terminar la carrera, el egresado tendrá una sólida formación matemática, así como conocimientos acerca de seguros, finanzas, disciplinas sociales, investigación de operaciones, probabilidad y estadística, considerados básicos para el ejercicio actuarial.<br>\r\n\r\nSerá capaz de:<br>\r\n* Emplear la informática y la tecnología computarizada en el trabajo cotidiano.<br>\r\n* Tomar decisiones en torno a problemas actuariales.<br>\r\n* Obtener, analizar, procesar y valorar información.<br>\r\n\r\nEl actuario sabrá:<br>\r\n* Plantearse preguntas sobre problemas reales y contrastarlas mediante la aplicación sistemática de los conocimientos adquiridos.<br>\r\n* Trabajar eficientemente, aun bajo presión.<br>\r\n* Desarrollar soluciones creativas.<br>\r\n\r\nContará con:<br>\r\n* Conciencia de su papel como profesionista comprometido con la sociedad mexicana.<br>\r\n* Verdadero interés por los problemas y soluciones que enfrentan la sociedad, las empresas y el país.<br>\r\n* Convicción de la naturaleza polifacética de la Actuaría mexicana, y de las oportunidades y amenazas de la profesión.', 13, '<ul>\r\n  <li><a href=\"https://misalario.org/main/tu-salario/comparatusalario?job-id=2120200000000\">https://misalario.org/main/tu-salario/comparatusalario?job-id=2120200000000</a></li>\r\n  <li><a href=\"http://oferta.unam.mx/carreras/82/actuaria\">http://oferta.unam.mx/carreras/82/actuaria</a></li>\r\n</ul>'),
(19, 11, 'Para ver información relacionada al plan de estudios entra al siguiente <a href=\"http://oferta.unam.mx/carrera/archivos/planes/biologia-fciencias-planestudios14.pdf\">enlace</a>.', 'El egresado de la carrera de Biología tendrá una sólida formación científica, que le permitirá incorporarse a la investigación en cualquier nivel de la organización biológica y ecológica, considerando los aspectos socioeconómicos y humanísticos. Además, tendrá una actitud ética y científica en la valoración de su profesión y de la naturaleza.<br>\r\n\r\nPoseerá también un amplio espectro de conocimientos básicos de los seres vivos, desde el nivel molecular hasta el de la biosfera. Asimismo será capaz de realizar abstracciones, análisis y aplicación de los conceptos teóricos y experimentales de esta licenciatura<br>\r\n\r\nUtilizará nuevas tecnologías y metodologías en los ámbitos molecular, celular, histológico, morfofisiológico, sistemático, ecológico y evolutivo y tendrá una conciencia de la megadiversidad biológica de nuestro país, con capacidad para potenciar su aprovechamiento y preservarla.<br>\r\n\r\nAsimismo será capaz de realizar abstracciones, análisis y aplicación de los conceptos teóricos y experimentales de esta licenciatura.', 13, '<ul>\r\n  <li><a href=\"http://oferta.unam.mx/carreras/34/biologia\">http://oferta.unam.mx/carreras/34/biologia</a></li>\r\n</ul>'),
(20, 29, 'Para ver información del plan de estudios ve al siguiente <a href=\"http://oferta.unam.mx/carrera/archivos/planes/cienciascomputacion-fciencias-planestudios17.pdf\">enlace</a>.', 'Al terminar la carrera, el egresado contará con las siguientes aptitudes y habilidades:<br>\r\n* Rigor para abordar los problemas y proponer soluciones efectivas.<br>\r\n* Capacidad de análisis y síntesis, observación y deducción.<br>\r\n* Inventiva y creatividad.<br><br>\r\nTendrá actitudes tales como:<br>\r\n* Respeto por la propiedad intelectual, entre la que figuran los sistemas y aplicaciones hechos por terceros.<br>\r\n* Conciencia de las implicaciones éticas, sociales y profesionales de su actividad profesional.<br>\r\n* Respeto irrestricto a la confidencialidad y seguridad de sistemas de información.<br><br>\r\nTambién deberá contar con los siguientes conocimientos:<br>\r\n* Teóricos que le permitan analizar, diseñar e implementar aplicaciones, ya sea a través de redes de computadoras o al interior de las organizaciones.<br>\r\n* Matemáticos, necesarios para colaborar en el modelado y automatización de aplicaciones en otras ramas científicas.<br>\r\n* Relativos a la organización de la información (bases de datos) y explotación de la misma.<br>', 13, '<ul>\r\n  <li><a href=\"http://oferta.unam.mx/carreras/69/ciencias-de-la-computacion\">http://oferta.unam.mx/carreras/69/ciencias-de-la-computacion</a></li>\r\n</ul>'),
(21, 30, 'Para ver el plan de estudios entra al siguiente <a href=\"http://oferta.unam.mx/carrera/archivos/planes/cienciastierra-fciencias-planestudios17.pdf\">enlace</a>.', 'Al terminar la carrera, el egresado tendrá una formación científica e interdisciplinaria que le permitirá comprender los orígenes de los fenómenos terrestres y analizar la relación existente entre los procesos físicos, biológicos, geológicos y químicos que se desarrollan en la Tierra.<br>\r\n\r\nHará uso de herramientas matemáticas, modelos computacionales e instrumentación tecnológica para manejar y procesar datos e imágenes del área, y para solucionar problemas complejos derivados de la interrelación entre el sistema tierra, agua, atmósfera y la sociedad.<br>\r\n\r\nMantendrá un enfoque integral del equilibrio en los sistemas terrestres y será capaz de aportar información fundamental para la protección de personas y bienes en casos de riesgos geológicos, meteorológicos o ambientales.<br>\r\n\r\nContribuirá con su visión al desempeño de otros profesionales dedicados al estudio de la Tierra (ingenieros geólogos, geofísicos, mineros, químicos, hidrólogos y geógrafos), con los que podrá interactuar y trabajar en equipo.', 13, '<ul>\r\n  <li><a href=\"http://oferta.unam.mx/carreras/70/ciencias-de-la-tierra\">http://oferta.unam.mx/carreras/70/ciencias-de-la-tierra</a></li>\r\n</ul>'),
(22, 31, 'Para ver el plan de estudios ve al siguiente <a href=\"http://oferta.unam.mx/carrera/archivos/planes/fisica-fciencias-planestudios17.pdf\">enlace</a>.', 'Con los conocimientos básicos y derivados, un físico será capaz de:<br>\r\n\r\n* Modelar teóricamente el comportamiento de múltiples sistemas físicos y no físicos.<br>\r\n\r\n* Como teórico o experimental, verificar la certeza de sus predicciones.<br>\r\n\r\n* Reestructurar la teoría que describe al sistema físico modelado, a través de la retroalimentación que enriquece la imagen del sistema.<br>\r\n<br>\r\nLa formación que adquiere durante los estudios, le permitirá contribuir positivamente a la creación de un ambiente orientado hacia el análisis y la solución científica de los problemas de la Física y de la sociedad.<br>\r\n\r\nPodrá, además, desarrollar una capacidad analítica y creativa única, que le dará la posibilidad de desempeñar labores muy diversas, no sólo relacionadas con su profesión, sino con diferentes áreas del conocimiento, entre las que destacan Ingeniería, Computación y Economía.\r\n<br>\r\nAsimismo obtendrá la habilidad de transferir el conocimiento, gracias a la cual participará en la actividad docente en diversos niveles educativos.', 13, '<ul>\r\n  <li><a href=\"http://oferta.unam.mx/carreras/68/fisica\">http://oferta.unam.mx/carreras/68/fisica</a></li>\r\n</ul>'),
(23, 32, 'Para ver el plan de estudios ve al siguiente <a href=\"http://oferta.unam.mx/carrera/archivos/planes/fsicabiomdica-cu-planestudios.pdf\">enlace</a>.', 'El físico biomédico tendrá una formación interdisciplinaria, que le permitirá trabajar en equipo con otros profesionales dedicados al estudio de las ciencias biológicas y médicas, y poseerá:<br><br>\r\n\r\nConocimientos de:<br>\r\n* El uso de técnicas y herramientas experimentales necesarias para su desarrollo profesional.<br>\r\n* Los principios físicos de la instrumentación biomédica.<br>\r\n* Los diferentes procesos de la interacción de la radiación con la materia.<br><br>\r\n\r\nHabilidades para:<br>\r\n* Observar, analizar, sintetizar y reflexionar críticamente.<br>\r\n* Plantear y resolver problemas teóricos y experimentales con base en sus conocimientos en el campo de la física y las matemáticas.<br>\r\n* Participar en actividades de investigación, divulgación y docencia.<br><br>\r\n\r\nActitudes:<br>\r\n* Interés por las aplicaciones físico-matemáticas en la medicina y la biología.<br>\r\n* Disposición para trabajar en grupos multidisciplinarios para buscar soluciones a problemas relacionados con aplicaciones de la física en la biomedicina.<br>\r\n* Actuar de manera veraz, ética y comprometida.<br>', 13, '<ul>\r\n  <li><a href=\"http://oferta.unam.mx/escuela-facultad/12/facultad-de-ciencias\">http://oferta.unam.mx/escuela-facultad/12/facultad-de-ciencias</a></li>\r\n</ul>'),
(24, 33, 'Para ver el plan de estudios ve al siguiente <a href=\"http://oferta.unam.mx/carrera/archivos/planes/matematicasplanestudiosfacciencias13.pdf\">enlace</a>.', 'El egresado de esta licenciatura será capaz de expresar en términos matemáticos problemas provenientes de otras profesiones, a fin de aplicar la herramienta matemática aprendida a lo largo de la carrera en la resolución del problema original.<br>\r\n\r\nEl análisis y síntesis proporcionados por la carrera le permitirán, al igual que a cualquier científico, organizar claramente sus ideas para exponerlas oralmente y por escrito.<br>\r\n\r\nSu principal habilidad será modelar problemas, para lo cual debe manejar las numerosas técnicas que adquirirá a lo largo de la carrera a fin de traducir los problemas a un lenguaje matemático y resolverlos en este contexto.<br>\r\n\r\nDesarrollará su capacidad para conjugar técnicas diversas, resolver un problema, realizar investigación, y cuestionar más allá de lo originalmente planteado.\r\n<br>\r\nTendrá una actitud crítica y perfeccionista que lo obligará a llevar sus razonamientos y su trabajo hasta las últimas consecuencias y lo hará apto para liderar grupos de trabajo.', 13, '<ul>\r\n  <li><a href=\"http://oferta.unam.mx/carreras/60/matematicas\">http://oferta.unam.mx/carreras/60/matematicas</a></li>\r\n</ul>'),
(25, 34, 'Para ver el plan de estudios ve al siguiente <a href=\"http://oferta.unam.mx/carrera/archivos/planes/matematicasaplicadasplanestudiosfciencias.pdf\">enlace</a>.', 'Al finalizar la licenciatura, el alumno habrá adquirido:<br>\r\n\r\n* Una formación matemática sólida, con una preparación general en las áreas de Análisis Numérico y Computación Científica, Ecuaciones Diferenciales, Estadística, Investigación de Operaciones y Probabilidad, entre otras; y conocimientos más especializados en una de las áreas de concentración ofrecidas por la carrera.<br>\r\n* Experiencia y habilidad, no sólo para formular, analizar y resolver, en términos matemáticos, problemas reales mediante el uso de diversas herramientas computacionales y procedimientos novedosos, sino para interpretar los resultados en el contexto del problema .<br>\r\n* Habilidades de comunicación oral y escrita y para trabajar en equipo.<br>\r\n* El conocimiento de modelos matemáticos en distintas áreas y explorado el lenguaje de alguna otra disciplina de ciencia y tecnología.<br>\r\n* Un manejo del inglés que le permita acceder a la literatura de su especialidad .', 13, '<ul>\r\n  <li><a href=\"http://oferta.unam.mx/carreras/108/matematicas-aplicadas\">http://oferta.unam.mx/carreras/108/matematicas-aplicadas</a></li>\r\n</ul>'),
(26, 35, 'Para ver el plan de estudios entre al siguiente <a href=\"http://oferta.unam.mx/carrera/archivos/planes/antropologia-fcpys-plandestudios17.pdf\">enlace</a>.', 'El perfil de egreso general comprende, a grandes rasgos, los siguientes conocimientos, habilidades y actitudes:<br><br>\r\n\r\nConocimientos<br>\r\n\r\n* Sólidos de las principales escuelas y tradiciones que fundamentan teórica y conceptualmente a la disciplina.<br>\r\n* Metodológicos y de fuentes de información directa y de primera mano, así como secundarias, para investigar, comprender y actuar en la compleja realidad social y cultural de las sociedades humanas, tanto del presente como del pasado.<br><br>\r\n\r\nHabilidades<br>\r\n\r\n* Realizar investigación empírica y trabajo de campo.<br>\r\n* Expresarse correctamente, por escrito y verbalmente.<br>\r\n* Realizar trabajo en grupos multidisciplinarios.<br><br>\r\n\r\nActitudes<br>\r\n\r\n* Actuar con compromiso y responsabilidad social.<br>\r\n* Tener un pensamiento crítico fundamentado en el conocimiento.<br><br>\r\n\r\nDe acuerdo con alguna de las Áreas de Profundización que elija el egresado -Arqueología, Antropología Física, Antropología Social, Lingüística Antropológica-, contará con conocimientos, habilidades y actitudes específicos.', 14, '<ul>\r\n  <li><a href=\"http://oferta.unam.mx/carreras/106/antropologia\">http://oferta.unam.mx/carreras/106/antropologia</a></li>\r\n</ul>'),
(27, 36, 'Para ver el plan de estudios entra en el siguiente <a href=\"http://oferta.unam.mx/carrera/archivos/planes/cienciasdlacomunica-fcpys-plandestudios17.pdf\">enlace</a>.', 'El egresado de la licenciatura en Ciencias de la Comunicación será capaz de analizar críticamente la información, lo que le permitirá proponer alternativas y soluciones a los problemas que se le presenten en su quehacer profesional; contará con conocimientos sólidos de su disciplina y de las Ciencias Sociales en general.\r\n<br>\r\nSerá capaz de expresarse de manera escrita, de producir diversos mensajes: audio, visual y audiovisuales, así como diseñar contenidos con distintos objetivos; deberá informar, exponer, argumentar y persuadir. Será un mediador entre un emisor, sus objetivos e intereses, y un público definido por sus intereses, necesidades, gustos. Conocerá las características de los canales de comunicación y será capaz de diseñar estrategias de comunicación que generen los resultados deseados.\r\n<br>\r\nEl comunicólogo conocerá las características de los medios de comunicación, de las empresas de la comunicación en cada medio.', 14, '<ul>\r\n  <li><a href=\"http://oferta.unam.mx/carreras/10/ciencias-de-la-comunicacion\">http://oferta.unam.mx/carreras/10/ciencias-de-la-comunicacion</a></li>\r\n</ul>'),
(28, 37, 'Para ver el plan de estudios entra en el siguiente <a href=\"http://oferta.unam.mx/carrera/archivos/planes/cienciaspoliticasyadmonpublica-cu-plandestudios14.pdf\">enlace</a>.', 'Enla Facultadde Ciencias Políticas y Sociales existe un perfil propio para cada opción en que se divide la carrera. El egresado de Administración Pública contará con estas aptitudes:<br>\r\n* Experto en cuestiones semánticas, lingüísticas y discursivas de las instituciones administrativas y gubernamentales.<br> * Experto en la construcción del discurso y el lenguaje argumentativo.<br>* Estratega en la decisión y las acciones de gobierno.<br>* Estratega en el diseño, la creación y la reforma de las instituciones administrativas y gubernamentales.<br><br>\r\n\r\nEl egresado de Ciencia Política reunirá conocimientos sobre:<br>\r\n* Las principales escuelas, tradiciones y autores que fundamentan teórica, metodológica y conceptualmente la disciplina.<br>\r\n* El Estado, el régimen político, las formas de gobierno y el orden jurídico que rige el sistema político mexicanos y su inserción en el mundo globalizado.<br>\r\n* Los actores, organizaciones, instituciones y procesos que interactúan en el campo político de los procesos de las políticas públicas.', 14, '<ul>\r\n  <li><a href=\"http://oferta.unam.mx/carreras/28/ciencias-politicas-y-administracion-publica\">http://oferta.unam.mx/carreras/28/ciencias-politicas-y-administracion-publica</a></li>\r\n</ul>'),
(29, 38, 'Para ver el plan de estudios ve al siguiente <a href=\"http://oferta.unam.mx/carrera/archivos/planes/relacionesinterna-fcpys-plandestudios17.pdf\">enlace</a>.', 'Al término de sus estudios, el estudiante habrá adquirido conocimientos sobre la historia de México y sus relaciones internacionales, los elementos económicos, jurídicos, políticos, sociales y culturales que inciden en el funcionamiento de sociedad internacional, así como los aspectos teórico-conceptuales que pretenden explicar fenómenos locales, regionales y globales.\r\n<br><br>\r\nAsí, el egresado de la licenciatura en Relaciones Internacionales será capaz de describir, comprender, analizar y explicar los fenómenos y procesos internacionales, además de proponer alternativas, diseñar y aplicar estrategias de solución a los problemas que forman parte del objeto de estudio de esta disciplina. Asimismo, actuará con un alto sentido ético, sustentado en los valores y cultura universitarios, para contribuir al desarrollo de la sociedad mexicana desde las áreas que integran el quehacer profesional del internacionalista.', 14, '<ul>\r\n  <li><a href=\"http://oferta.unam.mx/carreras/12/relaciones-internacionales\">http://oferta.unam.mx/carreras/12/relaciones-internacionales</a></li>\r\n</ul>'),
(30, 39, 'Para ver el plan de estudios ve al siguiente <a href=\"http://oferta.unam.mx/carrera/archivos/planes/sociologia-fcpys-plandestudios17.pdf\">enlace</a>.', 'Conocimientos<br>\r\nEl egresado cuenta con un conocimiento básico de las disciplinas con las que la Sociología interactúa, tales como: Economía, Antropología, Geografía, Psicología Social, Ciencias de la Comunicación, entre otras.<br>\r\n<br>\r\nEn términos de habilidades, el egresado es capaz de:<br>\r\n* Ejercer una práctica profesional adecuada a las necesidades sociales o sectoriales (públicas o particulares) definidas, tanto institucionalmente como por los diversos grupos sociales.<br>\r\n* Utilizar los distintos paradigmas de investigación de conformidad con las exigencias sociales o institucionales.<br><br>\r\n\r\nEn términos de actitudes, el sociólogo, además de poseer una identidad definida, debe:<br>\r\n* Desarrollar una actitud de responsabilidad social.<br>\r\n* Tener una actitud crítica fundamentada en el conocimiento.<br><br>\r\n\r\nPor lo tanto, el egresado de la licenciatura en Sociología está capacitado para analizar y proponer soluciones a las problemáticas sociales, políticas y económicas del país.', 14, '<ul>\r\n  <li><a href=\"http://oferta.unam.mx/carreras/9/sociologia\">http://oferta.unam.mx/carreras/9/sociologia</a></li>\r\n</ul>'),
(31, 40, 'Para ver el plan de estudios entra en el siguiente <a href=\"http://oferta.unam.mx/carrera/archivos/planes/administracionfca-plandeestudios13.pdf\">enlace</a>.', 'El egresado será capaz de integrar y dirigir grupos humanos hacia el logro de objetivos de organizaciones públicas y privadas, aprovechando los recursos disponibles mediante: la determinación de objetivos viables y el diseño de planes para alcanzarlos; el establecimiento de la mejor división del trabajo entre las diferentes áreas; y la orientación de los subordinados hacia el alcance de los objetivos de cada una de éstas, a través de la comunicación, la motivación y la supervisión.\r\n<br><br>\r\nDesarrollará además una visión integral sobre los objetivos de las organizaciones y establecerá estrategias para la creación de nuevas empresas.\r\n<br><br>\r\nDurante la licenciatura adquirirá conocimientos técnicos de los campos específicos de la licenciatura (Administración, Mercadotecnia, Operaciones, Recursos Humanos y Finanzas) así como de: administración de recursos humanos, presupuestos, mercadotecnia, y los propios del área de investigación, que buscan promover un proceso de reflexión y análisis.', 15, '<ul>\r\n  <li><a href=\"http://oferta.unam.mx/carreras/3/administracion\">http://oferta.unam.mx/carreras/3/administracion</a></li>\r\n</ul>'),
(32, 41, 'Para ver el plan de estudios ve al siguiente <a href=\"http://oferta.unam.mx/carrera/archivos/planes/plandeestudiosinformatica-fca13.pdf\">enlace</a>.', 'Los egresados de la Facultad de Contaduría y Administración se distinguen por un ejercicio profesional ético y responsable, con capacidades de trabajo individual y en equipo para hacer de las organizaciones factor de desarrollo social.\r\n<br><br>\r\nAsimismo posee conocimientos y habilidades que le permitan:\r\n<br><br>\r\n* Aplicar un conjunto de conocimientos teóricos y prácticos especializados en tecnología de la información.<br>\r\n* Tener una visión integral de las necesidades de procesamiento de la información de la empresa, para implementar las tecnologías de información que requiera.<br>\r\n* Auditar equipos y sistemas de procesamiento de datos.<br>\r\n* Analizar, diseñar, desarrollar e implementar software en las organizaciones, instalar y configurar equipos de cómputo, auditar, innovar y manejar las tecnologías de información, conocer su marco legal y su normatividad.<br>\r\n* Desarrollar una práctica profesional proactiva, innovadora y emprendedora con el compromiso de superación y estudio permanente.<br>', 15, '<ul>\r\n  <li><a href=\"http://oferta.unam.mx/carreras/8/informatica\">http://oferta.unam.mx/carreras/8/informatica</a></li>\r\n</ul>'),
(33, 42, 'Para ver el plan de estudios ve al siguiente <a href=\"http://oferta.unam.mx/carrera/archivos/planes/contaduracu-plandeestudios14.pdf\">enlace</a>', 'El egresado de esta Facultad posee una sólida formación académica con conocimientos, actitudes, aptitudes y habilidades para entender y solucionar los problemas financieros de las entidades en un sentido muy amplio.\r\n<br><br>\r\nEn el ejercicio de su profesión aplica sus conocimientos financieros, contables y tributarios a la situación financiera de las organizaciones.\r\n<br><br>\r\nContable<br>\r\nAnaliza la información financiera y no financiera de la entidad, a fin de entenderla y evaluarla.\r\n<br><br>\r\nFinanciero<br>\r\nElabora estrategias de financiamiento e inversión para que la entidad administre su riesgo financiero y operativo y evalúa proyectos de inversión.\r\n<br><br>\r\nFiscal<br>\r\nParticipa o crea su propio despacho donde brinda servicios relacionados con las obligaciones fiscales de personas morales y físicas.\r\n<br><br>\r\nSistemas de información<br>\r\nComprende y participa en el uso de las tecnologías de información.\r\n<br><br>\r\nEmprendedor/empresario<br>\r\nFunda y dirige su propia empresa de servicios o productos, tiene además conocimientos para crear valor dentro de dicho negocio.', 15, '<ul>\r\n  <li><a href=\"http://oferta.unam.mx/carreras/6/contaduria\">http://oferta.unam.mx/carreras/6/contaduria</a></li>\r\n</ul>'),
(34, 43, 'Para ver el plan de estudios ve al siguiente <a href=\"http://oferta.unam.mx/carrera/archivos/planes/negocios-fca-planestudios.pdf\">enlace</a>.', 'El egresado contará con una sólida formación en administración, negocios, economía y asuntos globales. Los campos de conocimiento de esta licenciatura aportan una visión estratégica de los negocios en el siglo XXI que le darán la capacidad para alcanzar los objetivos y las metas organizacionales, para proponer estrategias y modelos de negocios, así como aportar soluciones a problemas específicos de las empresas que participan en el mercado global.<br>\r\n<br>\r\nLa licenciatura en Negocios Internacionales ofrece una formación sólida en: administración, negocios, economía, asuntos globales, de las TIC, de los métodos cuantitativos, de ética y sociología, así como del dominio de la lengua extranjera. Además de lo anterior, el egresado poseerá:\r\n<br><br>\r\nConocimientos:<br>\r\n· Avanzados de métodos cuantitativos para la resolución de problemas en el área de los negocios internacionales.\r\n<br><br>\r\nHabilidades para:<br>\r\n· Definir y establecer objetivos organizacionales con visión internacional.', 15, '<ul>\r\n  <li><a href=\"http://oferta.unam.mx/carreras/113/negocios-internacionales\">http://oferta.unam.mx/carreras/113/negocios-internacionales</a></li>\r\n</ul>'),
(35, 44, 'Para ver el plan de estudios ve al siguiente <a href=\"http://oferta.unam.mx/carrera/archivos/planes/derecho-cu-plandestudios13.pdf\">enlace</a>.', 'El egresado contará con conocimientos y habilidades referentes a:<br>\r\n* La ciencia jurídica, de la que poseerá una sólida formación académica.<br>\r\n* El ejercicio del campo de especialización elegido.<br>\r\n* El marco jurídico vigente y, específicamente, de los campo(s) de cocimiento(s) de su especialidad.<br>\r\n* La resolución de problemas jurídicos.<br>\r\n* El juicio crítico basado en la observación científica de la realidad.<br>\r\n* El sentido humanista del Derecho.<br>\r\n* La capacidad para el litigio o la práctica jurídica de la especialización obtenida.<br>\r\n* El dominio del idioma inglés, como una herramienta adicional para una mayor competitividad en el mercado laboral.<br>\r\n* Las tecnologías de la información y la comunicación.<br>\r\n<br><br>\r\nActitudes y valores:<br>\r\n* Identificado con la cultura de la legalidad y solución pacífica de controversias.<br>\r\n* Congruente con los ideales y los principios de justicia, equidad, bien común y solidaridad.<br>\r\n* Iniciativa para continuar estudios de posgrado y para la actualización en la especialización en la que se formó.', 16, '<ul>\r\n  <li><a href=\"http://oferta.unam.mx/escuela-facultad/16/facultad-de-derecho\">http://oferta.unam.mx/escuela-facultad/16/facultad-de-derecho</a></li>\r\n</ul>');
INSERT INTO `carrera_uni` (`UID`, `id_carrera`, `plan_estudio`, `perfil_egreso`, `id_universidad`, `referencias`) VALUES
(36, 45, 'Para ver el plan de estudios ve al siguiente <a href=\"http://oferta.unam.mx/carrera/archivos/planes/economia-cu-plandestudios13.pdf\">enlace</a>.', 'El egresado de esta Facultad posee una serie de aptitudes, actitudes, habilidades y conocimientos que forman parte integral de su formación, aquí algunos:\r\n<br><br>\r\nConocimientos<br>\r\n* De la cultura económica para tener una formación con rigor científico.<br>\r\n* De las distintas corrientes y paradigmas teóricos de la ciencia económica.<br>\r\n* Para aplicar las herramientas de las matemáticas, la estadística, la econometría y los métodos cuantitativos.\r\n<br><br>\r\nAptitudes<br>\r\n* Hacia la investigación científica.<br>\r\n* Para la resolución de problemas económicos.\r\n<br><br>\r\nActitudes<br>\r\n* Formación social y humanitaria.<br>\r\n* Compromiso con los grandes problemas de la nación y del mundo.\r\n<br><br>\r\nAsimismo, el egresado será capaz de:<br>\r\n* Impartir los conocimientos básicos de la economía para formar en el alumno la disciplina y el saber de lo indispensable de la ciencia, lo que le permitirá profundizar en su ámbito económico-profesional.<br>\r\n* Enseñar modelos analíticos que desarrollen en él la capacidad de investigar y le ayuden a resolver problemas.', 17, '<ul>\r\n  <li><a href=\"http://oferta.unam.mx/carreras/56/economia\">http://oferta.unam.mx/carreras/56/economia</a></li>\r\n</ul>'),
(37, 28, 'Para ver el plan de estudios ve al siguiente <a href=\"http://oferta.unam.mx/carrera/archivos/planes/actuaria-fesacatlan-planestudios17.pdf\">enlace</a>.', 'Al término de la carrera, el egresado mostrará destreza en la formulación de modelos matemáticos, pericia en la identificación de patrones de comportamiento de fenómenos probabilísticos, capacidad para el manejo, organización y explotación de cantidades masivas de datos, habilidad para la evaluación cuantitativa y cualitativa de problemas de carácter social, así como el respectivo diseño de estrategias para su solución.\r\n<br><br>\r\nAdemás, poseerá:<br>\r\n* Capacidad de organización, tanto en trabajo de grupo como individual.<br>\r\n* Creatividad e innovación.<br>\r\n* Atención minuciosa y detallista.<br>\r\n* Disciplina y dinamismo.<br>\r\n* Actitud emprendedora y de liderazgo con iniciativa propia.<br>\r\n* Mente abierta orientada hacia la solución de problemas enla Actuaría.<br>\r\n* Honestidad, responsabilidad y espíritu crítico.<br>\r\n* Conciencia de la problemática nacional, basada en el conocimiento de la realidad del país.<br>\r\n* Actitud humanitaria y de servicio hacia la sociedad.', 18, '<ul>\r\n  <li><a href=\"http://oferta.unam.mx/escuela-facultad/18/facultad-de-estudios-superiores-acatlan\">http://oferta.unam.mx/escuela-facultad/18/facultad-de-estudios-superiores-acatlan</a></li>\r\n  <li><a href=\"http://planoinformativo.com/389947/taiwan-y-fes-acatlan-entregan-premios-y-becas-a-estudiantes-nacionales\">http://planoinformativo.com/389947/taiwan-y-fes-acatlan-entregan-premios-y-becas-a-estudiantes-nacionales</a></li>\r\n</ul>'),
(38, 21, 'Para ver el plan de estudios ve al siguiente <a href=\"http://oferta.unam.mx/carrera/archivos/planes/arquitectura-fesacatlan-plandeestudios17.pdf\">enlace</a>.', 'Al concluir los estudios, el egresado de la FES Acatlán podrá:\r\n<br>\r\n* Emprender proyectos arquitectónicos de manera global y competitiva en donde aplique las capacidades y habilidades adquiridas en su formación profesional.\r\n<br>\r\n* Promocionar y desarrollar su quehacer profesional individualmente o integrado a un equipo de trabajo, proponiendo soluciones factibles dentro de un campo inter, intra y multidisciplinario.\r\n<br>\r\n* Aplicar el conocimiento humanístico, científico, económico y técnico en la conceptualización y edificación del espacio arquitectónico y urbano.\r\n<br>\r\n* Aplicar las nuevas tecnologías en los procesos constructivos que satisfagan y respondan a las necesidades humanas y sociales, salvaguardando el medio ambiente.\r\n<br>\r\n* Regenerar el espacio urbano arquitectónico respetando sus valores y conservando el patrimonio histórico cultural y natural.\r\n<br>\r\n* Tener una actitud de formación permanente en diversas áreas relacionadas con la profesión.', 18, '<ul>\r\n  <li><a href=\"http://oferta.unam.mx/carreras/26/arquitectura\">http://oferta.unam.mx/carreras/26/arquitectura</a></li>\r\n</ul>'),
(39, 46, 'Para ver el plan de estudios ve al siguiente <a href=\"http://oferta.unam.mx/carrera/archivos/planes/comunicacion-fesacatlan-plandeestudios17.pdf\">enlace</a>.', 'El egresado identifica, analiza y diagnostica procesos de comunicación, asimismo diseña, produce y evalúa productos comunicativos y encabeza estrategias innovadoras.<br>\r\n<br>\r\nSu formación humana, flexible e interdisciplinaria le permitirá intervenir e influir directa y decisivamente, con libertad, responsabilidad social y compromiso ético en el ámbito de la comunicación. Posee las siguientes actitudes profesionales:\r\n<br>\r\n* Pensamiento crítico e integrador de los diversos saberes teóricos y metodológicos.<br>\r\n* Creatividad para el diseño de estrategias y proyectos que solucionen problemas comunicativos.<br>\r\n* Dominio y uso ético de diversas formas de expresión e integración de los lenguajes, medios y tecnologías en la elaboración de productos comunicativos.<br>\r\n* Liderazgo con asertividad y equidad para administrar proyectos de comunicación en ambientes de trabajo colaborativo e interdisciplinarios.<br>\r\n* Versatilidad para integrarse en los campos laborales vigentes y emergentes.', 18, '<ul>\r\n  <li><a href=\"http://oferta.unam.mx/carreras/96/comunicacion\">http://oferta.unam.mx/carreras/96/comunicacion</a></li>\r\n</ul>'),
(40, 44, 'Para ver el plan de estudios ve al siguiente <a href=\"http://oferta.unam.mx/carrera/archivos/planes/derecho-fes-acatln--plandeestudios13.pdf\">enlace</a>.', 'El egresado cuenta con una formación jurídica sólida con orientación inter y multidisciplinaria, con sentido humanista y social en el ejercicio del Derecho.<br>\r\n<br>\r\nTiene una actitud propositiva y analítica de la realidad social y del sistema jurídico; capacidad para comprender los fenómenos que el entorno económico, político y social le presenta frente a los retos producidos por los fenómenos de la globalización y del multiculturalismo, con habilidades para prevenir, intervenir, y resolver hechos y conflictos en los diversos ámbitos del Derecho.\r\n<br><br>\r\nReúne conocimientos para incorporarse en estudios de posgrado y participar, en su caso, en el desarrollo de la ciencia jurídica e investigación.\r\n<br><br>\r\nAdemás posee:\r\n<br>\r\nHabilidades para:<br>\r\n* Análisis de casos jurídicos.<br>\r\n* Investigación y manejo de las metodologías propias del conocimiento jurídico.<br>\r\n* Comprensión de lectura del idioma inglés.<br><br>\r\n\r\nActitudes:<br>\r\n* Sentido de responsabilidad profesional.<br>\r\n* Comportamiento ético.<br>\r\n* Respeto, fomento y tolerancia por la libertad del ser humano.', 18, '<ul>\r\n  <li><a href=\"http://oferta.unam.mx/carreras/1/derecho\">http://oferta.unam.mx/carreras/1/derecho</a></li>\r\n</ul>'),
(41, 47, 'Para ver el plan de estudios ve al siguiente <a href=\"\">enlace</a>.', 'Al concluir sus estudios el egresado de esta carrera podrá, gracias a los conocimientos tecnológicos de vanguardia adquiridos, producir comunicación digital, identificar problemas y determinar soluciones de diseño gráfico y comunicación audiovisual en forma creativa, innovadora, ética y responsable, con disposición al trabajo autónomo, grupal e interdisciplinario y siempre en la búsqueda de generar nuevos conocimientos científicos y propuestas artísticas, y de extender su desarrollo profesional a las necesidades sociales.', 18, '<ul>\r\n  <li><a href=\"http://oferta.unam.mx/carreras/13/diseno-grafico\">http://oferta.unam.mx/carreras/13/diseno-grafico</a></li>\r\n</ul>'),
(42, 45, 'Para ver el plan de estudios ve al siguiente <a href=\"http://oferta.unam.mx/carrera/archivos/planes/economia-fesacatlan-plandestudios13.pdf\">enlace</a>.', 'El egresado de la FES Acatlán conocerá los métodos cuantitativos e instrumentales que le permitirán estudiar, investigar y proponer soluciones a los diferentes problemas económicos. Por tanto, es capaz de:<br>\r\n* Distinguir las distintas corrientes teóricas de la ciencia económica y evaluar sus alcances y limitaciones y, por lo tanto, la factibilidad de su aplicación a la realidad socioeconómica del país.<br>\r\n* Evaluar la dotación, distribución y forma de aprovechamiento de los recursos productivos en sus dimensiones económica y social, con el fin de buscar el desarrollo local, regional y nacional del país, en el entorno mundial.<br>\r\n* Estudiar las relaciones que rigen la producción, distribución, intercambio y consumo entre los distintos actores socioeconómicos.\r\nDentro de la Universidad, la formación de todo profesional de la economía busca preservar su tradición humanista, capacidad crítica y de análisis, propios de una formación científica y con alta vocación social.', 18, '<ul>\r\n  <li><a href=\"http://oferta.unam.mx/carreras/56/economia\">http://oferta.unam.mx/carreras/56/economia</a></li>\r\n</ul>'),
(43, 48, 'Para ver el plan de estudios ve al siguiente <a href=\"http://oferta.unam.mx/carrera/archivos/planes/filosofia-acatlan-plan-de-estudios13.pdf\">enlace</a>', 'Al concluir la carrera, el egresado adquirirá una serie de conocimientos, habilidades y aptitudes, entre los que destacan:\r\n<br><br>\r\nConocimientos<br>\r\n\r\n* Tendrá una formación filosófica sistematizada y fundamentada que le permitirá comprender su entorno socio-cultural.<br>\r\n* Comprenderá las tesis centrales de la historia de la filosofía.<br>\r\n* Explicará problemas del mundo contemporáneo, desde una perspectiva filosófica.<br>\r\n \r\n<br>\r\nHabilidades y aptitudes<br>\r\n\r\n* Podrá participar en el diseño y ejecución de proyectos en el ámbito de su profesión.<br>\r\n* Propondrá programas orientados a la promoción de actividades académicas y de difusión de la cultura.<br>\r\n* Contará con las habilidades necesarias para colaborar en equipos multidisciplinarios, orientados al estudio y solución de problemas relativos a la Filosofí', 18, '<ul>\r\n  <li><a href=\"http://oferta.unam.mx/carreras/75/filosofia\">http://oferta.unam.mx/carreras/75/filosofia</a></li>\r\n</ul>'),
(44, 49, 'Para ver el plan de estudios entra al siguiente <a href=\"http://oferta.unam.mx/carrera/archivos/planes/historiaacatln-plan-de-estudios13.pdf\">enlace</a>.', 'Al concluir la carrera, el egresado contará con los conocimientos que le permitirán enriquecer su disciplina.<br>\r\n\r\nRecopilará, ordenará, sistematizará e interpretará los hechos humanos del pasado para interactuar eficazmente con egresados de otras disciplinas.<br>\r\n\r\nDará prioridad a tareas que favorezcan, preserven, refuercen y enriquezcan la identidad multicultural del país.<br>\r\n<br>\r\nAdemás:\r\n<br>\r\n* Manejará aspectos conceptuales básicos de la historiografía y de la teoría de la historia para analizar las diversas formas del discurso histórico y su interpretación.<br>\r\n* Dominará los fundamentos metodológicos y didácticos para el ejercicio de la docencia.<br>\r\n* Aplicará los principios metodológicos y de manejo de fuentes en la investigación histórica.<br>\r\n* Enfrentará los problemas que se presenten en la vida profesional de manera crítica y creativa.<br>\r\n* Mantendrá una actitud de apertura y crítica hacia nuevas corrientes de interpretación histórica.', 18, '<ul>\r\n  <li><a href=\"http://oferta.unam.mx/carreras/76/historia\">http://oferta.unam.mx/carreras/76/historia</a></li>\r\n</ul>'),
(45, 50, 'Para ver el plan de estudios ve al siguiente <a href=\"http://oferta.unam.mx/carrera/archivos/planes/ingcivilplanestudiosacatlan13.pdf\">enlace</a>.', 'El egresado de la FES Acatlán estará capacitado para controlar y aprovechar las fuerzas y los recursos de la naturaleza; resolverá técnicamente problemas y necesidades que se presentan en la sociedad y poseerá una visión globalizada y socio-humanística que le permita desempeñarse eficaz y éticamente.\r\n<br><br>\r\nConocimientos<br>\r\nTendrá conocimientos de física, matemáticas y química, básicos para las ciencias de la Ingeniería Civil; usará bases de información y herramientas computacionales para solucionar los problemas de su quehacer profesional.\r\n<br><br>\r\nAptitudes y habilidades<br>\r\n* Preferencia por el trabajo en el campo, lugar donde se realizan obras de ingeniería, y en el laboratorio, donde se prueban materiales o modelos.<br>\r\n* Adaptación a nuevas tecnologías como elementos integrantes de su quehacer profesional.<br><br>\r\n\r\nActitudes<br>\r\n* Emprendedor, capaz de desarrollar su propia profesión; generar nuevos empleos y coordinar las labores de un grupo de trabajo, en campo y oficina.<br>\r\n* Practicará la autodisciplina.', 18, '<ul>\r\n  <li><a href=\"http://oferta.unam.mx/carreras/53/ingenieria-civil\">http://oferta.unam.mx/carreras/53/ingenieria-civil</a></li>\r\n</ul>'),
(46, 51, 'Para ver el plan de estudios ve al siguiente <a href=\"http://oferta.unam.mx/carrera/archivos/planes/lengylithisp-acatlan-plan-de-estudios13.pdf\">enlace</a>.', 'Al término de los estudios, el egresado poseerá una sólida formación en los campos, lingüístico y literario, tanto teórico como metodológico, necesaria para el desarrollo de investigaciones, en torno a:<br>\r\n\r\n* Los problemas teóricos de la lingüística.<br>\r\n* La identificación de autores, géneros y corrientes literarias de la literatura española, hispanoamericana, mexicana y su relación con la literatura universal.<br>\r\n* El origen y desarrollo de la lengua española.<br><br>\r\n\r\nDesarrollará la capacidad de análisis, comprensión y síntesis, que le permita realizar una interpretación de la realidad y aplicarla en los diferentes campos profesionales en los que se pueda incorporar.<br>\r\n<br>\r\nPodrá comunicar, en forma oral y escrita, los conocimientos adquiridos para aplicarlos de manera eficaz en la práctica profesional.<br>\r\n<br>\r\nMantendrá una actitud reflexiva y crítica ante los hechos lingüísticos y literarios, con la finalidad de relacionar estos problemas con la comprensión general de la cultura humana.', 18, '<ul>\r\n  <li><a href=\"http://oferta.unam.mx/carreras/77/lengua-y-literaturas-hispanicas\">http://oferta.unam.mx/carreras/77/lengua-y-literaturas-hispanicas</a></li>\r\n</ul>'),
(48, 53, 'Para ver el plan de estudios ve al siguiente <a href=\"http://oferta.unam.mx/carrera/archivos/planes/mataplicadasycomputacionplanestudiosacatlan13.pdf\">enlace</a>.', 'Al concluir sus estudios, el egresado en Matemáticas Aplicadas y Computación podrá:<br>\r\n<br>\r\n* Emplear creativamente las matemáticas y las ciencias computacionales.<br>\r\n* Innovar en campos de aplicación como: el modelado analítico, los modelos estadísticos y estocásticos, las ciencias de la computación, los sistemas computacionales, la administración y las finanzas, entre otros.<br>\r\n* Resolver problemas teóricos y prácticos de diversas disciplinas tomando en cuenta diferentes puntos de vista.<br>\r\n* Crear por cuenta propia o en grupo, empresas que generen bienes, conocimientos o servicios en el ámbito de la computación.', 18, '<ul>\r\n  <li><a href=\"http://oferta.unam.mx/carreras/18/matematicas-aplicadas-y-computacion\">http://oferta.unam.mx/carreras/18/matematicas-aplicadas-y-computacion</a></li>\r\n</ul>'),
(49, 54, 'Para ver el plan de estudios ve al siguiente <a href=\"http://oferta.unam.mx/carrera/archivos/planes/pedagogia-acatlan-plan-de-estudios13.pdf\">enlace</a>.', 'Al término de los estudios, el egresado será capaz de:\r\n<br><br>\r\n* Diseñar, ejecutar y evaluar programas y proyectos encaminados a satisfacer los requerimientos y necesidades educativas de los diferentes sectores de la población, con base en planteamientos teórico-metodológicos e instrumentales que sustenten estas tareas.<br>\r\n* Participar en equipos de investigación disciplinarios e interdisciplinarios, con el fin de dar cuenta de la problemática del campo educativo, sus posibilidades de mejoramiento e innovación, desde diversas perspectivas epistemológicas.<br>\r\n* Proporcionar asesoría pedagógica respecto a elaboración y evaluación de planes y programas curriculares, organización de escuela para padres, capacitación y actualización laboral, proyectos psicopedagógicos, etcétera.<br>\r\n* Practicar la docencia con grupos de distintas modalidades, niveles educativos y condiciones socioeconómicas y culturales concretas, desde diversas posiciones teóricas, metodológicas y técnicas.', 18, '<ul>\r\n  <li><a href=\"http://oferta.unam.mx/carreras/81/pedagogia\">http://oferta.unam.mx/carreras/81/pedagogia</a></li>\r\n</ul>'),
(50, 38, 'Para ver el plan de estudios ve al siguiente <a href=\"http://oferta.unam.mx/carrera/archivos/planes/relacionesinterna-fesacatlan-plandestudios13.pdf\">enlace</a>.', 'El egresado de la FES Acatlán analizará situaciones, problemas y conflictos internacionales, y de esta manera estará en condiciones de conducir, prever y ofrecer soluciones al respecto. Por tanto es un profesionista de enlace entre: la Economía, la Ciencia Política, las Ciencias Jurídicas, la Geografía y la Historia.<br>\r\n<br>\r\nDe acuerdo con lo anterior, el profesional en Relaciones Internacionales será capaz de:<br>\r\n* Analizar, evaluar y prever las diferentes vinculaciones de México con otros países en áreas distintas como economía, finanzas internacionales, política internacional y derecho internacional.<br>\r\n* Identificar los problemas que son objeto de estudio de las relaciones internacionales.<br>\r\n* Elaborar estrategias aplicables al comercio y los negocios internacionales con el propósito de incrementar la presencia económica de México en el mundo.<br>\r\n* Contribuir profesionalmente en el análisis de la política exterior de México.<br>\r\n* Explicar el comportamiento de los sujetos internacionales.', 18, '<ul>\r\n  <li><a href=\"http://oferta.unam.mx/carreras/12/relaciones-internacionales\">http://oferta.unam.mx/carreras/12/relaciones-internacionales</a></li>\r\n</ul>'),
(51, 39, 'Para ver el plan de estudios ve al siguiente <a href=\"http://oferta.unam.mx/carrera/archivos/planes/sociologia-fesacatlan-plandestudios13.pdf\">enlace</a>.', 'Conocimientos:<br>\r\n* La formación teórica que le dará los elementos suficientes para confrontar diferentes estructuras sociales, la posibilidad del cambio y la redefinición de nuevas formas de organización social.<br>\r\n* Las corrientes, escuelas y autores que han dado forma a la disciplina y que han permitido al sociólogo ampliar la visión y las perspectivas de análisis.\r\n<br><br>\r\nHabilidades y aptitudes:<br>\r\n* La flexibilidad, la multi e interdisciplina lo forman como un profesionista con capacidad y adaptación a un mundo cambiante.<br>\r\n* El estudio activo, la creatividad, la disciplina, la autoformación y la actualización en el aprendizaje están presentes en el egresado.\r\n<br><br>\r\nActitudes:<br>\r\n* De responsabilidad y honestidad para consigo mismo y para con los demás, considerados los conocimientos y el avance de la ciencia.<br>\r\n* De interés permanente por los problemas sociales.', 18, '<ul>\r\n  <li><a href=\"http://oferta.unam.mx/carreras/9/sociologia\">http://oferta.unam.mx/carreras/9/sociologia</a></li>\r\n\r\n</ul>'),
(52, 21, 'Para ver información relacionada al plan de estudios ve al siguiente <a href=\"http://oferta.unam.mx/carrera/archivos/planes/arquitecturaplanestudiosaragon13.pdf\">enlace</a>.', 'Al concluir los estudios, este profesional estará capacitado para:<br>\r\n:<br>\r\n\r\n* Ejercer aquellas actividades relacionadas con el quehacer arquitectónico.:<br>\r\n\r\n* Concebir, determinar y realizar espacios internos que satisfagan las diversas necesidades del hombre en su dualidad física y espiritual, expresada como individuo y miembro de la sociedad.<br>\r\n\r\n* Resolver todo tipo de problemas de alojamiento a nivel urbano, a fin de generar unidades complejas para los grandes sectores de la población.', 19, '<ul>\r\n  <li><a href=\"http://oferta.unam.mx/carreras/26/arquitectura\">http://oferta.unam.mx/carreras/26/arquitectura</a></li>\r\n  <li><a href=\"http://oferta.unam.mx/escuela-facultad/19/facultad-de-estudios-superiores-aragon\">http://oferta.unam.mx/escuela-facultad/19/facultad-de-estudios-superiores-aragon</a></li>\r\n</ul>'),
(53, 55, 'Para ver el plan de estudios ve al siguiente <a href=\"http://oferta.unam.mx/carrera/archivos/planes/comunicayperiodismo-fesaragon-plandeestudios13a.pdf\">enlace</a>.', 'Los alumnos que cursen esta licenciatura en la FES Aragón obtendrán conocimientos y habilidades de acuerdo con las siguientes etapas de formación:\r\n<br><br>\r\nEtapa Propedéutica\r\n<br>\r\n* Comprenderá el objeto mismo de las ciencias sociales y la comunicación, así como su relación con: ciencia política, economía, sociología y epistemología.<br>\r\n* Conocerá las funciones sociales del periodismo.\r\n<br><br>\r\nEtapa Formativa\r\n<br>\r\n* Conocerá y aplicará los diferentes géneros periodísticos, además de las diversas teorías y métodos de la comunicación.<br>\r\n* Conocerá aspectos teórico-metodológicos respecto al desarrollo y el régimen legal de los medios de comunicación, la psicología, la opinión pública, la publicidad y la propaganda.\r\n<br><br>\r\nEtapa de Preespecialización\r\n<br>\r\nAl concluir esta etapa de formación que incluye las preespecialidades de prensa, radio o televisión, además de las asignaturas optativas, el alumno aplicará sus conocimientos teórico-técnicos en los procesos de producción de mensajes.', 19, '<ul>\r\n  <li><a href=\"http://oferta.unam.mx/carrera/archivos/planes/comunicayperiodismo-fesaragon-plandeestudios13a.pdf\">http://oferta.unam.mx/carrera/archivos/planes/comunicayperiodismo-fesaragon-plandeestudios13a.pdf</a></li>\r\n\r\n</ul>'),
(55, 1, 'asdasd', 'asdasd', 9, ''),
(56, 56, 'asdasd', 'asdasd', 4, ''),
(57, 56, 'asdasd', 'asdasd', 4, ''),
(58, 56, 'asdasd', 'asdasd', 11, ''),
(59, 56, 'asdasd', 'asdasd', 9, ''),
(60, 63, 'dsfgdfhgfds', 'asdfsghf', 4, ''),
(61, 63, 'dsfgdfhgfds', 'asdfsghf', 4, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `examen`
--

CREATE TABLE `examen` (
  `UID` int(11) NOT NULL,
  `nombre` varchar(72) NOT NULL,
  `tipo` varchar(72) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `examen`
--

INSERT INTO `examen` (`UID`, `nombre`, `tipo`) VALUES
(1, 'Mi primer test', 'General');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `institucion`
--

CREATE TABLE `institucion` (
  `UID` int(11) NOT NULL,
  `name` varchar(120) NOT NULL,
  `intercambio` mediumtext NOT NULL,
  `becas` mediumtext NOT NULL,
  `rank_nac` int(11) DEFAULT NULL,
  `rank_mun` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `institucion`
--

INSERT INTO `institucion` (`UID`, `name`, `intercambio`, `becas`, `rank_nac`, `rank_mun`) VALUES
(1, 'Universidad Nacional Autónoma de México', 'Ser becario de movilidad internacional no es un derecho de todo estudiante universitario sino una distinción que sólo obtienen algunos de los mejores alumnos de la UNAM. El perfil de estos alumnos de alta calidad está asociado a un promedio alto en sus calificaciones, regularidad en sus estudios, disciplina en sus procedimientos, aptitud excepcional en sus proyectos académicos, disposición a regresar a México para insertarse al ámbito laboral o académico y, muy frecuentemente, dominio de una lengua extranjera. Adicionalmente, cuando también hay un apoyo económico, es porque el perfil socioeconómico del alumno de excelencia lo sugiere.Más información <a href=\"http://www.global.unam.mx/es/movi_alumnos/para_participar_me.html?panel=2\">aquí</a><br>', 'Beca nacional:<br>\r\nLa Subsecretaria de Educación Superior (SES) de la Secretaria de Educación Pública (SEP), a través de\r\nla Coordinación Nacional de Becas de Educación Superior (CNBES), con aportaciones del Gobierno\r\nFederal, de la UNAM y de la Fundación UNAM A. C. han constituido un fondo para otorgar becas\r\nno reembolsables a estudiantes de licenciatura con buen desempeño académico que, por su situación\r\nfamiliar, requieran apoyo económico.<br>\r\nPrograma de Fortalecimiento Académico para las Mujeres Universitarias:<br>\r\nLa Universidad Nacional Autónoma de México a través de la Secretaría de Atención a la Comunidad\r\nUniversitaria y la Dirección General de Orientación y Atención Educativa (DGOAE) constituyó un fondo\r\npara otorgar becas no reembolsables a las alumnas inscritas, a partir del quinto semestre, en las carreras\r\ndel Consejo Académico de Área Físico-Matemáticas e Ingenierías con alto desempeño académico.<br>\r\nBeca para Estudiantes del Estado de México:<br>\r\nEl gobierno del Estado de México ha creado un programa de becas con el propósito de apoyar a los\r\nestudiantes que hayan ingresado o se encuentren realizando estudios de educación superior en los\r\nSistemas Escolarizado o Universidad Abierta y Educación a Distancia en la UNAM. Más información <a href=\"http://www.dgoae.unam.mx/PDF/becaslicenciatura.pdf\">aquí</a>', 1, 141),
(2, 'Instituto Politécnico Nacional', 'El IPN ofrece movilidad internacional en más de 30 países al rededor del mundo. Más información <a href=\"http://www.ipn.mx/cca/movilidad/Paginas/alumnos-ipn.aspx\">aquí</a>.', 'El IPN ofrece un total de 13 becas para los estudiantes de nivel Superior de los cuales se encuentran: Beca institucional, beca institucional de transporte, IPN-Becalos, beca Alfredo Harp Helú, IPN-Fundación TELMEX, entre otros.<br>\r\nMás información <a href=\"http://www.ipn.mx/dse/Becas/Documents/becas_principal/convocatoria/BECAS_IPN_2016_17(2).pdf\">aquí</a>.', 3, 920),
(6, 'Universidad Autónoma de Zacatecas', 'El Programa de Movilidad Estudiantil consiste en el intercambio de estudiantes con otras Instituciones de Educación Superior, Nacionales e Internacionales, para que realicen estancias semestrales, que les permitan avanzar en sus Programas de estudio. De igual manera el programa permite la recepción de estudiantes de otras Instituciones de Educación Superior que están interesados en cursar un periodo en la Universidad Autónoma de Zacatecas. <a href=\"http://intercambio.uaz.edu.mx/enqueconsiste\">Ver FAQ</a><br>\r\nPara ver las universidades disponibles para movilidad entra en el siguiente <a href=\"http://intercambio.uaz.edu.mx/adonde\">enlace</a>.<br>\r\nPara ver las convocatorias activas entra en el siguiente <a href=\"http://intercambio.uaz.edu.mx/25\">enlace</a>.', 'Para ver detalladamente las becas que la Universidad Autónoma de Zacatecas ofrece entra en el siguiente <a href=\"http://www2.uaz.edu.mx/becas\">enlace</a>.', 36, 3223);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pregunta`
--

CREATE TABLE `pregunta` (
  `UID` int(11) NOT NULL,
  `id_examen` int(11) NOT NULL,
  `pregunta_examen` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pregunta`
--

INSERT INTO `pregunta` (`UID`, `id_examen`, `pregunta_examen`) VALUES
(1, 1, '¿Te interesaría organizar una cooperacion grupal para comprar algo al aula?'),
(2, 1, '¿Te llama la atención entender lo que origina las emociones de una persona?'),
(3, 1, 'Al ver una pintura ¿te interesa conocer las técnicas que se emplearon para hacerla?'),
(4, 1, '¿Te gustaría armar un pequeño aparato electrónico?'),
(5, 1, '¿Te interesa el cuidado de los animales?'),
(6, 1, '¿Te ha llamado la atención aprender a tocar un instrumento musical?'),
(7, 1, '¿Te es interesante los diferentes comportamientos de tus compañeros de clase?'),
(8, 1, '¿Te gustaría controlar tus gastos para manejar el dinero más eficientemente?'),
(9, 1, '¿Te llama la atención ver y entender los componentes internos de un celular?'),
(10, 1, '¿Te gustaría conocer el funcionamiento del corazón?'),
(11, 1, '¿Te interesaría investigar una solución para disminuir la contaminación del aire?'),
(12, 1, 'Al ver el interior del cofre de un auto ¿te llaman la atención sus componentes y funcionamiento?'),
(13, 1, 'Si te eligieran como lider de un proyecto ¿aceptarías el puesto?'),
(14, 1, 'Al considerar las ineficiencias de tu ciudad ¿te gustaria proponer propuestas a los representantes de esta?'),
(15, 1, 'Cuando escuchas una canción ¿te interesan los instrumentos musicales y tonos que incluye la pista?'),
(16, 1, '¿Te gustaría ser el lider de una empresa?'),
(17, 1, '¿Te gustaría diseñar y hacer los cálculos para construir un puente?'),
(18, 1, '¿Te es interesante estudiar las causas y efectos de los transtornos o enfermedades emocionales?'),
(19, 1, '¿Te gustaría diseñar la publicidad para una gran empresa?'),
(20, 1, '¿Te interesaría realizar el control de calidad de los alimentos?'),
(21, 1, '¿Te gustaría aprender y estudiar otros idiomas para hablarlos casi perfectamente?'),
(22, 1, '¿Aceptarías supervisar las ventas de un centro comercial?'),
(23, 1, '¿Te gustaría componer la música para una película?'),
(24, 1, '¿Te llama la atención el estudio de nuevas curas para las enfermedades?'),
(25, 1, '¿Te gustaría hacer proyectos de extracción minera?'),
(26, 1, '¿Te gustaría estudiar el comportamiento de los animales que viven en el mar?'),
(27, 1, '¿Te gustaría elegir o diseñar los muebles interiores de una casa?'),
(28, 1, 'Te gustaría conocer las diferentes religiones, así como sus fundamentos y darlas a conocer?'),
(29, 1, '¿Te gustaría crear una aplicación de organización para tu telefono celular?'),
(30, 1, '¿Te gustaría organizar una excursión grupal?'),
(31, 1, '¿Cuál de las siguientes áreas prefieres?');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `respuesta`
--

CREATE TABLE `respuesta` (
  `UID` int(11) NOT NULL,
  `id_pregunta` int(11) DEFAULT NULL,
  `respuesta` text COLLATE utf8_unicode_ci,
  `id_area` int(11) NOT NULL,
  `valor` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `respuesta`
--

INSERT INTO `respuesta` (`UID`, `id_pregunta`, `respuesta`, `id_area`, `valor`) VALUES
(1, 1, 'No me interesa', 4, '-1'),
(2, 1, 'Me interesa', 4, '1'),
(3, 2, 'No me interesa', 2, '-1'),
(4, 2, 'Me interesa', 2, '1'),
(5, 3, 'No me interesa', 2, '-1'),
(6, 3, 'Me interesa', 2, '1'),
(7, 4, 'No me interesa', 3, '-1'),
(8, 4, 'Me interesa', 3, '1'),
(9, 5, 'No me interesa', 1, '-1'),
(10, 5, 'Me interesa', 1, '1'),
(11, 6, 'No me interesa', 2, '-1'),
(12, 6, 'Me interesa', 2, '1'),
(13, 7, 'No me interesa', 2, '-1'),
(14, 7, 'Me interesa', 2, '1'),
(15, 8, 'No me interesa', 4, '-1'),
(16, 8, 'Me interesa', 4, '1'),
(17, 9, 'No me interesa', 3, '-1'),
(18, 9, 'Me interesa', 3, '1'),
(19, 10, 'No me interesa', 1, '-1'),
(20, 10, 'Me interesa', 1, '1'),
(21, 11, 'No me interesa', 1, '-1'),
(22, 11, 'Me interesa', 1, '1'),
(23, 12, 'No me interesa', 3, '-1'),
(24, 12, 'Me interesa', 3, '1'),
(25, 13, 'No me interesa', 4, '-1'),
(26, 13, 'Me interesa', 4, '1'),
(27, 14, 'No me interesa', 2, '-1'),
(28, 14, 'Me interesa', 2, '1'),
(29, 15, 'No me interesa', 2, '-1'),
(30, 15, 'Me interesa', 2, '1'),
(31, 16, 'No me interesa', 4, '-1'),
(32, 16, 'Me interesa', 4, '1'),
(33, 17, 'No me interesa', 3, '-1'),
(34, 17, 'Me interesa', 3, '1'),
(35, 18, 'No me interesa', 2, '-1'),
(36, 18, 'Me interesa', 2, '1'),
(37, 19, 'No me interesa', 2, '-1'),
(38, 19, 'Me interesa', 2, '1'),
(39, 20, 'No me interesa', 1, '-1'),
(40, 20, 'Me interesa', 1, '1'),
(41, 21, 'No me interesa', 2, '-1'),
(42, 21, 'Me interesa', 2, '1'),
(43, 22, 'No me interesa', 4, '-1'),
(44, 22, 'Me interesa', 4, '1'),
(45, 23, 'No me interesa', 2, '-1'),
(46, 23, 'Me interesa', 2, '1'),
(47, 24, 'No me interesa', 1, '-1'),
(48, 24, 'Me interesa', 1, '1'),
(49, 25, 'No me interesa', 3, '-1'),
(50, 25, 'Me interesa', 3, '1'),
(51, 26, 'No me interesa', 1, '-1'),
(52, 26, 'Me interesa', 1, '1'),
(53, 27, 'No me interesa', 2, '-1'),
(54, 27, 'Me interesa', 2, '1'),
(55, 28, 'No me interesa', 2, '-1'),
(56, 28, 'Me interesa', 2, '1'),
(57, 29, 'No me interesa', 3, '-1'),
(58, 29, 'Me interesa', 3, '1'),
(59, 30, 'No me interesa', 4, '-1'),
(60, 30, 'Me interesa', 4, '1'),
(61, 31, 'Biológicas', 1, '5'),
(62, 31, 'Humanidades', 2, '5'),
(63, 31, 'Ingeniería', 3, '5'),
(64, 31, 'Sociales', 4, '5');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sesion_agregar_unis`
--

CREATE TABLE `sesion_agregar_unis` (
  `UID` int(11) NOT NULL,
  `token` varchar(40) NOT NULL,
  `correo` varchar(40) DEFAULT NULL,
  `expira` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sesion_agregar_unis`
--

INSERT INTO `sesion_agregar_unis` (`UID`, `token`, `correo`, `expira`) VALUES
(1, 'ab69eaf6fb654987b0dd8e914badc7b3', 'Pruebas', '2019-02-27 17:26:33');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `universidad`
--

CREATE TABLE `universidad` (
  `UID` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `descripcion` mediumtext NOT NULL,
  `lat` varchar(72) NOT NULL,
  `lng` varchar(72) NOT NULL,
  `foto_url` varchar(300) DEFAULT NULL,
  `foto_autor` varchar(70) NOT NULL,
  `ciudad` varchar(72) NOT NULL,
  `id_institutucion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `universidad`
--

INSERT INTO `universidad` (`UID`, `nombre`, `descripcion`, `lat`, `lng`, `foto_url`, `foto_autor`, `ciudad`, `id_institutucion`) VALUES
(4, 'Facultad de Odontología', 'Actualmente, la infraestructura del edificio principal, que sustenta la labor docente, lo constituyen 15 clínicas con 382 unidades dentales, 15 aparatos de rayos X, un ortopantomógrafo, 81 simuladores preclínicos, nueve laboratorios, 15 aulas, tres aulas-laboratorio, dos laboratorios de cómputo, una mediateca, una sala de videoconferencias y una biblioteca, entre otras áreas, con una superficie construida de 31,606 m2, que junto con la de posgrado y clínicas periféricas representa un total de 46,102 m2.', '19.334544', '-99.181444', 'http://www.odonto.unam.mx/pubg/img3923_copiar.jpg', 'Facultad de Odontología UNAM', 'Ciudad de México', 1),
(7, 'Unidad Profesional Interdisciplinaria de Ingeniería Campus Zacatecas', 'Actualmente, la UPIIZ cuenta con 75 docentes y 22 técnicos docentes (todos ellos con nivel de posgrado), de la más alta calidad académica, como lo avala no solo su quehacer cotidiano en la formación de nuestro alumnado, sino los proyectos de investigación que se desarrollan en la Unidad. En sus 8 años de existencia la UPIIZ ha cosechado importantes logros. De ella  han egresado tres generaciones de Ingeniería en Sistemas Computacionales; Ingeniería en Alimentos; Ingeniería Mecatrónica; y cuatro generaciones de Ingeniería Ambiental; mientras la primera generación de Ingeniería Metalúrgica egresará en diciembre de 2018.', '22.7839529', '-102.6157299', 'http://ntrzacatecas.com/content/uploads/2015/11/ipn-7-1000x586.jpg', 'Abigail Salinas | NTR Zacatecas', 'Zacatecas', 2),
(9, 'Unidad Académica de Ciencias Biológicas', 'La Unidad Académica de Ciencias Biológicas, inició sus actividades el 26 de Enero de 1986 como un Centro Universitario de Investigación y Docencia, donde prevalecía la idea central de la multidisciplina con la conjunción de una masa crítica de profesionales en distintas áreas del conocimiento por lo que se congregaron 16 investigadores del área biológica adscritos a diferentes Centros de Investigación de la Universidad Autónoma de Zacatecas como: El Centro de Estudios Ecológicos y de la Salud y Centro de Investigaciones Biomédicas de la Escuela de Medicina (Laboratorio de Inmunología, Laboratorio de Parasitología y Laboratorio de Farmacología) cuyo objetivo común fue desarrollar un Programa de Investigación en el área de las Ciencias Naturales. Posteriormente en el año de 1990 tomando como base las líneas de investigación, el H. Consejo Universitario avaló el cambio de nombre por el de Centro de Biología Experimental.', '22.7701418', '-102.558922', 'https://i1.wp.com/ljz.mx/wp-content/uploads/2017/08/la-jornada-zacatecas-unidad-academica-ciencias-biologicas_mc.jpg?fit=1280%2C720', 'Martín Catalán Lerma', 'Zacatecas', 6),
(11, 'Facultad de Arquitectura', 'Con una tradición de más de dos siglos, en sus aulas se ha formado la mayoría de los mejores arquitectos del país, algunos de ellos de reconocida fama internacional, por lo que la Facultad ha tenido y tiene un papel relevante en la construcción de la Arquitectura Nacional.\r\n<br>Encamina sus esfuerzos cotidianamente para lograr acrecentar el conocimiento, enriquecer la cultura y promover la pluralidad en sus cuatro licenciaturas. Asimismo, brinda un programa de estudios de posgrado de alto nivel en las áreas de Arquitectura, Diseño Industrial y Urbanismo, el cual permite a sus egresados contar con una excelente formación y un mayor conocimiento de la disciplina, pero sobre todo, contribuir al conocimiento y al desarrollo del país y de la sociedad  mexicana.\r\n<br>Gracias a su infraestructura, la comunidad de alumnos, docentes e investigadores puede acceder a una óptima formación, ya que en sus espacios se generan la academia, la investigación y la cultura. Sus instalaciones incluyen aulas, talleres, biblioteca y centros de documentación y cómputo, además del emblemático Teatro Carlos Lazo, sede del Taller Coreográfico de la UNAM y de otras expresiones culturales que incluyen teatro y muestras de cine.', '19.3311658', '-99.1865181', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f9/Facultad_de_Arquitectura.jpg/1200px-Facultad_de_Arquitectura.jpg', 'GAED | Wikipedia', 'Ciudad de México', 1),
(12, 'Facultad de Artes y Diseño', 'La Facultad de Artes y Diseño es la escuela de arte más importante en América: ha formado desde hace 227 años a los artistas de este país y es la única donde se preparan en la interdisciplina artistas visuales y diseñadores de la comunicación visual.<br>\r\n\r\nCuenta con la infraestructura y el equipamiento de más alto rango a nivel nacional para la enseñanza de las artes y el diseño, y participa en programas y proyectos de la propia Universidad, así como con escuelas de arte y diseño de México y del extranjero.<br>\r\n\r\nEn ella se imparte un destacado programa de posgrado que incluye la creación de tres nuevas maestrías: Diseño y Comunicación Visual, Docencia en Artes y Diseño, y Estudios de Cine Documental.\r\n<br>\r\nCuenta con tres campus para el desarrollo de la experimentación, la investigación y la producción de las artes visuales y del diseño y la comunicación visual: la Facultad de Artes y Diseño, ubicada en Xochimilco, la Academia de San Carlos, en el Centro Histórico y el campus Taxco, en Taxco, Guerrero.', '19.251976', '-99.118267', 'http://www.oferta.unam.mx/plantel/archivos//enap.jpg', 'Universidad Nacional Autónoma de México', 'Ciudad de México', 1),
(13, 'Facultad de Ciencias', 'La Facultad de Ciencias tiene como fines formar científicos en las áreas Físico-Matemáticas y de las Ingenierías, y de las Ciencias Biológicas, Químicas y de la Salud; realizar investigación y hacer la divulgación que permita elevar sustancialmente la cultura científica del país. Es reconocida como una de las instituciones líder en la formación de científicos debido a la alta calidad de sus actividades, productos y servicios; a la fortaleza y productividad de sus vínculos con los distintos sectores sociales y económicos del país.\r\n<br>', '19.3234472', '-99.1796417', 'http://static.panoramio.com/photos/original/24185729.jpg', 'Mapio.net', 'Ciudad de México', 1),
(14, 'Facultad de Ciencias Políticas y Sociales', 'Institución respaldada por una planta académica de primer nivel, cuyos miembros poseen estudios de posgrado, pertenecen al Sistema Nacional de Investigadores o han sido merecedores a diversos reconocimientos académicos; sin dejar de mencionar su presencia significativa ante la opinión pública a través de sus aportaciones periodísticas en diarios y revistas de circulación nacional.\r\n\r\n \r\n<br>\r\nLas investigaciones en Ciencias Sociales que desarrolla la FCPYS la han llevado a ser reconocida como una Facultad de excelencia, en donde se forman profesionistas, maestros e investigadores capaces de analizar lo procesos histórico-sociales contemporáneos y, sobre todo, plantear soluciones a éstos.', '19.319352', '-99.17853', 'http://www.oferta.unam.mx/plantel/archivos//fcpys.jpg', 'Universidad Nacional Autónoma de México', 'Ciudad de México', 1),
(15, 'Facultad de Contaduría y Administración', 'Forma profesionales, profesores e investigadores de la contaduría, la administración y la informática, quienes contribuyen al desarrollo económico del país mediante la solución de los problemas prácticos que enfrentan las empresas y las organizaciones.\r\n<br><br>\r\nEn la Facultad se realiza investigación orientada a la generación del conocimiento de estas disciplinas; entre los miembros de su comunidad se cultiva el análisis y la crítica, y cuentan con las herramientas técnicas que les permiten ser altamente competitivos en los planos nacional e internacional.', '19.3241822', '-99.184575', 'https://i.pinimg.com/736x/9a/bf/9b/9abf9b5c30b6effa1052f659fcbf7005--marketing-digital-cancun.jpg', 'Arturo Gallardo', 'Ciudad de México', 1),
(16, 'Facultad de Derecho', 'En la Facultad de Derecho se da la pluralidad del conocimiento y la libertad de pensar; al mismo tiempo, el estudiante obtiene una educación de excelencia, ya que se encuentra con la planta académica más calificada del país y obtiene, a partir de esa misma libertad y responsabilidad, una visión amplia del fenómeno jurídico y de sus implicaciones valorativas.\r\n<br><br>\r\nLa Facultad de Derecho es la institución de más tradición, fuerza intelectual y de trascendencia del panorama de la educación superior en México; de sus aulas han egresado personalidades de reconocido prestigio, así como numerosos premios nacionales e internacionales, además ha obtenido la certificación de calidad, expedida por el Consejo para la Acreditación de los Estudios de Derecho.', '19.333316', '-99.185922', 'https://facultaddederechounamblog.files.wordpress.com/2016/09/p1010009.jpg', 'LIC. María de Lourdes García Ruiz', 'Ciudad de México', 1),
(17, 'Facultad de Economía', 'En las aulas de la Facultad de Economía se han formado varias generaciones de destacados economistas, quienes no sólo han jugado un papel importante en el ámbito profesional de su competencia, sino que además han participado con alternativas y propuestas a la solución de los problemas nacionales.\r\n<br><br>\r\nEl papel desempeñado por la Facultad dentro de la política económica y financiera durante los últimos veinte años ha sido indispensable.\r\n<br><br>\r\nLos diversos galardones que le han sido otorgados a sus académicos dan cuenta de su nivel de excelencia como institución educativa además de que el Sistema Nacional de Investigadores ha reconocido a más de treinta de sus miembros.', '19.334854', '-99.183575', 'http://static.panoramio.com/photos/original/8609904.jpg', 'Mapio.net', 'Ciudad de México', 1),
(18, 'Facultad de Estudios Superiores Acatlán', 'La Facultad de Estudios Superiores Acatlán está considerada como uno de los centros académico-culturales más importantes de la zona noroeste del área metropolitana y uno de los espacios alternativos a Ciudad Universitaria. Con 40 años de vida, promueve un amplio abanico de opciones curriculares y de desarrollo humano. Actualmente cuenta con los niveles de calidad más altos en todos sus programas educativos, lo que garantiza la calidad en el desempeño de sus egresados.\r\n<br><br>\r\nEn la búsqueda de formar profesionales altamente capacitados y especializados, brinda diversos posgrados con carácter multidisciplinario en diferentes disciplinas –Derecho, Economía, Ciencias Políticas y Sociales, Relaciones Internacionales, Ingeniería, Urbanismo y Educación.', '19.483990', '-99.246369', 'http://www.planoinformativo.com/stock12/image/2015/Mayo/10/FES-Acatlan2.jpg', 'Notimex | Plano Informativo', 'Ciudad de México', 1),
(19, 'Facultad de Estudios Superiores Aragón', 'Forma profesionistas en las áreas de las Ciencias Sociales, las Humanidades, las Artes, y las Ciencias Físico-Matemáticas y las Ingenierías con una visión  integral. Ha logrado posicionarse como una institución de gran solidez en la preparación de sus egresados, a través de la docencia, la investigación multidisciplinaria, la difusión cultural y la práctica deportiva.\r\n<br>\r\nEl desarrollo y fortalecimiento académico han sido impulsados favorablemente a través de los estudios de posgrado que imparte la Facultad, reconocidos por su calidad y excelencia. La oferta académica de posgrado incluye estudios en las áreas de Derecho, Economía, Arquitectura, Ingeniería Civil y Pedagogía.', '19.476618', '-99.044569', 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0d/Facultad_de_Estudios_Superiores_Arag%C3%B3n_2.jpg/1280px-Facultad_de_Estudios_Superiores_Arag%C3%B3n_2.jpg', 'ProtoplasmaKid | Wikimedia Commons', 'Ciudad de México', 1),
(22, 'Facultad de Odontología', 'asdasd', '123', '122.99999997', 'screen_1920x1080_2018-02-05_19-42-59.232.png', 'asdasd', 'Baja California', 2),
(23, 'Facultad de Odontología', 'asdasd', '123', '122.99999997', 'screen_1920x1080_2018-02-05_19-42-59.232.png', 'asdasd', 'Baja California', 2),
(24, 'Facultad de Arquitectura', 'asdasd', '123', '122.99999997', 'screen_1920x1080_2018-02-05_19-42-59.232.png', 'asd', 'Baja California Sur', 2),
(25, 'Unidad Académica de Ciencias Biológicas', 'asdasd', '123', '122.99999994', 'http://php.net/manual/en/images/e88cefb5c3fca5060e2490b9763c4433-readfile.png', 'asdasd', 'Baja California', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `UID` varchar(40) NOT NULL,
  `email` varchar(72) NOT NULL,
  `pass` varchar(40) NOT NULL,
  `name` varchar(72) NOT NULL,
  `last_name` varchar(90) NOT NULL,
  `edad` int(72) NOT NULL,
  `ciudad` varchar(72) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`UID`, `email`, `pass`, `name`, `last_name`, `edad`, `ciudad`) VALUES
('15584d890f9cd2413fa85ed5bbc78583691eca32', 'ramiroestradag@gmail.com', '57f96f53b891f28dfabad52690b01325ea6db41e', 'ram', 'nsksks', 10, ''),
('4d09640e908161ae1c2098e0fcadb73d91a4b304', 'prueba@prue.com', 'ef163fb6406c786402863dc6fb56472c53e85eda', 'Ramiro', 'Estrada Garcia', 18, 'Zacatecas'),
('885a5a6e26f1d9b3efaf99f828d7b30751137082', 'thedaniel115@gmail.com', 'dc940ac29dcd634b9a9c02bff67a00f8024ab931', 'Daniel', 'Garnica', 19, 'Puebla'),
('f050f159e1d97092583e9a5b6813607b81ee7aab', 'ramiroestradag@hotmail.com', '7d3a41288556d50a876b89f3e5251be78e7823da', 'jdksks', 'ndjdj', 10, 'Aguascalientes');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `aplicacion_examen`
--
ALTER TABLE `aplicacion_examen`
  ADD PRIMARY KEY (`UID`),
  ADD KEY `id_examen` (`id_examen`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_resultado` (`id_resultado`);

--
-- Indices de la tabla `area`
--
ALTER TABLE `area`
  ADD PRIMARY KEY (`UID`);

--
-- Indices de la tabla `carrera_area`
--
ALTER TABLE `carrera_area`
  ADD PRIMARY KEY (`UID`),
  ADD KEY `id_carrera` (`id_carrera`),
  ADD KEY `id_area` (`id_area`);

--
-- Indices de la tabla `carrera_info`
--
ALTER TABLE `carrera_info`
  ADD PRIMARY KEY (`UID`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `carrera_uni`
--
ALTER TABLE `carrera_uni`
  ADD PRIMARY KEY (`UID`),
  ADD KEY `id_carrera` (`id_carrera`),
  ADD KEY `id_universidad` (`id_universidad`);

--
-- Indices de la tabla `examen`
--
ALTER TABLE `examen`
  ADD PRIMARY KEY (`UID`);

--
-- Indices de la tabla `institucion`
--
ALTER TABLE `institucion`
  ADD PRIMARY KEY (`UID`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `pregunta`
--
ALTER TABLE `pregunta`
  ADD PRIMARY KEY (`UID`),
  ADD KEY `pregunta_ibfk_1` (`id_examen`);

--
-- Indices de la tabla `respuesta`
--
ALTER TABLE `respuesta`
  ADD PRIMARY KEY (`UID`),
  ADD KEY `id_pregunta` (`id_pregunta`),
  ADD KEY `pregunta_ibfk_2` (`id_area`);

--
-- Indices de la tabla `sesion_agregar_unis`
--
ALTER TABLE `sesion_agregar_unis`
  ADD PRIMARY KEY (`UID`),
  ADD UNIQUE KEY `token` (`token`);

--
-- Indices de la tabla `universidad`
--
ALTER TABLE `universidad`
  ADD PRIMARY KEY (`UID`),
  ADD KEY `id_institutucion` (`id_institutucion`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`UID`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `aplicacion_examen`
--
ALTER TABLE `aplicacion_examen`
  MODIFY `UID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `area`
--
ALTER TABLE `area`
  MODIFY `UID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `carrera_area`
--
ALTER TABLE `carrera_area`
  MODIFY `UID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `carrera_info`
--
ALTER TABLE `carrera_info`
  MODIFY `UID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT de la tabla `carrera_uni`
--
ALTER TABLE `carrera_uni`
  MODIFY `UID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT de la tabla `examen`
--
ALTER TABLE `examen`
  MODIFY `UID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `institucion`
--
ALTER TABLE `institucion`
  MODIFY `UID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `pregunta`
--
ALTER TABLE `pregunta`
  MODIFY `UID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de la tabla `respuesta`
--
ALTER TABLE `respuesta`
  MODIFY `UID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `aplicacion_examen`
--
ALTER TABLE `aplicacion_examen`
  ADD CONSTRAINT `aplicacion_examen_ibfk_1` FOREIGN KEY (`id_examen`) REFERENCES `examen` (`UID`),
  ADD CONSTRAINT `aplicacion_examen_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `usuario` (`UID`),
  ADD CONSTRAINT `aplicacion_examen_ibfk_3` FOREIGN KEY (`id_resultado`) REFERENCES `area` (`UID`);

--
-- Filtros para la tabla `carrera_area`
--
ALTER TABLE `carrera_area`
  ADD CONSTRAINT `carrera_area_ibfk_1` FOREIGN KEY (`id_carrera`) REFERENCES `carrera_info` (`UID`),
  ADD CONSTRAINT `carrera_area_ibfk_2` FOREIGN KEY (`id_area`) REFERENCES `area` (`UID`);

--
-- Filtros para la tabla `carrera_uni`
--
ALTER TABLE `carrera_uni`
  ADD CONSTRAINT `carrera_uni_ibfk_1` FOREIGN KEY (`id_carrera`) REFERENCES `carrera_info` (`UID`),
  ADD CONSTRAINT `carrera_uni_ibfk_2` FOREIGN KEY (`id_universidad`) REFERENCES `universidad` (`UID`);

--
-- Filtros para la tabla `pregunta`
--
ALTER TABLE `pregunta`
  ADD CONSTRAINT `pregunta_ibfk_1` FOREIGN KEY (`id_examen`) REFERENCES `examen` (`UID`);

--
-- Filtros para la tabla `respuesta`
--
ALTER TABLE `respuesta`
  ADD CONSTRAINT `pregunta_ibfk_2` FOREIGN KEY (`id_area`) REFERENCES `area` (`UID`),
  ADD CONSTRAINT `respuesta_ibfk_1` FOREIGN KEY (`id_pregunta`) REFERENCES `pregunta` (`UID`);

--
-- Filtros para la tabla `universidad`
--
ALTER TABLE `universidad`
  ADD CONSTRAINT `universidad_ibfk_1` FOREIGN KEY (`id_institutucion`) REFERENCES `institucion` (`UID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
