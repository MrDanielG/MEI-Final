DROP DATABASE IF EXISTS `id1181196_mei`;
CREATE DATABASE `id1181196_mei`;
USE `id1181196_mei`;

CREATE TABLE `usuario` (
  `UID` varchar(40)  NOT NULL PRIMARY KEY,
  `email` varchar(72)  NOT NULL UNIQUE,
  `pass` varchar(40) CHARACTER SET latin1 NOT NULL,
  `name` varchar(72) CHARACTER SET latin1 NOT NULL,
  `last_name` varchar(90) CHARACTER SET latin1 NOT NULL,
  `edad` int(72) NOT NULL,
  `ciudad` varchar(72) CHARACTER SET latin1 NOT NULL
);

CREATE TABLE `area` (
  `UID` int PRIMARY KEY AUTO_INCREMENT,
  `nombre` varchar(72) NOT NULL,
  `descripcion` mediumtext NOT NULL
);

CREATE TABLE `carrera_info` (
  `UID` int PRIMARY KEY AUTO_INCREMENT,
  `nombre` varchar(72)  NOT NULL UNIQUE,
  `descripcion` mediumtext  NOT NULL,
  `id_area` INT  NOT NULL,
  `salario_min` float DEFAULT NULL,
  `salario_max` float DEFAULT NULL,
  `keywords` text  NOT NULL,
  FOREIGN KEY (`id_area`) REFERENCES `area`(`UID`)
);

CREATE TABLE `examen` (
  `UID` int PRIMARY KEY AUTO_INCREMENT,
  `nombre` varchar(72)  NOT NULL,
  `num_preguntas` varchar(72)  NOT NULL,
  `tipo` varchar(72)  NOT NULL,
  `archivo` varchar(40)  NOT NULL
);

CREATE TABLE `institucion` (
  `UID` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(120) NOT NULL UNIQUE,
  `intercambio` mediumtext  NOT NULL,
  `becas` mediumtext  NOT NULL,
  `rank_nac` int(11) DEFAULT NULL,
  `rank_mun` int(11) DEFAULT NULL
);

CREATE TABLE `aplicacion_examen` (
  `UID` int PRIMARY KEY AUTO_INCREMENT,
  `id_examen` int(20) NOT NULL,
  `id_user` varchar(40)  NOT NULL,
  `fecha` date NOT NULL,
  `resultado` varchar(40)  NOT NULL,
  FOREIGN KEY (`id_examen`) REFERENCES `examen`(`UID`),
  FOREIGN KEY (`id_user`) REFERENCES `usuario`(`UID`)
);

CREATE TABLE `universidad` (
  `UID` int PRIMARY KEY AUTO_INCREMENT,
  `nombre` varchar(150)  NOT NULL,
  `descripcion` mediumtext  NOT NULL,
  `lat` varchar(72)  NOT NULL,
  `lng` varchar(72)  NOT NULL,
  `foto_url` varchar(300)  DEFAULT NULL,
  `ciudad` varchar(72)  NOT NULL,
  `id_institutucion` int NOT NULL,
  FOREIGN KEY (`id_institutucion`) REFERENCES `institucion`(`UID`)
);

CREATE TABLE `carrera_uni` (
  `UID` int PRIMARY KEY AUTO_INCREMENT,
  `id_carrera` INT NOT NULL,
  `plan_estudio` mediumtext  NOT NULL,
  `perfil_egreso` mediumtext  NOT NULL,
  `id_universidad` INT NOT NULL,
  FOREIGN KEY (`id_carrera`) REFERENCES `carrera_info`(`UID`),
  FOREIGN KEY (`id_universidad`) REFERENCES `universidad`(`UID`)
);

CREATE TABLE `exam_recomendacion` (
  `UID` int PRIMARY KEY AUTO_INCREMENT,
  `id_user` varchar(40) NOT NULL,
  `id_examen` int NOT NULL,
  `id_area` INT NOT NULL,
  `id_carrera` int NOT NULL,
  `id_test_aplicado` int NOT NULL,
  FOREIGN KEY (`id_user`) REFERENCES `usuario`(`UID`),
  FOREIGN KEY (`id_area`) REFERENCES `area`(`UID`),
  FOREIGN KEY (`id_examen`) REFERENCES `examen`(`UID`),
  FOREIGN KEY (`id_carrera`) REFERENCES `carrera_uni`(`UID`),
  FOREIGN KEY (`id_test_aplicado`) REFERENCES `aplicacion_examen`(`UID`)
);
