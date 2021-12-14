-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 14, 2021 at 08:50 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `webshop`
--
CREATE DATABASE IF NOT EXISTS `webshop` DEFAULT CHARACTER SET utf16 COLLATE utf16_hungarian_ci;
USE `webshop`;

-- --------------------------------------------------------

--
-- Table structure for table `mennyisegiegyseg`
--

CREATE TABLE `mennyisegiegyseg` (
  `ID_Me` int(11) NOT NULL,
  `Nev` varchar(10) COLLATE utf16_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_hungarian_ci;

--
-- Dumping data for table `mennyisegiegyseg`
--

INSERT INTO `mennyisegiegyseg` (`ID_Me`, `Nev`) VALUES
(2, 'DB'),
(1, 'Liter');

-- --------------------------------------------------------

--
-- Table structure for table `rendeles`
--

CREATE TABLE `rendeles` (
  `ID_rendeles` int(11) NOT NULL,
  `ID_user` int(11) NOT NULL,
  `ID_termek` int(11) NOT NULL,
  `Mennyiseg` int(11) NOT NULL,
  `ID_Me` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_hungarian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `termekek`
--

CREATE TABLE `termekek` (
  `ID_termek` int(11) NOT NULL,
  `Nev` varchar(30) COLLATE utf16_hungarian_ci NOT NULL,
  `Mennyiseg` float NOT NULL,
  `ID_Me` int(11) NOT NULL,
  `Nettoar` int(10) NOT NULL,
  `Afa` int(2) NOT NULL DEFAULT 27,
  `Kep` varchar(100) COLLATE utf16_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_hungarian_ci;

--
-- Dumping data for table `termekek`
--

INSERT INTO `termekek` (`ID_termek`, `Nev`, `Mennyiseg`, `ID_Me`, `Nettoar`, `Afa`, `Kep`) VALUES
(35, 'Coca Cola', 0, 2, 150, 27, ''),
(36, 'Dobozos Borsodi sör', 0, 2, 288, 27, ''),
(37, 'Dobozos Kőbányai sör', 0, 2, 215, 27, ''),
(38, 'Dobozos Soproni sör', 0, 2, 230, 27, ''),
(39, 'Fanta', 0, 2, 211, 27, ''),
(40, 'Finlandia vodka', 0, 1, 2550, 27, ''),
(41, 'Grants whiskey', 0, 1, 3890, 27, ''),
(42, 'Jack Daniels whiskey 1,0', 0, 1, 3650, 27, ''),
(43, 'Jack Daniels whiskey 0,7', 0, 1, 4200, 27, ''),
(44, 'Jameson whiskey', 0, 1, 3100, 27, ''),
(45, 'Jim Beam whiskey 1,0', 1, 1, 5235, 27, ''),
(46, 'Jim Beam whiskey 0,7', 0, 1, 4750, 27, ''),
(47, 'Kaiser vodka', 1, 1, 3989, 27, ''),
(48, 'Royal vodka', 0, 1, 2365, 27, ''),
(49, 'Borsodi sör üveg', 0, 2, 185, 27, ''),
(50, 'Kőbányai sör üveg', 0, 2, 180, 27, ''),
(51, 'Soproni sör üveg', 0, 2, 190, 27, ''),
(52, 'Sörös üveg 0,5', 0, 2, 25, 0, ''),
(53, 'Rekesz Braus', 0, 2, 508, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `ID_user` int(11) NOT NULL,
  `Nev` varchar(50) COLLATE utf16_hungarian_ci NOT NULL,
  `Jelszo` varchar(20) COLLATE utf16_hungarian_ci NOT NULL,
  `Iranyitoszam` varchar(4) COLLATE utf16_hungarian_ci NOT NULL,
  `Utca` varchar(30) COLLATE utf16_hungarian_ci NOT NULL,
  `Hazszam` varchar(10) COLLATE utf16_hungarian_ci NOT NULL,
  `Emelet` varchar(2) COLLATE utf16_hungarian_ci NOT NULL,
  `Ajto` varchar(2) COLLATE utf16_hungarian_ci NOT NULL,
  `Email` varchar(30) COLLATE utf16_hungarian_ci NOT NULL,
  `Telefon` varchar(15) COLLATE utf16_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_hungarian_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`ID_user`, `Nev`, `Jelszo`, `Iranyitoszam`, `Utca`, `Hazszam`, `Emelet`, `Ajto`, `Email`, `Telefon`) VALUES
(1, 'Kiss Károly', '123456', '4029', 'Karcagi utca', '65', '', '', 'karcsi154@valami.hu', '+3698751122'),
(2, 'Nagy Péter', '123456', '4050', 'Tölgyfa utca', '21', '', '', '123nagyp@googlemail.com', '+3620817788'),
(3, 'Harc András', '123456', '4011', 'Petőfi utca', '4', '2', '28', 'harcos@harc.com', '+3611112222'),
(4, 'Kiss Zsófi', '123456', '4027', 'Fa utca', '77', '8', '1', 'email@nincsmail.com', '+3699887766'),
(5, 'Pap József', '123456', '4011', 'Tető utca', '56', '4', '4', 'papp@papok.com', '+3666554411');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `mennyisegiegyseg`
--
ALTER TABLE `mennyisegiegyseg`
  ADD PRIMARY KEY (`ID_Me`),
  ADD UNIQUE KEY `idx_nev` (`Nev`);

--
-- Indexes for table `rendeles`
--
ALTER TABLE `rendeles`
  ADD PRIMARY KEY (`ID_rendeles`),
  ADD KEY `idx_user` (`ID_user`),
  ADD KEY `idx_termek` (`ID_termek`),
  ADD KEY `idx_Me` (`ID_Me`);

--
-- Indexes for table `termekek`
--
ALTER TABLE `termekek`
  ADD PRIMARY KEY (`ID_termek`),
  ADD UNIQUE KEY `idx_termeknev` (`Nev`),
  ADD KEY `idx_Me` (`ID_Me`),
  ADD KEY `idx_Kep` (`Kep`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID_user`),
  ADD UNIQUE KEY `idx_nev` (`Nev`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `mennyisegiegyseg`
--
ALTER TABLE `mennyisegiegyseg`
  MODIFY `ID_Me` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `rendeles`
--
ALTER TABLE `rendeles`
  MODIFY `ID_rendeles` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `termekek`
--
ALTER TABLE `termekek`
  MODIFY `ID_termek` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `ID_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
