-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 12, 2023 at 08:19 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `telemedicine`
--
CREATE DATABASE IF NOT EXISTS `telemedicine` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `telemedicine`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(10) NOT NULL,
  `First_Name` varchar(30) NOT NULL,
  `Last_Name` varchar(30) NOT NULL,
  `BirthDay` varchar(50) DEFAULT NULL,
  `Email` varchar(50) NOT NULL,
  `Phone_Number` varchar(30) NOT NULL,
  `Username` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `First_Name`, `Last_Name`, `BirthDay`, `Email`, `Phone_Number`, `Username`, `Password`) VALUES
(1, 'Mohammed', 'ELachyry', '2000-11-15', 'app.medivist@gmail.com', '0680346100', 'admin', 'YWRtaW4=');

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `id` int(10) NOT NULL,
  `Date` varchar(10) NOT NULL,
  `Time` varchar(30) NOT NULL,
  `Patient_id` int(10) NOT NULL,
  `Doctor_id` int(10) NOT NULL,
  `Status` varchar(10) NOT NULL,
  `amount` double NOT NULL,
  `Link` varchar(255) NOT NULL,
  `created_at` date NOT NULL DEFAULT current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`id`, `Date`, `Time`, `Patient_id`, `Doctor_id`, `Status`, `amount`, `Link`, `created_at`, `deleted_at`) VALUES
(2, '2023-03-22', '15:29', 4, 11, 'Cancelled', 800, 'https://meet.google.com/irp-espf-pve', '2023-03-05', NULL),
(3, '2023-03-20', '14:00', 3, 11, 'Pending', 3000, 'https://meet.google.com/icu-eqmr-usv', '2023-03-05', NULL),
(4, '2023-03-19', '12:00', 2, 11, 'Pending', 3000, 'https://meet.google.com/icu-eqmr-usv', '2023-02-27', NULL),
(5, '2023-03-21', '13:00', 2, 11, 'Pending', 500, 'https://meet.google.com/icu-eqmr-usv', '2023-02-27', NULL),
(6, '2023-03-15', '23:00', 3, 11, 'Pending', 800, 'https://meet.google.com/icu-eqmr-usv', '2023-03-01', NULL),
(7, '2023-03-19', '02:03', 3, 8, 'Pending', 400, 'sdfsdfsdffffffgdhfgjyujuyyu', '2023-02-27', '2023-03-12 17:54:54');

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `id` int(10) NOT NULL,
  `Image_Path` varchar(255) DEFAULT NULL,
  `First_Name` varchar(30) DEFAULT NULL,
  `Last_Name` varchar(30) DEFAULT NULL,
  `BirthDay` date DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Number_Phone` varchar(30) DEFAULT NULL,
  `Sex` varchar(30) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Speciality` varchar(255) DEFAULT NULL,
  `Work_Days` varchar(255) DEFAULT NULL,
  `Work_Hours` varchar(255) DEFAULT NULL,
  `Username` varchar(30) DEFAULT NULL,
  `Password` varchar(100) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`id`, `Image_Path`, `First_Name`, `Last_Name`, `BirthDay`, `Email`, `Number_Phone`, `Sex`, `Address`, `Speciality`, `Work_Days`, `Work_Hours`, `Username`, `Password`, `deleted_at`) VALUES
(8, 'C:\\Users\\achyr\\eclipse-workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp2\\wtpwebapps\\telemedicneApp\\\\images\\c.PNG', 'mohamed', 'adam', '2023-03-13', 'achyri2ed000@gmail.com', '0680346100', 'Female', 'sadassadsa', 'Urology', 'Monday-Wednesday-Thursday-Friday-Saturday-', '9-11-12-13-16-', 'adam71517', 'mG6s0WIvK8', '2023-03-12 01:53:44'),
(10, 'C:\\Users\\achyr\\eclipse-workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp2\\wtpwebapps\\telemedicneApp\\\\images\\c.PNG', 'mohamed', 'adam', '2023-03-15', 'achyri2000@gmail.com', '0680346100', 'Male', 'sadassadsa', 'Allergy and immunology', 'Monday-Tuesday-', '9-10-', 'adam34678', 'dEs3dFJpaVVDdw==', NULL),
(11, 'D:\\Eclipse Work Space\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\telemedicine\\\\images\\doctors-2.jpg', 'Ahmed', 'Chair', '2023-03-08', 'ahmed123@gmail.com', '066174586', 'Male', 'HAY EL WAHDA 3', 'Ophthalmology', 'Monday-Tuesday-', '10-', 'Chair37163', 'dk4ybTVaZ3dIMw==', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `id` int(10) NOT NULL,
  `Image_Path` varchar(255) DEFAULT NULL,
  `First_Name` varchar(30) DEFAULT NULL,
  `Last_Name` varchar(30) DEFAULT NULL,
  `BirthDay` date DEFAULT NULL,
  `Email` varchar(50) NOT NULL,
  `Number_Phone` varchar(30) NOT NULL,
  `Sex` varchar(30) DEFAULT NULL,
  `Social_Account` varchar(30) DEFAULT NULL,
  `Address` varchar(50) DEFAULT NULL,
  `Username` varchar(30) DEFAULT NULL,
  `Password` varchar(30) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`id`, `Image_Path`, `First_Name`, `Last_Name`, `BirthDay`, `Email`, `Number_Phone`, `Sex`, `Social_Account`, `Address`, `Username`, `Password`, `deleted_at`) VALUES
(2, 'C:\\Users\\achyr\\eclipse-workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp2\\wtpwebapps\\telemedicneApp\\\\images\\c.PNG', 'Mohammed', 'Elachyry', '2023-03-09', 'mohammedelachyry@gmailcom', '0660000486', 'Female', '01478932158', 'hay nahda', 'Elachyry48726', 'dkc1RHp5aExwag==', NULL),
(3, 'D:\\Eclipse Work Space\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\telemedicine\\\\images\\Capture.PNG', 'MOHAMMED', 'ELACHYRY', '2023-03-16', 'mohammedelachyry@gmail.com', '+212658346100', 'Male', '202020202', 'HAY SALAM ABD LAKARIM LAKHADTABI NR134', 'ELACHYRY74981', 'dkg3aXQ1Qk1JeA==', NULL),
(4, 'D:\\Eclipse Work Space\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\telemedicine\\\\images\\Capture.PNG', 'MOHAMMED', 'ELACHYRY', '2023-03-21', 'mohammedelkachyry@gmail.com', '+2126580346100', 'Female', '2020201', 'HAY SALAM ABD LAKARIM LAKHADTABI NR134', 'ELACHYRY12079', 'c0MzcmpId0JDZg==', NULL),
(5, 'D:\\Eclipse Work Space\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\telemedicine\\\\images\\testimonials-5.jpg', 'Oussama', 'Moukhlis', '2023-03-15', 'Oussama@gmail.com', '0124578963', 'Male', '014789877', 'Haysalam', 'Moukhlis82263', 'eUw5Y1k5VWhuRA==', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Idpatient` (`Patient_id`),
  ADD KEY `FFK_IdDoctor` (`Doctor_id`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `doctor`
--
ALTER TABLE `doctor`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `patient`
--
ALTER TABLE `patient`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `FFK_IdDoctor` FOREIGN KEY (`Doctor_id`) REFERENCES `doctor` (`id`),
  ADD CONSTRAINT `FK_Idpatient` FOREIGN KEY (`Patient_id`) REFERENCES `patient` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
