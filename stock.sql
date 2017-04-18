-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 18, 2017 at 09:14 AM
-- Server version: 5.7.17-0ubuntu0.16.04.2
-- PHP Version: 7.0.15-0ubuntu0.16.04.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `stock`
--
CREATE DATABASE IF NOT EXISTS `stock` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `stock`;

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `barcode` int(12) DEFAULT NULL,
  `stock` int(11) NOT NULL,
  `alerta` int(11) NOT NULL DEFAULT '10'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`id`, `name`, `barcode`, `stock`, `alerta`) VALUES
(2, 'ESC', NULL, 14, 13),
(3, 'MOTOR', NULL, 930, 10),
(4, 'TEST', NULL, 10, 10),
(5, 'asd', NULL, 11, 10),
(6, 'aaaa', NULL, 19, 10),
(7, 'aaaa', NULL, 1210, 10),
(8, 'aaaa', NULL, 10, 10),
(9, 'aaaaasd', NULL, 10, 10),
(10, 'aaaaasd', NULL, 13, 10);

-- --------------------------------------------------------

--
-- Table structure for table `movement`
--

CREATE TABLE `movement` (
  `id` int(11) NOT NULL,
  `idItem` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `idRequest` int(11) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `movement`
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
(12, 2, -1, NULL, '2017-02-26 16:51:19'),
(13, 2, -6, NULL, '2017-03-31 08:50:19'),
(14, 2, 5, NULL, '2017-03-31 08:50:25'),
(15, 2, 6, NULL, '2017-03-31 08:50:30'),
(16, 2, -1, NULL, '2017-03-31 08:50:33'),
(17, 3, 15, NULL, '2017-03-31 09:03:07'),
(18, 2, 6, NULL, '2017-03-31 09:43:47'),
(19, 2, -1, NULL, '2017-03-31 09:43:52'),
(20, 2, -1, NULL, '2017-03-31 10:32:43'),
(21, 3, 15, NULL, '2017-04-16 23:10:51'),
(22, 10, 3, NULL, '2017-04-16 23:49:53'),
(23, 6, 14, NULL, '2017-04-16 23:50:06'),
(24, 2, 5, NULL, '2017-04-17 00:07:16'),
(25, 7, -1, NULL, '2017-04-17 00:18:24'),
(26, 7, 3, NULL, '2017-04-17 00:18:34'),
(27, 7, 3, NULL, '2017-04-17 00:20:25'),
(28, 4, 10, NULL, '2017-04-17 00:36:24'),
(29, 5, 1, NULL, '2017-04-17 00:36:29'),
(30, 5, 10, NULL, '2017-04-17 00:36:32'),
(31, 8, -10, NULL, '2017-04-17 00:36:38'),
(32, 8, 10, NULL, '2017-04-17 00:36:40'),
(33, 8, 10, NULL, '2017-04-17 00:36:45'),
(34, 7, 5, NULL, '2017-04-17 00:36:55'),
(35, 9, 10, NULL, '2017-04-17 00:37:05'),
(36, 10, 10, NULL, '2017-04-17 00:37:13'),
(37, 2, -1, NULL, '2017-04-17 00:37:24'),
(38, 2, -1, NULL, '2017-04-17 00:37:25'),
(39, 2, 1, NULL, '2017-04-17 00:48:18'),
(40, 2, -1, NULL, '2017-04-17 00:48:20'),
(41, 2, 2, NULL, '2017-04-17 00:53:47'),
(42, 7, 200, NULL, '2017-04-17 01:51:06'),
(43, 7, 200, NULL, '2017-04-17 01:51:54'),
(44, 7, 200, NULL, '2017-04-17 01:52:33'),
(45, 7, 200, NULL, '2017-04-17 01:53:26'),
(46, 7, 200, NULL, '2017-04-17 01:53:43'),
(47, 7, 200, NULL, '2017-04-17 01:54:23'),
(48, 3, 900, 2, '2017-04-17 01:57:03'),
(49, 6, 6, 4, '2017-04-17 02:19:49'),
(50, 6, -1, NULL, '2017-04-17 02:19:59');

--
-- Triggers `movement`
--
DELIMITER $$
CREATE TRIGGER `stock` AFTER INSERT ON `movement` FOR EACH ROW UPDATE `item` SET `stock` = `stock`+NEW.quantity WHERE `item`.`id` = NEW.idItem
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `request`
--

CREATE TABLE `request` (
  `id` int(11) NOT NULL,
  `requestDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `arrived` timestamp NULL DEFAULT NULL,
  `idItem` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `request`
--

INSERT INTO `request` (`id`, `requestDate`, `arrived`, `idItem`, `quantity`) VALUES
(1, '2017-04-17 01:03:22', '2017-04-17 01:54:23', 7, NULL),
(2, '2017-04-17 01:03:33', NULL, 3, 23),
(3, '2017-04-17 02:08:32', NULL, 9, NULL),
(4, '2017-04-17 02:11:01', '2017-04-17 02:19:49', 6, 6),
(5, '2017-04-17 02:11:13', NULL, 2, 2),
(6, '2017-04-17 02:11:26', NULL, 2, 2),
(7, '2017-04-17 02:11:43', NULL, 2, 2),
(8, '2017-04-17 02:13:54', NULL, 2, NULL),
(9, '2017-04-17 02:14:38', NULL, 2, NULL),
(10, '2017-04-17 02:15:37', NULL, 2, NULL),
(11, '2017-04-17 02:15:57', NULL, 2, NULL),
(12, '2017-04-17 02:17:19', NULL, 2, NULL),
(13, '2017-04-17 02:17:33', NULL, 2, NULL),
(14, '2017-04-17 02:18:31', NULL, 2, 11),
(15, '2017-04-17 02:19:36', NULL, 2, 11);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `movement`
--
ALTER TABLE `movement`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idItem` (`idItem`);

--
-- Indexes for table `request`
--
ALTER TABLE `request`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idItem` (`idItem`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `movement`
--
ALTER TABLE `movement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT for table `request`
--
ALTER TABLE `request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `movement`
--
ALTER TABLE `movement`
  ADD CONSTRAINT `movement_ibfk_1` FOREIGN KEY (`idItem`) REFERENCES `item` (`id`);

--
-- Constraints for table `request`
--
ALTER TABLE `request`
  ADD CONSTRAINT `request_ibfk_1` FOREIGN KEY (`idItem`) REFERENCES `item` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
