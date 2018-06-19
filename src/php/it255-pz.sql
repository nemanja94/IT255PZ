-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 19, 2018 at 08:16 AM
-- Server version: 10.2.14-MariaDB
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
CREATE DATABASE IF NOT EXISTS `it255-pz` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `it255-pz`;

-- --------------------------------------------------------

--
-- Table structure for table `dnevni_unos`
--

DROP TABLE IF EXISTS `dnevni_unos`;
CREATE TABLE IF NOT EXISTS `dnevni_unos` (
  `ID_DNEVNI_UNOS` int(11) NOT NULL AUTO_INCREMENT,
  `KORISNIK_ID` int(11) NOT NULL,
  `INSULIN` varchar(255) NOT NULL,
  `DATUM_DU` date NOT NULL,
  `KOLICINA_JEDINICA` int(11) NOT NULL,
  PRIMARY KEY (`ID_DNEVNI_UNOS`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `istorija_merenja`
--

DROP TABLE IF EXISTS `istorija_merenja`;
CREATE TABLE IF NOT EXISTS `istorija_merenja` (
  `ISTORIJA_MERENJA_ID` int(11) NOT NULL,
  `KORISNIK_ID` int(11) DEFAULT NULL,
  `DATUM_I_VREME_IM` datetime NOT NULL,
  `VREDNOST` decimal(38,2) NOT NULL,
  `TIP_INSULINA` text NOT NULL,
  `TIP_UNOSA` text NOT NULL,
  PRIMARY KEY (`ISTORIJA_MERENJA_ID`),
  KEY `RELATIONSHIP_3_FK` (`KORISNIK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `istorija_merenja`
--

INSERT INTO `istorija_merenja` (`ISTORIJA_MERENJA_ID`, `KORISNIK_ID`, `DATUM_I_VREME_IM`, `VREDNOST`, `TIP_INSULINA`, `TIP_UNOSA`) VALUES
(1, 2, '2017-12-27 19:25:00', '9.99', '', 'Glikemija'),
(2, 2, '2017-12-27 19:29:00', '9.99', '', 'Glikemija'),
(3, 2, '2017-12-27 19:12:00', '9.99', 'brzo delujuci', 'Insulin'),
(4, 2, '2017-12-27 19:59:00', '9.99', 'sporo delujuci', 'Insulin'),
(5, 2, '2016-12-27 19:59:00', '9.99', 'sporo delujuci', 'Insulin'),
(6, 2, '2017-10-27 19:59:00', '9.99', 'sporo delujuci', 'Insulin'),
(7, 2, '2017-12-27 19:53:00', '9.99', '', 'Glikemija'),
(8, 13, '2018-01-10 16:54:00', '9.99', '', 'Glikemija'),
(9, 13, '2018-01-10 16:54:00', '9.99', '', 'Glikemija'),
(10, 13, '2018-01-10 16:54:00', '9.99', 'sporo delujuci', 'Insulin'),
(11, 13, '2018-01-10 16:54:00', '9.99', '', 'Glikemija'),
(12, 13, '2018-01-10 16:54:00', '9.99', 'sporo delujuci', 'Insulin'),
(13, 13, '2017-12-09 16:56:00', '9.99', '', ''),
(14, 13, '2018-01-10 16:59:00', '9.99', '', 'Glikemija'),
(15, 13, '2018-01-10 16:59:00', '9.99', '', 'Glikemija'),
(16, 13, '2018-01-10 17:56:00', '2.00', '', 'Glikemija'),
(17, 14, '2018-05-12 10:14:00', '9.99', '', 'Glikemija'),
(18, 14, '2018-05-12 11:17:00', '9.99', '', 'Glikemija'),
(19, 14, '2018-05-10 11:17:00', '9.99', '', 'Glikemija'),
(20, 14, '2018-05-21 20:07:00', '9.99', 'brzo delujuci', 'Insulin'),
(21, 14, '2018-05-21 20:22:00', '9.99', '', 'Glikemija'),
(22, 14, '2018-05-21 20:25:00', '9.99', 'brzo delujuci', 'Insulin'),
(23, 14, '2018-05-21 23:59:00', '3.00', 'brzo delujuci', 'Glikemija'),
(24, 14, '2018-05-21 23:59:00', '3.00', '', 'Glikemija'),
(25, 14, '2018-05-21 20:26:00', '4.00', '', 'Glikemija'),
(26, 14, '2018-05-21 20:26:00', '3.50', '', 'Glikemija'),
(27, 14, '2018-05-21 20:26:00', '3.50', '', 'Glikemija'),
(28, 14, '2018-05-22 23:59:00', '10.90', '', 'Glikemija'),
(29, 14, '2018-05-21 23:00:00', '10.50', '', 'Glikemija'),
(30, 14, '2018-05-21 20:35:00', '22.00', 'brzo delujuci', 'Insulin'),
(31, 14, '2018-06-13 18:08:00', '12.00', '', 'Glikemija'),
(32, 14, '2018-06-14 10:49:00', '10.00', '', 'Glikemija'),
(33, 14, '2018-06-14 14:02:00', '1.30', '', ''),
(34, 14, '2018-06-14 14:03:00', '2.00', '', ''),
(35, 14, '2018-06-14 14:03:00', '2.00', '', ''),
(36, 14, '2018-06-14 14:03:00', '2.00', '', ''),
(37, 14, '2018-06-14 14:03:00', '2.00', '', ''),
(38, 14, '2018-06-14 14:03:00', '2.00', '', ''),
(39, 14, '2018-06-14 14:03:00', '2.00', '', ''),
(40, 14, '2018-06-14 14:03:00', '2.00', '', ''),
(41, 14, '2018-06-14 14:03:00', '2.00', '', ''),
(42, 14, '2018-06-14 14:03:00', '2.00', '', ''),
(43, 14, '2018-06-14 14:03:00', '2.00', '', ''),
(44, 14, '2018-06-14 14:03:00', '2.00', '', ''),
(45, 14, '2018-06-14 14:03:00', '2.00', '', ''),
(46, 14, '2018-06-14 14:03:00', '2.00', '', ''),
(47, 14, '2018-06-14 14:03:00', '2.00', '', ''),
(48, 14, '2018-06-14 14:03:00', '2.00', '', ''),
(49, 14, '2018-06-14 14:03:00', '2.00', '', 'Glikemija'),
(50, 14, '2018-06-14 14:03:00', '2.00', '', 'Glikemija'),
(51, 14, '2018-06-14 14:03:00', '2.00', '', 'Glikemija'),
(52, 14, '2018-06-14 14:03:00', '2.00', '', 'Glikemija'),
(53, 14, '2018-06-14 14:03:00', '2.00', '', 'Glikemija'),
(54, 14, '2018-06-14 14:04:00', '2.00', '', 'Glikemija'),
(55, 14, '2018-06-14 14:05:00', '2.00', '', 'Glikemija');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `lastname` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `username` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `password` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `token` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `password`, `token`) VALUES
(1, 'Nemanja', 'Andric', 'nemanja@mail.com', '08eaf4e07c1647c9aac207b0dae29486', '5abc0702a6736da0be1f46a82729cf89e2df4d1e'),
(2, 'Zarko', 'Zarkovic', 'zare@mail.com', '670c8d865b2e4cb3e458663819c1eafc', 'ad5304fca9f1388669e11bce70dfcafb1569df7e');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
