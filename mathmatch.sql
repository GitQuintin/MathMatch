-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 16, 2026 at 08:16 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mathmatch`
--

-- --------------------------------------------------------

--
-- Table structure for table `answers_given`
--

CREATE TABLE `answers_given` (
  `answers_given_ID` int(11) NOT NULL,
  `userID` int(100) NOT NULL,
  `question_ID` int(11) NOT NULL,
  `answer` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

CREATE TABLE `classes` (
  `classID` int(11) NOT NULL,
  `class_name` varchar(80) NOT NULL,
  `description` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qa_ag`
--

CREATE TABLE `qa_ag` (
  `qa_ag_ID` int(100) NOT NULL,
  `questions_asked_ID` int(11) NOT NULL,
  `answers_given_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `questions_asked`
--

CREATE TABLE `questions_asked` (
  `questions_asked_ID` int(11) NOT NULL,
  `userID` int(100) NOT NULL,
  `answer_ID` int(11) NOT NULL,
  `question` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `session`
--

CREATE TABLE `session` (
  `session_ID` int(100) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `ClassID` int(11) NOT NULL,
  `TutorID` int(11) NOT NULL,
  `StudentID` int(11) NOT NULL,
  `is_scheduled` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tutors`
--

CREATE TABLE `tutors` (
  `tutorID` int(100) NOT NULL,
  `userID` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tutors_classes`
--

CREATE TABLE `tutors_classes` (
  `tutors_classes` int(100) NOT NULL,
  `tutorID` int(100) NOT NULL,
  `classID` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userID` int(100) NOT NULL,
  `usertype` int(10) UNSIGNED NOT NULL,
  `username` varchar(40) NOT NULL,
  `password` varchar(40) NOT NULL,
  `security_question` varchar(120) NOT NULL,
  `security_answer` varchar(120) NOT NULL,
  `is_tutor` tinyint(1) NOT NULL,
  `TT1_ID` int(100) UNSIGNED NOT NULL,
  `TT2_ID` int(100) UNSIGNED NOT NULL,
  `TT3_ID` int(100) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `answers_given`
--
ALTER TABLE `answers_given`
  ADD PRIMARY KEY (`answers_given_ID`),
  ADD KEY `userID` (`userID`);

--
-- Indexes for table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`classID`);

--
-- Indexes for table `qa_ag`
--
ALTER TABLE `qa_ag`
  ADD PRIMARY KEY (`qa_ag_ID`),
  ADD KEY `questions_asked_ID` (`questions_asked_ID`),
  ADD KEY `answers_given_ID` (`answers_given_ID`);

--
-- Indexes for table `questions_asked`
--
ALTER TABLE `questions_asked`
  ADD PRIMARY KEY (`questions_asked_ID`),
  ADD KEY `userID` (`userID`);

--
-- Indexes for table `session`
--
ALTER TABLE `session`
  ADD PRIMARY KEY (`session_ID`),
  ADD KEY `ClassID` (`ClassID`),
  ADD KEY `TutorID` (`TutorID`),
  ADD KEY `StudentID` (`StudentID`);

--
-- Indexes for table `tutors`
--
ALTER TABLE `tutors`
  ADD PRIMARY KEY (`tutorID`),
  ADD KEY `userID` (`userID`);

--
-- Indexes for table `tutors_classes`
--
ALTER TABLE `tutors_classes`
  ADD PRIMARY KEY (`tutors_classes`),
  ADD KEY `classID` (`classID`),
  ADD KEY `tutorID` (`tutorID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userID`),
  ADD KEY `TT1_ID` (`TT1_ID`),
  ADD KEY `TT2_ID` (`TT2_ID`),
  ADD KEY `TT3_ID` (`TT3_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `answers_given`
--
ALTER TABLE `answers_given`
  MODIFY `answers_given_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `classes`
--
ALTER TABLE `classes`
  MODIFY `classID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qa_ag`
--
ALTER TABLE `qa_ag`
  MODIFY `qa_ag_ID` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `questions_asked`
--
ALTER TABLE `questions_asked`
  MODIFY `questions_asked_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `session`
--
ALTER TABLE `session`
  MODIFY `session_ID` int(100) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tutors`
--
ALTER TABLE `tutors`
  MODIFY `tutorID` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tutors_classes`
--
ALTER TABLE `tutors_classes`
  MODIFY `tutors_classes` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userID` int(100) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `answers_given`
--
ALTER TABLE `answers_given`
  ADD CONSTRAINT `answers_given_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`);

--
-- Constraints for table `qa_ag`
--
ALTER TABLE `qa_ag`
  ADD CONSTRAINT `qa_ag_ibfk_1` FOREIGN KEY (`questions_asked_ID`) REFERENCES `questions_asked` (`questions_asked_ID`),
  ADD CONSTRAINT `qa_ag_ibfk_2` FOREIGN KEY (`answers_given_ID`) REFERENCES `answers_given` (`answers_given_ID`);

--
-- Constraints for table `questions_asked`
--
ALTER TABLE `questions_asked`
  ADD CONSTRAINT `questions_asked_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`);

--
-- Constraints for table `session`
--
ALTER TABLE `session`
  ADD CONSTRAINT `session_ibfk_1` FOREIGN KEY (`ClassID`) REFERENCES `classes` (`classID`),
  ADD CONSTRAINT `session_ibfk_2` FOREIGN KEY (`TutorID`) REFERENCES `users` (`userID`),
  ADD CONSTRAINT `session_ibfk_3` FOREIGN KEY (`StudentID`) REFERENCES `users` (`userID`);

--
-- Constraints for table `tutors`
--
ALTER TABLE `tutors`
  ADD CONSTRAINT `userID` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`);

--
-- Constraints for table `tutors_classes`
--
ALTER TABLE `tutors_classes`
  ADD CONSTRAINT `classID` FOREIGN KEY (`classID`) REFERENCES `classes` (`classID`),
  ADD CONSTRAINT `tutorID` FOREIGN KEY (`tutorID`) REFERENCES `tutors` (`tutorID`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`TT1_ID`) REFERENCES `session` (`session_ID`),
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`TT2_ID`) REFERENCES `session` (`session_ID`),
  ADD CONSTRAINT `users_ibfk_3` FOREIGN KEY (`TT3_ID`) REFERENCES `session` (`session_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
