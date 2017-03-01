-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-03-2017 a las 20:42:18
-- Versión del servidor: 10.1.21-MariaDB
-- Versión de PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `stock`
--
CREATE DATABASE IF NOT EXISTS `stock` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `stock`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `item`
--

CREATE TABLE `item` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `barcode` int(12) DEFAULT NULL,
  `stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `item`
--

INSERT INTO `item` (`id`, `name`, `barcode`, `stock`) VALUES
(2, 'ESC', NULL, 1),
(3, 'MOTOR', NULL, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movement`
--

CREATE TABLE `movement` (
  `id` int(11) NOT NULL,
  `idItem` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `idRequest` int(11) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `movement`
--

INSERT INTO `movement` (`id`, `idItem`, `quantity`, `idRequest`, `timestamp`) VALUES
(2, 2, 5, NULL, '2017-02-26 16:27:42'),
(3, 2, -1, NULL, '2017-02-26 16:27:42'),
(4, 2, 1, NULL, '2017-02-26 16:37:06'),
(5, 2, 1, NULL, '2017-02-26 16:50:01'),
(6, 2, -1, NULL, '2017-02-26 16:50:41'),
(7, 2, -1, NULL, '2017-02-26 16:50:43'),
(8, 2, 1, NULL, '2017-02-26 16:50:45'),
(9, 2, -1, NULL, '2017-02-26 16:50:47'),
(10, 2, -1, NULL, '2017-02-26 16:50:48'),
(11, 2, -1, NULL, '2017-02-26 16:50:49'),
(12, 2, -1, NULL, '2017-02-26 16:51:19');

--
-- Disparadores `movement`
--
DELIMITER $$
CREATE TRIGGER `stock` AFTER INSERT ON `movement` FOR EACH ROW UPDATE `item` SET `stock` = `stock`+NEW.quantity WHERE `item`.`id` = NEW.idItem
$$
DELIMITER ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `movement`
--
ALTER TABLE `movement`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idItem` (`idItem`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `item`
--
ALTER TABLE `item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `movement`
--
ALTER TABLE `movement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `movement`
--
ALTER TABLE `movement`
  ADD CONSTRAINT `movement_ibfk_1` FOREIGN KEY (`idItem`) REFERENCES `item` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
