-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-12-2023 a las 03:23:20
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `basededatos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `NOMBRE` varchar(50) NOT NULL,
  `DESCRIPCION` varchar(200) DEFAULT NULL,
  `IMAGEN` blob DEFAULT NULL,
  `ES_HIJA_DE` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`NOMBRE`, `DESCRIPCION`, `IMAGEN`, `ES_HIJA_DE`) VALUES
('Entretenimiento', 'Artículos relacionados con la música', NULL, NULL),
('Música', 'Artículos relacionados con la música', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categ_nota`
--

CREATE TABLE `categ_nota` (
  `NOMBRE_CATEGORIA` varchar(50) DEFAULT NULL,
  `NOMBRE_NOTA` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios`
--

CREATE TABLE `comentarios` (
  `ID` varchar(50) NOT NULL,
  `TEXTO` varchar(200) DEFAULT NULL,
  `EMAIL_OYENTE` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentario_nota`
--

CREATE TABLE `comentario_nota` (
  `TITULO_NOTA` varchar(50) NOT NULL,
  `ID_COMENTARIOS` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conductores`
--

CREATE TABLE `conductores` (
  `NOMBRE` varchar(50) NOT NULL,
  `NOMBRE_PROGRAMA` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `es_padre_de`
--

CREATE TABLE `es_padre_de` (
  `NOMBRE_CAT` varchar(50) DEFAULT NULL,
  `NOMBRE_CAT_HIJA` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `es_padre_de`
--

INSERT INTO `es_padre_de` (`NOMBRE_CAT`, `NOMBRE_CAT_HIJA`) VALUES
('Entretenimiento', 'Música');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notas`
--

CREATE TABLE `notas` (
  `TITULO` varchar(40) NOT NULL,
  `CONTENIDO` varchar(100) DEFAULT NULL,
  `IMAGEN` blob DEFAULT NULL,
  `RESUMEN` varchar(50) DEFAULT NULL,
  `nombre_programa` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `notas`
--

INSERT INTO `notas` (`TITULO`, `CONTENIDO`, `IMAGEN`, `RESUMEN`, `nombre_programa`) VALUES
('Esta nota ha sido editada', 'https://youtu.be/dQw4w9WgXcQ?si=rpWbEkYF6BlI-RCu', NULL, 'asd', 'Codigo espagueti by Victor Ramirez');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oyentes`
--

CREATE TABLE `oyentes` (
  `USERNAME` varchar(50) DEFAULT NULL,
  `user_password` varchar(255) DEFAULT NULL,
  `FECHA_REGISTRO` datetime DEFAULT NULL,
  `AVATAR` blob DEFAULT NULL,
  `EMAIL` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `oyentes`
--

INSERT INTO `oyentes` (`USERNAME`, `user_password`, `FECHA_REGISTRO`, `AVATAR`, `EMAIL`) VALUES
('ADMIN', '1234', '2023-12-03 18:33:28', NULL, 'correo@prueba.com'),
('UsuarioNuevo', 'ContraseñaSegura', '2023-11-26 15:30:00', NULL, 'usuario@correo.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `programa`
--

CREATE TABLE `programa` (
  `NOMBRE` varchar(50) NOT NULL,
  `DESCRIPCION` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `programa`
--

INSERT INTO `programa` (`NOMBRE`, `DESCRIPCION`) VALUES
('Codigo espagueti by Victor Ramirez', 'Olimpica estereo no tiene rival'),
('Programa Mañanero', 'Programa matutino con noticias y música variada');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`NOMBRE`);

--
-- Indices de la tabla `categ_nota`
--
ALTER TABLE `categ_nota`
  ADD KEY `NOMBRE_CATEGORIA` (`NOMBRE_CATEGORIA`),
  ADD KEY `NOMBRE_NOTA` (`NOMBRE_NOTA`);

--
-- Indices de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `EMAIL_OYENTE` (`EMAIL_OYENTE`);

--
-- Indices de la tabla `comentario_nota`
--
ALTER TABLE `comentario_nota`
  ADD PRIMARY KEY (`TITULO_NOTA`,`ID_COMENTARIOS`),
  ADD KEY `ID_COMENTARIOS` (`ID_COMENTARIOS`);

--
-- Indices de la tabla `conductores`
--
ALTER TABLE `conductores`
  ADD PRIMARY KEY (`NOMBRE`),
  ADD KEY `NOMBRE_PROGRAMA` (`NOMBRE_PROGRAMA`);

--
-- Indices de la tabla `es_padre_de`
--
ALTER TABLE `es_padre_de`
  ADD KEY `NOMBRE_CAT` (`NOMBRE_CAT`);

--
-- Indices de la tabla `notas`
--
ALTER TABLE `notas`
  ADD PRIMARY KEY (`TITULO`),
  ADD KEY `NOMBRE_PROGRAMA` (`nombre_programa`);

--
-- Indices de la tabla `oyentes`
--
ALTER TABLE `oyentes`
  ADD PRIMARY KEY (`EMAIL`);

--
-- Indices de la tabla `programa`
--
ALTER TABLE `programa`
  ADD PRIMARY KEY (`NOMBRE`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `categ_nota`
--
ALTER TABLE `categ_nota`
  ADD CONSTRAINT `categ_nota_ibfk_1` FOREIGN KEY (`NOMBRE_CATEGORIA`) REFERENCES `categorias` (`NOMBRE`),
  ADD CONSTRAINT `categ_nota_ibfk_2` FOREIGN KEY (`NOMBRE_NOTA`) REFERENCES `notas` (`TITULO`);

--
-- Filtros para la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `comentarios_ibfk_1` FOREIGN KEY (`EMAIL_OYENTE`) REFERENCES `oyentes` (`EMAIL`);

--
-- Filtros para la tabla `comentario_nota`
--
ALTER TABLE `comentario_nota`
  ADD CONSTRAINT `comentario_nota_ibfk_1` FOREIGN KEY (`TITULO_NOTA`) REFERENCES `notas` (`TITULO`),
  ADD CONSTRAINT `comentario_nota_ibfk_2` FOREIGN KEY (`ID_COMENTARIOS`) REFERENCES `comentarios` (`ID`);

--
-- Filtros para la tabla `conductores`
--
ALTER TABLE `conductores`
  ADD CONSTRAINT `conductores_ibfk_1` FOREIGN KEY (`NOMBRE_PROGRAMA`) REFERENCES `programa` (`NOMBRE`);

--
-- Filtros para la tabla `es_padre_de`
--
ALTER TABLE `es_padre_de`
  ADD CONSTRAINT `es_padre_de_ibfk_1` FOREIGN KEY (`NOMBRE_CAT`) REFERENCES `categorias` (`NOMBRE`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
