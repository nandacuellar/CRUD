-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-05-2024 a las 06:02:02
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
-- Estructura de tabla para la tabla `aerolinea`
--

CREATE TABLE `aerolinea` (
  `ID_aerolinea` int(11) NOT NULL,
  `Nombre_aerolinea` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `aerolinea`
--

INSERT INTO `aerolinea` (`ID_aerolinea`, `Nombre_aerolinea`) VALUES
(1, 'Avianca'),
(2, 'LATAM'),
(3, 'Clic'),
(4, 'American Airlin'),
(5, 'LATAM');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudad`
--

CREATE TABLE `ciudad` (
  `ID_Ciudad` int(11) NOT NULL,
  `Nombre_ciudad` varchar(25) NOT NULL,
  `ID_Dep_FK` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ciudad`
--

INSERT INTO `ciudad` (`ID_Ciudad`, `Nombre_ciudad`, `ID_Dep_FK`) VALUES
(1, 'Leticia', 1),
(2, 'Medellín', 2),
(3, 'Arauca', 3),
(4, 'Barranquilla', 4),
(5, 'Bogotá, D.C.', 5),
(6, 'Cartagena De Indias', 6),
(7, 'Tunja', 7),
(8, 'Manizales', 8),
(9, 'Florencia', 9),
(10, 'Yopal', 10),
(11, 'Popayán', 11),
(12, 'Valledupar', 12),
(13, 'Quibdó', 13),
(14, 'Montería', 14),
(15, 'Inírida', 16),
(16, 'San José Del Guaviare', 17),
(17, 'Neiva', 18),
(18, 'Riohacha', 19),
(19, 'Santa Marta', 20),
(20, 'Villavicencio', 21),
(21, 'Pasto', 22),
(22, 'Cúcuta', 23),
(23, 'Mocoa', 24),
(24, 'Armenia', 25),
(25, 'Pereira', 26),
(26, 'San Andrés', 27),
(27, 'Bucaramanga', 28),
(28, 'Sincelejo', 29),
(29, 'Ibagué', 30),
(30, 'Cali', 31),
(31, 'Mitú', 32);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento`
--

CREATE TABLE `departamento` (
  `ID_Departamento` int(11) NOT NULL,
  `Nombre_Dep` varchar(25) NOT NULL,
  `ID_Pais_FK` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `departamento`
--

INSERT INTO `departamento` (`ID_Departamento`, `Nombre_Dep`, `ID_Pais_FK`) VALUES
(1, 'Amazonas', 1),
(2, 'Antioquia', 1),
(3, 'Arauca', 1),
(4, 'Atlántico', 1),
(5, 'Bogotá', 1),
(6, 'Bolívar', 1),
(7, 'Boyacá', 1),
(8, 'Caldas', 1),
(9, 'Caquetá', 1),
(10, 'Casanare', 1),
(11, 'Cauca', 1),
(12, 'Cesar', 1),
(13, 'Chocó', 1),
(14, 'Córdoba', 1),
(15, 'Cundinamarca', 1),
(16, 'Guainía', 1),
(17, 'Guaviare', 1),
(18, 'Huila', 1),
(19, 'La Guajira', 1),
(20, 'Magdalena', 1),
(21, 'Meta', 1),
(22, 'Nariño', 1),
(23, 'Norte de Santander', 1),
(24, 'Putumayo', 1),
(25, 'Quindío', 1),
(26, 'Risaralda', 1),
(27, 'San Andrés y Providencia', 1),
(28, 'Santander', 1),
(29, 'Sucre', 1),
(30, 'Tolima', 1),
(31, 'Valle del Cauca', 1),
(32, 'Vaupés', 1),
(33, 'Vichada', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_vuelo`
--

CREATE TABLE `estado_vuelo` (
  `ID_Estado` int(1) NOT NULL,
  `Estado_Vuelo` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estado_vuelo`
--

INSERT INTO `estado_vuelo` (`ID_Estado`, `Estado_Vuelo`) VALUES
(1, 'A tiempo'),
(2, 'Abordando'),
(3, 'Cancelado'),
(4, 'Cerrado'),
(5, 'En sala'),
(6, 'Programado'),
(7, 'Retrasado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `genero`
--

CREATE TABLE `genero` (
  `ID_Genero` int(1) NOT NULL,
  `Tipo_Genero` varchar(3) DEFAULT NULL,
  `Genero` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `genero`
--

INSERT INTO `genero` (`ID_Genero`, `Tipo_Genero`, `Genero`) VALUES
(1, 'F', 'Femenino'),
(2, 'M', 'Masculino'),
(3, 'N/A', 'No definido');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `informacion_vuelos`
--

CREATE TABLE `informacion_vuelos` (
  `ID_info_vuelos` int(11) NOT NULL,
  `ID_Vuelo_FK` int(11) NOT NULL,
  `Pasajero_FK` int(11) DEFAULT NULL,
  `Tripulacion_FK` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `informacion_vuelos`
--

INSERT INTO `informacion_vuelos` (`ID_info_vuelos`, `ID_Vuelo_FK`, `Pasajero_FK`, `Tripulacion_FK`) VALUES
(1, 1, 1, 1),
(2, 1, 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pais`
--

CREATE TABLE `pais` (
  `ID_Pais` int(3) NOT NULL,
  `Nombre_Pais` varchar(25) DEFAULT NULL,
  `Nacionalidad` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pais`
--

INSERT INTO `pais` (`ID_Pais`, `Nombre_Pais`, `Nacionalidad`) VALUES
(1, 'Colombia', 'Colombiana'),
(2, 'España', 'Española'),
(3, 'Argentina', 'Argentina'),
(4, 'Canada', 'Canadiense'),
(5, 'Chile', 'Chilena'),
(6, 'Estados Unidos', 'Estadounidense'),
(7, 'Panama', 'Panameña');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pasajeros`
--

CREATE TABLE `pasajeros` (
  `ID_Pasajero` int(11) NOT NULL,
  `Primer_Nombre` varchar(25) NOT NULL,
  `Segundo_Nombre` varchar(25) DEFAULT NULL,
  `Primer_Apellido` varchar(25) NOT NULL,
  `Segundo_Apellido` varchar(25) DEFAULT NULL,
  `ID_Genero_FK` int(1) DEFAULT NULL,
  `ID_Pais_FK` int(3) DEFAULT NULL,
  `ID_Vuelo_FK` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pasajeros`
--

INSERT INTO `pasajeros` (`ID_Pasajero`, `Primer_Nombre`, `Segundo_Nombre`, `Primer_Apellido`, `Segundo_Apellido`, `ID_Genero_FK`, `ID_Pais_FK`, `ID_Vuelo_FK`) VALUES
(1, 'Yessica', 'Fernanda', 'Cuellar', 'Vargas', 1, 1, NULL),
(2, 'Jaime', 'Andres', 'Calderon', 'Duarte', 2, 2, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_trayecto`
--

CREATE TABLE `tipo_trayecto` (
  `ID_Tipo_Trayecto` int(11) NOT NULL,
  `Tipo_Trayecto` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo_trayecto`
--

INSERT INTO `tipo_trayecto` (`ID_Tipo_Trayecto`, `Tipo_Trayecto`) VALUES
(1, 'Ida'),
(2, 'Regreso');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_vuelo`
--

CREATE TABLE `tipo_vuelo` (
  `ID_tipo_vuelo` int(2) NOT NULL,
  `Tipo_vuelo` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo_vuelo`
--

INSERT INTO `tipo_vuelo` (`ID_tipo_vuelo`, `Tipo_vuelo`) VALUES
(1, 'Comercial'),
(2, 'Charter'),
(3, 'Carga'),
(4, 'Privado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trayecto`
--

CREATE TABLE `trayecto` (
  `ID_Trayecto` int(11) NOT NULL,
  `Ciudad_Origen` int(11) DEFAULT NULL,
  `Ciudad_Destino` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `trayecto`
--

INSERT INTO `trayecto` (`ID_Trayecto`, `Ciudad_Origen`, `Ciudad_Destino`) VALUES
(1, 5, 6),
(2, 5, 2),
(3, 5, 19),
(4, 6, 5),
(5, 6, 2),
(6, 2, 5),
(8, 2, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tripulacion`
--

CREATE TABLE `tripulacion` (
  `ID_Empleado` int(11) NOT NULL,
  `Primer_Nombre` varchar(25) NOT NULL,
  `Segundo_Nombre` varchar(25) DEFAULT NULL,
  `Primer_Apellido` varchar(25) NOT NULL,
  `Segundo_Apellido` varchar(25) DEFAULT NULL,
  `genero` int(1) DEFAULT NULL,
  `Relacion_aerolinea` int(11) DEFAULT NULL,
  `Cod_Pais_id_FK` int(3) DEFAULT NULL,
  `Vuelo_FK` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tripulacion`
--

INSERT INTO `tripulacion` (`ID_Empleado`, `Primer_Nombre`, `Segundo_Nombre`, `Primer_Apellido`, `Segundo_Apellido`, `genero`, `Relacion_aerolinea`, `Cod_Pais_id_FK`, `Vuelo_FK`) VALUES
(1, 'William', 'Efrain', 'Abella', 'Herrera', 2, 1, 1, NULL),
(2, 'Isabel', '', 'Realpe', 'Bravo', 1, 1, 2, NULL),
(3, 'Horacio', '', 'Astudillo', '', 2, 1, 1, NULL),
(4, 'Martha', 'Lucia', 'Cortez', 'Bonilla', 1, 2, 7, NULL),
(5, 'Janeth', '', 'Lopez', 'Calderon', 1, 2, 7, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vuelos`
--

CREATE TABLE `vuelos` (
  `ID_vuelo` int(11) NOT NULL,
  `Numero_Vuelo` varchar(5) NOT NULL,
  `Tipo_vuelo_FK` int(2) DEFAULT NULL,
  `Aerolinea_FK` int(11) DEFAULT NULL,
  `Estado_vuelo_FK` int(1) DEFAULT NULL,
  `Tipo_Trayecto_FK` int(11) DEFAULT NULL,
  `Trayecto_FK` int(11) DEFAULT NULL,
  `Hora_salida` datetime DEFAULT NULL,
  `Hora_llegada` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `vuelos`
--

INSERT INTO `vuelos` (`ID_vuelo`, `Numero_Vuelo`, `Tipo_vuelo_FK`, `Aerolinea_FK`, `Estado_vuelo_FK`, `Tipo_Trayecto_FK`, `Trayecto_FK`, `Hora_salida`, `Hora_llegada`) VALUES
(1, 'AV01', 1, 1, 1, 1, 1, '2024-05-30 10:00:00', '2024-05-30 11:10:00'),
(2, 'AV02', 1, 1, 6, 2, 4, '2024-06-03 16:30:00', '2024-06-03 17:40:00');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `aerolinea`
--
ALTER TABLE `aerolinea`
  ADD PRIMARY KEY (`ID_aerolinea`);

--
-- Indices de la tabla `ciudad`
--
ALTER TABLE `ciudad`
  ADD PRIMARY KEY (`ID_Ciudad`),
  ADD KEY `ID_Dep_FK` (`ID_Dep_FK`);

--
-- Indices de la tabla `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`ID_Departamento`),
  ADD KEY `ID_Pais_FK` (`ID_Pais_FK`);

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
-- Indices de la tabla `informacion_vuelos`
--
ALTER TABLE `informacion_vuelos`
  ADD PRIMARY KEY (`ID_info_vuelos`),
  ADD KEY `Pasajero_FK` (`Pasajero_FK`),
  ADD KEY `Tripulacion_FK` (`Tripulacion_FK`),
  ADD KEY `ID_Vuelo_FK` (`ID_Vuelo_FK`);

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
  ADD KEY `ID_Genero_FK` (`ID_Genero_FK`),
  ADD KEY `ID_Pais_FK` (`ID_Pais_FK`);

--
-- Indices de la tabla `tipo_trayecto`
--
ALTER TABLE `tipo_trayecto`
  ADD PRIMARY KEY (`ID_Tipo_Trayecto`);

--
-- Indices de la tabla `tipo_vuelo`
--
ALTER TABLE `tipo_vuelo`
  ADD PRIMARY KEY (`ID_tipo_vuelo`);

--
-- Indices de la tabla `trayecto`
--
ALTER TABLE `trayecto`
  ADD PRIMARY KEY (`ID_Trayecto`),
  ADD KEY `Ciudad_Origen` (`Ciudad_Origen`),
  ADD KEY `Ciudad_Destino` (`Ciudad_Destino`);

--
-- Indices de la tabla `tripulacion`
--
ALTER TABLE `tripulacion`
  ADD PRIMARY KEY (`ID_Empleado`),
  ADD KEY `Relacion_aerolinea` (`Relacion_aerolinea`),
  ADD KEY `Cod_Pais_id_FK` (`Cod_Pais_id_FK`),
  ADD KEY `genero` (`genero`),
  ADD KEY `Vuelo_FK` (`Vuelo_FK`);

--
-- Indices de la tabla `vuelos`
--
ALTER TABLE `vuelos`
  ADD PRIMARY KEY (`ID_vuelo`),
  ADD UNIQUE KEY `ID_vuelo` (`ID_vuelo`),
  ADD KEY `Tipo_vuelo_FK` (`Tipo_vuelo_FK`),
  ADD KEY `ID_aerolinea_FK` (`Aerolinea_FK`),
  ADD KEY `Estado_vuelo_FK` (`Estado_vuelo_FK`),
  ADD KEY `Id_Trayecto` (`Trayecto_FK`),
  ADD KEY `Tipo_Trayecto_FK` (`Tipo_Trayecto_FK`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `aerolinea`
--
ALTER TABLE `aerolinea`
  MODIFY `ID_aerolinea` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `departamento`
--
ALTER TABLE `departamento`
  MODIFY `ID_Departamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de la tabla `estado_vuelo`
--
ALTER TABLE `estado_vuelo`
  MODIFY `ID_Estado` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `pais`
--
ALTER TABLE `pais`
  MODIFY `ID_Pais` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `pasajeros`
--
ALTER TABLE `pasajeros`
  MODIFY `ID_Pasajero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tipo_trayecto`
--
ALTER TABLE `tipo_trayecto`
  MODIFY `ID_Tipo_Trayecto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tipo_vuelo`
--
ALTER TABLE `tipo_vuelo`
  MODIFY `ID_tipo_vuelo` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `trayecto`
--
ALTER TABLE `trayecto`
  MODIFY `ID_Trayecto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `tripulacion`
--
ALTER TABLE `tripulacion`
  MODIFY `ID_Empleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `vuelos`
--
ALTER TABLE `vuelos`
  MODIFY `ID_vuelo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ciudad`
--
ALTER TABLE `ciudad`
  ADD CONSTRAINT `ciudad_ibfk_1` FOREIGN KEY (`ID_Dep_FK`) REFERENCES `departamento` (`ID_Departamento`);

--
-- Filtros para la tabla `departamento`
--
ALTER TABLE `departamento`
  ADD CONSTRAINT `departamento_ibfk_1` FOREIGN KEY (`ID_Pais_FK`) REFERENCES `pais` (`ID_Pais`);

--
-- Filtros para la tabla `informacion_vuelos`
--
ALTER TABLE `informacion_vuelos`
  ADD CONSTRAINT `informacion_vuelos_ibfk_1` FOREIGN KEY (`ID_Vuelo_FK`) REFERENCES `vuelos` (`ID_vuelo`),
  ADD CONSTRAINT `informacion_vuelos_ibfk_2` FOREIGN KEY (`ID_Vuelo_FK`) REFERENCES `vuelos` (`ID_vuelo`),
  ADD CONSTRAINT `informacion_vuelos_ibfk_3` FOREIGN KEY (`Pasajero_FK`) REFERENCES `pasajeros` (`ID_Pasajero`),
  ADD CONSTRAINT `informacion_vuelos_ibfk_4` FOREIGN KEY (`Tripulacion_FK`) REFERENCES `tripulacion` (`ID_Empleado`);

--
-- Filtros para la tabla `pasajeros`
--
ALTER TABLE `pasajeros`
  ADD CONSTRAINT `pasajeros_ibfk_1` FOREIGN KEY (`ID_Genero_FK`) REFERENCES `genero` (`ID_Genero`),
  ADD CONSTRAINT `pasajeros_ibfk_2` FOREIGN KEY (`ID_Pais_FK`) REFERENCES `pais` (`ID_Pais`),
  ADD CONSTRAINT `pasajeros_ibfk_3` FOREIGN KEY (`ID_Pais_FK`) REFERENCES `pais` (`ID_Pais`);

--
-- Filtros para la tabla `trayecto`
--
ALTER TABLE `trayecto`
  ADD CONSTRAINT `trayecto_ibfk_1` FOREIGN KEY (`Ciudad_Origen`) REFERENCES `ciudad` (`ID_Ciudad`),
  ADD CONSTRAINT `trayecto_ibfk_2` FOREIGN KEY (`Ciudad_Destino`) REFERENCES `ciudad` (`ID_Ciudad`);

--
-- Filtros para la tabla `tripulacion`
--
ALTER TABLE `tripulacion`
  ADD CONSTRAINT `tripulacion_ibfk_1` FOREIGN KEY (`Relacion_aerolinea`) REFERENCES `aerolinea` (`ID_aerolinea`),
  ADD CONSTRAINT `tripulacion_ibfk_2` FOREIGN KEY (`Cod_Pais_id_FK`) REFERENCES `pais` (`ID_Pais`),
  ADD CONSTRAINT `tripulacion_ibfk_3` FOREIGN KEY (`genero`) REFERENCES `genero` (`ID_Genero`),
  ADD CONSTRAINT `tripulacion_ibfk_4` FOREIGN KEY (`Vuelo_FK`) REFERENCES `informacion_vuelos` (`ID_info_vuelos`);

--
-- Filtros para la tabla `vuelos`
--
ALTER TABLE `vuelos`
  ADD CONSTRAINT `vuelos_ibfk_1` FOREIGN KEY (`Tipo_vuelo_FK`) REFERENCES `tipo_vuelo` (`ID_tipo_vuelo`),
  ADD CONSTRAINT `vuelos_ibfk_2` FOREIGN KEY (`Aerolinea_FK`) REFERENCES `aerolinea` (`ID_aerolinea`),
  ADD CONSTRAINT `vuelos_ibfk_3` FOREIGN KEY (`Estado_vuelo_FK`) REFERENCES `estado_vuelo` (`ID_Estado`),
  ADD CONSTRAINT `vuelos_ibfk_4` FOREIGN KEY (`Trayecto_FK`) REFERENCES `trayecto` (`ID_Trayecto`),
  ADD CONSTRAINT `vuelos_ibfk_5` FOREIGN KEY (`Tipo_Trayecto_FK`) REFERENCES `tipo_trayecto` (`ID_Tipo_Trayecto`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
