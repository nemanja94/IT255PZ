-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 21, 2018 at 11:31 PM
-- Server version: 10.1.32-MariaDB
-- PHP Version: 5.6.36

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dijabetes`
--

-- --------------------------------------------------------

--
-- Table structure for table `glikemija`
--

CREATE TABLE `glikemija` (
  `id_glikemija` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `datumG` date NOT NULL,
  `vremeG` time NOT NULL,
  `vrednostG` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `glikemija`
--

INSERT INTO `glikemija` (`id_glikemija`, `id`, `datumG`, `vremeG`, `vrednostG`) VALUES
(1, 1, '2018-06-21', '24:11:00', 22.5);

-- --------------------------------------------------------

--
-- Table structure for table `insulin`
--

CREATE TABLE `insulin` (
  `id_insulin` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `datum` date NOT NULL,
  `vreme` time NOT NULL,
  `vrednost` int(11) NOT NULL,
  `vrsta_insulina` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `insulin`
--

INSERT INTO `insulin` (`id_insulin`, `id`, `datum`, `vreme`, `vrednost`, `vrsta_insulina`) VALUES
(1, 1, '2018-06-21', '20:59:00', 15, 'brzo delujuci');

-- --------------------------------------------------------

--
-- Table structure for table `korisnik`
--

CREATE TABLE `korisnik` (
  `id` int(11) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(128) NOT NULL,
  `token` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `korisnik`
--

INSERT INTO `korisnik` (`id`, `firstname`, `lastname`, `username`, `password`, `token`) VALUES
(1, 'test', 'test', 'test', 'test', 'test');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `glikemija`
--
ALTER TABLE `glikemija`
  ADD PRIMARY KEY (`id_glikemija`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `insulin`
--
ALTER TABLE `insulin`
  ADD PRIMARY KEY (`id_insulin`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `korisnik`
--
ALTER TABLE `korisnik`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `glikemija`
--
ALTER TABLE `glikemija`
  MODIFY `id_glikemija` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `insulin`
--
ALTER TABLE `insulin`
  MODIFY `id_insulin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `korisnik`
--
ALTER TABLE `korisnik`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
