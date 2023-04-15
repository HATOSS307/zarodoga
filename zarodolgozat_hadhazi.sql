-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2023. Ápr 15. 18:17
-- Kiszolgáló verziója: 10.4.27-MariaDB
-- PHP verzió: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `zarodolgozat_hadhazi`
--
CREATE DATABASE IF NOT EXISTS `zarodolgozat_hadhazi` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `zarodolgozat_hadhazi`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `futar`
--

CREATE TABLE `futar` (
  `fazon` int(3) NOT NULL DEFAULT 0,
  `fnev` varchar(25) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `futar`
--

INSERT INTO `futar` (`fazon`, `fnev`) VALUES
(0, 'Kis Szilárd'),
(1, 'Tóth Lajos');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `menu`
--

CREATE TABLE `menu` (
  `mazon` int(3) NOT NULL DEFAULT 0,
  `mnev` varchar(55) NOT NULL DEFAULT '',
  `mar` int(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `menu`
--

INSERT INTO `menu` (`mazon`, `mnev`, `mar`) VALUES
(0, 'Gyros', 2000),
(1, 'Húsleves', 1500),
(2, 'Magyaros borsóleves', 2290),
(3, 'Joghurtos meggyleves', 2280),
(4, 'Sajttal sonkával töltött csirkemell', 3000);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `rendeles`
--

CREATE TABLE `rendeles` (
  `razon` int(8) NOT NULL DEFAULT 0,
  `vazon` int(6) NOT NULL DEFAULT 0,
  `fazon` int(3) NOT NULL DEFAULT 0,
  `idopont` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `rendeles`
--

INSERT INTO `rendeles` (`razon`, `vazon`, `fazon`, `idopont`) VALUES
(0, 4, 1, '2023-03-22 09:39:26'),
(1, 3, 1, '2023-03-24 11:18:13');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `tetel`
--

CREATE TABLE `tetel` (
  `razon` int(8) NOT NULL DEFAULT 0,
  `mazon` int(3) NOT NULL DEFAULT 0,
  `db` int(3) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `tetel`
--

INSERT INTO `tetel` (`razon`, `mazon`, `db`) VALUES
(0, 4, 4),
(1, 2, 4);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `users`
--

CREATE TABLE `users` (
  `users_id` int(11) NOT NULL,
  `bejelentkezes_felhasz` varchar(1000) NOT NULL,
  `bejelentkezes_jelszo` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `users`
--

INSERT INTO `users` (`users_id`, `bejelentkezes_felhasz`, `bejelentkezes_jelszo`) VALUES
(1, 'admin1', 'admin1'),
(2, 'admin2', 'admin2');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `vevo`
--

CREATE TABLE `vevo` (
  `vazon` int(6) NOT NULL DEFAULT 0,
  `vnev` varchar(30) NOT NULL DEFAULT '',
  `vcim` varchar(30) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `vevo`
--

INSERT INTO `vevo` (`vazon`, `vnev`, `vcim`) VALUES
(1, 'Nagy Róbert', '4043 Tócós kert 24'),
(2, 'Regős Gábor', '4002  Medok utca 3'),
(3, 'Gál Tamás', '4002 Citromfű utca 3'),
(4, 'Balogh Roland', '4043 Tócós kert 24');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `futar`
--
ALTER TABLE `futar`
  ADD PRIMARY KEY (`fazon`);

--
-- A tábla indexei `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`mazon`);

--
-- A tábla indexei `rendeles`
--
ALTER TABLE `rendeles`
  ADD PRIMARY KEY (`razon`),
  ADD KEY `fk_vazon` (`vazon`),
  ADD KEY `fk_fazon` (`fazon`);

--
-- A tábla indexei `tetel`
--
ALTER TABLE `tetel`
  ADD KEY `fk_ppizza` (`mazon`),
  ADD KEY `fk_razon` (`razon`);

--
-- A tábla indexei `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`users_id`);

--
-- A tábla indexei `vevo`
--
ALTER TABLE `vevo`
  ADD PRIMARY KEY (`vazon`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `users`
--
ALTER TABLE `users`
  MODIFY `users_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `rendeles`
--
ALTER TABLE `rendeles`
  ADD CONSTRAINT `fk_fazon` FOREIGN KEY (`fazon`) REFERENCES `futar` (`fazon`),
  ADD CONSTRAINT `fk_vazon` FOREIGN KEY (`vazon`) REFERENCES `vevo` (`vazon`);

--
-- Megkötések a táblához `tetel`
--
ALTER TABLE `tetel`
  ADD CONSTRAINT `fk_menu` FOREIGN KEY (`mazon`) REFERENCES `menu` (`mazon`),
  ADD CONSTRAINT `fk_razon` FOREIGN KEY (`razon`) REFERENCES `rendeles` (`razon`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
