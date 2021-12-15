-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2021. Dec 15. 14:37
-- Kiszolgáló verziója: 10.4.22-MariaDB
-- PHP verzió: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `webshop`
--
CREATE DATABASE IF NOT EXISTS `webshop` DEFAULT CHARACTER SET utf16 COLLATE utf16_hungarian_ci;
USE `webshop`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `kategoriak`
--

CREATE TABLE `kategoriak` (
  `ID_kategoria` int(11) NOT NULL,
  `kategoria` varchar(15) COLLATE utf16_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_hungarian_ci;

--
-- A tábla adatainak kiíratása `kategoriak`
--

INSERT INTO `kategoriak` (`ID_kategoria`, `kategoria`) VALUES
(2, 'Minőségi italok'),
(1, 'Sörök'),
(3, 'Üditők');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `mennyisegiegyseg`
--

CREATE TABLE `mennyisegiegyseg` (
  `ID_Me` int(11) NOT NULL,
  `Nev` varchar(10) COLLATE utf16_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_hungarian_ci;

--
-- A tábla adatainak kiíratása `mennyisegiegyseg`
--

INSERT INTO `mennyisegiegyseg` (`ID_Me`, `Nev`) VALUES
(2, 'DB'),
(1, 'Liter');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `rendeles`
--

CREATE TABLE `rendeles` (
  `ID_rendeles` int(11) NOT NULL,
  `ID_user` int(11) NOT NULL,
  `ID_termek` int(11) NOT NULL,
  `Mennyiseg` int(11) NOT NULL,
  `ID_Me` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_hungarian_ci;

--
-- A tábla adatainak kiíratása `rendeles`
--

INSERT INTO `rendeles` (`ID_rendeles`, `ID_user`, `ID_termek`, `Mennyiseg`, `ID_Me`) VALUES
(1, 1, 35, 12, 2),
(2, 1, 40, 2, 1),
(3, 3, 50, 40, 2),
(4, 3, 40, 52, 2),
(5, 3, 2, 53, 2),
(6, 3, 47, 2, 1),
(7, 3, 48, 3, 1),
(8, 4, 37, 24, 2),
(9, 4, 38, 12, 2),
(10, 5, 45, 2, 1),
(11, 5, 42, 4, 1),
(12, 5, 40, 1, 1),
(13, 5, 41, 1, 1),
(14, 1, 36, 48, 2),
(15, 3, 51, 40, 2),
(16, 3, 52, 40, 2),
(17, 3, 53, 2, 2);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `termekek`
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
-- A tábla adatainak kiíratása `termekek`
--

INSERT INTO `termekek` (`ID_termek`, `Nev`, `Mennyiseg`, `ID_Me`, `Nettoar`, `Afa`, `Kep`) VALUES
(35, 'Coca Cola', 0, 2, 150, 27, 'kepek/cocacolameretezve.jpg'),
(36, 'Dobozos Borsodi sör', 0, 2, 288, 27, 'kepek/dobborsmeretezve.jpg'),
(37, 'Dobozos Kőbányai sör', 0, 2, 215, 27, 'kepek/dobkobmeretezve.jpg'),
(38, 'Dobozos Soproni sör', 0, 2, 230, 27, 'kepek/dobsopmeretezve.jpg'),
(39, 'Fanta', 0, 2, 211, 27, 'kepek/fantameretezve.jpg'),
(40, 'Finlandia vodka', 0, 1, 2550, 27, 'kepek/finlandiameretezve.jpg'),
(41, 'Grants whiskey', 0, 1, 3890, 27, 'kepek/grantsmeretezve.jpg'),
(42, 'Jack Daniels whiskey 0,5', 0, 1, 3650, 27, 'kepek/jack05meretezve.jpg'),
(43, 'Jack Daniels whiskey 0,7', 0, 1, 4200, 27, 'kepek/jack07meretezve.jpg'),
(44, 'Jameson whiskey', 0, 1, 3100, 27, 'kepek/jamesonmeretezve.jpg'),
(45, 'Jim Beam whiskey 1,0', 1, 1, 5235, 27, 'kepek/jim1meretezve.jpg'),
(46, 'Jim Beam whiskey 0,7', 0, 1, 4750, 27, 'kepek/jim07meretezve.jpg'),
(47, 'Kaiser vodka', 1, 1, 3989, 27, 'kepek/kaisermeretezve.jpg'),
(48, 'Royal vodka', 0, 1, 2365, 27, 'kepek/royalvodkameretezve.jpg'),
(49, 'Borsodi sör üveg', 0, 2, 185, 27, 'kepek/uvegborsmretezve.jpg'),
(50, 'Kőbányai sör üveg', 0, 2, 180, 27, 'kepek/uvegkobmeretezve.jpg'),
(51, 'Soproni sör üveg', 0, 2, 190, 27, 'kepek/uvegsopmeretezve.jpg'),
(52, 'Sörös üveg 0,5', 0, 2, 25, 0, ''),
(53, 'Rekesz Braus', 0, 2, 508, 0, '');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `users`
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
-- A tábla adatainak kiíratása `users`
--

INSERT INTO `users` (`ID_user`, `Nev`, `Jelszo`, `Iranyitoszam`, `Utca`, `Hazszam`, `Emelet`, `Ajto`, `Email`, `Telefon`) VALUES
(1, 'Kiss Károly', '123456', '4029', 'Karcagi utca', '65', '', '', 'karcsi154@valami.hu', '+3698751122'),
(2, 'Nagy Péter', '123456', '4050', 'Tölgyfa utca', '21', '', '', '123nagyp@googlemail.com', '+3620817788'),
(3, 'Harc András', '123456', '4011', 'Petőfi utca', '4', '2', '28', 'harcos@harc.com', '+3611112222'),
(4, 'Kiss Zsófi', '123456', '4027', 'Fa utca', '77', '8', '1', 'email@nincsmail.com', '+3699887766'),
(5, 'Pap József', '123456', '4011', 'Tető utca', '56', '4', '4', 'papp@papok.com', '+3666554411');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `mennyisegiegyseg`
--
ALTER TABLE `mennyisegiegyseg`
  ADD PRIMARY KEY (`ID_Me`),
  ADD UNIQUE KEY `idx_nev` (`Nev`);

--
-- A tábla indexei `rendeles`
--
ALTER TABLE `rendeles`
  ADD PRIMARY KEY (`ID_rendeles`),
  ADD KEY `idx_user` (`ID_user`),
  ADD KEY `idx_termek` (`ID_termek`),
  ADD KEY `idx_Me` (`ID_Me`);

--
-- A tábla indexei `termekek`
--
ALTER TABLE `termekek`
  ADD PRIMARY KEY (`ID_termek`),
  ADD UNIQUE KEY `idx_termeknev` (`Nev`),
  ADD KEY `idx_Me` (`ID_Me`),
  ADD KEY `idx_Kep` (`Kep`);

--
-- A tábla indexei `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID_user`),
  ADD UNIQUE KEY `idx_nev` (`Nev`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `mennyisegiegyseg`
--
ALTER TABLE `mennyisegiegyseg`
  MODIFY `ID_Me` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT a táblához `rendeles`
--
ALTER TABLE `rendeles`
  MODIFY `ID_rendeles` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT a táblához `termekek`
--
ALTER TABLE `termekek`
  MODIFY `ID_termek` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT a táblához `users`
--
ALTER TABLE `users`
  MODIFY `ID_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
