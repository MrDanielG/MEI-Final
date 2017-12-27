-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-12-2017 a las 09:59:00
-- Versión del servidor: 10.1.28-MariaDB
-- Versión de PHP: 7.1.10

DROP DATABASE IF EXISTS `id1181196_mei`;
CREATE DATABASE `id1181196_mei`;
USE `id1181196_mei`;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `prueba`
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
  `resultado` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `area`
--

CREATE TABLE `area` (
  `UID` int(11) NOT NULL,
  `nombre` varchar(72) NOT NULL,
  `descripcion` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `area`
--

INSERT INTO `area` (`UID`, `nombre`, `descripcion`) VALUES
(1, 'Biológicas ', 'Las ciencias biológicas son aquellas que se dedican a estudiar la vida y sus procesos. Se trata de una rama de las ciencias naturales que investiga el origen, la evolución y las propiedades de los seres vivos.\r\n'),
(2, 'Humanidades', 'Relacion con las humanidades'),
(3, 'Ingeniería', 'La ingeniería es el conjunto de conocimientos científicos y tecnológicos para la innovación, invención, desarrollo y mejoramiento de técnicas y herramientas para satisfacer las necesidades de las empresas y la sociedad.\r\nEl ingeniero utiliza las matemáticas, las matemáticas aplicadas, la física, química y otras ciencias tanto para el desarrollo de tecnologías, como para el manejo eficiente y productivo de recursos y fuerzas de la naturaleza en beneficio de la sociedad. La ingeniería es una actividad que transforma el conocimiento en algo práctico.\r\nLa ingeniería aplica los conocimientos y métodos científicos a la invención o perfeccionamiento de tecnologías de manera pragmática y ágil, adecuándose a las limitaciones de tiempo, recursos, requerimientos legales, requerimientos de seguridad, ecológicos, etc.\r\n'),
(4, 'Sociales', 'Relacion con las sociales');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrera_info`
--

CREATE TABLE `carrera_info` (
  `UID` int(11) NOT NULL,
  `nombre` varchar(72) NOT NULL,
  `descripcion` mediumtext NOT NULL,
  `id_area` int(11) NOT NULL,
  `salario_min` float DEFAULT NULL,
  `salario_max` float DEFAULT NULL,
  `keywords` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `carrera_info`
--

INSERT INTO `carrera_info` (`UID`, `nombre`, `descripcion`, `id_area`, `salario_min`, `salario_max`, `keywords`) VALUES
(1, 'Cirujano Dentista', 'La licenciatura de Cirujano Dentista forma profesionistas capaces de resolver las necesidades de salud bucodental de la población, mediante un criterio clínico integral. Su labor se enfoca hacia la solución de: caries dental, enfermedad periodontal (tejidos de sostén del diente), malposiciones dentarias, alteraciones de la articulación temporomandibular, cáncer bucal y malformaciones de labio y paladar.', 1, 7000, 15000, 'biologicas,odontología,diente,dentista'),
(11, 'Licenciatura en Biología', 'El egresado de la licenciatura en Biología es concebido como una persona cuyo bagaje intelectual incluya un espectro de conocimientos básicos desde el nivel molecular y celular, hasta visiones integrativas que le permitan comprender los procesos de cambio de la biosfera en el tiempo y en el espacio. Debe ser una persona consciente no sólo de la extraordinaria diversidad biológica que caracteriza al país, sino también de la riqueza que el uso y preservación de ésta representan para mantener y desarrollar nuestra identidad nacional. El egresado de Biología es un profesional que por sus conocimientos profundos de la ciencia de la vida, realiza docencia e investigación y colabora adecuadamente aplicando sus conocimientos para resolver problemas de investigación o aplicaciones de otras disciplinas vinculadas.', 1, 12000, 5500, 'biológicas,biologo,zoologo,microorganismos,programación,python,zacatecas');

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
(3, 11, 'Para ver el plan de estudios de Licenciatura en Biología presione <a href=\"http://cienciasbiologicas.uaz.edu.mx/plandeestudiolic\">aquí</a>.', '<ol>\r\n<li> Estará calificado para incorporarse a estudios de postgrado, realizar aportes en el área de la investigación o integrarse a actividades productivas como un profesional en su campo.</li><br>\r\n\r\n<li>Tendrá los conocimientos básicos y aplicados de la Biología celular y molecular para participar en el desarrollo de metodologías de Ingeniería Genética, Biotecnología, Medicina molecular, Microbiología y Ecología sustentable entre otras, se involucrará generando corriente de opinión en la planeación y diseño de estudios integrales sobre los seres vivos y los recursos bióticos.</li><br>\r\n\r\n<li> Formulará, coordinará y evaluará proyectos sobre problemática relativas a los recursos naturales.</li><br>\r\n\r\n<li> Analizará la estructura y funcionamiento de los seres vivos, así como sus interacciones con el medio ambiente (capacidad de observar, describir, analizar y explicar los fenómenos biológicos).</li><br>\r\n\r\n<li> Planeará, realizará y coordinará proyectos de investigación básica y aplicada que propongan soluciones a problemas científicos y generen conocimientos biológicos. Participará en investigación de vanguardia en áreas como genética, biotecnología y biomedicina, entre otras.</li><br>\r\n\r\n<li> Llevará a cabo análisis de ecosistemas con el objeto de elaborar y/o completar los catálogos de los recursos naturales y lograr su conservación y sustentabilidad, tanto en áreas silvestres como protegidas. Planeará estrategias que conlleven a la recuperación y rehabilitación de ecosistemas deteriorados. Manejará, utilizará y aplicará técnicas adecuadas para prevenir o disminuir la acción de los agentes contaminantes.</li><br>\r\n\r\n<li> Realizará con destreza programas de control de plagas que afectan la producción agropecuaria y forestal. Trabajará en equipos multidisciplinarios en la docencia, investigación y difusión científica. Logrará un manejo eficiente de instrumentos y equipo científico, así como la habilidad de preparar soluciones, reactivos y medios de cultivo.</li><br>\r\n\r\n<li> Empleará la informática y la tecnología de cómputo en su trabajo cotidiano. Manejará adecuadamente el idioma español en sus comunicaciones verbales y escritas y el inglés será su segundo lengua. Se vinculará a la problemática social orientada al conocimiento y solución de problemas nacionales relacionados con la Biología como son alimentación, salud y medioambiente; es decir, conciencia de su papel como profesionista comprometido.\r\n<br>\r\nLogrará una formación continua y permanente en el campo de la Biología. Ejercerá su profesión con ética, responsabilidad y honestidad, impulsando siempre los valores universales de la sociedad. Buscará la verdad a través de la investigación y la difusión de la cultura en equipos multidisciplinarios de la investigación, docencia y la divulgación científica.</li><br>\r\n\r\n<li> Estará capacitado para llevar a cabo inventarios de biota, evaluaciones de impacto ambiental y planes de manejo de áreas naturales y de recursos renovables. Estará capacitado para la creación de su propia empresa, fincada en el aprovechamiento sensato de los recursos biológicos ambientales.</li><br>\r\n\r\n<li> Podrá diseñar y adaptar sistemas biotecnológicos que utilicen a los organismos como productores de bienes y servicios. Dispondrá de las herramientas conceptuales, normativas, legislativas y metodológicas para generar corrientes de opinión sobre la temática biotecnológica, medicina molecular, ambiental, ecológica, así como asesorar a instituciones gubernamentales y privadas sobre decisiones en esta materia.</li>\r\n</ol>', 9, '<ul>\r\n<li>http://cienciasbiologicas.uaz.edu.mx/licenciatura-en-biologia</li>\r\n<li>http://cienciasbiologicas.uaz.edu.mx/index</li>\r\n<li>http://cienciasbiologicas.uaz.edu.mx/biologia1</li>\r\n<li>http://ljz.mx/2017/08/22/detienen-labores-docentes-de-ciencias-biologicas-de-la-uaz-por-falta-de-asignacion-de-carga-de-trabajo/</li>\r\n</ul>');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `examen`
--

CREATE TABLE `examen` (
  `UID` int(11) NOT NULL,
  `nombre` varchar(72) NOT NULL,
  `num_preguntas` varchar(72) NOT NULL,
  `tipo` varchar(72) NOT NULL,
  `archivo` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `examen`
--

INSERT INTO `examen` (`UID`, `nombre`, `num_preguntas`, `tipo`, `archivo`) VALUES
(1, 'Mi primer test', '30', 'General', 'form.php');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `exam_recomendacion`
--

CREATE TABLE `exam_recomendacion` (
  `UID` int(11) NOT NULL,
  `id_user` varchar(40) NOT NULL,
  `id_examen` int(11) NOT NULL,
  `id_area` int(11) NOT NULL,
  `id_carrera` int(11) NOT NULL,
  `id_test_aplicado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(1, 'Universidad Nacional Autónoma de México', '', '', NULL, NULL),
(2, 'Instituto Politécnico Nacional', '', '', NULL, NULL),
(3, 'Ninguna', '', '', NULL, NULL),
(4, 'Consejo Nacional de Ciencia y Tecnología', '', '', NULL, NULL),
(5, 'Universidad Autónoma de Querétaro', '', '', NULL, NULL),
(6, 'Universidad Autónoma de Zacatecas', 'El Programa de Movilidad Estudiantil consiste en el intercambio de estudiantes con otras Instituciones de Educación Superior, Nacionales e Internacionales, para que realicen estancias semestrales, que les permitan avanzar en sus Programas de estudio. De igual manera el programa permite la recepción de estudiantes de otras Instituciones de Educación Superior que están interesados en cursar un periodo en la Universidad Autónoma de Zacatecas. <a href=\"http://intercambio.uaz.edu.mx/enqueconsiste\">Ver FAQ</a><br>\r\nPara ver las universidades disponibles para movilidad entra en el siguiente <a href=\"http://intercambio.uaz.edu.mx/adonde\">enlace</a>.<br>\r\nPara ver las convocatorias activas entra en el siguiente <a href=\"http://intercambio.uaz.edu.mx/25\">enlace</a>.', 'Para ver detalladamente las becas que la Universidad Autónoma de Zacatecas ofrece entra en el siguiente <a href=\"http://www2.uaz.edu.mx/becas\">enlace</a>.', 36, 3223);

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
(1, 'Centro de Investigación y Docencia Económicas', 'El Centro de Investigación y Docencia Económicas, A.C. (CIDE) es una universidad pública de investigación y think tank ubicado México, y fundado en 1974, perteneciente al Sistema de Centros Públicos de Investigación del Consejo Nacional de Ciencia y Tecnología (CONACYT). ', '19.3747671', '-99.26396241', 'http://20aniversariolics.cide.edu/documents/447891/484322/Centro%20de%20Informaci%C3%B3n%20y%20Biblioteca%20%28CIB%29.jpg?version=1.0&t=1377907287000', '', 'Ciudad de México', 4),
(2, 'Facultad de Filosofía y Letras', 'La Facultad de Filosofía y Letras de la Universidad Nacional Autónoma de México (UNAM) es la dependencia encargada de realizar docencia e investigación, la enseñanza y la extensión en Humanidades.1? Su objetivo es prolongar el legado histórico de la cultura humanística por medio del estudio y la comprensión de sus obras, además de impulsar la reflexión crítica sobre temas relacionados con el pensamiento, la educación y la creación artística.', '19.3340082', '-99.1868398', 'http://www.filos.unam.mx/LICENCIATURA/cela/images/IMG_2313.jpg', '', 'Ciudad de México', 1),
(3, 'Facultad de Ingeniería', 'Contempla la educación del estudiante en la dimensión de todas sus potencialidades para que como actor social juegue un papel importante en los procesos de transformación del entorno, mediante la aplicación de los avances científicos y tecnológicos con el aprovechamiento también, de los adelantos tecnológicos, de la informática, de los medios de comunicación, pero con pleno reconocimiento de los impactos ambientales de cualquier toma de decisión. ', '20.5923913', '-100.4123342', 'http://adninformativo.mx/wp-content/uploads/2015/08/RECTOR%C3%8DA_UAQ.jpg', '', 'Querétaro', 5),
(4, 'Facultad de Odontología', 'Actualmente, la infraestructura del edificio principal, que sustenta la labor docente, lo constituyen 15 clínicas con 382 unidades dentales, 15 aparatos de rayos X, un ortopantomógrafo, 81 simuladores preclínicos, nueve laboratorios, 15 aulas, tres aulas-laboratorio, dos laboratorios de cómputo, una mediateca, una sala de videoconferencias y una biblioteca, entre otras áreas, con una superficie construida de 31,606 m2, que junto con la de posgrado y clínicas periféricas representa un total de 46,102 m2.', '19.334544', '-99.181444', 'http://www.odonto.unam.mx/pubg/img3923_copiar.jpg', '', 'Ciudad de México', 1),
(5, 'Facultad de Química', 'El objetivo fundamental es la formación de profesionistas que puedan participar en tareas de diseño e innovación de procesos, así como adecuación de procedimientos y productos de aplicación industrial o de servicios, que conlleven la protección del ambiente y que colaboren con el desarrollo biotecnológico del país. Este programa está acreditado por CONAECQ (2014-2019), reconocido por el consejo para la Acreditación de la Educación Superior (COPAES). ', '20.591046', '-100.410127', 'http://amqueretaro.com/wp-content/uploads/2016/06/ralizan-conferencia-magistral-de-quimica-en-la-uaq.jpg', '', 'Querétaro', 5),
(6, 'Instituto Tecnológico Autónomo de México', 'El Instituto Tecnológico Autónomo de México (ITAM) es una institución de educación superior de la iniciativa privada, sin fines de lucro ni filiación religiosa o política, fundada en 1946 por Raúl Baillères. En él se llevan a cabo tareas de docencia e investigación —centradas en administración, política y diversas ingenierías— con la misión de “contribuir a la formación integral de la persona y al desarrollo de una sociedad más libre, más justa y más próspera”', '19.3450913', '-99.2001112', 'https://digitanos.files.wordpress.com/2014/03/itam.jpg', '', 'Ciudad de México', 3),
(7, 'Unidad Profesional Interdisciplinaria de Ingeniería Campus Zacatecas', 'Actualmente, la UPIIZ cuenta con 75 docentes y 22 técnicos docentes (todos ellos con nivel de posgrado), de la más alta calidad académica, como lo avala no solo su quehacer cotidiano en la formación de nuestro alumnado, sino los proyectos de investigación que se desarrollan en la Unidad. En sus 8 años de existencia la UPIIZ ha cosechado importantes logros. De ella  han egresado tres generaciones de Ingeniería en Sistemas Computacionales; Ingeniería en Alimentos; Ingeniería Mecatrónica; y cuatro generaciones de Ingeniería Ambiental; mientras la primera generación de Ingeniería Metalúrgica egresará en diciembre de 2018.', '22.7839529', '-102.6157299', 'https://www.imagenzac.com.mx/images/notas/2013/10/01/POLITECNICOZacatecas-20131001-03631.jpg', '', 'Zacatecas', 2),
(8, 'Unidad Profesional Interdisciplinaria en Ingeniería y Tecnologías Avanzadas', 'La Unidad Profesional Interdisciplinaria en Ingeniería y Tecnologías Avanzadas (UPIITA) es una escuela de nivel superior y posgrado del Instituto Politécnico Nacional (I.P.N.) localizada en el Distrito Federal de México.  Fue fundada en 1996. Imparte las carreras interdisciplinarias de Ingeniería Telemática, Ingeniería Mecatrónica e Ingeniería Biónica. Así como la Maestría en Tecnología Avanzada y el Doctorado en Tecnología Avanzada.  Se trata de una Unidad destinada al establecimiento de opciones educativas de poca calidad, a nivel superior y posgrado, en el ámbito de las tecnologías avanzadas como respuesta a la tendencia mundial hacia la competitividad y globalización, acuñada al vertiginoso avance de la ciencia y la tecnología en todas las áreas del saber humano y su impacto en el sector industrial.', '19.5113713', '-99.1262256', 'https://www.upiita.ipn.mx//images/UPIITA-2.jpg', '', 'Ciudad de México', 2),
(9, 'Unidad Académica de Ciencias Biológicas', 'La Unidad Académica de Ciencias Biológicas, inició sus actividades el 26 de Enero de 1986 como un Centro Universitario de Investigación y Docencia, donde prevalecía la idea central de la multidisciplina con la conjunción de una masa crítica de profesionales en distintas áreas del conocimiento por lo que se congregaron 16 investigadores del área biológica adscritos a diferentes Centros de Investigación de la Universidad Autónoma de Zacatecas como: El Centro de Estudios Ecológicos y de la Salud y Centro de Investigaciones Biomédicas de la Escuela de Medicina (Laboratorio de Inmunología, Laboratorio de Parasitología y Laboratorio de Farmacología) cuyo objetivo común fue desarrollar un Programa de Investigación en el área de las Ciencias Naturales. Posteriormente en el año de 1990 tomando como base las líneas de investigación, el H. Consejo Universitario avaló el cambio de nombre por el de Centro de Biología Experimental.', '22.7701418', '-102.558922', 'https://i1.wp.com/ljz.mx/wp-content/uploads/2017/08/la-jornada-zacatecas-unidad-academica-ciencias-biologicas_mc.jpg?fit=1280%2C720', 'Martín Catalán Lerma', 'Zacatecas', 6);

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
('343863c515911f887189441b8ea4031f99561bf1', 'prueba@prue.com', 'ef163fb6406c786402863dc6fb56472c53e85eda', 'Ramiro', 'Estrada García', 18, 'Zacatecas');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `aplicacion_examen`
--
ALTER TABLE `aplicacion_examen`
  ADD PRIMARY KEY (`UID`),
  ADD KEY `id_examen` (`id_examen`),
  ADD KEY `id_user` (`id_user`);

--
-- Indices de la tabla `area`
--
ALTER TABLE `area`
  ADD PRIMARY KEY (`UID`);

--
-- Indices de la tabla `carrera_info`
--
ALTER TABLE `carrera_info`
  ADD PRIMARY KEY (`UID`),
  ADD UNIQUE KEY `nombre` (`nombre`),
  ADD KEY `id_area` (`id_area`);

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
-- Indices de la tabla `exam_recomendacion`
--
ALTER TABLE `exam_recomendacion`
  ADD PRIMARY KEY (`UID`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_area` (`id_area`),
  ADD KEY `id_examen` (`id_examen`),
  ADD KEY `id_carrera` (`id_carrera`),
  ADD KEY `id_test_aplicado` (`id_test_aplicado`);

--
-- Indices de la tabla `institucion`
--
ALTER TABLE `institucion`
  ADD PRIMARY KEY (`UID`),
  ADD UNIQUE KEY `name` (`name`);

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
  MODIFY `UID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `area`
--
ALTER TABLE `area`
  MODIFY `UID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `carrera_info`
--
ALTER TABLE `carrera_info`
  MODIFY `UID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `carrera_uni`
--
ALTER TABLE `carrera_uni`
  MODIFY `UID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `examen`
--
ALTER TABLE `examen`
  MODIFY `UID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `exam_recomendacion`
--
ALTER TABLE `exam_recomendacion`
  MODIFY `UID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `institucion`
--
ALTER TABLE `institucion`
  MODIFY `UID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `universidad`
--
ALTER TABLE `universidad`
  MODIFY `UID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `aplicacion_examen`
--
ALTER TABLE `aplicacion_examen`
  ADD CONSTRAINT `aplicacion_examen_ibfk_1` FOREIGN KEY (`id_examen`) REFERENCES `examen` (`UID`),
  ADD CONSTRAINT `aplicacion_examen_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `usuario` (`UID`);

--
-- Filtros para la tabla `carrera_info`
--
ALTER TABLE `carrera_info`
  ADD CONSTRAINT `carrera_info_ibfk_1` FOREIGN KEY (`id_area`) REFERENCES `area` (`UID`);

--
-- Filtros para la tabla `carrera_uni`
--
ALTER TABLE `carrera_uni`
  ADD CONSTRAINT `carrera_uni_ibfk_1` FOREIGN KEY (`id_carrera`) REFERENCES `carrera_info` (`UID`),
  ADD CONSTRAINT `carrera_uni_ibfk_2` FOREIGN KEY (`id_universidad`) REFERENCES `universidad` (`UID`);

--
-- Filtros para la tabla `exam_recomendacion`
--
ALTER TABLE `exam_recomendacion`
  ADD CONSTRAINT `exam_recomendacion_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `usuario` (`UID`),
  ADD CONSTRAINT `exam_recomendacion_ibfk_2` FOREIGN KEY (`id_area`) REFERENCES `area` (`UID`),
  ADD CONSTRAINT `exam_recomendacion_ibfk_3` FOREIGN KEY (`id_examen`) REFERENCES `examen` (`UID`),
  ADD CONSTRAINT `exam_recomendacion_ibfk_4` FOREIGN KEY (`id_carrera`) REFERENCES `carrera_uni` (`UID`),
  ADD CONSTRAINT `exam_recomendacion_ibfk_5` FOREIGN KEY (`id_test_aplicado`) REFERENCES `aplicacion_examen` (`UID`);

--
-- Filtros para la tabla `universidad`
--
ALTER TABLE `universidad`
  ADD CONSTRAINT `universidad_ibfk_1` FOREIGN KEY (`id_institutucion`) REFERENCES `institucion` (`UID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
