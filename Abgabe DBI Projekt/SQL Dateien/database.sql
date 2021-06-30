SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Datenbank: `em2020_melmer_paulweber`
--
CREATE DATABASE IF NOT EXISTS `em2020_melmer_paulweber` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `em2020_melmer_paulweber`;

-- Tabellenstruktur für Tabelle `gruppe`

DROP TABLE IF EXISTS `gruppe`;
CREATE TABLE `gruppe` (
  `gruppen_Name` varchar(1) NOT NULL,
  `mannschaft1ID` int(11) NOT NULL,
  `mannschaft2ID` int(11) NOT NULL,
  `mannschaft3ID` int(11) NOT NULL,
  `mannschaft4ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Daten für Tabelle `gruppe`

INSERT INTO `gruppe` (`gruppen_Name`, `mannschaft1ID`, `mannschaft2ID`, `mannschaft3ID`, `mannschaft4ID`) VALUES
('A', 1, 2, 3, 4),
('B', 5, 6, 7, 8),
('C', 9, 10, 11, 12),
('D', 13, 14, 15, 16),
('E', 17, 18, 19, 20),
('F', 21, 22, 23, 24);

-- Stellvertreter-Struktur der Views Gruppe A bis F 
-- (Siehe unten für die tatsächliche Ansicht)

-- Gruppe A

DROP VIEW IF EXISTS `gruppea`;
CREATE TABLE `gruppea` (
`land` varchar(128)
,`goals` decimal(32,0)
,`points` decimal(32,0)
);

-- Gruppe B

DROP VIEW IF EXISTS `gruppeb`;
CREATE TABLE `gruppeb` (
`land` varchar(128)
,`goals` decimal(32,0)
,`points` decimal(32,0)
);

-- Gruppe C

DROP VIEW IF EXISTS `gruppec`;
CREATE TABLE `gruppec` (
`land` varchar(128)
,`goals` decimal(32,0)
,`points` decimal(32,0)
);

-- Gruppe D

DROP VIEW IF EXISTS `grupped`;
CREATE TABLE `grupped` (
`land` varchar(128)
,`goals` decimal(32,0)
,`points` decimal(32,0)
);

-- Gruppe E

DROP VIEW IF EXISTS `gruppee`;
CREATE TABLE `gruppee` (
`land` varchar(128)
,`goals` decimal(32,0)
,`points` decimal(32,0)
);

-- Gruppe F

DROP VIEW IF EXISTS `gruppef`;
CREATE TABLE `gruppef` (
`land` varchar(128)
,`goals` decimal(32,0)
,`points` decimal(32,0)
);

-- Tabellenstruktur für Tabelle `gruppendritte`

DROP TABLE IF EXISTS `gruppendritte`;
CREATE TABLE `gruppendritte` (
  `land` varchar(128) DEFAULT NULL,
  `goals` decimal(32,0) DEFAULT NULL,
  `points` decimal(32,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Daten für Tabelle `gruppendritte`

INSERT INTO `gruppendritte` (`land`, `goals`, `points`) VALUES
('Schweiz', '4', '4'),
('Finnland', '1', '3'),
('Ukraine', '4', '3'),
('Tschechnien', '3', '4'),
('Slowakei', '2', '3'),
('Portugal', '7', '4');

-- Tabellenstruktur für Tabelle `mannschaft`

DROP TABLE IF EXISTS `mannschaft`;
CREATE TABLE `mannschaft` (
  `mannschaftID` int(11) NOT NULL,
  `land` varchar(128) NOT NULL,
  `fifaWeltrangliste` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Daten für Tabelle `mannschaft`

INSERT INTO `mannschaft` (`mannschaftID`, `land`, `fifaWeltrangliste`) VALUES
(1, 'Italien', 7),
(2, 'Schweiz', 13),
(3, 'Tuerkei', 29),
(4, 'Wales', 17),
(5, 'Belgien', 1),
(6, 'Russland', 38),
(7, 'Daenemark', 10),
(8, 'Finnland', 54),
(9, 'Niederlande', 16),
(10, 'Ukraine', 24),
(11, 'Oesterreich', 23),
(12, 'Nordmazedonien', 62),
(13, 'England', 4),
(14, 'Kroatien', 14),
(15, 'Tschechien', 40),
(16, 'Schottland', 44),
(17, 'Spanien', 6),
(18, 'Polen', 21),
(19, 'Schweden', 18),
(20, 'Slowakei', 36),
(21, 'Deutschland', 12),
(22, 'Frankreich', 2),
(23, 'Portugal', 5),
(24, 'Ungarn', 37),
(25, 'Serbien', 25),
(26, 'Andorra', 158);

-- Tabellenstruktur für Tabelle `spiele`

DROP TABLE IF EXISTS `spiele`;
CREATE TABLE `spiele` (
  `iD` int(11) NOT NULL,
  `mannschaftID` int(2) NOT NULL,
  `tore` int(2) NOT NULL,
  `gegnerID` int(2) NOT NULL,
  `punkte` int(1) NOT NULL,
  `spielort` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Daten für Tabelle `spiele`

INSERT INTO `spiele` (`iD`, `mannschaftID`, `tore`, `gegnerID`, `punkte`, `spielort`) VALUES
-- Gruppe A
(1, 3, 0, 1, 0, 'ROM'),
(2, 1, 3, 3, 3, 'ROM'),

(3, 4, 1, 2, 1, 'BAK'),
(4, 2, 1, 4, 1, 'BAK'),

(5, 3, 0, 4, 0, 'BAK'),
(6, 4, 2, 3, 3, 'BAK'),

(7, 1, 3, 2, 3, 'ROM'),
(8, 2, 0, 1, 0, 'ROM'),

(9, 2, 3, 3, 3, 'BAK'),
(10, 3, 1, 2, 0, 'BAK'),

(11, 1, 1, 4, 3, 'ROM'),
(12, 4, 0, 1, 0, 'ROM'),

-- Gruppe B
(13, 7, 0, 8, 0, 'KOP'),
(14, 8, 1, 7, 3, 'KOP'),

(15, 5, 3, 6, 3, 'PET'),
(16, 6, 0, 5, 0, 'PET'),

(17, 8, 0, 6, 0, 'PET'),
(18, 6, 1, 8, 3, 'PET'),

(19, 7, 0, 5, 0, 'KOP'),
(20, 5, 3, 7, 3, 'KOP'),

(21, 6, 1, 7, 0, 'KOP'),
(22, 7, 4, 6, 3, 'KOP'),

(23, 8, 0, 5, 0, 'PET'),
(24, 5, 2, 8, 3, 'PET'),

-- Gruppe C
(25, 11, 3, 12, 3, 'BUK'),
(26, 12, 1, 11, 0, 'BUK'),

(27, 9, 3, 10, 3, 'AMS'),
(28, 10, 2, 9, 0, 'AMS'),

(29, 10, 2, 12, 3, 'BUK'),
(30, 12, 1, 10, 0, 'BUK'),

(31, 9, 2, 11, 3, 'AMS'),
(32, 11, 0, 9, 0, 'AMS'),

(33, 12, 0, 9, 0, 'AMS'),
(34, 9, 3, 12, 3, 'AMS'),

(35, 10, 0, 11, 0, 'BUK'),
(36, 11, 1, 10, 3, 'BUK'),

-- Gruppe D
(37, 13, 1, 14, 3, 'LON'),
(38, 14, 0, 13, 0, 'LON'),

(39, 16, 0, 15, 0, 'GLA'),
(40, 15, 2, 16, 3, 'GLA'),

(41, 14, 1, 15, 1, 'GLA'),
(42, 15, 1, 14, 1, 'GLA'),

(43, 13, 0, 16, 1, 'LON'),
(44, 16, 0, 13, 1, 'LON'),

(45, 14, 3, 16, 3, 'GLA'),
(46, 16, 1, 14, 0, 'GLA'),

(47, 15, 0, 13, 0, 'LON'),
(48, 13, 1, 15, 3, 'LON'),

-- Gruppe E
(49, 18, 1, 20, 0, 'PET'),
(50, 20, 2, 18, 3, 'PET'),

(51, 17, 0, 19, 1, 'SEV'),
(52, 19, 0, 17, 1, 'SEV'),

(53, 19, 1, 20, 3, 'PET'),
(54, 20, 0, 19, 0, 'PET'),

(55, 17, 1, 18, 1, 'SEV'),
(56, 18, 1, 17, 1, 'SEV'),

(57, 20, 0, 17, 0, 'SEV'),
(58, 17, 5, 20, 3, 'SEV'),

(59, 19, 3, 18, 3, 'PET'),
(60, 18, 2, 19, 0, 'PET'),

-- Gruppe F
(61, 24, 0, 23, 0, 'BUD'),
(62, 23, 3, 24, 3, 'BUD'),

(63, 22, 1, 21, 3, 'MÜN'),
(64, 21, 0, 22, 0, 'MÜN'),

(65, 24, 1, 22, 1, 'BUD'),
(66, 22, 1, 24, 1, 'BUD'),

(67, 23, 2, 21, 0, 'MÜN'),
(68, 21, 4, 23, 3, 'MÜN'),

(69, 23, 2, 22, 1, 'BUD'),
(70, 22, 2, 23, 1, 'BUD'),

(71, 21, 2, 24, 1, 'MÜN'),
(72, 24, 2, 21, 1, 'MÜN');

-- Tabellenstruktur für Tabelle `spielort`

DROP TABLE IF EXISTS `spielort`;
CREATE TABLE `spielort` (
  `stadt_kuerzel` varchar(3) NOT NULL,
  `stadt` varchar(255) NOT NULL,
  `land` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Daten für Tabelle `spielort`

INSERT INTO `spielort` (`stadt_kuerzel`, `stadt`, `land`) VALUES
('AMS', 'Amsterdam', 'Niederlande'),
('BAK', 'Baku', 'Aserbaidschan'),
('BUD', 'Budapest', 'Ungarn'),
('BUK', 'Bukarest', 'Rumaenien'),
('DUB', 'Dublin', 'Irland'),
('GLA', 'Glasgow', 'Schottland'),
('KOP', 'Kopenhaben', 'Daenemark'),
('LON', 'London', 'England'),
('MÜN', 'Muenchen', 'Deutschland'),
('PET', 'St. Petersburg', 'Russland'),
('ROM', 'Rom', 'Italien'),
('SEV', 'Sevilla', 'Spanien');

-- Struktur des Views `gruppea`

DROP TABLE IF EXISTS `gruppea`;

DROP VIEW IF EXISTS `gruppea`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `gruppea` 
AS select `mannschaft`.`land` AS `land`,sum(`spiele`.`tore`) AS `goals`,sum(`spiele`.`punkte`) AS `points` 
from (`mannschaft` join `spiele`) where `spiele`.`mannschaftID` = 1 and `mannschaft`.`mannschaftID` = 1 
union select `mannschaft`.`land` AS `land`,sum(`spiele`.`tore`) AS `sum(spiele.tore)`,sum(`spiele`.`punkte`) AS `sum(spiele.punkte)` 
from (`mannschaft` join `spiele`) where `spiele`.`mannschaftID` = 2 and `mannschaft`.`mannschaftID` = 2 
union select `mannschaft`.`land` AS `land`,sum(`spiele`.`tore`) AS `sum(spiele.tore)`,sum(`spiele`.`punkte`) AS `sum(spiele.punkte)` 
from (`mannschaft` join `spiele`) where `spiele`.`mannschaftID` = 3 and `mannschaft`.`mannschaftID` = 3 
union select `mannschaft`.`land` AS `land`,sum(`spiele`.`tore`) AS `sum(spiele.tore)`,sum(`spiele`.`punkte`) AS `sum(spiele.punkte)` 
from (`mannschaft` join `spiele`) where `spiele`.`mannschaftID` = 4 and `mannschaft`.`mannschaftID` = 4 
order by `points` desc,`goals` desc ;

-- Struktur des Views `gruppeb`

DROP TABLE IF EXISTS `gruppeb`;

DROP VIEW IF EXISTS `gruppeb`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `gruppeb`  
AS  select `mannschaft`.`land` AS `land`,sum(`spiele`.`tore`) AS `goals`,sum(`spiele`.`punkte`) AS `points` 
from (`mannschaft` join `spiele`) where `spiele`.`mannschaftID` = 5 and `mannschaft`.`mannschaftID` = 5 
union select `mannschaft`.`land` AS `land`,sum(`spiele`.`tore`) AS `sum(spiele.tore)`,sum(`spiele`.`punkte`) AS `sum(spiele.punkte)` 
from (`mannschaft` join `spiele`) where `spiele`.`mannschaftID` = 6 and `mannschaft`.`mannschaftID` = 6 
union select `mannschaft`.`land` AS `land`,sum(`spiele`.`tore`) AS `sum(spiele.tore)`,sum(`spiele`.`punkte`) AS `sum(spiele.punkte)` 
from (`mannschaft` join `spiele`) where `spiele`.`mannschaftID` = 7 and `mannschaft`.`mannschaftID` = 7 
union select `mannschaft`.`land` AS `land`,sum(`spiele`.`tore`) AS `sum(spiele.tore)`,sum(`spiele`.`punkte`) AS `sum(spiele.punkte)` 
from (`mannschaft` join `spiele`) where `spiele`.`mannschaftID` = 8 and `mannschaft`.`mannschaftID` = 8 
order by `points` desc,`goals` desc ;

-- Struktur des Views `gruppec`

DROP TABLE IF EXISTS `gruppec`;

DROP VIEW IF EXISTS `gruppec`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `gruppec`  
AS  select `mannschaft`.`land` AS `land`,sum(`spiele`.`tore`) AS `goals`,sum(`spiele`.`punkte`) AS `points` 
from (`mannschaft` join `spiele`) where `spiele`.`mannschaftID` = 9 and `mannschaft`.`mannschaftID` = 9 
union select `mannschaft`.`land` AS `land`,sum(`spiele`.`tore`) AS `sum(spiele.tore)`,sum(`spiele`.`punkte`) AS `sum(spiele.punkte)` 
from (`mannschaft` join `spiele`) where `spiele`.`mannschaftID` = 10 and `mannschaft`.`mannschaftID` = 10 
union select `mannschaft`.`land` AS `land`,sum(`spiele`.`tore`) AS `sum(spiele.tore)`,sum(`spiele`.`punkte`) AS `sum(spiele.punkte)` 
from (`mannschaft` join `spiele`) where `spiele`.`mannschaftID` = 11 and `mannschaft`.`mannschaftID` = 11 
union select `mannschaft`.`land` AS `land`,sum(`spiele`.`tore`) AS `sum(spiele.tore)`,sum(`spiele`.`punkte`) AS `sum(spiele.punkte)` 
from (`mannschaft` join `spiele`) where `spiele`.`mannschaftID` = 12 and `mannschaft`.`mannschaftID` = 12 
order by `points` desc,`goals` desc ;

-- Struktur des Views `grupped`

DROP TABLE IF EXISTS `grupped`;

DROP VIEW IF EXISTS `grupped`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `grupped`  
AS  select `mannschaft`.`land` AS `land`,sum(`spiele`.`tore`) AS `goals`,sum(`spiele`.`punkte`) AS `points` 
from (`mannschaft` join `spiele`) where `spiele`.`mannschaftID` = 13 and `mannschaft`.`mannschaftID` = 13 
union select `mannschaft`.`land` AS `land`,sum(`spiele`.`tore`) AS `sum(spiele.tore)`,sum(`spiele`.`punkte`) AS `sum(spiele.punkte)` 
from (`mannschaft` join `spiele`) where `spiele`.`mannschaftID` = 14 and `mannschaft`.`mannschaftID` = 14 
union select `mannschaft`.`land` AS `land`,sum(`spiele`.`tore`) AS `sum(spiele.tore)`,sum(`spiele`.`punkte`) AS `sum(spiele.punkte)` 
from (`mannschaft` join `spiele`) where `spiele`.`mannschaftID` = 15 and `mannschaft`.`mannschaftID` = 15 
union select `mannschaft`.`land` AS `land`,sum(`spiele`.`tore`) AS `sum(spiele.tore)`,sum(`spiele`.`punkte`) AS `sum(spiele.punkte)` 
from (`mannschaft` join `spiele`) where `spiele`.`mannschaftID` = 16 and `mannschaft`.`mannschaftID` = 16 
order by `points` desc,`goals` desc ;

-- Struktur des Views `gruppee`

DROP TABLE IF EXISTS `gruppee`;

DROP VIEW IF EXISTS `gruppee`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `gruppee`  
AS  select `mannschaft`.`land` AS `land`,sum(`spiele`.`tore`) AS `goals`,sum(`spiele`.`punkte`) AS `points` 
from (`mannschaft` join `spiele`) where `spiele`.`mannschaftID` = 17 and `mannschaft`.`mannschaftID` = 17 
union select `mannschaft`.`land` AS `land`,sum(`spiele`.`tore`) AS `sum(spiele.tore)`,sum(`spiele`.`punkte`) AS `sum(spiele.punkte)` 
from (`mannschaft` join `spiele`) where `spiele`.`mannschaftID` = 18 and `mannschaft`.`mannschaftID` = 18 
union select `mannschaft`.`land` AS `land`,sum(`spiele`.`tore`) AS `sum(spiele.tore)`,sum(`spiele`.`punkte`) AS `sum(spiele.punkte)` 
from (`mannschaft` join `spiele`) where `spiele`.`mannschaftID` = 19 and `mannschaft`.`mannschaftID` = 19 
union select `mannschaft`.`land` AS `land`,sum(`spiele`.`tore`) AS `sum(spiele.tore)`,sum(`spiele`.`punkte`) AS `sum(spiele.punkte)` 
from (`mannschaft` join `spiele`) where `spiele`.`mannschaftID` = 20 and `mannschaft`.`mannschaftID` = 20 
order by `points` desc,`goals` desc ;

-- Struktur des Views `gruppef`

DROP TABLE IF EXISTS `gruppef`;

DROP VIEW IF EXISTS `gruppef`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `gruppef`  
AS  select `mannschaft`.`land` AS `land`,sum(`spiele`.`tore`) AS `goals`,sum(`spiele`.`punkte`) AS `points` 
from (`mannschaft` join `spiele`) where `spiele`.`mannschaftID` = 21 and `mannschaft`.`mannschaftID` = 21 
union select `mannschaft`.`land` AS `land`,sum(`spiele`.`tore`) AS `sum(spiele.tore)`,sum(`spiele`.`punkte`) AS `sum(spiele.punkte)` 
from (`mannschaft` join `spiele`) where `spiele`.`mannschaftID` = 22 and `mannschaft`.`mannschaftID` = 22 
union select `mannschaft`.`land` AS `land`,sum(`spiele`.`tore`) AS `sum(spiele.tore)`,sum(`spiele`.`punkte`) AS `sum(spiele.punkte)` 
from (`mannschaft` join `spiele`) where `spiele`.`mannschaftID` = 23 and `mannschaft`.`mannschaftID` = 23 
union select `mannschaft`.`land` AS `land`,sum(`spiele`.`tore`) AS `sum(spiele.tore)`,sum(`spiele`.`punkte`) AS `sum(spiele.punkte)` 
from (`mannschaft` join `spiele`) where `spiele`.`mannschaftID` = 24 and `mannschaft`.`mannschaftID` = 24 
order by `points` desc,`goals` desc ;

-- Indizes für die Tabelle `gruppe`

ALTER TABLE `gruppe`
  ADD PRIMARY KEY (`gruppen_Name`),
  ADD UNIQUE KEY `mannschaft1ID` (`mannschaft1ID`),
  ADD UNIQUE KEY `mannschaft2ID` (`mannschaft2ID`),
  ADD UNIQUE KEY `mannschaft3ID` (`mannschaft3ID`),
  ADD UNIQUE KEY `mannschaft4ID` (`mannschaft4ID`);

-- Indizes für die Tabelle `mannschaft`

ALTER TABLE `mannschaft`
  ADD PRIMARY KEY (`mannschaftID`);

-- Indizes für die Tabelle `spiele`

ALTER TABLE `spiele`
  ADD PRIMARY KEY (`iD`),
  ADD KEY `mannschaftID` (`mannschaftID`),
  ADD KEY `gegnerID` (`gegnerID`),
  ADD KEY `spielort` (`spielort`);

-- Indizes für die Tabelle `spielort`

ALTER TABLE `spielort`
  ADD PRIMARY KEY (`stadt_kuerzel`),
  ADD UNIQUE KEY `stadt_kuerzel` (`stadt_kuerzel`);

-- AUTO_INCREMENT für Tabelle `mannschaft`

ALTER TABLE `mannschaft`
  MODIFY `mannschaftID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

-- AUTO_INCREMENT für Tabelle `spiele`

ALTER TABLE `spiele`
  MODIFY `iD` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

-- Constraints der Tabelle `gruppe`

ALTER TABLE `gruppe`
  ADD CONSTRAINT `gruppe_ibfk_1` FOREIGN KEY (`mannschaft1ID`) REFERENCES `mannschaft` (`mannschaftID`),
  ADD CONSTRAINT `gruppe_ibfk_2` FOREIGN KEY (`mannschaft2ID`) REFERENCES `mannschaft` (`mannschaftID`),
  ADD CONSTRAINT `gruppe_ibfk_3` FOREIGN KEY (`mannschaft3ID`) REFERENCES `mannschaft` (`mannschaftID`),
  ADD CONSTRAINT `gruppe_ibfk_4` FOREIGN KEY (`mannschaft4ID`) REFERENCES `mannschaft` (`mannschaftID`);

-- Constraints der Tabelle `spiele`

ALTER TABLE `spiele`
  ADD CONSTRAINT `spiele_ibfk_1` FOREIGN KEY (`mannschaftID`) REFERENCES `mannschaft` (`mannschaftID`),
  ADD CONSTRAINT `spiele_ibfk_2` FOREIGN KEY (`gegnerID`) REFERENCES `mannschaft` (`mannschaftID`),
  ADD CONSTRAINT `spiele_ibfk_3` FOREIGN KEY (`spielort`) REFERENCES `spielort` (`stadt_kuerzel`);
COMMIT;

