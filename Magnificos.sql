-- phpMyAdmin SQL Dump
-- version 4.9.7deb1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 09-06-2021 a las 12:11:12
-- Versión del servidor: 8.0.23-0ubuntu0.20.10.1
-- Versión de PHP: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `Magnificos`
--
CREATE DATABASE IF NOT EXISTS `Magnificos` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish2_ci;
USE `Magnificos`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Acciones`
--

CREATE TABLE `Acciones` (
  `idAccion` int NOT NULL,
  `nombre` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `descripcion` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Competiciones`
--

CREATE TABLE `Competiciones` (
  `IdCompeticion` int NOT NULL,
  `Nombre` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `CreditosUsuario`
--

CREATE TABLE `CreditosUsuario` (
  `idUsuario` int NOT NULL,
  `Creditos` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `DatosVarios`
--

CREATE TABLE `DatosVarios` (
  `idDato` int NOT NULL,
  `temporadaActual` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `FechaMaximoAbono` date NOT NULL,
  `CambiosPermitidos` int NOT NULL,
  `PrecioCambioExtra` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Demarcaciones`
--

CREATE TABLE `Demarcaciones` (
  `idDemarcacion` int NOT NULL,
  `nombreDemarcacion` varchar(100) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Futbolistas`
--

CREATE TABLE `Futbolistas` (
  `idFutbolista` int NOT NULL,
  `dorsal` int NOT NULL,
  `apodo` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `nombre` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `apellidos` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `paisNacimiento` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `fechaNac` date NOT NULL,
  `altura` float NOT NULL,
  `peso` int NOT NULL,
  `debutProfesional` date NOT NULL,
  `debutRealZaragoza` date NOT NULL,
  `idDemarcacion` int NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `foto` varchar(255) COLLATE utf8_spanish2_ci NOT NULL


) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

CREATE TABLE `Futbolistas_Stats` (
  `idFutbolista` int NOT NULL,
  `player_rating` decimal(3, 2),
  `player_type` varchar(20),
  `player_goals` smallint,
  `player_minutes` int,
  `player_fouls_committed` smallint,
  `player_duels_total` smallint,
  `player_duels_won` smallint


) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `LigaHasUsuario`
--

CREATE TABLE `LigaHasUsuario` (
  `IdUsuario` int NOT NULL,
  `idLiga` int NOT NULL,
  `invitacionAceptada` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Ligas`
--

CREATE TABLE `Ligas` (
  `idLiga` int NOT NULL,
  `NombreLiga` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `logoLiga` varchar(250) COLLATE utf8_spanish2_ci NOT NULL,
  `descripcionLiga` varchar(250) COLLATE utf8_spanish2_ci NOT NULL,
  `publica` tinyint(1) NOT NULL,
  `adminLiga` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `LigaValoraAcciones`
--

CREATE TABLE `LigaValoraAcciones` (
  `idLiga` int NOT NULL,
  `idAccion` int NOT NULL,
  `peso` int NOT NULL,
  `ponderaOrden` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Partido-Futbolista-Accion`
--

CREATE TABLE `Partido-Futbolista-Accion` (
  `idPartido` int NOT NULL,
  `idFutbolista` int NOT NULL,
  `idAccion` int NOT NULL,
  `valoracion` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Partidos`
--

CREATE TABLE `Partidos` (
  `idPartido` int NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `idCompeticion` int NOT NULL,
  `nombrePartido` int NOT NULL,
  `IdRival` int NOT NULL,
  `local` tinyint(1) NOT NULL,
  `golesZaragoza` int NOT NULL,
  `golesRival` int NOT NULL,
  `estadio` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `arbitro` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `temporada` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `finalizado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ProximoEquipo`
--

CREATE TABLE `ProximoEquipo` (
  `IdUsuario` int NOT NULL,
  `ifFutbolista` int NOT NULL,
  `IdLiga` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Rivales`
--

CREATE TABLE `Rivales` (
  `IdRival` int NOT NULL,
  `NombreEquipo` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `Estadio` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `Foto` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL COMMENT 'Ruta de la foto'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `temporadas`
--

CREATE TABLE `temporadas` (
  `temporada` varchar(50) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `UsuarioPartidoFutbolista`
--

CREATE TABLE `UsuarioPartidoFutbolista` (
  `IdUsuario` int NOT NULL,
  `idPartido` int NOT NULL,
  `idFutbolista` int NOT NULL,
  `idLiga` int NOT NULL,
  `orden` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Usuarios`
--

CREATE TABLE `Usuarios` (
  `IdUsuario` int NOT NULL,
  `IdWordPress` int NOT NULL,
  `nombreUsusaio` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `clave` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `abonado` tinyint(1) NOT NULL,
  `fechaAbono` date NOT NULL,
  `foto` varchar(255) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Acciones`
--
ALTER TABLE `Acciones`
  ADD PRIMARY KEY (`idAccion`);

--
-- Indices de la tabla `Competiciones`
--
ALTER TABLE `Competiciones`
  ADD PRIMARY KEY (`IdCompeticion`);

--
-- Indices de la tabla `CreditosUsuario`
--
ALTER TABLE `CreditosUsuario`
  ADD PRIMARY KEY (`idUsuario`);

--
-- Indices de la tabla `DatosVarios`
--
ALTER TABLE `DatosVarios`
  ADD PRIMARY KEY (`idDato`),
  ADD KEY `fk_datos_temporadas` (`temporadaActual`);

--
-- Indices de la tabla `Demarcaciones`
--
ALTER TABLE `Demarcaciones`
  ADD PRIMARY KEY (`idDemarcacion`);

--
-- Indices de la tabla `Futbolistas`
--
ALTER TABLE `Futbolistas`
  ADD PRIMARY KEY (`idFutbolista`),
  ADD KEY `fk_futbolista_demarcacion` (`idDemarcacion`);

--
-- Indices de la tabla `LigaHasUsuario`
--
ALTER TABLE `LigaHasUsuario`
  ADD PRIMARY KEY (`IdUsuario`,`idLiga`),
  ADD KEY `Fk_LigaHasUsuario-Liga` (`idLiga`);

--
-- Indices de la tabla `Ligas`
--
ALTER TABLE `Ligas`
  ADD PRIMARY KEY (`idLiga`),
  ADD KEY `Fk_UsuarioAdministraLiga` (`adminLiga`);

--
-- Indices de la tabla `LigaValoraAcciones`
--
ALTER TABLE `LigaValoraAcciones`
  ADD PRIMARY KEY (`idLiga`,`idAccion`),
  ADD KEY `fk_LigaValoraAcciones-Acciones` (`idAccion`);

--
-- Indices de la tabla `Partido-Futbolista-Accion`
--
ALTER TABLE `Partido-Futbolista-Accion`
  ADD PRIMARY KEY (`idPartido`,`idFutbolista`,`idAccion`) USING BTREE,
  ADD KEY `Fk-Part-Fut-Ac-Acciones` (`idAccion`),
  ADD KEY `Fk-Part-Fut-Ac-Futbolista` (`idFutbolista`);

--
-- Indices de la tabla `Partidos`
--
ALTER TABLE `Partidos`
  ADD PRIMARY KEY (`idPartido`),
  ADD KEY `fk_Partido_Competicion` (`idCompeticion`),
  ADD KEY `fk_Partido_Rival` (`IdRival`),
  ADD KEY `fk_Partido_temporada` (`temporada`);

--
-- Indices de la tabla `ProximoEquipo`
--
ALTER TABLE `ProximoEquipo`
  ADD PRIMARY KEY (`IdUsuario`,`ifFutbolista`,`IdLiga`),
  ADD KEY `fk_ProximoEquipo-Futbolistas` (`ifFutbolista`),
  ADD KEY `fk_ProximoEquipo-Liga` (`IdLiga`);

--
-- Indices de la tabla `Rivales`
--
ALTER TABLE `Rivales`
  ADD PRIMARY KEY (`IdRival`);

--
-- Indices de la tabla `temporadas`
--
ALTER TABLE `temporadas`
  ADD PRIMARY KEY (`temporada`);

--
-- Indices de la tabla `UsuarioPartidoFutbolista`
--
ALTER TABLE `UsuarioPartidoFutbolista`
  ADD PRIMARY KEY (`IdUsuario`,`idPartido`,`idFutbolista`,`idLiga`),
  ADD KEY `fk_UsuarioPartidoFutbolista-Futbolistas` (`idFutbolista`),
  ADD KEY `fk_UsuarioPartidoFutbolista-Partidos` (`idPartido`),
  ADD KEY `fk_UsuarioPartidoFutbolista-Ligas` (`idLiga`);

--
-- Indices de la tabla `Usuarios`
--
ALTER TABLE `Usuarios`
  ADD PRIMARY KEY (`IdUsuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `Competiciones`
--
ALTER TABLE `Competiciones`
  MODIFY `IdCompeticion` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `DatosVarios`
--
ALTER TABLE `DatosVarios`
  MODIFY `idDato` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Futbolistas`
--
ALTER TABLE `Futbolistas`
  MODIFY `idFutbolista` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Ligas`
--
ALTER TABLE `Ligas`
  MODIFY `idLiga` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Partidos`
--
ALTER TABLE `Partidos`
  MODIFY `idPartido` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Rivales`
--
ALTER TABLE `Rivales`
  MODIFY `IdRival` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Usuarios`
--
ALTER TABLE `Usuarios`
  MODIFY `IdUsuario` int NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `CreditosUsuario`
--
ALTER TABLE `CreditosUsuario`
  ADD CONSTRAINT `fk_Creditos_Usuario` FOREIGN KEY (`idUsuario`) REFERENCES `Usuarios` (`IdUsuario`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `DatosVarios`
--
ALTER TABLE `DatosVarios`
  ADD CONSTRAINT `fk_datos_temporadas` FOREIGN KEY (`temporadaActual`) REFERENCES `temporadas` (`temporada`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `Futbolistas`
--
ALTER TABLE `Futbolistas`
  ADD CONSTRAINT `fk_futbolista_demarcacion` FOREIGN KEY (`idDemarcacion`) REFERENCES `Demarcaciones` (`idDemarcacion`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `LigaHasUsuario`
--
ALTER TABLE `LigaHasUsuario`
  ADD CONSTRAINT `Fk_LigaHasUsuario-Liga` FOREIGN KEY (`idLiga`) REFERENCES `Ligas` (`idLiga`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `Fk_LigaHasUsuario-Usuario` FOREIGN KEY (`IdUsuario`) REFERENCES `Usuarios` (`IdUsuario`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `Ligas`
--
ALTER TABLE `Ligas`
  ADD CONSTRAINT `Fk_UsuarioAdministraLiga` FOREIGN KEY (`adminLiga`) REFERENCES `Usuarios` (`IdUsuario`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `LigaValoraAcciones`
--
ALTER TABLE `LigaValoraAcciones`
  ADD CONSTRAINT `fk_LigaValoraAcciones-Acciones` FOREIGN KEY (`idAccion`) REFERENCES `Acciones` (`idAccion`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_LigaValoraAcciones-Liga` FOREIGN KEY (`idLiga`) REFERENCES `Ligas` (`idLiga`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `Partido-Futbolista-Accion`
--
ALTER TABLE `Partido-Futbolista-Accion`
  ADD CONSTRAINT `Fk-Part-Fut-Ac-Acciones` FOREIGN KEY (`idAccion`) REFERENCES `Acciones` (`idAccion`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `Fk-Part-Fut-Ac-Futbolista` FOREIGN KEY (`idFutbolista`) REFERENCES `Futbolistas` (`idFutbolista`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `Fk-Part-Fut-Ac-Partido` FOREIGN KEY (`idPartido`) REFERENCES `Partidos` (`idPartido`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `Partidos`
--
ALTER TABLE `Partidos`
  ADD CONSTRAINT `fk_Partido_Competicion` FOREIGN KEY (`idCompeticion`) REFERENCES `Competiciones` (`IdCompeticion`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_Partido_Rival` FOREIGN KEY (`IdRival`) REFERENCES `Rivales` (`IdRival`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_Partido_temporada` FOREIGN KEY (`temporada`) REFERENCES `temporadas` (`temporada`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `ProximoEquipo`
--
ALTER TABLE `ProximoEquipo`
  ADD CONSTRAINT `fk_ProximoEquipo-Futbolistas` FOREIGN KEY (`ifFutbolista`) REFERENCES `Futbolistas` (`idFutbolista`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_ProximoEquipo-Liga` FOREIGN KEY (`IdLiga`) REFERENCES `Ligas` (`idLiga`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_ProximoEquipo-Usuarios` FOREIGN KEY (`IdUsuario`) REFERENCES `Usuarios` (`IdUsuario`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `UsuarioPartidoFutbolista`
--
ALTER TABLE `UsuarioPartidoFutbolista`
  ADD CONSTRAINT `fk_UsuarioPartidoFutbolista-Futbolistas` FOREIGN KEY (`idFutbolista`) REFERENCES `Futbolistas` (`idFutbolista`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_UsuarioPartidoFutbolista-Ligas` FOREIGN KEY (`idLiga`) REFERENCES `Ligas` (`idLiga`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_UsuarioPartidoFutbolista-Partidos` FOREIGN KEY (`idPartido`) REFERENCES `Partidos` (`idPartido`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_UsuarioPartidoFutbolista-Usuarios` FOREIGN KEY (`IdUsuario`) REFERENCES `Usuarios` (`IdUsuario`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
