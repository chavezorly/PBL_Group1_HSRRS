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