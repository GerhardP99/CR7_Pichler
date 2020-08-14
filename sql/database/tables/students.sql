-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 14. Aug 2020 um 17:31
-- Server-Version: 10.4.13-MariaDB
-- PHP-Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `cr7_pichler`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `students`
--

CREATE TABLE `students` (
  `student_id` int(11) NOT NULL,
  `first_name` varchar(55) DEFAULT NULL,
  `last_name` varchar(55) DEFAULT NULL,
  `email` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `students`
--

INSERT INTO `students` (`student_id`, `first_name`, `last_name`, `email`) VALUES
(1, 'Lyon', 'Hoofe', 'lhoofe4@diigo.com'),
(2, 'Valdemar', 'Balshen', 'vbalshen5@sphinn.com'),
(3, 'Jaynell', 'Batalini', 'jbatalini6@fc2.com'),
(4, 'Audie', 'Haker', 'ahaker7@zdnet.com'),
(5, 'Mady', 'Liffey', 'mliffey8@house.gov'),
(6, 'Bobbe', 'Saltsberger', 'bsaltsberger9@nationalgeographic.com'),
(7, 'Jerrome', 'Nardi', 'jnardia@boston.com'),
(8, 'Leupold', 'Lusted', 'llustedb@npr.org'),
(9, 'Stillmann', 'Orpyne', 'sorpynec@newyorker.com'),
(10, 'Lanie', 'Collingwood', 'lcollingwoodd@pinterest.com');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`student_id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `students`
--
ALTER TABLE `students`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
