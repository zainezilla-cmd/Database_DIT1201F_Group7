-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 22, 2026 at 09:30 PM
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
-- Database: `dit1201f_group7`
--

-- --------------------------------------------------------

--
-- Table structure for table `allocation`
--

CREATE TABLE `allocation` (
  `AllocationID` int(11) NOT NULL,
  `StallID` int(11) NOT NULL,
  `VendorID` int(11) NOT NULL,
  `Startdate` date NOT NULL,
  `Enddate` date DEFAULT NULL,
  `status` enum('Active','Pending','Expired') DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `allocation`
--

INSERT INTO `allocation` (`AllocationID`, `StallID`, `VendorID`, `Startdate`, `Enddate`, `status`) VALUES
(5, 3, 7, '2010-06-15', '2022-06-16', 'Active'),
(6, 4, 8, '2016-02-10', '2024-03-01', 'Active'),
(7, 10, 11, '2017-05-11', '2024-02-14', 'Active'),
(8, 9, 9, '2016-01-04', '2025-05-14', 'Active'),
(9, 6, 6, '2021-11-25', '2026-03-12', 'Active'),
(10, 5, 6, '2005-09-05', '2026-01-30', 'Active'),
(11, 11, 11, '2001-10-02', '2017-08-18', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `inspector`
--

CREATE TABLE `inspector` (
  `InspectorID` int(11) NOT NULL,
  `First_Name` varchar(50) NOT NULL,
  `Last_Name` varchar(90) NOT NULL,
  `Phone` varchar(70) NOT NULL,
  `MarketID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inspector`
--

INSERT INTO `inspector` (`InspectorID`, `First_Name`, `Last_Name`, `Phone`, `MarketID`) VALUES
(1, 'Abdul', 'Kargbo', '+23278900067', 1),
(2, 'Sami', 'Skeiky', '+23280404317', 4),
(3, 'Grace', 'Kallon', '+23278981183', 3),
(4, 'Gladys', 'Collier', '+23288868303', 2),
(5, 'Mariama', 'Conteh', '+23232281329', 1),
(6, 'Mitchell', 'Kondeh', '=23288700090', 4);

-- --------------------------------------------------------

--
-- Table structure for table `market`
--

CREATE TABLE `market` (
  `MarketID` int(11) NOT NULL,
  `Marketname` varchar(100) NOT NULL,
  `Location` varchar(200) NOT NULL,
  `TotalStalls` int(11) NOT NULL,
  `Opendate` date NOT NULL,
  `Managername` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `market`
--

INSERT INTO `market` (`MarketID`, `Marketname`, `Location`, `TotalStalls`, `Opendate`, `Managername`) VALUES
(1, 'Freetown Central Market\r\n', 'Wallace Johnson St, Freetown', 50, '2017-06-23', 'Joseph Bangura'),
(2, 'Lumley Market', 'Lumley, Western Area', 30, '2020-07-01', 'Sia Kamara'),
(3, 'Aberdeen Market', 'Aberdeen Freetown', 40, '2019-06-01', 'Adama Fofonah'),
(4, 'Waterloo Market', 'Waterloo, Rural Western Area', 70, '2020-06-08', 'Thomas Koroma');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `PaymentID` int(11) NOT NULL,
  `AllocationID` int(11) NOT NULL,
  `Paymentdate` date NOT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `Paymentmethod` enum('Cash','Mobile Money','Bank Trasfer') DEFAULT NULL,
  `Receptnumber` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`PaymentID`, `AllocationID`, `Paymentdate`, `amount`, `Paymentmethod`, `Receptnumber`) VALUES
(3, 11, '2021-02-01', 500000.00, 'Cash', ''),
(4, 10, '2019-05-05', 600000.00, 'Mobile Money', 'REC-2021-002'),
(5, 9, '2020-03-01', 400000.00, 'Cash', 'RCP-2021-003'),
(6, 8, '2022-04-17', 350000.00, 'Bank Trasfer', 'RCP-2022-009'),
(8, 7, '2016-03-07', 500000.00, 'Cash', 'RCP-2001-004'),
(10, 8, '2016-03-07', 550000.00, 'Bank Trasfer', 'RCP-2001-009'),
(11, 9, '2020-03-01', 700000.00, 'Bank Trasfer', 'RCP-2003-001'),
(12, 10, '2022-04-17', 30000.00, 'Mobile Money', 'RCP-2004-009'),
(13, 10, '2022-04-17', 550000.00, 'Mobile Money', 'RCP-2005-004'),
(14, 7, '2020-03-01', 750000.00, 'Mobile Money', 'RCP-2005-990'),
(15, 9, '2024-08-09', 660000.00, 'Cash', 'RCP-5005-000'),
(17, 8, '2023-07-06', 900000.00, 'Cash', 'RCP-0099-886');

-- --------------------------------------------------------

--
-- Table structure for table `stall`
--

CREATE TABLE `stall` (
  `StallID` int(11) NOT NULL,
  `MarketID` int(11) NOT NULL,
  `Stallnumber` varchar(80) NOT NULL,
  `Size` enum('Small','Medium','Large') DEFAULT NULL,
  `Monthlyrent` decimal(10,3) NOT NULL,
  `status` enum('Available','Occupied','Under Maintenance') DEFAULT 'Available'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stall`
--

INSERT INTO `stall` (`StallID`, `MarketID`, `Stallnumber`, `Size`, `Monthlyrent`, `status`) VALUES
(1, 1, 'A-05', 'Medium', 20000.000, 'Available'),
(2, 1, 'A-01', 'Large', 52500.000, 'Available'),
(3, 1, 'A-02', 'Small', 85000.000, 'Under Maintenance'),
(4, 2, 'A-03', 'Medium', 45000.000, 'Available'),
(5, 1, 'A-04', 'Medium', 93000.000, 'Available'),
(6, 4, 'A-05', 'Medium', 87000.000, 'Available'),
(8, 4, 'B-01', 'Large', 132000.000, 'Available'),
(9, 1, 'B-02', 'Medium', 99000.000, 'Available'),
(10, 1, 'C-01', 'Medium', 10000.000, 'Available'),
(11, 3, 'D-04', 'Small', 77000.000, 'Available'),
(12, 2, 'B-03', 'Large', 55500.000, 'Available');

-- --------------------------------------------------------

--
-- Table structure for table `vendor`
--

CREATE TABLE `vendor` (
  `VendorID` int(11) NOT NULL,
  `First_Name` varchar(50) NOT NULL,
  `Last_Name` varchar(90) NOT NULL,
  `NationalID` varchar(50) NOT NULL,
  `Phone` varchar(20) NOT NULL,
  `Email` varchar(40) DEFAULT NULL,
  `Businesstype` varchar(100) NOT NULL,
  `Registrationdate` date NOT NULL DEFAULT curdate()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vendor`
--

INSERT INTO `vendor` (`VendorID`, `First_Name`, `Last_Name`, `NationalID`, `Phone`, `Email`, `Businesstype`, `Registrationdate`) VALUES
(1, 'Aminata', 'Koroma', 'SL-2021-0001', '77453689', 'koromaaminata@gmail.com', 'Vegetables and Fruits', '2022-06-30'),
(6, 'Mohamed', 'Kamara', 'SL-50070-0001', '+232456790', 'mohamedkamara132@gmail.com', 'Clothing and Fabric', '2017-06-19'),
(7, 'Fatima', 'Conteh', 'SL20210003', '+23278100003', 'contehfatima@gmail.com', 'Food and Beverages', '2023-06-21'),
(8, 'Braima', 'Bangura', 'SL20220004', '+23276100004', 'braima.b@gmail.com', 'Electronics and Accessories', '2022-06-01'),
(9, 'Isata', 'Turay', 'SL2022-0005', '+232', 'turayisata141@gmail.com', 'Cosmetics and Toiletries', '2022-06-04'),
(10, 'Karim', 'Jalloh', 'SL20020006', '+232100006', 'karim.j@gmail.com', 'HARDWARE AND TOOLS', '2026-06-16'),
(11, 'Mariama', 'Kanu', 'SL20230007', '+23276167890', 'Null', 'Second hand Clothing', '2019-06-05');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `allocation`
--
ALTER TABLE `allocation`
  ADD PRIMARY KEY (`AllocationID`),
  ADD KEY `StallID` (`StallID`),
  ADD KEY `VendorID` (`VendorID`);

--
-- Indexes for table `inspector`
--
ALTER TABLE `inspector`
  ADD PRIMARY KEY (`InspectorID`),
  ADD KEY `MarketID` (`MarketID`);

--
-- Indexes for table `market`
--
ALTER TABLE `market`
  ADD PRIMARY KEY (`MarketID`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`PaymentID`),
  ADD UNIQUE KEY `Receptnumber` (`Receptnumber`),
  ADD KEY `AllocationID` (`AllocationID`);

--
-- Indexes for table `stall`
--
ALTER TABLE `stall`
  ADD PRIMARY KEY (`StallID`),
  ADD KEY `MarketID` (`MarketID`);

--
-- Indexes for table `vendor`
--
ALTER TABLE `vendor`
  ADD PRIMARY KEY (`VendorID`),
  ADD UNIQUE KEY `NationalID` (`NationalID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `allocation`
--
ALTER TABLE `allocation`
  MODIFY `AllocationID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `inspector`
--
ALTER TABLE `inspector`
  MODIFY `InspectorID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `market`
--
ALTER TABLE `market`
  MODIFY `MarketID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `PaymentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `stall`
--
ALTER TABLE `stall`
  MODIFY `StallID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `vendor`
--
ALTER TABLE `vendor`
  MODIFY `VendorID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `allocation`
--
ALTER TABLE `allocation`
  ADD CONSTRAINT `allocation_ibfk_1` FOREIGN KEY (`StallID`) REFERENCES `stall` (`StallID`),
  ADD CONSTRAINT `allocation_ibfk_2` FOREIGN KEY (`VendorID`) REFERENCES `vendor` (`VendorID`);

--
-- Constraints for table `inspector`
--
ALTER TABLE `inspector`
  ADD CONSTRAINT `inspector_ibfk_1` FOREIGN KEY (`MarketID`) REFERENCES `market` (`MarketID`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`AllocationID`) REFERENCES `allocation` (`AllocationID`);

--
-- Constraints for table `stall`
--
ALTER TABLE `stall`
  ADD CONSTRAINT `stall_ibfk_1` FOREIGN KEY (`MarketID`) REFERENCES `market` (`MarketID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
