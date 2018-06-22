-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 22, 2018 at 02:21 PM
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
-- Dumping data for table `glikemija`
--

INSERT INTO `glikemija` (`id_glikemija`, `id`, `datumG`, `vremeG`, `vrednostG`) VALUES
(1, 1, '2018-06-25', '03:15:00', 4),
(2, 1, '2018-06-26', '04:16:00', 5),
(3, 1, '2018-06-27', '17:17:00', 7);

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
-- Dumping data for table `insulin`
--

INSERT INTO `insulin` (`id_insulin`, `id`, `datum`, `vreme`, `vrednost`, `vrsta_insulina`) VALUES
(1, 1, '2018-06-22', '00:12:00', 1, 'Brzodelujuci'),
(2, 1, '2018-06-23', '01:13:00', 2, 'Sporo delujuci'),
(3, 1, '2018-06-24', '02:14:00', 3, 'Brzodelujuci');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `korisnik`
--

INSERT INTO `korisnik` (`id`, `firstname`, `lastname`, `username`, `password`, `token`) VALUES
(1, 'Nemanja', 'Andric', 'nemanja@mail.com', '08eaf4e07c1647c9aac207b0dae29486', '2b23f7fef3db81bfe03f9fb3776aec725125622c');

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
