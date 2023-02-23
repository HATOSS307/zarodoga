-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2023. Feb 23. 08:23
-- Kiszolgáló verziója: 10.4.22-MariaDB
-- PHP verzió: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `zarovizsga_hadhazi`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `normalize_n0`
--

CREATE TABLE `normalize_n0` (
  `bejelentkezes_id` int(255) NOT NULL,
  `bejelentkezes_felhasz` varchar(1000) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `bejelentkezes_jelszo` varchar(1000) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `futar_id` int(255) NOT NULL,
  `futar_nev` varchar(1000) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `menu_id` int(255) NOT NULL,
  `menu_nev` varchar(1000) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `menu_ar` int(255) NOT NULL,
  `tetel_id` int(255) NOT NULL,
  `tetel_nev` varchar(1000) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `tetel_db` int(255) NOT NULL,
  `vevo_id` int(255) NOT NULL,
  `vevo_nev` varchar(1000) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `vevo_cim` varchar(1000) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `rendeles_id` int(255) NOT NULL,
  `rendeles_futar` varchar(1000) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `rendeles_tetel` varchar(1000) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `rendeles_vevo` varchar(1000) COLLATE utf8mb4_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `normalize_n0`
--
ALTER TABLE `normalize_n0`
  ADD PRIMARY KEY (`bejelentkezes_id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `normalize_n0`
--
ALTER TABLE `normalize_n0`
  MODIFY `bejelentkezes_id` int(255) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
