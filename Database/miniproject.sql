-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 11, 2019 at 11:43 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `miniproject`
--

-- --------------------------------------------------------

--
-- Table structure for table `consumer`
--

CREATE TABLE `consumer` (
  `c_id` int(11) NOT NULL,
  `hname` varchar(10) NOT NULL,
  `area` varchar(20) NOT NULL,
  `typeofshelter` varchar(20) NOT NULL,
  `phoneno` int(10) NOT NULL,
  `foodgrains` tinyint(1) NOT NULL,
  `cookedfood` tinyint(1) NOT NULL,
  `nonvegfood` tinyint(1) NOT NULL,
  `breakfast` time NOT NULL,
  `lunch` time NOT NULL,
  `dinner` time NOT NULL,
  `toddler` int(11) NOT NULL,
  `children` int(11) NOT NULL,
  `adolescent` int(11) NOT NULL,
  `adult` int(11) NOT NULL,
  `elderly` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `donor`
--

CREATE TABLE `donor` (
  `d_id` int(5) NOT NULL,
  `DonorName` varchar(50) NOT NULL,
  `DonorPan` varchar(10) NOT NULL,
  `DonateAmt` float NOT NULL,
  `DonateAddr` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sponsors`
--

CREATE TABLE `sponsors` (
  `s_id` int(11) NOT NULL,
  `whatentry` varchar(20) NOT NULL,
  `excessfood` tinyint(1) NOT NULL,
  `freshfood` tinyint(1) NOT NULL,
  `rawgrain` tinyint(1) NOT NULL,
  `fund` tinyint(1) NOT NULL,
  `spn_nm` varchar(20) NOT NULL,
  `phnno` int(10) NOT NULL,
  `email` varchar(20) NOT NULL,
  `city` varchar(20) NOT NULL,
  `state` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `volunteer`
--

CREATE TABLE `volunteer` (
  `v_id` int(11) NOT NULL,
  `fname` varchar(30) NOT NULL,
  `lname` varchar(20) NOT NULL,
  `email` varchar(30) DEFAULT NULL,
  `number` varchar(12) NOT NULL,
  `DOB` date NOT NULL,
  `organization` varchar(30) NOT NULL,
  `education` varchar(30) NOT NULL,
  `area` varchar(30) NOT NULL,
  `whytojoin` varchar(100) NOT NULL,
  `duration` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `volunteer`
--

INSERT INTO `volunteer` (`v_id`, `fname`, `lname`, `email`, `number`, `DOB`, `organization`, `education`, `area`, `whytojoin`, `duration`) VALUES
(1, 'Kalpit', '', 'kalpit@gmail.com', '9172327788', '0000-00-00', '', 'Diploma', '', '', '20'),
(2, 'Ayan', 'Gadpal', 'Ayangadpal2@gmail.com', '77757025466', '2019-09-11', 'Student', 'sfds', 'null', 'sdfsdf', '5');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `consumer`
--
ALTER TABLE `consumer`
  ADD PRIMARY KEY (`c_id`);

--
-- Indexes for table `donor`
--
ALTER TABLE `donor`
  ADD PRIMARY KEY (`d_id`);

--
-- Indexes for table `sponsors`
--
ALTER TABLE `sponsors`
  ADD PRIMARY KEY (`s_id`);

--
-- Indexes for table `volunteer`
--
ALTER TABLE `volunteer`
  ADD PRIMARY KEY (`v_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `consumer`
--
ALTER TABLE `consumer`
  MODIFY `c_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `donor`
--
ALTER TABLE `donor`
  MODIFY `d_id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sponsors`
--
ALTER TABLE `sponsors`
  MODIFY `s_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `volunteer`
--
ALTER TABLE `volunteer`
  MODIFY `v_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
