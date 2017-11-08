CREATE DATABASE `id1181196_mei`;
USE `id1181196_mei`;

CREATE TABLE `aplicacion_examen` (
  `id` int(20) NOT NULL,
  `IdExamen` int(20) NOT NULL,
  `UsrEmail` varchar(72) COLLATE latin1_spanish_ci NOT NULL,
  `fecha` date NOT NULL,
  `resultado` varchar(40) COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

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
  `NombreUni` varchar(150) COLLATE latin1_spanish_ci NOT NULL,
  `nombre` varchar(72) COLLATE latin1_spanish_ci NOT NULL,
  `descripcion` mediumtext COLLATE latin1_spanish_ci NOT NULL,
  `planestudios` mediumtext COLLATE latin1_spanish_ci NOT NULL,
  `intercambio` mediumtext COLLATE latin1_spanish_ci NOT NULL,
  `perfilegreso` mediumtext COLLATE latin1_spanish_ci NOT NULL,
  `keywords` text COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Dumping data for table `carreras`
--

INSERT INTO `carreras` (`AreaNombre`, `NombreUni`, `nombre`, `descripcion`, `planestudios`, `intercambio`, `perfilegreso`, `keywords`) VALUES
('Biológicas', 'Facultad de Odontología', 'Cirujano Dentista', 'La licenciatura de Cirujano Dentista forma profesionistas capaces de resolver las necesidades de salud bucodental de la población, mediante un criterio clínico integral. Su labor se enfoca hacia la solución de: caries dental, enfermedad periodontal (tejidos de sostén del diente), malposiciones dentarias, alteraciones de la articulación temporomandibular, cáncer bucal y malformaciones de labio y paladar.', 'Toda la información relacionada al plan de estudios está <a href=\"http://oferta.unam.mx/carrera/archivos/planes/cdentista-fodontologia-planestudios15.pdf\">aquí</a>', 'Ser becario de movilidad internacional no es un derecho de todo estudiante universitario sino una distinción que sólo obtienen algunos de los mejores alumnos de la UNAM. El perfil de estos alumnos de alta calidad está asociado a un promedio alto en sus calificaciones, regularidad en sus estudios, disciplina en sus procedimientos, aptitud excepcional en sus proyectos académicos, disposición a regresar a México para insertarse al ámbito laboral o académico y, muy frecuentemente, dominio de una lengua extranjera. Adicionalmente, cuando también hay un apoyo económico, es porque el perfil socioeconómico del alumno de excelencia lo sugiere.Más información <a href=\"http://www.global.unam.mx/es/movi_alumnos/para_participar_me.html?panel=2\">aquí<a><br>', 'Los egresados de la Facultad de Odontología poseen conocimientos científicos, habilidades técnicas y actitudes humanísticas para conservar y mantener la salud bucal de las personas, bajo una concepción vinculada con la realidad del país.\r\nPredomina en su práctica la prevención, lo que permite atender los problemas de inequidad, costo e inaccesibilidad que prevalecen en más del 50% de la población mexicana.<br>\r\nEste perfil lo respalda la sólida formación científica, tecnológica y clínica que ofrece esta Facultad, lo que le permite al egresado emitir un diagnóstico integral e instituir un plan de tratamiento completo, atendiendo todas las fases que implica una práctica profesional responsable y humanística, bajo una concepción amplia del proceso de salud-enfermedad, y aplicando todas las áreas de la odontología.\r\nEn términos generales, el egresado de la carrera será capaz de trabajar en distintos modelos de servicios de salud e identificar las características biopsicosociales del individuo.', 'ciencias,biológicas,salud,unam,odontología,dentista'),
('Ingeniería', 'Unidad Profesional Interdisciplinaria en Ingeniería y Tecnologías Avanzadas', 'Ingeniería en Mecatrónica', 'Formar ingenieros que conozcan, analicen e integren las diferentes disciplinas que conforman a la mecatrónica, para difundir y aplicar conocimiento científico y tecnológico acorde a las necesidades de desarrollo nacional e internacional. Manteniendo una plantilla docente de alto nivel en constante actualización, que funjan como facilitadores del conocimiento y que se encuentren vinculados con los sectores productivos y sociales. Así mismo, contar con un programa académico flexible y un enfoque centrado en el aprendizaje en concordancia con el modelo educativo del Instituto Politécnico Nacional, que permita a los estudiantes construir su propio conocimiento de forma ética y responsable.', 'El objetivo del plan de estudios es formar ingenieros en mecatrónica con las competencias necesarias para resolver problemas de diseño, construcción, mantenimiento, programación y control de sistemas mecatrónicos, desarrollando y aplicando nueva tecnología, con las habilidades necesarias para desarrollar un plan de vida y carrera, conduciéndose con ética, responsabilidad y tolerancia en sus ambientes de desarrollo profesional y personal.', 'Opcional', 'Es un profesional interdisciplinario capaz de diseñar, manufacturar y construir dispositivos y sistemas mecatrónicos, así como automatizar procesos industriales, con dominio de una segunda lengua y la habilidad de integrarse en equipos de trabajo, para desarrollar y emplear nueva tecnología, que esté aplicada de manera ética y responsable en la solución de las necesidades del entorno social y en armonía con el medio ambiente.\r\n', 'Mecatrónica'),
('Ingeniería', 'Unidad Profesional Interdisciplinaria de Ingeniería Campus Zacatecas', 'Ingeniería en Sistemas Computacionales', 'El Ingeniero en Sistemas Computacionales se desempeña en los sectores privado, público, académico y ejercicio libre de la profesión. <br>• Ejercicio libre de la profesión: Prestando de forma independiente sus servicios profesionales a los sectores público y privado. Constituyendo empresas formales que presten sus servicios computacionales a los diversos sectores. <br>• Sector público: Participa automatizando procesos administrativos en entidades gubernamentales en todos sus niveles, así como desarrollando software especializado para satisfacer los requerimientos específicos de dependencias gubernamentales. <br>• Sector privado: Se desempeñan como diseñadores y desarrolladores, líderes y administradores de proyectos computacionales, en empresas de transformación, servicios y comerciales, nacionales e internacionales.', 'Más información <a href=\"http://www.zacatecas.ipn.mx/OfertaEducativa/Documents/programa%20sistemas%20computacionales.pdf\">aquí</a>', 'El IPN ofrece movilidad internacional en más de 30 países al rededor del mundo. Más información <a href=\"http://www.ipn.mx/cca/movilidad/Documents/ALUMNOS-IPN/MOVILIDAD-INTERNACIONAL-NIVEL-SUPERIOR/IDs-MovInt2018-1.pdf\">aquí</a>', '• Conocer las metodologías de desarrollo de software para seleccionar la adecuada en el análisis, diseño, desarrollo e implementación de un sistema computacional. • Conocer las normas y estándares de calidad, nacionales e internacionales para el desarrollo de sistemas computacionales. • Conocer los fundamentos de análisis de algoritmos para seleccionar la opción más adecuada en la solución de problemas algorítmicos. • Conocer los modelos de datos para representar la información de una organización. • Conocer los lenguajes de los Sistemas Gestores de Bases de Datos (SGBD) para la definición, manipulación y control de bases de datos. • Conocer las características de las diversas herramientas para la administración de bases de datos. • Describir los distintos tipos de redes, protocolos y esquemas de seguridad para garantizar el intercambio de información de manera confiable. • Conocer las características de los paradigmas de programación para el desarrollo de un sistema computacional. • Conocer las tecnologías de Internet para el desarrollo de aplicaciones Web. • Conocer las metodologías para el desarrollo de software embebido. • Identificar los distintos dispositivos lógicos programables para ofrecer soluciones de circuitos lógicos para una aplicación especifica.', 'sistemas,programación,ingeniería,IPN,computacional'),
('Sociales', 'Centro de Investigación y Docencia Económicas', 'Licenciatura en Ciencia Política y Relaciones Internacionales', 'Esta licenciatura se caracteriza por la aplicación de una perspectiva interdisciplinaria, la utilización de métodos cuantitativos y cualitativos y su compromiso social para interpretar la realidad nacional y global, particularmente, lo que se refiere a procesos políticos y económicos. Este programa se basa en la idea de que un buen politólogo es aquel que conoce los efectos del sistema internacional en el sistema político nacional y un buen internacionalista es aquel que entiende el funcionamiento del sistema político interno y su vinculación con el exterior.', 'Está estructurado en tres grandes bloques:\r\n\r\nToral: conformado por cursos teóricos y prácticos para brindar una sólida formación en los contenidos centrales de la Ciencia Política y las Relaciones Internacionales.\r\n\r\nInterdisciplinario: conformado por cursos para desarrollar una visión interdisciplinaria a través del conocimiento básico de otras disciplinas, tales como Administración Pública, Derecho, Economía, Historia y Sociología.\r\n\r\nMetodológico: conformado por cursos para proveer herramientas cuantitativas y cualitativas con el objetivo de desarrollar las habilidades de razonamiento crítico y argumentación.\r\n\r\nEl plan de estudios de la Licenciatura en Ciencia Política y Relaciones Internacionales está conformado por 40 materias, las cuales se cursan en 8 semestres (5 materias por semestre). A partir del 5º semestre el alumno opta por una de las dos especialidades: Política Comparada o Relaciones Internacionales.', 'Obligatorio. En 6to. semestre', 'Los politólogos e internacionalistas egresados del CIDE se caracterizan por ser profesionales sumamente competitivos, cuyos sólidos conocimientos y habilidades les permiten continuar con estudios de posgrado en las mejores universidades del mundo o insertarse inmediatamente al mercado laboral.\r\nEntre sus cualidades profesionales destacan: las habilidades de argumentación y de expresión verbal y escrita; el dominio de métodos cuantitativos y cualitativos para el análisis y la capacidad para vincular variables de las esferas jurídica, económica y social con el análisis de la realidad política nacional e internacional, así como para explicar fenómenos económicos complejos y proponer soluciones viables.\r\nAl concluir la licenciatura serás capaz de:\r\n• Entender los procesos políticos y sociales en los que México se inserta nacional e internacionalmente.\r\n• Analizar la realidad nacional e internacional de los mexicanos para identificar propuestas de solución a problemas de actualidad.\r\n• Explicar la naturaleza de las instituciones políticas de México y de los fenómenos que se suscitan en el sistema internacional.\r\n• Ejecutar acciones diseñadas para la solución de problemas nacionales e internacionales.', 'CienciaPolítica'),
('Sociales', 'Instituto Tecnológico Autónomo de México', 'Licenciatura en Economía', 'Un economista del ITAM es un especialista en modelos de análisis que permiten comprender como los agentes económicos toman decisiones día a día en todos los ámbitos sociales, ya sea como individuos, como empresa o como país y como parte de un entorno globalizado.', 'El programa de estudios de la Licenciatura en Economía comprende temas de Microeconomía, Macroeconomía, Economía Internacional, Finanzas Públicas, Desarrollo Económico, Organización Industrial, Historia Económica de México, Econometría y Economía Política. De forma adicional, todas las carreras del ITAM tienen materias de tronco común que les permite complementar su formación académica brindándoles una visión interdisciplinaria en áreas como Contaduría, Administración, Filosofía, Derecho, Computación, Estadística y Matemáticas. Finalmente los alumnos de economía deben elegir alguna de las cinco áreas de especialización lo que les permitirá complementar sus conocimientos y habilidades en sus respectivas áreas de interés. Las áreas de concentración que se otorgan son: Fundamentos Económicos, Política Económica, Economía Financiera, Economía Empresarial y Economía y Derecho.', 'Opcional', 'Nuestros egresados se desempeñan en puestos estratégicos de análisis en distintas dependencias públicas y privadas, nacionales e internacionales. Los egresados del ITAM se han colocado en el sector financiero en bancos nacionales e internacionales, casas de bolsa, administradoras de fondos para el retiro y fondos de inversión y empresas de seguros. En el sector privado forman parte de empresas de consumo y de servicio, así como consultorías de alto reconocimiento a nivel nacional e internacional. En el sector público han alcanzado puestos directivos en el Banco de México, el Congreso de la Unión, la Presidencia de la República y diversas Secretarías.', 'Economía'),
('Humanidades', 'Facultad de Filosofía y Letras', 'Licenciatura en Filosofía', 'A través de la enseñanza, la investigación y la difusión de teorías, argumentos y problemas filosóficos, la licenciatura en Filosofía transmite los valores fundamentales de la cultura, gracias a su constante y sistemática reflexión de la realidad –elemento fundamental en esta carrera–, cuestiona las diversas problemáticas de la época actual, desarrolla la conciencia crítica e histórica de la sociedad y contribuye a la formación integral de las personas.', 'El plan de estudios consta de 48 asignaturas: 25 obligatorias y 23 optativas. El total de créditos es de 300, de los\r\ncuales, 168 corresponden a las asignaturas obligatorias y 132 a las optativas.\r\nComprende diez áreas temáticas: Estética, Ética, Filosofía de la Historia y de las Ciencias Sociales, Filosofía del Lenguaje y\r\nFilosofía de la Mente, Filosofía en México y en Latinoamérica, Historia de la Filosofía, Lógica, Metafísica y Ontología, Teoría\r\ndel Conocimiento y Filosofía de la Ciencia y el área de Propedéutica y Método.\r\nCada una de estas áreas contiene por lo menos una asignatura obligatoria que aborda los conocimientos básicos que\r\nproporcionan la formación fundamental, misma que se complementa al elegir las materias optativas, las cuales permiten al\r\nalumno concentrarse en una o varias áreas, de acuerdo con sus intereses académicos.', 'Opcional', 'Al término de sus estudios, el egresado adquirirá una serie de conocimientos, habilidades y aptitudes, entre los que destacan:\r\n\r\nConocimientos\r\n\r\n* Contará con una formación filosófica sistematizada y fundamentada que le permita comprender su entorno socio-cultural.\r\n* Habrá desarrollado una visión crítica de los conceptos centrales, problemas, sistemas, corrientes teóricas y métodos de la filosofía.\r\n* Comprenderá las tesis centrales de la historia de la filosofía.\r\n\r\nHabilidades y aptitudes\r\n\r\n* Tendrá la capacidad de participar en el diseño y ejecución de proyectos en el ámbito de su profesión.\r\n* Realizará reflexiones filosóficas sobre los principales problemas de la humanidad.\r\n* Contará con las habilidades necesarias para colaborar en equipos multidisciplinarios, orientados al estudio y solución de problemas relativos a su área.', 'Filosofía');

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

-- --------------------------------------------------------

--
-- Table structure for table `institucion`
--

CREATE TABLE `institucion` (
  `id` int(11) NOT NULL,
  `name` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `institucion`
--

INSERT INTO `institucion` (`id`, `name`) VALUES
(1, 'Universidad Nacional Autónoma de México'),
(2, 'Instituto Politécnico Nacional'),
(3, 'Ninguna'),
(4, 'Consejo Nacional de Ciencia y Tecnología');

-- --------------------------------------------------------

--
-- Table structure for table `universidades`
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
-- Dumping data for table `universidades`
--

INSERT INTO `universidades` (`nombre`, `idInstitutucion`, `descripcion`, `ciudad`, `latitud`, `longitud`, `becas`, `uni_foto`) VALUES
('Centro de Investigación y Docencia Económicas', 4, 'El Centro de Investigación y Docencia Económicas, A.C. (CIDE) es una universidad pública de investigación y think tank ubicado México, y fundado en 1974, perteneciente al Sistema de Centros Públicos de Investigación del Consejo Nacional de Ciencia y Tecnología (CONACYT). ', 'Ciudad de México', '19.3747671', '-99.26396241', 'Becas CONACyT\r\nBecas de manutención\r\nBecas de colegiatura', 'http://20aniversariolics.cide.edu/documents/447891/484322/Centro%20de%20Informaci%C3%B3n%20y%20Biblioteca%20%28CIB%29.jpg?version=1.0&t=1377907287000'),
('Facultad de Filosofía y Letras', 1, 'La Facultad de Filosofía y Letras de la Universidad Nacional Autónoma de México (UNAM) es la dependencia encargada de realizar docencia e investigación, la enseñanza y la extensión en Humanidades.1? Su objetivo es prolongar el legado histórico de la cultura humanística por medio del estudio y la comprensión de sus obras, además de impulsar la reflexión crítica sobre temas relacionados con el pensamiento, la educación y la creación artística.', 'Ciudad de México', '19.3340082', '-99.1868398', 'Becas UNAM', 'http://www.filos.unam.mx/LICENCIATURA/cela/images/IMG_2313.jpg'),
('Facultad de Odontología', 1, 'Actualmente, la infraestructura del edificio principal, que sustenta la labor docente, lo constituyen 15 clínicas con 382 unidades dentales, 15 aparatos de rayos X, un ortopantomógrafo, 81 simuladores preclínicos, nueve laboratorios, 15 aulas, tres aulas-laboratorio, dos laboratorios de cómputo, una mediateca, una sala de videoconferencias y una biblioteca, entre otras áreas, con una superficie construida de 31,606 m2, que junto con la de posgrado y clínicas periféricas representa un total de 46,102 m2.', 'Ciudad de México', '19.334544', '-99.181444', 'Beca nacional:<br>\r\nLa Subsecretaria de Educación Superior (SES) de la Secretaria de Educación Pública (SEP), a través de\r\nla Coordinación Nacional de Becas de Educación Superior (CNBES), con aportaciones del Gobierno\r\nFederal, de la UNAM y de la Fundación UNAM A. C. han constituido un fondo para otorgar becas\r\nno reembolsables a estudiantes de licenciatura con buen desempeño académico que, por su situación\r\nfamiliar, requieran apoyo económico.<br>\r\nPrograma de Fortalecimiento Académico para las Mujeres Universitarias:<br>\r\nLa Universidad Nacional Autónoma de México a través de la Secretaría de Atención a la Comunidad\r\nUniversitaria y la Dirección General de Orientación y Atención Educativa (DGOAE) constituyó un fondo\r\npara otorgar becas no reembolsables a las alumnas inscritas, a partir del quinto semestre, en las carreras\r\ndel Consejo Académico de Área Físico-Matemáticas e Ingenierías con alto desempeño académico.<br>\r\nBeca para Estudiantes del Estado de México:<br>\r\nEl gobierno del Estado de México ha creado un programa de becas con el propósito de apoyar a los\r\nestudiantes que hayan ingresado o se encuentren realizando estudios de educación superior en los\r\nSistemas Escolarizado o Universidad Abierta y Educación a Distancia en la UNAM. Más información <a href=\"http://www.dgoae.unam.mx/PDF/becaslicenciatura.pdf\">aquí</a>', 'http://www.odonto.unam.mx/pubg/img3923_copiar.jpg'),
('Instituto Tecnológico Autónomo de México', 3, 'El Instituto Tecnológico Autónomo de México (ITAM) es una institución de educación superior de la iniciativa privada, sin fines de lucro ni filiación religiosa o política, fundada en 1946 por Raúl Baillères. En él se llevan a cabo tareas de docencia e investigación —centradas en administración, política y diversas ingenierías— con la misión de “contribuir a la formación integral de la persona y al desarrollo de una sociedad más libre, más justa y más próspera”', 'Ciudad de México', '19.3450913', '-99.2001112', 'Becas ITAM', 'https://digitanos.files.wordpress.com/2014/03/itam.jpg'),
('Unidad Profesional Interdisciplinaria de Ingeniería Campus Zacatecas', 2, 'Actualmente, la UPIIZ cuenta con 75 docentes y 22 técnicos docentes (todos ellos con nivel de posgrado), de la más alta calidad académica, como lo avala no solo su quehacer cotidiano en la formación de nuestro alumnado, sino los proyectos de investigación que se desarrollan en la Unidad. En sus 8 años de existencia la UPIIZ ha cosechado importantes logros. De ella  han egresado tres generaciones de Ingeniería en Sistemas Computacionales; Ingeniería en Alimentos; Ingeniería Mecatrónica; y cuatro generaciones de Ingeniería Ambiental; mientras la primera generación de Ingeniería Metalúrgica egresará en diciembre de 2018.', 'Zacatecas', '22.7839529', '-102.6157299', 'El IPN ofrece un total de 13 becas para los estudiantes de nivel Superior de los cuales se encuentran: Beca institucional, beca institucional de transporte, IPN-Becalos, beca Alfredo Harp Helú, IPN-Fundación TELMEX, entre otros.<br>\r\nMás información <a href=\"http://www.ipn.mx/dse/Becas/Documents/becas_principal/convocatoria/BECAS_IPN_2016_17(2).pdf\">aquí</a>', 'https://www.imagenzac.com.mx/images/notas/2013/10/01/POLITECNICOZacatecas-20131001-03631.jpg'),
('Unidad Profesional Interdisciplinaria en Ingeniería y Tecnologías Avanzadas', 2, 'La Unidad Profesional Interdisciplinaria en Ingeniería y Tecnologías Avanzadas (UPIITA) es una escuela de nivel superior y posgrado del Instituto Politécnico Nacional (I.P.N.) localizada en el Distrito Federal de México.  Fue fundada en 1996. Imparte las carreras interdisciplinarias de Ingeniería Telemática, Ingeniería Mecatrónica e Ingeniería Biónica. Así como la Maestría en Tecnología Avanzada y el Doctorado en Tecnología Avanzada.  Se trata de una Unidad destinada al establecimiento de opciones educativas de poca calidad, a nivel superior y posgrado, en el ámbito de las tecnologías avanzadas como respuesta a la tendencia mundial hacia la competitividad y globalización, acuñada al vertiginoso avance de la ciencia y la tecnología en todas las áreas del saber humano y su impacto en el sector industrial.', 'Ciudad de México', '19.5113713', '-99.1262256', 'El IPN ofrece un total de 13 becas para los estudiantes de nivel Superior de los cuales se encuentran: Beca institucional, beca institucional de transporte, IPN-Becalos, beca Alfredo Harp Helú, IPN-Fundación TELMEX, entre otros.<br>\r\nMás información <a href=\"http://www.ipn.mx/dse/Becas/Documents/becas_principal/convocatoria/BECAS_IPN_2016_17(2).pdf\">aquí</a>', 'https://www.upiita.ipn.mx//images/UPIITA-2.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
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
-- Indexes for table `institucion`
--
ALTER TABLE `institucion`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `universidades`
--
ALTER TABLE `universidades`
  ADD PRIMARY KEY (`nombre`),
  ADD KEY `idInstitutucion` (`idInstitutucion`);

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
-- AUTO_INCREMENT for table `institucion`
--
ALTER TABLE `institucion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
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

--
-- Constraints for table `universidades`
--
ALTER TABLE `universidades`
  ADD CONSTRAINT `universidades_ibfk_1` FOREIGN KEY (`idInstitutucion`) REFERENCES `institucion` (`id`);
