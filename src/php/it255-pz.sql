-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 22, 2018 at 09:40 AM
-- Server version: 10.2.15-MariaDB
-- PHP Version: 7.2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `it255-pz`
--
CREATE DATABASE IF NOT EXISTS `it255-pz` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `it255-pz`;

-- --------------------------------------------------------

--
-- Table structure for table `glikemija`
--

DROP TABLE IF EXISTS `glikemija`;
CREATE TABLE IF NOT EXISTS `glikemija` (
  `id_glikemija` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL,
  `datumG` date NOT NULL,
  `vremeG` time NOT NULL,
  `vrednostG` double NOT NULL,
  PRIMARY KEY (`id_glikemija`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `glikemija`
--

TRUNCATE TABLE `glikemija`;
--
-- Dumping data for table `glikemija`
--

INSERT INTO `glikemija` (`id_glikemija`, `id`, `datumG`, `vremeG`, `vrednostG`) VALUES
(1, 1, '2018-06-21', '24:11:00', 22.5),
(2, 4, '2018-06-27', '29:20:17', 12.5),
(3, 3, '2018-06-22', '00:12:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `insulin`
--

DROP TABLE IF EXISTS `insulin`;
CREATE TABLE IF NOT EXISTS `insulin` (
  `id_insulin` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL,
  `datum` date NOT NULL,
  `vreme` time NOT NULL,
  `vrednost` int(11) NOT NULL,
  `vrsta_insulina` varchar(20) NOT NULL,
  PRIMARY KEY (`id_insulin`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `insulin`
--

TRUNCATE TABLE `insulin`;
--
-- Dumping data for table `insulin`
--

INSERT INTO `insulin` (`id_insulin`, `id`, `datum`, `vreme`, `vrednost`, `vrsta_insulina`) VALUES
(1, 4, '2018-06-22', '12:12:00', 4, 'Brzodelujuci'),
(2, 4, '2018-08-22', '12:12:00', 7, 'Sporo delujuci'),
(3, 3, '2018-06-02', '03:33:00', 7, 'Brzodelujuci');

-- --------------------------------------------------------

--
-- Table structure for table `korisnik`
--

DROP TABLE IF EXISTS `korisnik`;
CREATE TABLE IF NOT EXISTS `korisnik` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(128) NOT NULL,
  `token` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `korisnik`
--

TRUNCATE TABLE `korisnik`;
--
-- Dumping data for table `korisnik`
--

INSERT INTO `korisnik` (`id`, `firstname`, `lastname`, `username`, `password`, `token`) VALUES
(1, 'test', 'test', 'test', 'test', 'test'),
(2, 'Marko', 'Markovic', 'mare@mail.com', 'mare1211', ''),
(3, 'Nemanja', 'Andric', 'nemanja@mail.com', '08eaf4e07c1647c9aac207b0dae29486', '647c617c1a86bbfb1f51f5524aaae6642bfd22ca'),
(4, 'Zarko', 'Zarkovic', 'zare@mail.com', '670c8d865b2e4cb3e458663819c1eafc', '73c85a0aad35dea4fdf6c9a931c4279a3d862ac8');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `glikemija`
--
ALTER TABLE `glikemija`
  ADD CONSTRAINT `glikemija_ibfk_1` FOREIGN KEY (`id`) REFERENCES `korisnik` (`id`);

--
-- Constraints for table `insulin`
--
ALTER TABLE `insulin`
  ADD CONSTRAINT `insulin_ibfk_1` FOREIGN KEY (`id`) REFERENCES `korisnik` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
