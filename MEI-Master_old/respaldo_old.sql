-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-12-2017 a las 06:22:51
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
-- Base de datos: `id1181196_mei`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aplicacion_examen`
--

CREATE TABLE `aplicacion_examen` (
  `id` int(20) NOT NULL,
  `IdExamen` int(20) NOT NULL,
  `UsrEmail` varchar(72) COLLATE latin1_spanish_ci NOT NULL,
  `fecha` date NOT NULL,
  `resultado` varchar(40) COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `aplicacion_examen`
--

INSERT INTO `aplicacion_examen` (`id`, `IdExamen`, `UsrEmail`, `fecha`, `resultado`) VALUES
(41, 1, 'prueba@prue.com', '2017-11-09', 'Ingeniería'),
(42, 1, 'prueba@prue.com', '2017-11-09', 'Ingeniería'),
(43, 1, 'PRUEBA@PRUE.COM', '2017-11-09', 'Sociales'),
(44, 1, 'PRUEBA@PRUE.COM', '2017-11-09', 'Ingeniería'),
(45, 1, 'PRUEBA@PRUE.COM', '2017-11-09', 'Ingeniería'),
(46, 1, 'PRUEBA@PRUE.COM', '2017-11-09', 'Ingeniería'),
(47, 1, 'PRUEBA@PRUE.COM', '2017-11-09', 'Humanidades'),
(48, 1, 'PRUEBA@PRUE.COM', '2017-11-09', 'Ingeniería'),
(49, 1, 'PRUEBA@PRUE.COM', '2017-11-09', 'Ingeniería'),
(50, 1, 'PRUEBA@PRUE.COM', '2017-11-09', 'Biológicas'),
(51, 1, 'PRUEBA@PRUE.COM', '2017-11-09', 'Ingeniería'),
(52, 1, 'PRUEBA@PRUE.COM', '2017-11-09', 'Biológicas'),
(53, 1, 'PRUEBA@PRUE.COM', '2017-11-09', 'Sociales'),
(54, 1, 'PRUEBA@PRUE.COM', '2017-11-09', 'Sociales'),
(55, 1, 'PRUEBA@PRUE.COM', '2017-11-09', 'Ingeniería'),
(56, 1, 'PRUEBA@PRUE.COM', '2017-11-09', 'Ingeniería'),
(57, 1, 'PRUEBA@PRUE.COM', '2017-11-09', 'Biológicas'),
(58, 1, 'PRUEBA@PRUE.COM', '2017-11-10', 'Humanidades'),
(59, 1, 'PRUEBA@PRUE.COM', '2017-11-10', 'Sociales'),
(60, 1, 'PRUEBA@PRUE.COM', '2017-11-10', 'Sociales'),
(61, 1, 'PRUEBA@PRUE.COM', '2017-11-10', 'Sociales'),
(62, 1, 'PRUEBA@PRUE.COM', '2017-11-10', 'Ingeniería'),
(63, 1, 'PRUEBA@PRUE.COM', '2017-11-10', 'Biológicas'),
(64, 1, 'PRUEBA@PRUE.COM', '2017-11-10', 'Ingeniería'),
(65, 1, 'PRUEBA@PRUE.COM', '2017-11-10', 'Humanidades'),
(66, 1, 'PRUEBA@PRUE.COM', '2017-11-10', 'Ingeniería'),
(67, 1, 'PRUEBA@PRUE.COM', '2017-11-10', 'Biológicas'),
(68, 1, 'PRUEBA@PRUE.COM', '2017-11-10', 'Biológicas'),
(69, 1, 'PRUEBA@PRUE.COM', '2017-11-10', 'Ingeniería'),
(70, 1, 'PRUEBA@PRUE.COM', '2017-11-10', 'Ingeniería'),
(71, 1, 'prueba@prue.com', '2017-11-17', 'Ingeniería'),
(72, 1, 'prueba@prue.com', '2017-11-17', 'Sociales'),
(73, 1, 'prueba@prue.com', '2017-11-17', 'Ingeniería'),
(74, 1, 'prueba@prue.com', '2017-11-17', 'Sociales'),
(75, 1, 'prueba@prue.com', '2017-11-17', 'Ingeniería'),
(76, 1, 'oscar_wiifan@hotmail.com', '2017-11-20', 'Biológicas'),
(77, 1, 'prueba@prue.com', '2017-12-14', 'Ingeniería'),
(78, 1, 'prueba@prue.com', '2017-12-14', 'Biológicas'),
(79, 1, 'prueba@prue.com', '2017-12-14', 'Sociales'),
(80, 1, 'prueba@prue.com', '2017-12-14', 'Biológicas'),
(81, 1, 'prueba@prue.com', '2017-12-14', 'Ingeniería'),
(82, 1, 'prueba@prue.com', '2017-12-14', 'Ingeniería'),
(83, 1, 'prueba@prue.com', '2017-12-14', 'Sociales'),
(84, 1, 'prueba@prue.com', '2017-12-14', 'Sociales'),
(85, 1, 'prueba@prue.com', '2017-12-14', 'Ingeniería');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `areas`
--

CREATE TABLE `areas` (
  `nombre` varchar(72) COLLATE latin1_spanish_ci NOT NULL,
  `descripcion` mediumtext COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `areas`
--

INSERT INTO `areas` (`nombre`, `descripcion`) VALUES
('Biológicas ', 'Las ciencias biológicas son aquellas que se dedican a estudiar la vida y sus procesos. Se trata de una rama de las ciencias naturales que investiga el origen, la evolución y las propiedades de los seres vivos.\r\n'),
('Humanidades', 'Relacion con las humanidades'),
('Ingeniería', 'La ingeniería es el conjunto de conocimientos científicos y tecnológicos para la innovación, invención, desarrollo y mejoramiento de técnicas y herramientas para satisfacer las necesidades de las empresas y la sociedad.\r\nEl ingeniero utiliza las matemáticas, las matemáticas aplicadas, la física, química y otras ciencias tanto para el desarrollo de tecnologías, como para el manejo eficiente y productivo de recursos y fuerzas de la naturaleza en beneficio de la sociedad. La ingeniería es una actividad que transforma el conocimiento en algo práctico.\r\nLa ingeniería aplica los conocimientos y métodos científicos a la invención o perfeccionamiento de tecnologías de manera pragmática y ágil, adecuándose a las limitaciones de tiempo, recursos, requerimientos legales, requerimientos de seguridad, ecológicos, etc.\r\n'),
('Sociales', 'Relacion con las sociales');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carreras`
--

