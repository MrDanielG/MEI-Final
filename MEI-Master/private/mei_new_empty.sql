-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-07-2018 a las 07:53:23
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
  MODIFY `UID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `area`
--
ALTER TABLE `area`
  MODIFY `UID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `carrera_area`
--
ALTER TABLE `carrera_area`
  MODIFY `UID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `carrera_info`
--
ALTER TABLE `carrera_info`
  MODIFY `UID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `carrera_uni`
--
ALTER TABLE `carrera_uni`
  MODIFY `UID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `examen`
--
ALTER TABLE `examen`
  MODIFY `UID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `institucion`
--
ALTER TABLE `institucion`
  MODIFY `UID` int(11) NOT NULL AUTO_INCREMENT;

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
-- AUTO_INCREMENT de la tabla `sesion_agregar_unis`
--
ALTER TABLE `sesion_agregar_unis`
  MODIFY `UID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `universidad`
--
ALTER TABLE `universidad`
  MODIFY `UID` int(11) NOT NULL AUTO_INCREMENT;

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
  ADD CONSTRAINT `carrera_uni` FOREIGN KEY (`id_universidad`) REFERENCES `universidad` (`UID`),
  ADD CONSTRAINT `carrera_uni_ibfk_1` FOREIGN KEY (`id_carrera`) REFERENCES `carrera_info` (`UID`);

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
