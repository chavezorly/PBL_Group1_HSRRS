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