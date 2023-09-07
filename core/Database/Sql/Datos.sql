-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-09-2023 a las 16:31:56
-- Versión del servidor: 10.4.17-MariaDB
-- Versión de PHP: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `academia`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bitacora`
--

CREATE TABLE `bitacora` (
  `BitacoraID` int(11) NOT NULL,
  `FechaHora` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `UsuarioID` int(11) DEFAULT NULL,
  `Accion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catedras`
--

CREATE TABLE `catedras` (
  `CatedraID` int(11) NOT NULL,
  `NombreCatedra` varchar(255) NOT NULL,
  `Status` tinyint(4) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `catedras`
--

INSERT INTO `catedras` (`CatedraID`, `NombreCatedra`, `Status`) VALUES
(1, 'Piano', 1),
(2, 'Canto', 1),
(3, 'Guitarra', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuracionweb`
--

CREATE TABLE `configuracionweb` (
  `ConfiguracionID` int(11) NOT NULL,
  `Nombre` varchar(255) NOT NULL,
  `Valor` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `configuracionweb`
--

INSERT INTO `configuracionweb` (`ConfiguracionID`, `Nombre`, `Valor`) VALUES
(1, 'Título', 'Sistema de Gestión de Catedras'),
(2, 'Menú', 'Piano,Canto,Guitarra');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuentasusuarios`
--

CREATE TABLE `cuentasusuarios` (
  `UsuarioID` int(11) NOT NULL,
  `EstudianteID` int(11) DEFAULT NULL,
  `Usuario` varchar(255) NOT NULL,
  `Contraseña` varchar(255) NOT NULL,
  `PermisoID` int(11) DEFAULT NULL,
  `Status` tinyint(4) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cuentasusuarios`
--

INSERT INTO `cuentasusuarios` (`UsuarioID`, `EstudianteID`, `Usuario`, `Contraseña`, `PermisoID`, `Status`) VALUES
(1, 1, 'estudiante', '123456', 1, 1),
(2, 2, 'admin', '123456', 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiantes`
--

CREATE TABLE `estudiantes` (
  `EstudianteID` int(11) NOT NULL,
  `Nombre` varchar(255) NOT NULL,
  `Telefono` varchar(15) DEFAULT NULL,
  `CorreoElectronico` varchar(255) DEFAULT NULL,
  `Status` tinyint(4) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estudiantes`
--

INSERT INTO `estudiantes` (`EstudianteID`, `Nombre`, `Telefono`, `CorreoElectronico`, `Status`) VALUES
(1, 'Juan Pérez', '123-456-7890', 'juan@example.com', 1),
(2, 'María González', '987-654-3210', 'maria@example.com', 1),
(3, 'Carlos López', '555-555-5555', 'carlos@example.com', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiantescatedras`
--

CREATE TABLE `estudiantescatedras` (
  `EstudianteCatedraID` int(11) NOT NULL,
  `EstudianteID` int(11) DEFAULT NULL,
  `CatedraID` int(11) DEFAULT NULL,
  `CodigoUnico` varchar(15) NOT NULL,
  `Status` tinyint(4) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estudiantescatedras`
--

INSERT INTO `estudiantescatedras` (`EstudianteCatedraID`, `EstudianteID`, `CatedraID`, `CodigoUnico`, `Status`) VALUES
(1, 1, 1, 'P-001', 1),
(2, 2, 1, 'P-002', 1),
(3, 2, 2, 'C-001', 1),
(4, 3, 3, 'G-001', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `PagoID` int(11) NOT NULL,
  `EstudianteCatedraID` int(11) DEFAULT NULL,
  `FechaPago` date DEFAULT NULL,
  `Monto` decimal(10,2) DEFAULT NULL,
  `ComprobantePago` blob DEFAULT NULL,
  `TipoMovimiento` enum('Pago','Deuda') DEFAULT NULL,
  `Status` tinyint(4) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

CREATE TABLE `permisos` (
  `PermisoID` int(11) NOT NULL,
  `Rol` varchar(50) NOT NULL,
  `AccesoPagos` tinyint(1) DEFAULT NULL,
  `AccesoCuentas` tinyint(1) DEFAULT NULL,
  `AccesoBitacora` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `permisos`
--

INSERT INTO `permisos` (`PermisoID`, `Rol`, `AccesoPagos`, `AccesoCuentas`, `AccesoBitacora`) VALUES
(1, 'Estudiante', 1, 1, 0),
(2, 'Admin', 1, 1, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `bitacora`
--
ALTER TABLE `bitacora`
  ADD PRIMARY KEY (`BitacoraID`),
  ADD KEY `UsuarioID` (`UsuarioID`);

--
-- Indices de la tabla `catedras`
--
ALTER TABLE `catedras`
  ADD PRIMARY KEY (`CatedraID`);

--
-- Indices de la tabla `configuracionweb`
--
ALTER TABLE `configuracionweb`
  ADD PRIMARY KEY (`ConfiguracionID`);

--
-- Indices de la tabla `cuentasusuarios`
--
ALTER TABLE `cuentasusuarios`
  ADD PRIMARY KEY (`UsuarioID`),
  ADD KEY `EstudianteID` (`EstudianteID`),
  ADD KEY `PermisoID` (`PermisoID`);

--
-- Indices de la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  ADD PRIMARY KEY (`EstudianteID`);

--
-- Indices de la tabla `estudiantescatedras`
--
ALTER TABLE `estudiantescatedras`
  ADD PRIMARY KEY (`EstudianteCatedraID`),
  ADD KEY `EstudianteID` (`EstudianteID`),
  ADD KEY `CatedraID` (`CatedraID`);

--
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`PagoID`),
  ADD KEY `EstudianteCatedraID` (`EstudianteCatedraID`);

--
-- Indices de la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD PRIMARY KEY (`PermisoID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `bitacora`
--
ALTER TABLE `bitacora`
  MODIFY `BitacoraID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `catedras`
--
ALTER TABLE `catedras`
  MODIFY `CatedraID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `configuracionweb`
--
ALTER TABLE `configuracionweb`
  MODIFY `ConfiguracionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `cuentasusuarios`
--
ALTER TABLE `cuentasusuarios`
  MODIFY `UsuarioID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  MODIFY `EstudianteID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `estudiantescatedras`
--
ALTER TABLE `estudiantescatedras`
  MODIFY `EstudianteCatedraID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `pagos`
--
ALTER TABLE `pagos`
  MODIFY `PagoID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `PermisoID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `bitacora`
--
ALTER TABLE `bitacora`
  ADD CONSTRAINT `bitacora_ibfk_1` FOREIGN KEY (`UsuarioID`) REFERENCES `cuentasusuarios` (`UsuarioID`);

--
-- Filtros para la tabla `cuentasusuarios`
--
ALTER TABLE `cuentasusuarios`
  ADD CONSTRAINT `cuentasusuarios_ibfk_1` FOREIGN KEY (`EstudianteID`) REFERENCES `estudiantes` (`EstudianteID`),
  ADD CONSTRAINT `cuentasusuarios_ibfk_2` FOREIGN KEY (`PermisoID`) REFERENCES `permisos` (`PermisoID`);

--
-- Filtros para la tabla `estudiantescatedras`
--
ALTER TABLE `estudiantescatedras`
  ADD CONSTRAINT `estudiantescatedras_ibfk_1` FOREIGN KEY (`EstudianteID`) REFERENCES `estudiantes` (`EstudianteID`),
  ADD CONSTRAINT `estudiantescatedras_ibfk_2` FOREIGN KEY (`CatedraID`) REFERENCES `catedras` (`CatedraID`);

--
-- Filtros para la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD CONSTRAINT `pagos_ibfk_1` FOREIGN KEY (`EstudianteCatedraID`) REFERENCES `estudiantescatedras` (`EstudianteCatedraID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
