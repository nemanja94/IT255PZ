-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 26, 2018 at 09:23 AM
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `glikemija`
--

INSERT INTO `glikemija` (`id_glikemija`, `id`, `datumG`, `vremeG`, `vrednostG`) VALUES
(1, 1, '2018-01-01', '01:01:00', 1),
(2, 1, '2018-01-02', '02:02:00', 2);

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `insulin`
--

INSERT INTO `insulin` (`id_insulin`, `id`, `datum`, `vreme`, `vrednost`, `vrsta_insulina`) VALUES
(1, 1, '2018-01-01', '01:01:00', 1, 'Brzodelujuci'),
(2, 1, '2018-01-02', '02:02:00', 2, 'Sporo delujuci');

-- --------------------------------------------------------

--
-- Table structure for table `istorija_merenja`
--

DROP TABLE IF EXISTS `istorija_merenja`;
CREATE TABLE IF NOT EXISTS `istorija_merenja` (
  `ISTORIJA_MERENJA_ID` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) DEFAULT NULL,
  `DATUM_I_VREME_IM` datetime NOT NULL,
  `VREDNOST` decimal(38,2) NOT NULL,
  `TIP_INSULINA` text DEFAULT NULL,
  `TIP_UNOSA` text NOT NULL,
  PRIMARY KEY (`ISTORIJA_MERENJA_ID`),
  UNIQUE KEY `ISTORIJA_MERENJA_ID` (`ISTORIJA_MERENJA_ID`),
  KEY `ISTORIJA_MERENJA_ID_2` (`ISTORIJA_MERENJA_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `istorija_merenja`
--

INSERT INTO `istorija_merenja` (`ISTORIJA_MERENJA_ID`, `id`, `DATUM_I_VREME_IM`, `VREDNOST`, `TIP_INSULINA`, `TIP_UNOSA`) VALUES
(4, 1, '2018-01-01 01:00:00', '1.00', 'Brzodelujuci', 'Insulin');

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `korisnik`
--

INSERT INTO `korisnik` (`id`, `firstname`, `lastname`, `username`, `password`, `token`) VALUES
(1, 'Nemanja', 'Andric', 'nemanja@mail.com', '08eaf4e07c1647c9aac207b0dae29486', 'fb27054fd92afb0e8e5633d190375526cde187f4'),
(5, 'Stanko', 'Stankovic', 'stane@mail.com', '670c8d865b2e4cb3e458663819c1eafc', 'f71af293f29587173b6abb66e4b34ced8201e58b'),
(6, 'Marko', 'Markovic', 'mare@mail.com', '45717c759fdf6ce85e1810d938ea73d8', '337e6059ba83cd5e255c2e6f361f4bddcb5edfaa'),
(7, 'Admin', 'Administratovic', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'feaac8517c8f87be9e3de4f430885296e36d1957');

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
