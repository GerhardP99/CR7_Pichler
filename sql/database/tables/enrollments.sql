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
-- Tabellenstruktur für Tabelle `enrollments`
--

CREATE TABLE `enrollments` (
  `enroll_id` int(11) NOT NULL,
  `fk_class_id` int(11) DEFAULT NULL,
  `fk_class_name` varchar(55) DEFAULT NULL,
  `fk_student_id` int(11) DEFAULT NULL,
  `fk_teacher_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `enrollments`
--

INSERT INTO `enrollments` (`enroll_id`, `fk_class_id`, `fk_class_name`, `fk_student_id`, `fk_teacher_id`) VALUES
(1, 1, '1a', 4, 4),
(2, 1, '1a', 6, 4),
(3, 2, '1b', 3, 2),
(4, 2, '1b', 7, 2),
(5, 3, '2a', 10, 3),
(6, 3, '2a', 8, 3),
(7, 4, '2b', 1, 1),
(8, 4, '2b', 5, 1),
(9, 3, '2a', 9, 3),
(10, 3, '2a', 2, 3);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `enrollments`
--
ALTER TABLE `enrollments`
  ADD PRIMARY KEY (`enroll_id`),
  ADD KEY `fk_class_id` (`fk_class_id`),
  ADD KEY `fk_student_id` (`fk_student_id`),
  ADD KEY `fk_teacher_id` (`fk_teacher_id`),
  ADD KEY `fk_class_name` (`fk_class_name`) USING BTREE;

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `enrollments`
--
ALTER TABLE `enrollments`
  MODIFY `enroll_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `enrollments`
--
ALTER TABLE `enrollments`
  ADD CONSTRAINT `enrollments_ibfk_1` FOREIGN KEY (`fk_class_id`) REFERENCES `classes` (`class_id`),
  ADD CONSTRAINT `enrollments_ibfk_2` FOREIGN KEY (`fk_student_id`) REFERENCES `students` (`student_id`),
  ADD CONSTRAINT `enrollments_ibfk_3` FOREIGN KEY (`fk_teacher_id`) REFERENCES `teachers` (`teacher_id`),
  ADD CONSTRAINT `enrollments_ibfk_4` FOREIGN KEY (`fk_class_name`) REFERENCES `classes` (`class_name`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
