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