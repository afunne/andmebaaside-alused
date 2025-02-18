-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Loomise aeg: Veebr 18, 2025 kell 02:50 PL
-- Serveri versioon: 10.4.32-MariaDB
-- PHP versioon: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Andmebaas: `retseptiraamattahmazov`
--

DELIMITER $$
--
-- Toimingud
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddKasutaja` (IN `nimi` VARCHAR(50), IN `pnimi` VARCHAR(50), IN `mail` VARCHAR(150))   BEGIN
Insert into Kasutaja(eesnimi, perenimi, email)
values (enimi, pnimi, mail);

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `kasutaja`
--

CREATE TABLE `kasutaja` (
  `kasutaja_id` int(11) NOT NULL,
  `eesnimi` varchar(50) DEFAULT NULL,
  `perenimi` varchar(50) NOT NULL,
  `email` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `kasutaja`
--

INSERT INTO `kasutaja` (`kasutaja_id`, `eesnimi`, `perenimi`, `email`) VALUES
(1, 'Igor', 'Pandavich', 'Megaemail@gmail.ee'),
(2, 'Ivan', 'Stakanovich', 'Megaemail@gmail.ee'),
(3, 'Roman', 'Karandash', 'Megaemail@gmail.ee'),
(4, 'Aspir', 'Carous', 'Megaemail@gmail.ee'),
(5, 'Muni', 'tricolomna', 'Megaemail@gmail.ee'),
(6, 'yuhuuuu', 'yihiiiiii', 'GachaEnjoyer3000@gmail.com');

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `kategooria`
--

CREATE TABLE `kategooria` (
  `kategooria_id` int(11) NOT NULL,
  `kategooria_nimi` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `kategooria`
--

INSERT INTO `kategooria` (`kategooria_id`, `kategooria_nimi`) VALUES
(1, 'supid'),
(2, 'munad'),
(3, 'jöökid'),
(4, 'söökid'),
(5, 'riided');

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `koostis`
--

CREATE TABLE `koostis` (
  `koostis_id` int(11) NOT NULL,
  `retsept_retsept_id` int(11) DEFAULT NULL,
  `koogus` int(11) DEFAULT NULL,
  `yhik` int(11) DEFAULT NULL,
  `yhik_id` int(11) DEFAULT NULL,
  `toiduaine_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `koostis`
--

INSERT INTO `koostis` (`koostis_id`, `retsept_retsept_id`, `koogus`, `yhik`, `yhik_id`, `toiduaine_id`) VALUES
(1, 1, 34, 1, 5, 1),
(2, 2, 34, 1, 5, 2),
(3, 3, 34, 1, 5, 3),
(4, 4, 34, 1, 5, 4),
(5, 5, 34, 1, 5, 5);

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `retsept`
--

