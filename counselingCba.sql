-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-11-2020 a las 01:12:03
-- Versión del servidor: 10.4.13-MariaDB
-- Versión de PHP: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `gdlwebcamp`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admins`
--

CREATE TABLE `admins` (
  `ID_admin` int(11) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `hash_pass` varchar(60) NOT NULL,
  `nivel` int(1) NOT NULL,
  `actualizado` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `admins`
--

INSERT INTO `admins` (`ID_admin`, `usuario`, `hash_pass`, `nivel`, `actualizado`) VALUES
(35, 'admin', '$2y$12$g0cjuWeACtlUbLaHMad4uumz8yhcbuBpS32DIZgd2sPwQYV0JVPgW', 1, '0000-00-00 00:00:00'),
(89, 'Nacho', '$2y$12$4VVkQSZ9FIVMi07BSLzRFuKewXfzV0n55fcrsW/OfsVT377Rzt0kC', 0, '2020-11-22 14:23:26');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria_evento`
--

CREATE TABLE `categoria_evento` (
  `id_categoria` tinyint(10) NOT NULL,
  `cat_evento` varchar(50) NOT NULL,
  `icono` varchar(15) NOT NULL,
  `actualizado` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `categoria_evento`
--

INSERT INTO `categoria_evento` (`id_categoria`, `cat_evento`, `icono`, `actualizado`) VALUES
(1, 'Seminario', 'fa-university', '2020-11-21 14:35:27'),
(2, 'Conferencia', 'fa-users', '2020-11-21 08:47:08'),
(3, 'Cursos', 'fa-mortar-board', '2020-11-17 17:20:41');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eventos`
--

CREATE TABLE `eventos` (
  `evento_id` tinyint(10) NOT NULL,
  `nombre_evento` varchar(60) NOT NULL,
  `fecha_evento` date NOT NULL,
  `hora_evento` varchar(10) NOT NULL,
  `id_cat_evento` tinyint(10) NOT NULL,
  `id_inv` tinyint(4) NOT NULL,
  `clave` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `eventos`
--

INSERT INTO `eventos` (`evento_id`, `nombre_evento`, `fecha_evento`, `hora_evento`, `id_cat_evento`, `id_inv`, `clave`) VALUES
(4, 'Certificación en PNL (Programación-Neuro-Lingüística).', '2020-12-09', '02:00 PM', 3, 3, 'curs_01'),
(7, '15 hábitos para vivir con abundancia.', '2020-12-09', '10:00:00', 2, 6, 'conf_01'),
(8, 'Descubre a qué dedicarte.', '2020-12-09', '05:00 PM', 2, 3, 'conf_02'),
(9, 'Superación personal', '2020-12-09', '07:00 PM', 2, 2, 'conf_03'),
(10, 'Coaching personal.', '2020-12-09', '10:00:00', 1, 6, 'sem_01'),
(11, 'Coaching de vida.', '2020-12-10', '10:00 AM', 3, 3, 'curs_02'),
(12, 'Curso intensivo de ayurveda.', '2020-12-10', '12:00:00', 3, 2, 'curs_03'),
(13, 'Coaching Nutricional.', '2020-12-10', '14:00:00', 3, 3, 'curs_04'),
(14, 'Inteligencia Emocional.', '2020-12-10', '17:00:00', 3, 4, 'curs_05'),
(15, 'Yo puedo lograr todas mis metas', '2020-12-10', '19:00:00', 3, 5, 'curs_06'),
(16, 'Desarrollo personal y autohipnosis', '2020-12-10', '21:00:00', 3, 6, 'curs_07'),
(17, 'Es posible lo imposible', '2020-12-10', '10:00:00', 2, 6, 'conf_04'),
(18, 'Despertando tu poder interior', '2020-12-10', '17:00:00', 2, 1, 'conf_05'),
(19, 'El arte de conseguir lo imposible', '2020-12-10', '19:00:00', 2, 2, 'conf_06'),
(20, 'Autoconocimiento y Desarrollo personal', '2020-12-10', '10:00:00', 1, 3, 'sem_02'),
(21, 'Yoga Salud: Cuerpo, Con-Ciencia y Alma.', '2020-12-10', '17:00:00', 1, 5, 'sem_03'),
(22, 'Entrena tu Mente para tomar Acción.', '2020-12-11', '10:00:00', 3, 1, 'curs_08'),
(23, 'Gestión del tiempo', '2020-12-11', '12:00:00', 3, 2, 'curs_09'),
(24, 'Mejora Tu Autoestima', '2020-12-11', '14:00:00', 3, 3, 'curs_10'),
(25, 'Los Secretos del Carisma, de la Influencia y Persuasión', '2020-12-11', '17:00:00', 3, 4, 'curs_11'),
(26, 'Desarrolla Tu Confianza', '2020-12-11', '19:00:00', 3, 5, 'curs_12'),
(30, 'Como crear una motivación indestructible', '2020-12-11', '10:00:00', 1, 4, 'sem_04'),
(31, 'Identifícate y define tus objetivos.', '2020-12-11', '17:00:00', 1, 1, 'sem_05'),
(32, 'Actitud ', '2020-12-10', '11:00:00', 2, 4, 'conf_07');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `invitados`
--

CREATE TABLE `invitados` (
  `invitado_id` tinyint(4) NOT NULL,
  `nombre_invitado` varchar(30) NOT NULL,
  `apellido_invitado` varchar(30) NOT NULL,
  `descripcion` text NOT NULL,
  `url_imagen` varchar(50) NOT NULL,
  `editado` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `invitados`
--

INSERT INTO `invitados` (`invitado_id`, `nombre_invitado`, `apellido_invitado`, `descripcion`, `url_imagen`, `editado`) VALUES
(1, 'David ', 'Bejarano', 'David Bejarano Coach Estratégico, practicante de PNL, el cual ha logrado con su experiencia internacional, aprender y entender el valor de las conexiones interpersonales, la comunicación y el crecimiento personal.', 'invitado1.jpg', '0000-00-00 00:00:00'),
(2, 'Fabiana ', 'Razo', 'Fabiana Razo es una coach y entrenadora certificada por el Dr. John C. Maxwell. \r\n\r\nDurante 10 años, Fabiana, trabajó en el sector privado desarrollando equipos de alto desempeño.\r\n\r\nA través de sus cursos, seminarios y capacitaciones ha formado a más de 10000 personas alrededor del mundo.', 'invitado2.jpg', '0000-00-00 00:00:00'),
(3, 'Álvaro ', 'Bilbao', 'Álvaro es un apasionado profesor con de cursos y seminarios. Sus alumnos (que van desde neurocientíficos, hasta padres, o educadores) lo califican como un maestro dinámico que contagia el entusiasmo que siente por mejorar la vida de las personas. Es uno de los neuropsicólogos con más experiencia en el ámbito de la rehabilitación de la memoria y desarrollo cerebral habiendo ayudado a cientos de pacientes a desarrollar su potencial cerebral. ', 'invitado3.jpg', '2020-10-11 09:41:30'),
(4, 'Sabina ', 'Serrano', 'mi principal valor personal es la creencia de que todas las personas son extraordinarias, solo han de decidir ser mejores, por ello estudié Psicología, realicé un Master en Dirección y Gestión de los RRHH donde obtuve la calificación de Mención de Honor y me especialicé en Coaching, Inteligencia Emocional y PNL con una formación certificada por Asesco e ICF. Además estoy certificada en el uso de la potente herramienta MBTI de desarrollo profesional por OPP.', 'invitado4.jpg', '0000-00-00 00:00:00'),
(5, 'Victor ', 'Camon', 'Apasionado por el crecimiento personal y profesional de las personas, soy un Homo Creativo y Coach Internacional.\r\n\r\nHackeo marcas y negocios para que destaquen y potencien sus habilidades.\r\n\r\nSin duda el hecho de tener un hermano gemelo ha hecho que cada día de mi vida, haya tenido que buscar el modo de diferenciarme de él.\r\n\r\nEsa necesidad de ser único me ha ayudado a crear ideas y proyectos fuera de toda idea.\r\n\r\nProyectos que nacían de cero y que necesitaban una adaptación. Creo para creer que no todo existe ya, y que nada está fuera de ser descubierto o creado.\r\n\r\nSoy Creativo, Habilidoso en la estrategia de negocios, Innovador y Autónomo en el conocimiento.', 'invitado5.jpg', '0000-00-00 00:00:00'),
(6, 'Andrea ', 'Herrera', 'Me apasiona acompañar a las personas que desean superarse a sí mismas, que notan que han tocado techo y quieren seguir descubriendo nuevos horizontes. Me apasiona también escribir y aprender, para lo que estoy escribiendo un libro, también acerca del Éxito. Me apasiona enseñar. ', 'invitado6.jpg', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `regalos`
--

CREATE TABLE `regalos` (
  `ID_regalo` int(11) NOT NULL,
  `nombre_regalo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `regalos`
--

INSERT INTO `regalos` (`ID_regalo`, `nombre_regalo`) VALUES
(1, 'Pulsera'),
(2, 'Etiquetas'),
(3, 'Plumas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registrados`
--

CREATE TABLE `registrados` (
  `ID_Registrado` bigint(20) UNSIGNED NOT NULL,
  `nombre_registrado` varchar(50) NOT NULL,
  `apellido_registrado` varchar(50) NOT NULL,
  `email_registrado` varchar(100) NOT NULL,
  `fecha_registro` datetime NOT NULL,
  `pases_articulos` longtext NOT NULL,
  `talleres_registrados` longtext NOT NULL,
  `regalo` int(11) NOT NULL,
  `total_pagado` varchar(50) NOT NULL,
  `pagado` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `registrados`
--

INSERT INTO `registrados` (`ID_Registrado`, `nombre_registrado`, `apellido_registrado`, `email_registrado`, `fecha_registro`, `pases_articulos`, `talleres_registrados`, `regalo`, `total_pagado`, `pagado`) VALUES
(24, 'Juan', 'Valdez', 'blackmaxgdl18@hotmail.com', '2017-01-15 06:55:24', '{\"un_dia\":{\"cantidad\":\"\"},\"pase_completo\":{\"cantidad\":\"\"},\"pase_2dias\":{\"cantidad\":\"\"},\"camisas\":3,\"etiquetas\":3}', '[]', 2, '33.900000000000006', 1),
(26, '', '', '', '2017-11-12 19:37:32', '{\"un_dia\":1,\"pase_completo\":1,\"pase_2dias\":1,\"camisas\":1,\"etiquetas\":1}', '{\"eventos\":[\"22\",\"23\"]}', 2, '61.3', 1),
(28, 'ju', 'daa', 'jpdelatorrevaldez@gmail.com', '2018-10-22 01:51:03', '{\"un_dia\":{\"cantidad\":\"1\"},\"pase_completo\":{\"cantidad\":\"\"},\"pase_2dias\":{\"cantidad\":\"\"},\"camisas\":1,\"etiquetas\":2}', '{\"eventos\":[\"9\",\"7\"]}', 1, '43.3', 0),
(29, 'Juan Pablo', 'De la t', 'jpdelatorrevaldez@gmail.com', '2018-10-22 01:51:44', '{\"un_dia\":{\"cantidad\":\"1\"},\"pase_completo\":{\"cantidad\":\"\"},\"pase_2dias\":{\"cantidad\":\"\"},\"camisas\":2,\"etiquetas\":1}', '{\"eventos\":[\"10\",\"6\"]}', 1, '50.6', 1),
(30, 'juan', 'ad', 'correo@correo.com', '2018-10-22 02:11:26', '{\"un_dia\":{\"cantidad\":\"1\"},\"pase_completo\":{\"cantidad\":\"\"},\"pase_2dias\":{\"cantidad\":\"\"},\"camisas\":1,\"etiquetas\":2}', '{\"eventos\":[\"7\"]}', 1, '43.3', 1),
(31, 'juan', 'de la t', 'correo@correo.com', '2018-10-22 02:27:21', '{\"un_dia\":{\"cantidad\":\"1\"},\"pase_completo\":{\"cantidad\":\"\"},\"pase_2dias\":{\"cantidad\":\"\"},\"camisas\":1,\"etiquetas\":2}', '{\"eventos\":[\"8\"]}', 2, '43.3', 1),
(32, '1', '2', 'correo@correo.com', '2018-10-22 02:35:09', '{\"un_dia\":{\"cantidad\":\"1\"},\"pase_completo\":{\"cantidad\":\"\"},\"pase_2dias\":{\"cantidad\":\"\"}}', '[]', 2, '30', 1),
(33, 'correo', '1', 'correo@correo.com', '2018-10-22 02:36:47', '{\"un_dia\":{\"cantidad\":\"1\"},\"pase_completo\":{\"cantidad\":\"\"},\"pase_2dias\":{\"cantidad\":\"\"}}', '[]', 2, '30', 1),
(34, 'juan', 'v', 'correo@correo.com', '2018-10-22 02:48:24', '{\"un_dia\":{\"cantidad\":\"1\"},\"pase_completo\":{\"cantidad\":\"\"},\"pase_2dias\":{\"cantidad\":\"\"}}', '{\"eventos\":[\"7\"]}', 2, '30', 0),
(36, 'Juan', 'De la torre', 'correo@correo.com', '2018-10-22 03:01:10', '{\"un_dia\":{\"cantidad\":\"1\"},\"pase_completo\":{\"cantidad\":\"\"},\"pase_2dias\":{\"cantidad\":\"\"},\"camisas\":1}', '{\"eventos\":[\"9\"]}', 2, '39.3', 0),
(37, '1', '2', 'correo@correo.com', '2018-10-22 03:02:09', '{\"un_dia\":{\"cantidad\":\"1\"},\"pase_completo\":{\"cantidad\":\"\"},\"pase_2dias\":{\"cantidad\":\"\"}}', '{\"eventos\":[\"6\"]}', 1, '30', 0),
(38, 'jua', 'c', 'correo@correo.com', '2018-10-22 03:02:55', '{\"un_dia\":{\"cantidad\":\"1\"},\"pase_completo\":{\"cantidad\":\"\"},\"pase_2dias\":{\"cantidad\":\"\"}}', '{\"eventos\":[\"7\"]}', 2, '30', 0),
(39, 'Juan Pablo', 'ca', 'correo@correo.com', '2018-10-22 03:04:08', '{\"un_dia\":{\"cantidad\":\"1\"},\"pase_completo\":{\"cantidad\":\"\"},\"pase_2dias\":{\"cantidad\":\"\"}}', '{\"eventos\":[\"8\"]}', 1, '30', 0),
(40, 'juan', 'co', 'correo@correo.com', '2018-10-22 03:07:14', '{\"un_dia\":{\"cantidad\":\"1\"},\"pase_completo\":{\"cantidad\":\"\"},\"pase_2dias\":{\"cantidad\":\"\"}}', '{\"eventos\":[\"7\"]}', 2, '30', 0),
(41, 'Juan', 'de ', 'correo@correo.com', '2018-10-22 05:00:13', '{\"un_dia\":{\"cantidad\":\"1\"},\"pase_completo\":{\"cantidad\":\"\"},\"pase_2dias\":{\"cantidad\":\"\"},\"camisas\":10,\"etiquetas\":20}', '{\"eventos\":[\"8\"]}', 2, '163', 0),
(42, 'Juan Pablo', 'De la torre', 'correo@correo.com', '2018-10-22 05:01:09', '{\"un_dia\":{\"cantidad\":\"1\"},\"pase_completo\":{\"cantidad\":\"\"},\"pase_2dias\":{\"cantidad\":\"\"},\"camisas\":1,\"etiquetas\":2}', '{\"eventos\":[\"6\"]}', 2, '43.3', 0),
(43, 'Juan Pablo', 'De la torre', 'correo@correo.com', '2018-10-22 05:02:22', '{\"un_dia\":{\"cantidad\":\"1\"},\"pase_completo\":{\"cantidad\":\"\"},\"pase_2dias\":{\"cantidad\":\"\"},\"camisas\":1,\"etiquetas\":2}', '{\"eventos\":[\"6\"]}', 1, '43.3', 0),
(44, 'Juan', 'De la t', 'correo@correo.com', '2018-10-22 05:04:18', '{\"un_dia\":{\"cantidad\":\"1\"},\"pase_completo\":{\"cantidad\":\"\"},\"pase_2dias\":{\"cantidad\":\"\"},\"camisas\":1}', '{\"eventos\":[\"8\"]}', 2, '39.3', 1),
(45, 'Juan Pablo', 'DE', 'correo@correo.com', '2018-10-22 05:13:39', '{\"un_dia\":{\"cantidad\":\"1\"},\"pase_completo\":{\"cantidad\":\"\"},\"pase_2dias\":{\"cantidad\":\"\"},\"camisas\":1}', '{\"eventos\":[\"6\"]}', 2, '39.3', 1),
(46, 'ca', 'ju', 'correo@correo.com', '2018-10-22 06:19:41', '{\"un_dia\":{\"cantidad\":\"1\"},\"pase_completo\":{\"cantidad\":\"\"},\"pase_2dias\":{\"cantidad\":\"\"},\"etiquetas\":1}', '{\"eventos\":[\"8\"]}', 1, '32', 0),
(47, 'zxc', 'zxc', 'zxc@asd', '2020-10-11 14:40:43', '{\"un_dia\":{\"cantidad\":\"1\"},\"pase_completo\":{\"cantidad\":\"\"},\"pase_2dias\":{\"cantidad\":\"\"},\"camisas\":1}', '[]', 2, '39.3', 0),
(48, 'ignacio', 'probst', 'asdf@as', '2020-10-30 14:18:04', '{\"un_dia\":{\"cantidad\":\"\"},\"pase_completo\":{\"cantidad\":\"1\"},\"pase_2dias\":{\"cantidad\":\"1\"}}', '[]', 1, '95', 0),
(49, 'ignacio', 'probst', 'nachp@gm.com', '2020-11-18 14:20:19', '{\"un_dia\":{\"cantidad\":\"\"},\"pase_completo\":{\"cantidad\":\"2\"},\"pase_2dias\":{\"cantidad\":\"\"}}', '[]', 2, '2998', 0),
(50, 'ignacio', 'probst', 'nachp@gm.com', '2020-11-18 14:38:32', '{\"un_dia\":{\"cantidad\":\"\"},\"pase_completo\":{\"cantidad\":\"2\"},\"pase_2dias\":{\"cantidad\":\"\"}}', '[]', 1, '2998', 0),
(51, '', '', '', '2020-11-18 21:21:26', '{\"un_dia\":{\"cantidad\":\"\"},\"pase_completo\":{\"cantidad\":\"2\"},\"pase_2dias\":{\"cantidad\":\"\"}}', '[]', 2, '2998', 0),
(52, '', '', '', '2020-11-20 22:08:20', '{\"un_dia\":{\"cantidad\":\"1\"},\"pase_completo\":{\"cantidad\":\"\"},\"pase_2dias\":{\"cantidad\":\"\"}}', '[]', 2, '800', 0),
(53, 'Juan', 'perez pro', 'nachp@gm.com', '2020-11-20 19:27:13', '{\"un_dia\":{\"cantidad\":\"1\"},\"pase_completo\":{\"cantidad\":\"2\"},\"pase_2dias\":{\"cantidad\":\"3\"}}', '[]', 2, '265', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`ID_admin`),
  ADD UNIQUE KEY `usuario` (`usuario`);

--
-- Indices de la tabla `categoria_evento`
--
ALTER TABLE `categoria_evento`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `eventos`
--
ALTER TABLE `eventos`
  ADD PRIMARY KEY (`evento_id`),
  ADD KEY `id_cat_evento` (`id_cat_evento`),
  ADD KEY `id_inv` (`id_inv`);

--
-- Indices de la tabla `invitados`
--
ALTER TABLE `invitados`
  ADD PRIMARY KEY (`invitado_id`);

--
-- Indices de la tabla `regalos`
--
ALTER TABLE `regalos`
  ADD PRIMARY KEY (`ID_regalo`);

--
-- Indices de la tabla `registrados`
--
ALTER TABLE `registrados`
  ADD PRIMARY KEY (`ID_Registrado`),
  ADD KEY `regalo` (`regalo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `admins`
--
ALTER TABLE `admins`
  MODIFY `ID_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT de la tabla `categoria_evento`
--
ALTER TABLE `categoria_evento`
  MODIFY `id_categoria` tinyint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de la tabla `eventos`
--
ALTER TABLE `eventos`
  MODIFY `evento_id` tinyint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `invitados`
--
ALTER TABLE `invitados`
  MODIFY `invitado_id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `regalos`
--
ALTER TABLE `regalos`
  MODIFY `ID_regalo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `registrados`
--
ALTER TABLE `registrados`
  MODIFY `ID_Registrado` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `eventos`
--
ALTER TABLE `eventos`
  ADD CONSTRAINT `eventos_ibfk_1` FOREIGN KEY (`id_cat_evento`) REFERENCES `categoria_evento` (`id_categoria`),
  ADD CONSTRAINT `eventos_ibfk_2` FOREIGN KEY (`id_inv`) REFERENCES `invitados` (`invitado_id`);

--
-- Filtros para la tabla `registrados`
--
ALTER TABLE `registrados`
  ADD CONSTRAINT `registrados_ibfk_1` FOREIGN KEY (`regalo`) REFERENCES `regalos` (`ID_regalo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
