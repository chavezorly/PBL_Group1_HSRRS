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