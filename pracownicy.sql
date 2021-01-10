-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 10, 2021 at 11:39 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pracownicy`
--

-- --------------------------------------------------------

--
-- Table structure for table `adres_praca`
--

CREATE TABLE `adres_praca` (
  `osoba_id` int(11) NOT NULL,
  `miasto` varchar(50) NOT NULL,
  `adres` varchar(150) NOT NULL,
  `numer_budynku` decimal(4,0) NOT NULL,
  `numer_lokalu` decimal(4,0) NOT NULL,
  `kod_pocztowy` decimal(5,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `adres_zamieszkania`
--

CREATE TABLE `adres_zamieszkania` (
  `osoba_id` int(11) NOT NULL,
  `miasto` varchar(50) NOT NULL,
  `adres` varchar(150) NOT NULL,
  `numer_domu` decimal(4,0) NOT NULL,
  `numer_lokalu` decimal(4,0) NOT NULL,
  `kod_pocztowy` decimal(5,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `osoby`
--

CREATE TABLE `osoby` (
  `id` int(11) NOT NULL,
  `imie` varchar(50) NOT NULL,
  `nazwisko` varchar(50) NOT NULL,
  `data_urodzenia` date NOT NULL,
  `plec_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `plec`
--

CREATE TABLE `plec` (
  `id` int(11) NOT NULL,
  `plec` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `praca`
--

CREATE TABLE `praca` (
  `osoba_id` int(11) NOT NULL,
  `stanowisko` varchar(100) NOT NULL,
  `zarobki` decimal(6,2) NOT NULL,
  `od_kiedy_pracuje` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adres_praca`
--
ALTER TABLE `adres_praca`
  ADD KEY `a_praca_osoby_fk` (`osoba_id`);

--
-- Indexes for table `adres_zamieszkania`
--
ALTER TABLE `adres_zamieszkania`
  ADD KEY `adres_osoby_fk` (`osoba_id`);

--
-- Indexes for table `osoby`
--
ALTER TABLE `osoby`
  ADD PRIMARY KEY (`id`),
  ADD KEY `osoby_plec_fk` (`plec_id`);

--
-- Indexes for table `plec`
--
ALTER TABLE `plec`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `praca`
--
ALTER TABLE `praca`
  ADD KEY `praca_osoby_fk` (`osoba_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `osoby`
--
ALTER TABLE `osoby`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `plec`
--
ALTER TABLE `plec`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `adres_praca`
--
ALTER TABLE `adres_praca`
  ADD CONSTRAINT `a_praca_osoby_fk` FOREIGN KEY (`osoba_id`) REFERENCES `osoby` (`id`);

--
-- Constraints for table `adres_zamieszkania`
--
ALTER TABLE `adres_zamieszkania`
  ADD CONSTRAINT `adres_osoby_fk` FOREIGN KEY (`osoba_id`) REFERENCES `osoby` (`id`);

--
-- Constraints for table `osoby`
--
ALTER TABLE `osoby`
  ADD CONSTRAINT `osoby_plec_fk` FOREIGN KEY (`plec_id`) REFERENCES `plec` (`id`);

--
-- Constraints for table `praca`
--
ALTER TABLE `praca`
  ADD CONSTRAINT `praca_osoby_fk` FOREIGN KEY (`osoba_id`) REFERENCES `osoby` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
