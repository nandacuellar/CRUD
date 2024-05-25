-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-05-2024 a las 21:39:57
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
-- Base de datos: `informacion_vuelos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudad`
--

CREATE TABLE `ciudad` (
  `ID_Ciudad` int(11) NOT NULL,
  `Nombre_ciudad` varchar(25) NOT NULL,
  `ID_Departamento_PK` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudades_viaje`
--

CREATE TABLE `ciudades_viaje` (
  `ID_destino` int(11) NOT NULL,
  `ID_origen` int(11) DEFAULT NULL,
  `ID_ciudad_FK` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento`
--

CREATE TABLE `departamento` (
  `ID_Departamento` int(11) NOT NULL,
  `Nombre_Dep` varchar(25) NOT NULL,
  `Segundo_Nombre` varchar(25) DEFAULT NULL,
  `ID_Pais_FK` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_vuelo`
--

CREATE TABLE `estado_vuelo` (
  `ID_Estado` int(1) NOT NULL,
  `Estado_Vuelo` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `genero`
--

CREATE TABLE `genero` (
  `ID_Genero` int(1) NOT NULL,
  `Tipo_Genero` char(1) DEFAULT NULL,
  `Genero_FK` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `genero`
--

INSERT INTO `genero` (`ID_Genero`, `Tipo_Genero`, `Genero_FK`) VALUES
(1, 'F', 'Femenino'),
(2, 'M', 'Masculino'),
(3, 'N', 'No definifo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `info_vuelo`
--

CREATE TABLE `info_vuelo` (
  `ID_vuelo` int(11) NOT NULL,
  `Tipo_vuelo_FK` varchar(25) DEFAULT NULL,
  `ID_aerolinea_FK` varchar(25) DEFAULT NULL,
  `Estado_vuelo_FK` varchar(25) DEFAULT NULL,
  `ID_origen_FK` int(1) DEFAULT NULL,
  `ID_destino_FK` int(1) DEFAULT NULL,
  `Hora_salida` datetime DEFAULT NULL,
  `Hora_llegada` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pais`
--

CREATE TABLE `pais` (
  `ID_Pais` int(3) NOT NULL,
  `Nombre_Pais` varchar(25) DEFAULT NULL,
  `Nacionalidad_FK` varchar(25) DEFAULT NULL,
  `Indicativo_FK` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pais`
--

INSERT INTO `pais` (`ID_Pais`, `Nombre_Pais`, `Nacionalidad_FK`, `Indicativo_FK`) VALUES
(1, 'Colombia', 'Colombiana', '+57'),
(2, 'España', 'Española', '+51');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pasajeros`
--

CREATE TABLE `pasajeros` (
  `ID_Pasajero` int(11) NOT NULL,
  `Primer_Nombre` varchar(25) DEFAULT NULL,
  `Segundo_Nombre` varchar(25) DEFAULT NULL,
  `Primer_Apellido` varchar(25) DEFAULT NULL,
  `Segundo_Apellido` varchar(25) DEFAULT NULL,
  `Fecha_nacimiento` date DEFAULT NULL,
  `Tipo_Genero_FK` int(1) DEFAULT NULL,
  `ID_Nacionalidad` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pasajeros`
--

INSERT INTO `pasajeros` (`ID_Pasajero`, `Primer_Nombre`, `Segundo_Nombre`, `Primer_Apellido`, `Segundo_Apellido`, `Fecha_nacimiento`, `Tipo_Genero_FK`, `ID_Nacionalidad`) VALUES
(1, 'Yessica', 'Fernanda', 'Cuellar', 'Vargas', '1994-03-04', 1, 1),
(2, 'Jaime', 'Andres', 'Calderon', 'Duarte', '1982-04-29', 2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_vuelo`
--

CREATE TABLE `tipo_vuelo` (
  `ID_tipo_vuelo` int(2) NOT NULL,
  `Tipo_vuelo` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ciudad`
--
ALTER TABLE `ciudad`
  ADD PRIMARY KEY (`ID_Ciudad`);

--
-- Indices de la tabla `ciudades_viaje`
--
ALTER TABLE `ciudades_viaje`
  ADD PRIMARY KEY (`ID_destino`);

--
-- Indices de la tabla `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`ID_Departamento`);

--
-- Indices de la tabla `estado_vuelo`
--
ALTER TABLE `estado_vuelo`
  ADD PRIMARY KEY (`ID_Estado`);

--
-- Indices de la tabla `genero`
--
ALTER TABLE `genero`
  ADD PRIMARY KEY (`ID_Genero`);

--
-- Indices de la tabla `info_vuelo`
--
ALTER TABLE `info_vuelo`
  ADD PRIMARY KEY (`ID_vuelo`);

--
-- Indices de la tabla `pais`
--
ALTER TABLE `pais`
  ADD PRIMARY KEY (`ID_Pais`);

--
-- Indices de la tabla `pasajeros`
--
ALTER TABLE `pasajeros`
  ADD PRIMARY KEY (`ID_Pasajero`),
  ADD KEY `ID_Nacionalidad` (`ID_Nacionalidad`),
  ADD KEY `Tipo_Genero_FK` (`Tipo_Genero_FK`);

--
-- Indices de la tabla `tipo_vuelo`
--
ALTER TABLE `tipo_vuelo`
  ADD PRIMARY KEY (`ID_tipo_vuelo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `departamento`
--
ALTER TABLE `departamento`
  MODIFY `ID_Departamento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estado_vuelo`
--
ALTER TABLE `estado_vuelo`
  MODIFY `ID_Estado` int(1) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `info_vuelo`
--
ALTER TABLE `info_vuelo`
  MODIFY `ID_vuelo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pais`
--
ALTER TABLE `pais`
  MODIFY `ID_Pais` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `pasajeros`
--
ALTER TABLE `pasajeros`
  MODIFY `ID_Pasajero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tipo_vuelo`
--
ALTER TABLE `tipo_vuelo`
  MODIFY `ID_tipo_vuelo` int(2) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `pasajeros`
--
ALTER TABLE `pasajeros`
  ADD CONSTRAINT `pasajeros_ibfk_1` FOREIGN KEY (`ID_Nacionalidad`) REFERENCES `pais` (`ID_Pais`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
