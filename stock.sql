-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 31, 2017 at 10:33 AM
-- Server version: 5.7.17-0ubuntu0.16.04.1
-- PHP Version: 7.0.15-0ubuntu0.16.04.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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
(2, 'ESC', NULL, 9, 13),
(3, 'MOTOR', NULL, 15, 10);

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
(20, 2, -1, NULL, '2017-03-31 10:32:43');

--
-- Triggers `movement`
--
DELIMITER $$
CREATE TRIGGER `stock` AFTER INSERT ON `movement` FOR EACH ROW UPDATE `item` SET `stock` = `stock`+NEW.quantity WHERE `item`.`id` = NEW.idItem
$$
DELIMITER ;

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
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `movement`
--
ALTER TABLE `movement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `movement`
--
ALTER TABLE `movement`
  ADD CONSTRAINT `movement_ibfk_1` FOREIGN KEY (`idItem`) REFERENCES `item` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