CREATE TABLE `retsept` (
  `retsept_id` int(11) NOT NULL,
  `retsepti_nimi` varchar(100) DEFAULT NULL,
  `kirjeldus` varchar(200) DEFAULT NULL,
  `juhtend` varchar(500) DEFAULT NULL,
  `sisestatud_kp` date DEFAULT NULL,
  `Kasutaja` int(11) DEFAULT NULL,
  `kategooria_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `retsept`
--

INSERT INTO `retsept` (`retsept_id`, `retsepti_nimi`, `kirjeldus`, `juhtend`, `sisestatud_kp`, `Kasutaja`, `kategooria_id`) VALUES
(1, 'pasta', 'keeta makaroonid', 'kasutaja elekripliit', '2025-06-17', 1, 1),
(2, 'Vermicelli', 'keeta makaroonid', 'kasutaja elekripliit', '2025-06-17', 2, 2),
(3, 'Conchiglie', 'keeta makaroonid', 'kasutaja elekripliit', '2025-06-17', 3, 3),
(4, 'Farfalle', 'keeta makaroonid', 'kasutaja elekripliit', '2025-06-17', 4, 4),
(5, 'Linguine', 'keeta makaroonid', 'kasutaja elekripliit', '2025-06-17', 5, 5);

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `tehtud`
--

CREATE TABLE `tehtud` (
  `tehtud_id` int(11) NOT NULL,
  `tehtud_kp` date DEFAULT NULL,
  `retsept_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `tehtud`
--

INSERT INTO `tehtud` (`tehtud_id`, `tehtud_kp`, `retsept_id`) VALUES
(1, '2025-06-17', 1),
(2, '2025-06-17', 2),
(3, '2025-06-17', 3),
(4, '2025-06-17', 4),
(5, '2025-06-17', 5);

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `toiduaine`
--

CREATE TABLE `toiduaine` (
  `tuiduaine_id` int(11) NOT NULL,
  `tuiduaine_nimi` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `toiduaine`
--

INSERT INTO `toiduaine` (`tuiduaine_id`, `tuiduaine_nimi`) VALUES
(1, 'juust'),
(2, 'sool'),
(3, 'piim'),
(4, 'suhkur'),
(5, 'leib');

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `yhik`
--

CREATE TABLE `yhik` (
  `yhik_id` int(11) NOT NULL,
  `yhik_nimi` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `yhik`
--

INSERT INTO `yhik` (`yhik_id`, `yhik_nimi`) VALUES
(1, 'ml'),
(2, 'tl'),
(3, 'sl'),
(4, 'g'),
(5, 'gr');

--
-- Indeksid tõmmistatud tabelitele
--

--
-- Indeksid tabelile `kasutaja`
--
ALTER TABLE `kasutaja`
  ADD PRIMARY KEY (`kasutaja_id`);

--
-- Indeksid tabelile `kategooria`
--
ALTER TABLE `kategooria`
  ADD PRIMARY KEY (`kategooria_id`);

--
-- Indeksid tabelile `koostis`
--
ALTER TABLE `koostis`
  ADD PRIMARY KEY (`koostis_id`),
  ADD KEY `retsept_retsept_id` (`retsept_retsept_id`),
  ADD KEY `toiduaine_id` (`toiduaine_id`),
  ADD KEY `yhik_id` (`yhik_id`);

--
-- Indeksid tabelile `retsept`
--
ALTER TABLE `retsept`
  ADD PRIMARY KEY (`retsept_id`),
  ADD KEY `Kasutaja` (`Kasutaja`),
  ADD KEY `kategooria_id` (`kategooria_id`);

--
-- Indeksid tabelile `tehtud`
--
ALTER TABLE `tehtud`
  ADD PRIMARY KEY (`tehtud_id`),
  ADD KEY `retsept_id` (`retsept_id`);

--
-- Indeksid tabelile `toiduaine`
--
ALTER TABLE `toiduaine`
  ADD PRIMARY KEY (`tuiduaine_id`);

--
-- Indeksid tabelile `yhik`
--
ALTER TABLE `yhik`
  ADD PRIMARY KEY (`yhik_id`);

--
-- AUTO_INCREMENT tõmmistatud tabelitele
--

--
-- AUTO_INCREMENT tabelile `kasutaja`
--
ALTER TABLE `kasutaja`
  MODIFY `kasutaja_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT tabelile `kategooria`
--
ALTER TABLE `kategooria`
  MODIFY `kategooria_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT tabelile `koostis`
--
ALTER TABLE `koostis`
  MODIFY `koostis_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT tabelile `retsept`
--
ALTER TABLE `retsept`
  MODIFY `retsept_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT tabelile `tehtud`
--
ALTER TABLE `tehtud`
  MODIFY `tehtud_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT tabelile `toiduaine`
--
ALTER TABLE `toiduaine`
  MODIFY `tuiduaine_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT tabelile `yhik`
--
ALTER TABLE `yhik`
  MODIFY `yhik_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Tõmmistatud tabelite piirangud
--

--
-- Piirangud tabelile `koostis`
--
ALTER TABLE `koostis`
  ADD CONSTRAINT `koostis_ibfk_1` FOREIGN KEY (`retsept_retsept_id`) REFERENCES `retsept` (`retsept_id`),
  ADD CONSTRAINT `koostis_ibfk_2` FOREIGN KEY (`toiduaine_id`) REFERENCES `toiduaine` (`tuiduaine_id`),
  ADD CONSTRAINT `koostis_ibfk_3` FOREIGN KEY (`yhik_id`) REFERENCES `yhik` (`yhik_id`);

--
-- Piirangud tabelile `retsept`
--
ALTER TABLE `retsept`
  ADD CONSTRAINT `retsept_ibfk_1` FOREIGN KEY (`Kasutaja`) REFERENCES `kasutaja` (`kasutaja_id`),
  ADD CONSTRAINT `retsept_ibfk_2` FOREIGN KEY (`kategooria_id`) REFERENCES `kategooria` (`kategooria_id`);

--
-- Piirangud tabelile `tehtud`
--
ALTER TABLE `tehtud`
  ADD CONSTRAINT `tehtud_ibfk_1` FOREIGN KEY (`retsept_id`) REFERENCES `retsept` (`retsept_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
