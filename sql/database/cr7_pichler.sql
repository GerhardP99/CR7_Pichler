-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 14. Aug 2020 um 17:30
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
-- Tabellenstruktur für Tabelle `classes`
--

CREATE TABLE `classes` (
  `class_id` int(11) NOT NULL,
  `class_name` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `classes`
--

INSERT INTO `classes` (`class_id`, `class_name`) VALUES
(1, '1a'),
(2, '1b'),
(3, '2a'),
(4, '2b');

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

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `teachers`
--

CREATE TABLE `teachers` (
  `teacher_id` int(11) NOT NULL,
  `first_name` varchar(55) DEFAULT NULL,
  `last_name` varchar(55) DEFAULT NULL,
  `email` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `teachers`
--

INSERT INTO `teachers` (`teacher_id`, `first_name`, `last_name`, `email`) VALUES
(1, 'Toby', 'Meredith', 'tmeredith0@unc.edu'),
(2, 'Jess', 'Dimond', 'jdimond1@icio.us'),
(3, 'Terry', 'Eglise', 'teglise2@bloglines.com	'),
(4, 'Carolina', 'Kennicott', 'ckennicott3@hhs.gov');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`class_id`),
  ADD KEY `class_name` (`class_name`);

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
-- Indizes für die Tabelle `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`student_id`);

--
-- Indizes für die Tabelle `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`teacher_id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `classes`
--
ALTER TABLE `classes`
  MODIFY `class_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `enrollments`
--
ALTER TABLE `enrollments`
  MODIFY `enroll_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT für Tabelle `students`
--
ALTER TABLE `students`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT für Tabelle `teachers`
--
ALTER TABLE `teachers`
  MODIFY `teacher_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
