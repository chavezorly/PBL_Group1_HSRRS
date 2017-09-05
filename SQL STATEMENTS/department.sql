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