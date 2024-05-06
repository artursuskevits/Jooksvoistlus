-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: d123189.mysql.zonevs.eu
-- Loomise aeg: Mai 06, 2024 kell 09:11 EL
-- Serveri versioon: 10.4.32-MariaDB-log
-- PHP versioon: 8.2.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Andmebaas: `d123189_andmebaas`
--

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `registration`
--

CREATE TABLE `registration` (
  `id` int(11) NOT NULL,
  `login` varchar(30) DEFAULT NULL,
  `pass` varchar(30) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `registration`
--

INSERT INTO `registration` (`id`, `login`, `pass`, `status`) VALUES
(1, 'lala', 'su6esjGx7rXcU', 0),
(3, 'admin', 'suPaQSJn73eGI', 1),
(4, 'afgan', 'suW7CLvDPDRDM', 0),
(5, 'adfas', 'su8tdgZGfpc2w', 0),
(6, 'opilane5', 'suhb3Qlq/qMLw', 0),
(7, 'dasdas', 'suWE7yBEt1ULI', 0);

--
-- Indeksid tõmmistatud tabelitele
--

--
-- Indeksid tabelile `registration`
--
ALTER TABLE `registration`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT tõmmistatud tabelitele
--

--
-- AUTO_INCREMENT tabelile `registration`
--
ALTER TABLE `registration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