CREATE TABLE `carreras` (
  `AreaNombre` varchar(72) COLLATE latin1_spanish_ci NOT NULL,
  `NombreUni` varchar(150) COLLATE latin1_spanish_ci NOT NULL,
  `nombre` varchar(72) COLLATE latin1_spanish_ci NOT NULL,
  `descripcion` mediumtext COLLATE latin1_spanish_ci NOT NULL,
  `planestudios` mediumtext COLLATE latin1_spanish_ci NOT NULL,
  `intercambio` mediumtext COLLATE latin1_spanish_ci NOT NULL,
  `perfilegreso` mediumtext COLLATE latin1_spanish_ci NOT NULL,
  `keywords` text COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `carreras`
--

INSERT INTO `carreras` (`AreaNombre`, `NombreUni`, `nombre`, `descripcion`, `planestudios`, `intercambio`, `perfilegreso`, `keywords`) VALUES
('Biológicas', 'Facultad de Odontología', 'Cirujano Dentista', 'La licenciatura de Cirujano Dentista forma profesionistas capaces de resolver las necesidades de salud bucodental de la población, mediante un criterio clínico integral. Su labor se enfoca hacia la solución de: caries dental, enfermedad periodontal (tejidos de sostén del diente), malposiciones dentarias, alteraciones de la articulación temporomandibular, cáncer bucal y malformaciones de labio y paladar.', 'Toda la información relacionada al plan de estudios está <a href=\"http://oferta.unam.mx/carrera/archivos/planes/cdentista-fodontologia-planestudios15.pdf\">aquí</a>', 'Ser becario de movilidad internacional no es un derecho de todo estudiante universitario sino una distinción que sólo obtienen algunos de los mejores alumnos de la UNAM. El perfil de estos alumnos de alta calidad está asociado a un promedio alto en sus calificaciones, regularidad en sus estudios, disciplina en sus procedimientos, aptitud excepcional en sus proyectos académicos, disposición a regresar a México para insertarse al ámbito laboral o académico y, muy frecuentemente, dominio de una lengua extranjera. Adicionalmente, cuando también hay un apoyo económico, es porque el perfil socioeconómico del alumno de excelencia lo sugiere.Más información <a href=\"http://www.global.unam.mx/es/movi_alumnos/para_participar_me.html?panel=2\">aquí<a><br>', 'Los egresados de la Facultad de Odontología poseen conocimientos científicos, habilidades técnicas y actitudes humanísticas para conservar y mantener la salud bucal de las personas, bajo una concepción vinculada con la realidad del país.\r\nPredomina en su práctica la prevención, lo que permite atender los problemas de inequidad, costo e inaccesibilidad que prevalecen en más del 50% de la población mexicana.<br>\r\nEste perfil lo respalda la sólida formación científica, tecnológica y clínica que ofrece esta Facultad, lo que le permite al egresado emitir un diagnóstico integral e instituir un plan de tratamiento completo, atendiendo todas las fases que implica una práctica profesional responsable y humanística, bajo una concepción amplia del proceso de salud-enfermedad, y aplicando todas las áreas de la odontología.\r\nEn términos generales, el egresado de la carrera será capaz de trabajar en distintos modelos de servicios de salud e identificar las características biopsicosociales del individuo.', 'ciencias,biológicas,salud,unam,odontología,dentista'),
('Ingeniería', 'Facultad de Ingeniería', 'Ingeniería Civil', '<p>La ingeniería civil es una disciplina que emplea diversos conocimientos de cálculo, mecánica de suelos, física y química para diseñar, construir y dar mantenimiento a las estructuras del entorno, entre las que se encuentran carreteras, edificios, puentes, túneles, entre otras construcciones.</p>\r\n<p>En la actualidad, el programa  de ingeniería civil es el resultado de las modificaciones a los planes de estudio llevados a cabo en los años año 2003, 2008 y 2010.</p>', 'Toda la información relacionada al plan de estudios está <a href=\"http://www.uaq.mx/ofertaeducativa/prog-ingenieria/FING-mapa-Ingenieria-Civil.pdf\">aquí</a>.', 'La UAQ cuenta con la Dirección de Cooperación y Movilidad Académica, la cual se encarga de planificar, gestionar y coordinar las relaciones de cooperación académica, así como facilitar los procesos de intercambio y movilidad. Para más información acceda <a href=\"http://movilidad.uaq.mx/\">aquí</a>.', '<ul>\r\n<li>Aplicarán el conocimiento de las matemáticas básicas y avanzadas, de las ciencias químicas, físicas, entre otras; y de la ingeniería civil, conforme al plan de estudios; así como desarrollará su capacidad para diseñar y conducir experimentos, de analizar y de interpretar datos.</li>\r\n<li>Serán capaces de diseñar un sistema, un componente, o un proceso para subsanar las necesidades económicas, ambientales, sociales, políticas, éticas, salubres, de seguridad, manufactura y sustentabilidad.</li>\r\n<li>Será capaz de interactuar en equipos multidisciplinarios, para contribuir, y funcionar adecuadamente en una empresa en equipos, en puestos directivos y en puestos no relacionados con la dirección.</li>\r\n<li>Será capaz de identificar, formular, y solucionar problemas asociados a la ingeniería civil; y desarrollará una capacidad para utilizar las técnicas, las habilidades, y las herramientas modernas de la ingeniería civil, necesarias para la práctica de esta profesión. Mostrará una actitud ética profesional, integra y responsable.</li>\r\n<li>Será capaz de comunicarse con eficacia en los formatos escritos, orales, gráficos y matemáticos apropiados tanto en español como primer idioma, como en inglés como segundo idioma.</li>\r\n<li>Comprenderá el impacto de la intervención desde la ingeniería en un contexto global, económico, ambiental, y social. Desarrollará la conciencia acerca de la necesidad individual de continuar su aprendizaje a través de una enseñanza convencional o por otros medios.</li>\r\n</ul>\r\nPara ver el Perfil de Egreso completo, ingrese <a hrerf=\"http://www.uaq.mx/index.php/carreras/licenciaturas/fi/ingenieria-civil\">aquí</a>.', 'construcción,física,matemáticas,equipo,diseño,estructuras'),
('Ingeniería', 'Facultad de Ingeniería', 'Ingeniería en Automatización', '<p>La Ingeniería en Automatización es una rama de la ingeniería que aplica la integración de tecnologías de vanguardia que son utilizadas en el campo de la automatización y el control automático industrial, las cuales son complementadas con disciplinas paralelas al área tales como los sistemas de control y supervisión de datos, la instrumentación industrial, el control de procesos y las redes de comunicación industrial.</p>\r\n<p>La carrera en Ingeniería en Automatización está calificada por el Consejo de Acreditación de la Enseñanza de la Ingeniería (CACEI). Tiene una matrícula de profesores altamente capacitados entre los cuales se encuentran docentes en el Sistema Nacional de Investigadores.</p>', 'Toda la información relacionada al plan de estudios está <a href=\"http://ingenieria.uaq.mx/web/files/educacion/eduLicen/ingAuto/automatizacionPC/index.html\">aquí</a>.', 'La UAQ cuenta con la Dirección de Cooperación y Movilidad Académica, la cual se encarga de planificar, gestionar y coordinar las relaciones de cooperación académica, así como facilitar los procesos de intercambio y movilidad. Para más información acceda <a href=\"http://movilidad.uaq.mx/\">aquí</a>.', '<p>1) Aplicar con éxito las herramientas y conocimientos de la ingeniería para analizar y resolver problemas en Ingeniería.</p>\r\n<p>2) Administrar, aplicar y desarrollar efectivamente sus conocimientos de Ingeniería, TICs y ciencias en proyectos sociales, de investigación y de aplicación en industria.</p>\r\n<p>3) Liderar con éxito en el campo de la ingeniería e investigación.</p>\r\n<p>4) Comunicarse eficientemente con otros profesionistas y trabajar en equipos multidisciplinarios.</p>\r\n<p>5) Concientemente valore y respete los problemas de la actualidad reconociendo las diferencias individuales y culturales basándose en principios profesionales éticos y apegándose a los criterios y normas de calidad para impulsar el desarrollo sustentable.</p>', 'ingeniería,electrónica,física,matemáticas,automotriz,manufactura,industría,control,automatización'),
('Biológicas', 'Facultad de Química', 'Ingeniería en Biotecnología ', '<p>La ingeniería en biotecnología es la rama de la ingeniería encargada de la aplicación tecnológica de los sistemas biológicos y organismos vivos -o sus derivados- para la creación o modificación de productos o procesos para un uso específico. Para esto, se llevan a cabo conocimientos sobre ciencias básicas, de formación biotecnológica, y de la comunicación, pertinentes para el desarrollo de procesos biotecnológicos y para el uso sustentable de los recursos naturales. Así mismo se hace uso de la ingeniería de producción y recuperación de productos biotecnológicos.', 'Toda la información relacionada al plan de estudios está <a href=\"http://quimica.uaq.mx/index.php/programas/licenciaturas/vigentes/ingeniero-en-biotecnologia-plan-2012/mapa-ib\">aquí</a>.', 'La UAQ cuenta con la Dirección de Cooperación y Movilidad Académica, la cual se encarga de planificar, gestionar y coordinar las relaciones de cooperación académica, así como facilitar los procesos de intercambio y movilidad. Para más información acceda <a href=\"http://movilidad.uaq.mx/\">aquí</a>.', '<p>El Ingeniero en Biotecnología tendrá una sólida formación académica complementada con entrenamiento práctico en los aspectos básicos, así como en alguna de las áreas de formación biotecnológica terminal que incluyen la agropecuaria, salud, alimentos y ambiental, por lo que estará capacitado para desarrollar, diseñar, innovar, integrar y aplicar técnicas de biotecnología en el área respectiva.</p>\r\n<p>El egresado estará preparado para asumir los retos en el ejercicio de la Biotecnología, con orientación en alguna de las áreas terminales que se ofrecen en este PE. Habrá adquirido habilidades instrumentales, así como experiencia en los sectores industrial y de investigación relacionados con la biotecnología.</p>', 'industria,ambiente,ciencias,naturales,productos,genética,calidad,sanidad,bioseguridad'),
('Ingeniería', 'Unidad Profesional Interdisciplinaria en Ingeniería y Tecnologías Avanzadas', 'Ingeniería en Mecatrónica', 'Formar ingenieros que conozcan, analicen e integren las diferentes disciplinas que conforman a la mecatrónica, para difundir y aplicar conocimiento científico y tecnológico acorde a las necesidades de desarrollo nacional e internacional. Manteniendo una plantilla docente de alto nivel en constante actualización, que funjan como facilitadores del conocimiento y que se encuentren vinculados con los sectores productivos y sociales. Así mismo, contar con un programa académico flexible y un enfoque centrado en el aprendizaje en concordancia con el modelo educativo del Instituto Politécnico Nacional, que permita a los estudiantes construir su propio conocimiento de forma ética y responsable.', 'El objetivo del plan de estudios es formar ingenieros en mecatrónica con las competencias necesarias para resolver problemas de diseño, construcción, mantenimiento, programación y control de sistemas mecatrónicos, desarrollando y aplicando nueva tecnología, con las habilidades necesarias para desarrollar un plan de vida y carrera, conduciéndose con ética, responsabilidad y tolerancia en sus ambientes de desarrollo profesional y personal.', 'Opcional', 'Es un profesional interdisciplinario capaz de diseñar, manufacturar y construir dispositivos y sistemas mecatrónicos, así como automatizar procesos industriales, con dominio de una segunda lengua y la habilidad de integrarse en equipos de trabajo, para desarrollar y emplear nueva tecnología, que esté aplicada de manera ética y responsable en la solución de las necesidades del entorno social y en armonía con el medio ambiente.\r\n', 'Mecatrónica'),
('Ingeniería', 'Unidad Profesional Interdisciplinaria de Ingeniería Campus Zacatecas', 'Ingeniería en Sistemas Computacionales', 'El Ingeniero en Sistemas Computacionales se desempeña en los sectores privado, público, académico y ejercicio libre de la profesión. <br>• Ejercicio libre de la profesión: Prestando de forma independiente sus servicios profesionales a los sectores público y privado. Constituyendo empresas formales que presten sus servicios computacionales a los diversos sectores. <br>• Sector público: Participa automatizando procesos administrativos en entidades gubernamentales en todos sus niveles, así como desarrollando software especializado para satisfacer los requerimientos específicos de dependencias gubernamentales. <br>• Sector privado: Se desempeñan como diseñadores y desarrolladores, líderes y administradores de proyectos computacionales, en empresas de transformación, servicios y comerciales, nacionales e internacionales.', 'Más información <a href=\"http://www.zacatecas.ipn.mx/OfertaEducativa/Documents/programa%20sistemas%20computacionales.pdf\">aquí</a>', 'El IPN ofrece movilidad internacional en más de 30 países al rededor del mundo. Más información <a href=\"http://www.ipn.mx/cca/movilidad/Documents/ALUMNOS-IPN/MOVILIDAD-INTERNACIONAL-NIVEL-SUPERIOR/IDs-MovInt2018-1.pdf\">aquí</a>', '• Conocer las metodologías de desarrollo de software para seleccionar la adecuada en el análisis, diseño, desarrollo e implementación de un sistema computacional. • Conocer las normas y estándares de calidad, nacionales e internacionales para el desarrollo de sistemas computacionales. • Conocer los fundamentos de análisis de algoritmos para seleccionar la opción más adecuada en la solución de problemas algorítmicos. • Conocer los modelos de datos para representar la información de una organización. • Conocer los lenguajes de los Sistemas Gestores de Bases de Datos (SGBD) para la definición, manipulación y control de bases de datos. • Conocer las características de las diversas herramientas para la administración de bases de datos. • Describir los distintos tipos de redes, protocolos y esquemas de seguridad para garantizar el intercambio de información de manera confiable. • Conocer las características de los paradigmas de programación para el desarrollo de un sistema computacional. • Conocer las tecnologías de Internet para el desarrollo de aplicaciones Web. • Conocer las metodologías para el desarrollo de software embebido. • Identificar los distintos dispositivos lógicos programables para ofrecer soluciones de circuitos lógicos para una aplicación especifica.', 'sistemas,programación,ingeniería,IPN,computacional'),
('Sociales', 'Centro de Investigación y Docencia Económicas', 'Licenciatura en Ciencia Política y Relaciones Internacionales', 'Esta licenciatura se caracteriza por la aplicación de una perspectiva interdisciplinaria, la utilización de métodos cuantitativos y cualitativos y su compromiso social para interpretar la realidad nacional y global, particularmente, lo que se refiere a procesos políticos y económicos. Este programa se basa en la idea de que un buen politólogo es aquel que conoce los efectos del sistema internacional en el sistema político nacional y un buen internacionalista es aquel que entiende el funcionamiento del sistema político interno y su vinculación con el exterior.', 'Está estructurado en tres grandes bloques:\r\n\r\nToral: conformado por cursos teóricos y prácticos para brindar una sólida formación en los contenidos centrales de la Ciencia Política y las Relaciones Internacionales.\r\n\r\nInterdisciplinario: conformado por cursos para desarrollar una visión interdisciplinaria a través del conocimiento básico de otras disciplinas, tales como Administración Pública, Derecho, Economía, Historia y Sociología.\r\n\r\nMetodológico: conformado por cursos para proveer herramientas cuantitativas y cualitativas con el objetivo de desarrollar las habilidades de razonamiento crítico y argumentación.\r\n\r\nEl plan de estudios de la Licenciatura en Ciencia Política y Relaciones Internacionales está conformado por 40 materias, las cuales se cursan en 8 semestres (5 materias por semestre). A partir del 5º semestre el alumno opta por una de las dos especialidades: Política Comparada o Relaciones Internacionales.', 'Obligatorio. En 6to. semestre', 'Los politólogos e internacionalistas egresados del CIDE se caracterizan por ser profesionales sumamente competitivos, cuyos sólidos conocimientos y habilidades les permiten continuar con estudios de posgrado en las mejores universidades del mundo o insertarse inmediatamente al mercado laboral.\r\nEntre sus cualidades profesionales destacan: las habilidades de argumentación y de expresión verbal y escrita; el dominio de métodos cuantitativos y cualitativos para el análisis y la capacidad para vincular variables de las esferas jurídica, económica y social con el análisis de la realidad política nacional e internacional, así como para explicar fenómenos económicos complejos y proponer soluciones viables.\r\nAl concluir la licenciatura serás capaz de:\r\n• Entender los procesos políticos y sociales en los que México se inserta nacional e internacionalmente.\r\n• Analizar la realidad nacional e internacional de los mexicanos para identificar propuestas de solución a problemas de actualidad.\r\n• Explicar la naturaleza de las instituciones políticas de México y de los fenómenos que se suscitan en el sistema internacional.\r\n• Ejecutar acciones diseñadas para la solución de problemas nacionales e internacionales.', 'CienciaPolítica'),
('Sociales', 'Instituto Tecnológico Autónomo de México', 'Licenciatura en Economía', 'Un economista del ITAM es un especialista en modelos de análisis que permiten comprender como los agentes económicos toman decisiones día a día en todos los ámbitos sociales, ya sea como individuos, como empresa o como país y como parte de un entorno globalizado.', 'El programa de estudios de la Licenciatura en Economía comprende temas de Microeconomía, Macroeconomía, Economía Internacional, Finanzas Públicas, Desarrollo Económico, Organización Industrial, Historia Económica de México, Econometría y Economía Política. De forma adicional, todas las carreras del ITAM tienen materias de tronco común que les permite complementar su formación académica brindándoles una visión interdisciplinaria en áreas como Contaduría, Administración, Filosofía, Derecho, Computación, Estadística y Matemáticas. Finalmente los alumnos de economía deben elegir alguna de las cinco áreas de especialización lo que les permitirá complementar sus conocimientos y habilidades en sus respectivas áreas de interés. Las áreas de concentración que se otorgan son: Fundamentos Económicos, Política Económica, Economía Financiera, Economía Empresarial y Economía y Derecho.', 'Opcional', 'Nuestros egresados se desempeñan en puestos estratégicos de análisis en distintas dependencias públicas y privadas, nacionales e internacionales. Los egresados del ITAM se han colocado en el sector financiero en bancos nacionales e internacionales, casas de bolsa, administradoras de fondos para el retiro y fondos de inversión y empresas de seguros. En el sector privado forman parte de empresas de consumo y de servicio, así como consultorías de alto reconocimiento a nivel nacional e internacional. En el sector público han alcanzado puestos directivos en el Banco de México, el Congreso de la Unión, la Presidencia de la República y diversas Secretarías.', 'Economía'),
('Humanidades', 'Facultad de Filosofía y Letras', 'Licenciatura en Filosofía', 'A través de la enseñanza, la investigación y la difusión de teorías, argumentos y problemas filosóficos, la licenciatura en Filosofía transmite los valores fundamentales de la cultura, gracias a su constante y sistemática reflexión de la realidad –elemento fundamental en esta carrera–, cuestiona las diversas problemáticas de la época actual, desarrolla la conciencia crítica e histórica de la sociedad y contribuye a la formación integral de las personas.', 'El plan de estudios consta de 48 asignaturas: 25 obligatorias y 23 optativas. El total de créditos es de 300, de los\r\ncuales, 168 corresponden a las asignaturas obligatorias y 132 a las optativas.\r\nComprende diez áreas temáticas: Estética, Ética, Filosofía de la Historia y de las Ciencias Sociales, Filosofía del Lenguaje y\r\nFilosofía de la Mente, Filosofía en México y en Latinoamérica, Historia de la Filosofía, Lógica, Metafísica y Ontología, Teoría\r\ndel Conocimiento y Filosofía de la Ciencia y el área de Propedéutica y Método.\r\nCada una de estas áreas contiene por lo menos una asignatura obligatoria que aborda los conocimientos básicos que\r\nproporcionan la formación fundamental, misma que se complementa al elegir las materias optativas, las cuales permiten al\r\nalumno concentrarse en una o varias áreas, de acuerdo con sus intereses académicos.', 'Opcional', 'Al término de sus estudios, el egresado adquirirá una serie de conocimientos, habilidades y aptitudes, entre los que destacan:\r\n\r\nConocimientos\r\n\r\n* Contará con una formación filosófica sistematizada y fundamentada que le permita comprender su entorno socio-cultural.\r\n* Habrá desarrollado una visión crítica de los conceptos centrales, problemas, sistemas, corrientes teóricas y métodos de la filosofía.\r\n* Comprenderá las tesis centrales de la historia de la filosofía.\r\n\r\nHabilidades y aptitudes\r\n\r\n* Tendrá la capacidad de participar en el diseño y ejecución de proyectos en el ámbito de su profesión.\r\n* Realizará reflexiones filosóficas sobre los principales problemas de la humanidad.\r\n* Contará con las habilidades necesarias para colaborar en equipos multidisciplinarios, orientados al estudio y solución de problemas relativos a su área.', 'Filosofía');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `examenes`
--

CREATE TABLE `examenes` (
  `id` int(20) NOT NULL,
  `nombre` varchar(72) COLLATE latin1_spanish_ci NOT NULL,
  `numpreguntas` varchar(72) COLLATE latin1_spanish_ci NOT NULL,
  `tipo` varchar(72) COLLATE latin1_spanish_ci NOT NULL,
  `archivo` varchar(40) COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `examenes`
--

INSERT INTO `examenes` (`id`, `nombre`, `numpreguntas`, `tipo`, `archivo`) VALUES
(1, 'Test vocacional 1', '30', 'general', 'form.php');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `exam_recomendacion`
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
-- Volcado de datos para la tabla `exam_recomendacion`
--

INSERT INTO `exam_recomendacion` (`Id`, `UsrEmail`, `IdExamen`, `AreaNombre`, `NombreUni`, `Id_Aplicacion_Examen`, `Nombre_Carrera`) VALUES
(66, 'prueba@prue.com', 1, 'Ingeniería', 'Facultad de Ingeniería', 41, 'Ingeniería Civil'),
(69, 'prueba@prue.com', 1, 'Ingeniería', 'Unidad Profesional Interdisciplinaria de Ingeniería Campus Zacatecas', 41, 'Ingeniería en Sistemas Computacionales'),
(70, 'prueba@prue.com', 1, 'Ingeniería', 'Facultad de Ingeniería', 42, 'Ingeniería Civil'),
(73, 'prueba@prue.com', 1, 'Ingeniería', 'Unidad Profesional Interdisciplinaria de Ingeniería Campus Zacatecas', 42, 'Ingeniería en Sistemas Computacionales'),
(74, 'PRUEBA@PRUE.COM', 1, 'Sociales', 'Centro de Investigación y Docencia Económicas', 43, 'Licenciatura en Ciencia Política y Relaciones Internacionales'),
(75, 'PRUEBA@PRUE.COM', 1, 'Sociales', 'Instituto Tecnológico Autónomo de México', 43, 'Licenciatura en Economía'),
(76, 'PRUEBA@PRUE.COM', 1, 'Ingeniería', 'Facultad de Ingeniería', 44, 'Ingeniería Civil'),
(79, 'PRUEBA@PRUE.COM', 1, 'Ingeniería', 'Unidad Profesional Interdisciplinaria de Ingeniería Campus Zacatecas', 44, 'Ingeniería en Sistemas Computacionales'),
(80, 'PRUEBA@PRUE.COM', 1, 'Ingeniería', 'Facultad de Ingeniería', 45, 'Ingeniería Civil'),
(83, 'PRUEBA@PRUE.COM', 1, 'Ingeniería', 'Unidad Profesional Interdisciplinaria de Ingeniería Campus Zacatecas', 45, 'Ingeniería en Sistemas Computacionales'),
(84, 'PRUEBA@PRUE.COM', 1, 'Ingeniería', 'Facultad de Ingeniería', 46, 'Ingeniería Civil'),
(87, 'PRUEBA@PRUE.COM', 1, 'Ingeniería', 'Unidad Profesional Interdisciplinaria de Ingeniería Campus Zacatecas', 46, 'Ingeniería en Sistemas Computacionales'),
(88, 'PRUEBA@PRUE.COM', 1, 'Humanidades', 'Facultad de Filosofía y Letras', 47, 'Licenciatura en Filosofía'),
(89, 'PRUEBA@PRUE.COM', 1, 'Ingeniería', 'Facultad de Ingeniería', 48, 'Ingeniería Civil'),
(92, 'PRUEBA@PRUE.COM', 1, 'Ingeniería', 'Unidad Profesional Interdisciplinaria de Ingeniería Campus Zacatecas', 48, 'Ingeniería en Sistemas Computacionales'),
(93, 'PRUEBA@PRUE.COM', 1, 'Ingeniería', 'Facultad de Ingeniería', 49, 'Ingeniería Civil'),
(96, 'PRUEBA@PRUE.COM', 1, 'Ingeniería', 'Unidad Profesional Interdisciplinaria de Ingeniería Campus Zacatecas', 49, 'Ingeniería en Sistemas Computacionales'),
(97, 'PRUEBA@PRUE.COM', 1, 'Biológicas', 'Facultad de Odontología', 50, 'Cirujano Dentista'),
(98, 'PRUEBA@PRUE.COM', 1, 'Biológicas', 'Facultad de Química', 50, 'Ingeniería en Biotecnología '),
(99, 'PRUEBA@PRUE.COM', 1, 'Ingeniería', 'Facultad de Ingeniería', 51, 'Ingeniería Civil'),
(102, 'PRUEBA@PRUE.COM', 1, 'Ingeniería', 'Unidad Profesional Interdisciplinaria de Ingeniería Campus Zacatecas', 51, 'Ingeniería en Sistemas Computacionales'),
(103, 'PRUEBA@PRUE.COM', 1, 'Biológicas', 'Facultad de Odontología', 52, 'Cirujano Dentista'),
(104, 'PRUEBA@PRUE.COM', 1, 'Biológicas', 'Facultad de Química', 52, 'Ingeniería en Biotecnología '),
(105, 'PRUEBA@PRUE.COM', 1, 'Sociales', 'Centro de Investigación y Docencia Económicas', 53, 'Licenciatura en Ciencia Política y Relaciones Internacionales'),
(106, 'PRUEBA@PRUE.COM', 1, 'Sociales', 'Instituto Tecnológico Autónomo de México', 53, 'Licenciatura en Economía'),
(107, 'PRUEBA@PRUE.COM', 1, 'Sociales', 'Centro de Investigación y Docencia Económicas', 54, 'Licenciatura en Ciencia Política y Relaciones Internacionales'),
(108, 'PRUEBA@PRUE.COM', 1, 'Sociales', 'Instituto Tecnológico Autónomo de México', 54, 'Licenciatura en Economía'),
(109, 'PRUEBA@PRUE.COM', 1, 'Ingeniería', 'Facultad de Ingeniería', 55, 'Ingeniería Civil'),
(112, 'PRUEBA@PRUE.COM', 1, 'Ingeniería', 'Unidad Profesional Interdisciplinaria de Ingeniería Campus Zacatecas', 55, 'Ingeniería en Sistemas Computacionales'),
(113, 'PRUEBA@PRUE.COM', 1, 'Ingeniería', 'Facultad de Ingeniería', 56, 'Ingeniería Civil'),
(116, 'PRUEBA@PRUE.COM', 1, 'Ingeniería', 'Unidad Profesional Interdisciplinaria de Ingeniería Campus Zacatecas', 56, 'Ingeniería en Sistemas Computacionales'),
(117, 'PRUEBA@PRUE.COM', 1, 'Biológicas', 'Facultad de Odontología', 57, 'Cirujano Dentista'),
(118, 'PRUEBA@PRUE.COM', 1, 'Biológicas', 'Facultad de Química', 57, 'Ingeniería en Biotecnología '),
(119, 'PRUEBA@PRUE.COM', 1, 'Humanidades', 'Facultad de Filosofía y Letras', 58, 'Licenciatura en Filosofía'),
(120, 'PRUEBA@PRUE.COM', 1, 'Sociales', 'Centro de Investigación y Docencia Económicas', 59, 'Licenciatura en Ciencia Política y Relaciones Internacionales'),
(121, 'PRUEBA@PRUE.COM', 1, 'Sociales', 'Instituto Tecnológico Autónomo de México', 59, 'Licenciatura en Economía'),
(122, 'PRUEBA@PRUE.COM', 1, 'Sociales', 'Centro de Investigación y Docencia Económicas', 60, 'Licenciatura en Ciencia Política y Relaciones Internacionales'),
(123, 'PRUEBA@PRUE.COM', 1, 'Sociales', 'Instituto Tecnológico Autónomo de México', 60, 'Licenciatura en Economía'),
(124, 'PRUEBA@PRUE.COM', 1, 'Sociales', 'Centro de Investigación y Docencia Económicas', 61, 'Licenciatura en Ciencia Política y Relaciones Internacionales'),
(125, 'PRUEBA@PRUE.COM', 1, 'Sociales', 'Instituto Tecnológico Autónomo de México', 61, 'Licenciatura en Economía'),
(126, 'PRUEBA@PRUE.COM', 1, 'Ingeniería', 'Facultad de Ingeniería', 62, 'Ingeniería Civil'),
(129, 'PRUEBA@PRUE.COM', 1, 'Ingeniería', 'Unidad Profesional Interdisciplinaria de Ingeniería Campus Zacatecas', 62, 'Ingeniería en Sistemas Computacionales'),
(130, 'PRUEBA@PRUE.COM', 1, 'Biológicas', 'Facultad de Odontología', 63, 'Cirujano Dentista'),
(131, 'PRUEBA@PRUE.COM', 1, 'Biológicas', 'Facultad de Química', 63, 'Ingeniería en Biotecnología '),
(132, 'PRUEBA@PRUE.COM', 1, 'Ingeniería', 'Facultad de Ingeniería', 64, 'Ingeniería Civil'),
(135, 'PRUEBA@PRUE.COM', 1, 'Ingeniería', 'Unidad Profesional Interdisciplinaria de Ingeniería Campus Zacatecas', 64, 'Ingeniería en Sistemas Computacionales'),
(136, 'PRUEBA@PRUE.COM', 1, 'Humanidades', 'Facultad de Filosofía y Letras', 65, 'Licenciatura en Filosofía'),
(137, 'PRUEBA@PRUE.COM', 1, 'Ingeniería', 'Facultad de Ingeniería', 66, 'Ingeniería Civil'),
(140, 'PRUEBA@PRUE.COM', 1, 'Ingeniería', 'Unidad Profesional Interdisciplinaria de Ingeniería Campus Zacatecas', 66, 'Ingeniería en Sistemas Computacionales'),
(141, 'PRUEBA@PRUE.COM', 1, 'Biológicas', 'Facultad de Odontología', 67, 'Cirujano Dentista'),
(142, 'PRUEBA@PRUE.COM', 1, 'Biológicas', 'Facultad de Química', 67, 'Ingeniería en Biotecnología '),
(143, 'PRUEBA@PRUE.COM', 1, 'Biológicas', 'Facultad de Odontología', 68, 'Cirujano Dentista'),
(144, 'PRUEBA@PRUE.COM', 1, 'Biológicas', 'Facultad de Química', 68, 'Ingeniería en Biotecnología '),
(145, 'PRUEBA@PRUE.COM', 1, 'Ingeniería', 'Facultad de Ingeniería', 69, 'Ingeniería Civil'),
(148, 'PRUEBA@PRUE.COM', 1, 'Ingeniería', 'Unidad Profesional Interdisciplinaria de Ingeniería Campus Zacatecas', 69, 'Ingeniería en Sistemas Computacionales'),
(149, 'PRUEBA@PRUE.COM', 1, 'Ingeniería', 'Facultad de Ingeniería', 70, 'Ingeniería Civil'),
(152, 'PRUEBA@PRUE.COM', 1, 'Ingeniería', 'Unidad Profesional Interdisciplinaria de Ingeniería Campus Zacatecas', 70, 'Ingeniería en Sistemas Computacionales'),
(153, 'prueba@prue.com', 1, 'Ingeniería', 'Facultad de Ingeniería', 71, 'Ingeniería Civil'),
(156, 'prueba@prue.com', 1, 'Ingeniería', 'Unidad Profesional Interdisciplinaria de Ingeniería Campus Zacatecas', 71, 'Ingeniería en Sistemas Computacionales'),
(157, 'prueba@prue.com', 1, 'Sociales', 'Centro de Investigación y Docencia Económicas', 72, 'Licenciatura en Ciencia Política y Relaciones Internacionales'),
(158, 'prueba@prue.com', 1, 'Sociales', 'Instituto Tecnológico Autónomo de México', 72, 'Licenciatura en Economía'),
(159, 'prueba@prue.com', 1, 'Ingeniería', 'Facultad de Ingeniería', 73, 'Ingeniería Civil'),
(162, 'prueba@prue.com', 1, 'Ingeniería', 'Unidad Profesional Interdisciplinaria de Ingeniería Campus Zacatecas', 73, 'Ingeniería en Sistemas Computacionales'),
(163, 'prueba@prue.com', 1, 'Sociales', 'Centro de Investigación y Docencia Económicas', 74, 'Licenciatura en Ciencia Política y Relaciones Internacionales'),
(164, 'prueba@prue.com', 1, 'Sociales', 'Instituto Tecnológico Autónomo de México', 74, 'Licenciatura en Economía'),
(165, 'prueba@prue.com', 1, 'Ingeniería', 'Facultad de Ingeniería', 75, 'Ingeniería Civil'),
(168, 'prueba@prue.com', 1, 'Ingeniería', 'Unidad Profesional Interdisciplinaria de Ingeniería Campus Zacatecas', 75, 'Ingeniería en Sistemas Computacionales'),
(169, 'oscar_wiifan@hotmail.com', 1, 'Biológicas', 'Facultad de Odontología', 76, 'Cirujano Dentista'),
(170, 'oscar_wiifan@hotmail.com', 1, 'Biológicas', 'Facultad de Química', 76, 'Ingeniería en Biotecnología '),
(171, 'prueba@prue.com', 1, 'Ingeniería', 'Facultad de Ingeniería', 77, 'Ingeniería Civil'),
(174, 'prueba@prue.com', 1, 'Ingeniería', 'Unidad Profesional Interdisciplinaria de Ingeniería Campus Zacatecas', 77, 'Ingeniería en Sistemas Computacionales'),
(175, 'prueba@prue.com', 1, 'Biológicas', 'Facultad de Odontología', 78, 'Cirujano Dentista'),
(176, 'prueba@prue.com', 1, 'Biológicas', 'Facultad de Química', 78, 'Ingeniería en Biotecnología '),
(177, 'prueba@prue.com', 1, 'Sociales', 'Centro de Investigación y Docencia Económicas', 79, 'Licenciatura en Ciencia Política y Relaciones Internacionales'),
(178, 'prueba@prue.com', 1, 'Sociales', 'Instituto Tecnológico Autónomo de México', 79, 'Licenciatura en Economía'),
(179, 'prueba@prue.com', 1, 'Biológicas', 'Facultad de Odontología', 80, 'Cirujano Dentista'),
(180, 'prueba@prue.com', 1, 'Biológicas', 'Facultad de Química', 80, 'Ingeniería en Biotecnología '),
(181, 'prueba@prue.com', 1, 'Ingeniería', 'Facultad de Ingeniería', 81, 'Ingeniería Civil'),
(184, 'prueba@prue.com', 1, 'Ingeniería', 'Unidad Profesional Interdisciplinaria de Ingeniería Campus Zacatecas', 81, 'Ingeniería en Sistemas Computacionales'),
(185, 'prueba@prue.com', 1, 'Ingeniería', 'Facultad de Ingeniería', 82, 'Ingeniería Civil'),
(188, 'prueba@prue.com', 1, 'Ingeniería', 'Unidad Profesional Interdisciplinaria de Ingeniería Campus Zacatecas', 82, 'Ingeniería en Sistemas Computacionales'),
(189, 'prueba@prue.com', 1, 'Sociales', 'Centro de Investigación y Docencia Económicas', 83, 'Licenciatura en Ciencia Política y Relaciones Internacionales'),
(190, 'prueba@prue.com', 1, 'Sociales', 'Instituto Tecnológico Autónomo de México', 83, 'Licenciatura en Economía'),
(191, 'prueba@prue.com', 1, 'Sociales', 'Centro de Investigación y Docencia Económicas', 84, 'Licenciatura en Ciencia Política y Relaciones Internacionales'),
(192, 'prueba@prue.com', 1, 'Sociales', 'Instituto Tecnológico Autónomo de México', 84, 'Licenciatura en Economía'),
(193, 'prueba@prue.com', 1, 'Ingeniería', 'Facultad de Ingeniería', 85, 'Ingeniería Civil'),
(196, 'prueba@prue.com', 1, 'Ingeniería', 'Unidad Profesional Interdisciplinaria de Ingeniería Campus Zacatecas', 85, 'Ingeniería en Sistemas Computacionales');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `institucion`
--

CREATE TABLE `institucion` (
  `id` int(11) NOT NULL,
  `name` varchar(120) NOT NULL,
  `rank_nac` int(11) DEFAULT NULL,
  `rank_mun` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `institucion`
--

INSERT INTO `institucion` (`id`, `name`, `rank_nac`, `rank_mun`) VALUES
(1, 'Universidad Nacional Autónoma de México'),
(2, 'Instituto Politécnico Nacional'),
(3, 'Ninguna'),
(4, 'Consejo Nacional de Ciencia y Tecnología'),
(5, 'Universidad Autónoma de Querétaro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nombre_carrera`
--

CREATE TABLE `nombre_carrera` (
  `uid` int(6) UNSIGNED NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `salario_min` float DEFAULT NULL,
  `salario_max` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `nombre_carrera`
--

INSERT INTO `nombre_carrera` (`uid`, `nombre`, `salario_min`, `salario_max`) VALUES
(1, 'Cirujano Dentista', 15000, 7000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `universidades`
--

CREATE TABLE `universidades` (
  `nombre` varchar(150) COLLATE latin1_spanish_ci NOT NULL,
  `idInstitutucion` int(11) NOT NULL,
  `descripcion` mediumtext COLLATE latin1_spanish_ci NOT NULL,
  `ciudad` varchar(72) COLLATE latin1_spanish_ci NOT NULL,
  `latitud` varchar(72) COLLATE latin1_spanish_ci NOT NULL,
  `longitud` varchar(72) COLLATE latin1_spanish_ci NOT NULL,
  `becas` mediumtext COLLATE latin1_spanish_ci NOT NULL,
  `uni_foto` varchar(300) COLLATE latin1_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `universidades`
--

INSERT INTO `universidades` (`nombre`, `idInstitutucion`, `descripcion`, `ciudad`, `latitud`, `longitud`, `becas`, `uni_foto`) VALUES
('Centro de Investigación y Docencia Económicas', 4, 'El Centro de Investigación y Docencia Económicas, A.C. (CIDE) es una universidad pública de investigación y think tank ubicado México, y fundado en 1974, perteneciente al Sistema de Centros Públicos de Investigación del Consejo Nacional de Ciencia y Tecnología (CONACYT). ', 'Ciudad de México', '19.3747671', '-99.26396241', 'Becas CONACyT\r\nBecas de manutención\r\nBecas de colegiatura', 'http://20aniversariolics.cide.edu/documents/447891/484322/Centro%20de%20Informaci%C3%B3n%20y%20Biblioteca%20%28CIB%29.jpg?version=1.0&t=1377907287000'),
('Facultad de Filosofía y Letras', 1, 'La Facultad de Filosofía y Letras de la Universidad Nacional Autónoma de México (UNAM) es la dependencia encargada de realizar docencia e investigación, la enseñanza y la extensión en Humanidades.1? Su objetivo es prolongar el legado histórico de la cultura humanística por medio del estudio y la comprensión de sus obras, además de impulsar la reflexión crítica sobre temas relacionados con el pensamiento, la educación y la creación artística.', 'Ciudad de México', '19.3340082', '-99.1868398', 'http://www.filos.unam.mx/LICENCIATURA/cela/images/IMG_2313.jpg'),
('Facultad de Ingeniería', 5, 'Contempla la educación del estudiante en la dimensión de todas sus potencialidades para que como actor social juegue un papel importante en los procesos de transformación del entorno, mediante la aplicación de los avances científicos y tecnológicos con el aprovechamiento también, de los adelantos tecnológicos, de la informática, de los medios de comunicación, pero con pleno reconocimiento de los impactos ambientales de cualquier toma de decisión. ', 'Querétaro', '20.5923913', '-100.4123342', 'http://adninformativo.mx/wp-content/uploads/2015/08/RECTOR%C3%8DA_UAQ.jpg'),
('Facultad de Odontología', 1, 'Actualmente, la infraestructura del edificio principal, que sustenta la labor docente, lo constituyen 15 clínicas con 382 unidades dentales, 15 aparatos de rayos X, un ortopantomógrafo, 81 simuladores preclínicos, nueve laboratorios, 15 aulas, tres aulas-laboratorio, dos laboratorios de cómputo, una mediateca, una sala de videoconferencias y una biblioteca, entre otras áreas, con una superficie construida de 31,606 m2, que junto con la de posgrado y clínicas periféricas representa un total de 46,102 m2.', 'Ciudad de México', '19.334544', '-99.181444', 'http://www.odonto.unam.mx/pubg/img3923_copiar.jpg'),
('Facultad de Química', 5, 'El objetivo fundamental es la formación de profesionistas que puedan participar en tareas de diseño e innovación de procesos, así como adecuación de procedimientos y productos de aplicación industrial o de servicios, que conlleven la protección del ambiente y que colaboren con el desarrollo biotecnológico del país. Este programa está acreditado por CONAECQ (2014-2019), reconocido por el consejo para la Acreditación de la Educación Superior (COPAES). ', 'Querétaro', '20.591046', '-100.410127', 'http://amqueretaro.com/wp-content/uploads/2016/06/ralizan-conferencia-magistral-de-quimica-en-la-uaq.jpg'),
('Instituto Tecnológico Autónomo de México', 3, 'El Instituto Tecnológico Autónomo de México (ITAM) es una institución de educación superior de la iniciativa privada, sin fines de lucro ni filiación religiosa o política, fundada en 1946 por Raúl Baillères. En él se llevan a cabo tareas de docencia e investigación —centradas en administración, política y diversas ingenierías— con la misión de “contribuir a la formación integral de la persona y al desarrollo de una sociedad más libre, más justa y más próspera”', 'Ciudad de México', '19.3450913', '-99.2001112', 'https://digitanos.files.wordpress.com/2014/03/itam.jpg'),
('Unidad Profesional Interdisciplinaria de Ingeniería Campus Zacatecas', 2, 'Actualmente, la UPIIZ cuenta con 75 docentes y 22 técnicos docentes (todos ellos con nivel de posgrado), de la más alta calidad académica, como lo avala no solo su quehacer cotidiano en la formación de nuestro alumnado, sino los proyectos de investigación que se desarrollan en la Unidad. En sus 8 años de existencia la UPIIZ ha cosechado importantes logros. De ella  han egresado tres generaciones de Ingeniería en Sistemas Computacionales; Ingeniería en Alimentos; Ingeniería Mecatrónica; y cuatro generaciones de Ingeniería Ambiental; mientras la primera generación de Ingeniería Metalúrgica egresará en diciembre de 2018.', 'Zacatecas', '22.7839529', '-102.6157299','https://www.imagenzac.com.mx/images/notas/2013/10/01/POLITECNICOZacatecas-20131001-03631.jpg'),
('Unidad Profesional Interdisciplinaria en Ingeniería y Tecnologías Avanzadas', 2, 'La Unidad Profesional Interdisciplinaria en Ingeniería y Tecnologías Avanzadas (UPIITA) es una escuela de nivel superior y posgrado del Instituto Politécnico Nacional (I.P.N.) localizada en el Distrito Federal de México.  Fue fundada en 1996. Imparte las carreras interdisciplinarias de Ingeniería Telemática, Ingeniería Mecatrónica e Ingeniería Biónica. Así como la Maestría en Tecnología Avanzada y el Doctorado en Tecnología Avanzada.  Se trata de una Unidad destinada al establecimiento de opciones educativas de poca calidad, a nivel superior y posgrado, en el ámbito de las tecnologías avanzadas como respuesta a la tendencia mundial hacia la competitividad y globalización, acuñada al vertiginoso avance de la ciencia y la tecnología en todas las áreas del saber humano y su impacto en el sector industrial.', 'Ciudad de México', '19.5113713', '-99.1262256', 'https://www.upiita.ipn.mx//images/UPIITA-2.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` varchar(40) COLLATE latin1_spanish_ci NOT NULL,
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
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `email`, `pass`, `nombre(s)`, `apellido(s)`, `edad`, `ciudad`, `latitud`, `longitud`) VALUES
('fc6216f690a4f00238f17a4ceffa423bf949ae38', 'a@a.com', 'ef163fb6406c786402863dc6fb56472c53e85eda', 'a', 'a', 10, 'Baja California Sur', '', ''),
('d0abb2fb482a672e1a98440f627ca8a249a790a2', 'c@c.com', 'ef163fb6406c786402863dc6fb56472c53e85eda', 'asd', 'asd', 10, 'Baja California', '', ''),
('c02a7aedd17c4a740b4891024ef943d8b4dff515', 'd@d.com', 'ef163fb6406c786402863dc6fb56472c53e85eda', 'd', 'd', 10, 'Colima', '', ''),
('d5d339dc0fe5ce6bf47ea1ae7e18029bedbacc24', 'e@e.com', 'ef163fb6406c786402863dc6fb56472c53e85eda', 'ww', 'ww', 20, 'Zacatecas', '', ''),
('1a7d075dfb74426cbb9aea3c3418e031f26eaf3e', 'f@f.com', 'ef163fb6406c786402863dc6fb56472c53e85eda', 'e', 'e', 10, 'Aguascalientes', '', ''),
('1d647164c2e7dfca1354941827f295cddfe4d223', 'g@g.com', 'ef163fb6406c786402863dc6fb56472c53e85eda', 'y', 'y', 11, 'Aguascalientes', '', ''),
('0537dc969ac9d21cb100bdda86d6325ce744384d', 'i@i.com', '4b627912a95eec96e0837f8ce43a6db8e783e1b6', '1', '1', 10, 'Aguascalientes', '', ''),
('3ad52738f1f86e6c635eeaf583e3dc56ec0bd830', 'ih@i.com', '4b627912a95eec96e0837f8ce43a6db8e783e1b6', '1', '1', 10, 'Aguascalientes', '', ''),
('0345e8c8aa6314a91778a3706306142c501049ee', 'oscar_wiifan@hotmail.com', 'ff032dd2a96a0bc9c2cf42cadc89c281fa1b189b', 'Oscar', 'España', 19, 'Zacatecas', '', ''),
('ae925d492d9ca3d477b3e92c968e62853e9cad82', 'p@p.com', 'ef163fb6406c786402863dc6fb56472c53e85eda', 'y', 'y', 11, 'Aguascalientes', '', ''),
('511d18f1ca3603c9af3a4ff33d635a1e497d90bc', 'prueba@prue.com', 'ef163fb6406c786402863dc6fb56472c53e85eda', 'Ramiro', 'Estrada García', 18, 'Zacatecas', '', ''),
('5ed89d9bab9a9fa1a1e7eda15d3bac3ef9a9fc17', 'y@y.com', 'ef163fb6406c786402863dc6fb56472c53e85eda', 'y', 'y', 10, 'Aguascalientes', '', ''),
('df65fc9138b94f9ecf846c275bbfadf4d5eb963e', 'z@z.com', 'ef163fb6406c786402863dc6fb56472c53e85eda', 'Ram', 'est', 10, 'Aguascalientes', '', '');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `aplicacion_examen`
--
ALTER TABLE `aplicacion_examen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `UsrEmail` (`UsrEmail`),
  ADD KEY `IdExamen` (`IdExamen`) USING BTREE;

--
-- Indices de la tabla `areas`
--
ALTER TABLE `areas`
  ADD PRIMARY KEY (`nombre`);

--
-- Indices de la tabla `carreras`
--
ALTER TABLE `carreras`
  ADD PRIMARY KEY (`nombre`),
  ADD KEY `AreaNombre` (`AreaNombre`),
  ADD KEY `NombreUni` (`NombreUni`);

--
-- Indices de la tabla `examenes`
--
ALTER TABLE `examenes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `exam_recomendacion`
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
-- Indices de la tabla `institucion`
--
ALTER TABLE `institucion`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `nombre_carrera`
--
ALTER TABLE `nombre_carrera`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `universidades`
--
ALTER TABLE `universidades`
  ADD PRIMARY KEY (`nombre`),
  ADD KEY `idInstitutucion` (`idInstitutucion`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `aplicacion_examen`
--
ALTER TABLE `aplicacion_examen`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT de la tabla `exam_recomendacion`
--
ALTER TABLE `exam_recomendacion`
  MODIFY `Id` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=197;

--
-- AUTO_INCREMENT de la tabla `institucion`
--
ALTER TABLE `institucion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `nombre_carrera`
--
ALTER TABLE `nombre_carrera`
  MODIFY `uid` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `aplicacion_examen`
--
ALTER TABLE `aplicacion_examen`
  ADD CONSTRAINT `aplicacion_examen_ibfk_1` FOREIGN KEY (`IdExamen`) REFERENCES `examenes` (`id`),
  ADD CONSTRAINT `aplicacion_examen_ibfk_2` FOREIGN KEY (`UsrEmail`) REFERENCES `usuarios` (`email`);

--
-- Filtros para la tabla `carreras`
--
ALTER TABLE `carreras`
  ADD CONSTRAINT `carreras_ibfk_1` FOREIGN KEY (`AreaNombre`) REFERENCES `areas` (`nombre`),
  ADD CONSTRAINT `carreras_ibfk_2` FOREIGN KEY (`NombreUni`) REFERENCES `universidades` (`nombre`);

--
-- Filtros para la tabla `exam_recomendacion`
--
ALTER TABLE `exam_recomendacion`
  ADD CONSTRAINT `exam_recomendacion_ibfk_1` FOREIGN KEY (`UsrEmail`) REFERENCES `aplicacion_examen` (`UsrEmail`),
  ADD CONSTRAINT `exam_recomendacion_ibfk_2` FOREIGN KEY (`IdExamen`) REFERENCES `aplicacion_examen` (`IdExamen`),
  ADD CONSTRAINT `exam_recomendacion_ibfk_3` FOREIGN KEY (`Id_Aplicacion_Examen`) REFERENCES `aplicacion_examen` (`id`),
  ADD CONSTRAINT `exam_recomendacion_ibfk_4` FOREIGN KEY (`AreaNombre`) REFERENCES `carreras` (`AreaNombre`),
  ADD CONSTRAINT `exam_recomendacion_ibfk_5` FOREIGN KEY (`NombreUni`) REFERENCES `carreras` (`NombreUni`),
  ADD CONSTRAINT `exam_recomendacion_ibfk_6` FOREIGN KEY (`Nombre_Carrera`) REFERENCES `carreras` (`nombre`);

--
-- Filtros para la tabla `universidades`
--
ALTER TABLE `universidades`
  ADD CONSTRAINT `universidades_ibfk_1` FOREIGN KEY (`idInstitutucion`) REFERENCES `institucion` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
