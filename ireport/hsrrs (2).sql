-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 05, 2017 at 09:33 AM
-- Server version: 10.1.19-MariaDB
-- PHP Version: 5.5.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hsrrs`
--

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `id` int(11) NOT NULL,
  `dept_name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`id`, `dept_name`) VALUES
(1, 'Engineering'),
(2, 'Housekeeping');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id` int(11) NOT NULL,
  `emp_num` varchar(45) NOT NULL,
  `emp_lname` varchar(20) NOT NULL,
  `emp_fname` varchar(20) NOT NULL,
  `emp_mname` varchar(20) NOT NULL,
  `emp_contact_no` varchar(15) NOT NULL,
  `pos_id` int(11) NOT NULL,
  `dept_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `emp_num`, `emp_lname`, `emp_fname`, `emp_mname`, `emp_contact_no`, `pos_id`, `dept_id`) VALUES
(1, '2015-100101', 'Chavez', 'Orly', 'Aguila', '+63912345678', 1, 1),
(2, '2015-100102', 'Furuya', 'John', 'Rafael', '+63931242355', 2, 1),
(3, '2015-100103', 'Borlongan', 'Neil', 'wew', '+63912342345', 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `position`
--

CREATE TABLE `position` (
  `id` int(11) NOT NULL,
  `pos_name` varchar(25) NOT NULL,
  `pos_des` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `position`
--

INSERT INTO `position` (`id`, `pos_name`, `pos_des`) VALUES
(1, 'Staff', 'Renders the service'),
(2, 'Dept Head', 'Assigns the service'),
(3, 'Supervisor', 'Assigns the sevice'),
(4, 'General Manager', 'The report exported is sent to the GM for their record');

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `id` int(11) NOT NULL,
  `room_no` int(11) NOT NULL,
  `room_location` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`id`, `room_no`, `room_location`) VALUES
(1, 307, 'Mountain Wing'),
(2, 607, 'Lake Wing');

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

CREATE TABLE `ticket` (
  `id` int(11) NOT NULL,
  `tick_details` varchar(255) NOT NULL,
  `tick_status` varchar(10) NOT NULL,
  `tick_priority` varchar(10) NOT NULL,
  `tick_date` datetime NOT NULL,
  `tick_limit` time NOT NULL,
  `tick_closed_time` datetime DEFAULT NULL,
  `tick_escalate` tinyint(4) NOT NULL,
  `room_id` int(11) NOT NULL,
  `ticket_type_id` int(11) NOT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `employee_id1` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ticket`
--

INSERT INTO `ticket` (`id`, `tick_details`, `tick_status`, `tick_priority`, `tick_date`, `tick_limit`, `tick_closed_time`, `tick_escalate`, `room_id`, `ticket_type_id`, `employee_id`, `employee_id1`) VALUES
(1, 'Endorsed to Sir Ricsam', 'Closed', 'High', '2017-01-23 08:01:00', '00:10:00', '2017-01-23 10:01:00', 1, 1, 1, 2, 2),
(2, 'Door latch broken at room 255. guest already checked out', 'Closed', 'High', '2017-02-15 14:01:00', '00:20:00', '2017-02-15 15:01:00', 0, 1, 2, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ticket_type`
--

CREATE TABLE `ticket_type` (
  `id` int(11) NOT NULL,
  `type_name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ticket_type`
--

INSERT INTO `ticket_type` (`id`, `type_name`) VALUES
(1, 'Guest Aircon Assistance'),
(2, 'Busted Bulb'),
(3, 'Guest Assistance - Others'),
(4, 'Guest TV Assistance'),
(5, 'Guest Room Item Request'),
(6, 'Guest Room Amenities Request'),
(7, 'Guest Room Setup Request');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_EMPLOYEE_JOB1_idx` (`pos_id`),
  ADD KEY `dept_idx` (`dept_id`);

--
-- Indexes for table `position`
--
ALTER TABLE `position`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_INITIAL TICKET_ROOM1_idx` (`room_id`),
  ADD KEY `fk_initial_ticket_ticket_type1_idx` (`ticket_type_id`),
  ADD KEY `fk_ticket_employee1_idx` (`employee_id`),
  ADD KEY `fk_ticket_employee2_idx` (`employee_id1`);

--
-- Indexes for table `ticket_type`
--
ALTER TABLE `ticket_type`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `position`
--
ALTER TABLE `position`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `room`
--
ALTER TABLE `room`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `ticket`
--
ALTER TABLE `ticket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `ticket_type`
--
ALTER TABLE `ticket_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `dept` FOREIGN KEY (`dept_id`) REFERENCES `department` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_EMPLOYEE_JOB1` FOREIGN KEY (`pos_id`) REFERENCES `position` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `fk_INITIAL TICKET_ROOM1` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_initial_ticket_ticket_type1` FOREIGN KEY (`ticket_type_id`) REFERENCES `ticket_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ticket_employee1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ticket_employee2` FOREIGN KEY (`employee_id1`) REFERENCES `employee` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
