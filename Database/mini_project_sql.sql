-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 05, 2019 at 12:22 PM
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
-- Database: `ngo`
--

-- --------------------------------------------------------

--
-- Table structure for table `allocation`
--

CREATE TABLE `allocation` (
  `AllID` int(11) NOT NULL,
  `C_ID` int(11) NOT NULL,
  `FoodID` int(11) NOT NULL,
  `date_tran` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `allocation`
--

INSERT INTO `allocation` (`AllID`, `C_ID`, `FoodID`, `date_tran`) VALUES
(1, 1, 1, '2019-10-05');

--
-- Triggers `allocation`
--
DELIMITER $$
CREATE TRIGGER `allo_tri` BEFORE INSERT ON `allocation` FOR EACH ROW begin set
new.date_tran = now();
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `area`
--

CREATE TABLE `area` (
  `AreaID` int(11) NOT NULL,
  `areaName` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `area`
--

INSERT INTO `area` (`AreaID`, `areaName`) VALUES
(1, 'katraj'),
(2, 'vakad'),
(3, 'Swargate'),
(4, 'Shivaji Nagar');

-- --------------------------------------------------------

--
-- Table structure for table `consumer`
--

CREATE TABLE `consumer` (
  `FoodID` int(11) NOT NULL,
  `C_ID` int(11) NOT NULL,
  `AreaID` int(11) NOT NULL,
  `hname` varchar(25) NOT NULL,
  `Quantity` float DEFAULT NULL,
  `type_of_shelter` varchar(20) NOT NULL,
  `mobno` int(12) NOT NULL,
  `toddler` int(11) NOT NULL,
  `children` int(11) NOT NULL,
  `adolescent` int(11) NOT NULL,
  `adult` int(11) NOT NULL,
  `elderly` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `consumer`
--

INSERT INTO `consumer` (`FoodID`, `C_ID`, `AreaID`, `hname`, `Quantity`, `type_of_shelter`, `mobno`, `toddler`, `children`, `adolescent`, `adult`, `elderly`) VALUES
(1, 1, 1, 'Home of Love', 18, 'orphange', 2147483647, 10, 12, 12, 11, 22),
(2, 2, 2, 'Aadarana', 20, 'old age home', 2147483647, 16, 32, 23, 12, 1),
(1, 3, 1, 'anand public school', 15.6, 'education institue', 2147483647, 31, 2, 11, 13, 12),
(2, 4, 3, 'Janahita Vatsalya Project', 13.2, ' night shelter home', 2147483647, 23, 6, 17, 1, 14),
(2, 5, 3, 'Shejar Chhaya', 23.5, 'nursery', 2147483647, 15, 43, 3, 14, 23),
(2, 6, 1, 'New Dawn Trust', 18.9, 'other', 2147483647, 26, 23, 6, 21, 5),
(1, 7, 3, 'Purbachal Ananda Foundati', 31.5, 'orphange', 2147483647, 18, 43, 9, 22, 32),
(2, 8, 4, 'Mitra Jyothi', 30.9, 'old age home', 2147483647, 3, 11, 32, 23, 32),
(1, 9, 3, 'Agappe Educational and Ch', 22.7, 'education institue', 2147483647, 5, 21, 26, 24, 2),
(1, 10, 2, ' Aasha Social Welfare Ass', 15.7, ' night shelter home', 2147483647, 11, 1, 15, 15, 13),
(2, 11, 3, 'St. Mary\'s (Girls) Orphan', 18.1, 'nursery', 2147483647, 7, 16, 12, 16, 14),
(1, 12, 2, 'Nativity Girl\'s Orphanage', 20.8, 'other', 2147483647, 8, 18, 17, 17, 15),
(2, 13, 4, 'St. Peter\'s Orphanage (Gi', 32.6, 'orphange', 2147483647, 11, 23, 31, 32, 16),
(1, 14, 4, 'Presentation Girls Orphan', 21.4, 'old age home', 2147483647, 22, 26, 27, 2, 17),
(2, 15, 2, 'St. John Bosco Orphanage ', 22.1, 'education institue', 2147483647, 26, 23, 22, 5, 21),
(2, 16, 3, 'St. John Vianney Orphanag', 20.6, ' night shelter home', 2147483647, 17, 15, 27, 3, 22),
(2, 17, 1, 'Epiphany Children\'s Home ', 24.8, 'nursery', 2147483647, 16, 16, 25, 23, 11),
(1, 18, 3, 'Umsohlait Mawhati Welfare', 20.5, 'other', 2147483647, 14, 17, 11, 22, 12),
(2, 19, 1, 'S.F.S. Girls Home', 13.1, 'orphange', 2147483647, 2, 18, 14, 12, 1),
(1, 20, 2, 'S.O.S. Children Village,', 28.7, 'old age home', 2147483647, 33, 21, 5, 32, 23),
(2, 21, 1, 'Krist Syiem Social Welfar', 5.9, 'education institue', 2147483647, 27, 2, 2, 4, 2),
(2, 22, 3, 'Lum Assisi Social Welfare', 8.6, ' night shelter home', 2147483647, 12, 3, 17, 2, 3),
(1, 23, 4, 'Lum Assisi Social Welfare', 16.2, 'nursery', 2147483647, 27, 5, 24, 11, 3),
(2, 24, 3, 'St. Theresa Girls Orphana', 19.7, 'other', 2147483647, 23, 4, 23, 22, 3);

--
-- Triggers `consumer`
--
DELIMITER $$
CREATE TRIGGER `cons_tri` BEFORE INSERT ON `consumer` FOR EACH ROW BEGIN
SET new.Quantity=(0.1*new.toddler)+(0.2*new.children)+(0.3*new.adolescent)+(0.4*new.adult)+(0.3*new.elderly);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `donor`
--

CREATE TABLE `donor` (
  `d_id` int(11) NOT NULL,
  `DonorPan` varchar(10) DEFAULT NULL,
  `DonorName` varchar(20) NOT NULL,
  `DonateAmt` decimal(10,2) NOT NULL,
  `DonorAddress` varchar(50) NOT NULL,
  `date_tran` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `donor`
--

INSERT INTO `donor` (`d_id`, `DonorPan`, `DonorName`, `DonateAmt`, `DonorAddress`, `date_tran`) VALUES
(1, 'AGCH458212', 'Nishant ', '100.00', 'pune', '2019-10-03'),
(2, 'CHUF6943BH', 'Suryanarayana', '150.00', 'nagar', '2019-10-03'),
(3, 'CHFU3598AB', 'ayan ', '670.00', 'solapur', '2019-10-03'),
(4, 'VKDI5692CB', 'Babu ', '340.00', 'jalana', '2019-10-03'),
(5, 'FKBH5609AS', 'Balasubramaniam', '900.00', 'sangali', '2019-10-03'),
(6, 'CJHS5094AS', 'Bhagwati', '200.00', 'mumbai', '2019-10-03'),
(7, 'XJHU5692CH', 'Bimal ', '650.00', 'godiya', '2019-10-03'),
(8, 'FKOY6934VH', 'Binod', '200.00', 'kholapur', '2019-10-03'),
(9, 'XDNJ6753BH', 'Brijesh', '350.00', 'jalgon', '2019-10-03'),
(10, 'AGCH438212', 'dnyanu', '1000.00', 'pune', '2019-10-03'),
(11, 'CHUF8543BH', 'Chandramouli', '200.00', 'nagar', '2019-10-03'),
(12, 'CHSU3598AB', 'Chetan ', '100.00', 'solapur', '2019-10-03'),
(13, 'VKDI5692AB', 'kalpit', '150.00', 'jalana', '2019-10-03'),
(14, 'FKBH5609AB', 'Deepan', '670.00', 'sangali', '2019-10-03'),
(15, 'AJHS5094AS', 'MANSI', '340.00', 'mumbai', '2019-10-03'),
(16, 'XJHU5695CH', 'Gautam ', '900.00', 'godiya', '2019-10-03'),
(17, 'FKOY6934CH', 'Ghantasala', '200.00', 'kholapur', '2019-10-03'),
(18, 'XDNJ6753BH', 'ROHAN', '650.00', 'jalgon', '2019-10-03'),
(19, 'AGCF438212', 'Hanumantha Rao', '200.00', 'pune', '2019-10-03'),
(20, 'CHUFG543BH', 'Harbhajan', '350.00', 'nagar', '2019-10-03'),
(21, 'CHSH3598AB', 'Harikrishna', '1000.00', 'solapur', '2019-10-03'),
(22, 'VKEI5692AB', 'OMKAR', '200.00', 'jalana', '2019-10-03'),
(23, 'FKBH5809AB', 'Ishwar ', '100.00', 'sangali', '2019-10-03'),
(24, 'AJAS5094AS', 'ADITYA', '150.00', 'mumbai', '2019-10-03'),
(25, 'XJJU5695CH', 'Jaisingrao', '670.00', 'godiya', '2019-10-03'),
(26, 'FKOY9934CH', 'Jayendra', '340.00', 'kholapur', '2019-10-03'),
(27, 'XDNJ1753BH', 'Jeona', '900.00', 'jalgon', '2019-10-03'),
(28, 'AGQF438212', 'Jigar ', '200.00', 'pune', '2019-10-03'),
(29, 'CHUFG543VH', 'Jitu ', '650.00', 'nagar', '2019-10-03'),
(30, 'CHSH5598AB', 'KETAN', '200.00', 'solapur', '2019-10-03'),
(31, 'VKEI6592AB', 'Keki', '350.00', 'jalana', '2019-10-03'),
(32, 'FKBH5809BA', 'Keshavadasa', '1000.00', 'sangali', '2019-10-03'),
(33, 'AJAS0594AS', 'Krishna Das', '100.00', 'mumbai', '2019-10-03'),
(34, 'XJJF3695CH', 'Krishnamurti', '150.00', 'godiya', '2019-10-03'),
(35, 'FKOY1934CH', 'Kushal ', '670.00', 'kholapur', '2019-10-03'),
(36, 'XDNJ1758BH', 'Kutumba Rao', '340.00', 'jalgon', '2019-10-03'),
(37, 'XJJU5695CH', 'SHARDUL', '900.00', 'pune', '2019-10-03'),
(38, 'FKOY1134CH', 'Lakshmikantam', '200.00', 'nagar', '2019-10-03'),
(39, 'XDGY1753BH', 'Lal', '650.00', 'solapur', '2019-10-03'),
(40, 'AGHU458212', 'MAYANK', '200.00', 'jalana', '2019-10-03'),
(41, 'CHFYG873VH', 'Mandar ', '350.00', 'sangali', '2019-10-03'),
(42, 'CHDT5598AB', 'Mandeep', '1000.00', 'mumbai', '2019-10-03'),
(43, 'VKEI6972AB', 'Manpreet', '100.00', 'godiya', '2019-10-03'),
(44, 'FKBB5809BA', 'Mrinal', '150.00', 'kholapur', '2019-10-03'),
(45, 'AJAS0592AS', 'NITIN', '670.00', 'jalgon', '2019-10-03'),
(46, 'XJJF3795CH', 'Nachiketa ', '340.00', 'pune', '2019-10-03'),
(47, 'FKSY1934CH', 'Nakusha', '900.00', 'mumbai', '2019-10-03'),
(48, 'XVNJ1758BH', 'Narendran', '200.00', 'solapur', '2019-10-03'),
(49, 'GIFD6849QA', 'Naresh', '650.00', 'nagar', '2019-10-03');

--
-- Triggers `donor`
--
DELIMITER $$
CREATE TRIGGER `DonateAddFund` AFTER INSERT ON `donor` FOR EACH ROW begin
  UPDATE total_fund 
  set Fund = Fund+new.DonateAmt WHERE F_id = 1;
  end
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `donor_tri` BEFORE INSERT ON `donor` FOR EACH ROW begin
set new.date_tran = now();
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `received_food`
--

CREATE TABLE `received_food` (
  `R_ID` int(11) NOT NULL,
  `s_id` int(11) DEFAULT NULL,
  `FoodID` int(11) DEFAULT NULL,
  `amount` float NOT NULL,
  `date_tran` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `received_food`
--

INSERT INTO `received_food` (`R_ID`, `s_id`, `FoodID`, `amount`, `date_tran`) VALUES
(19, 1, 2, 10, '2019-10-03'),
(20, 3, 1, 20, '2019-10-03'),
(21, 5, 2, 25, '2019-10-03'),
(22, 6, 1, 21, '2019-10-03'),
(23, 8, 2, 13, '2019-10-03'),
(24, 9, 1, 25, '2019-10-03'),
(25, 10, 2, 10, '2019-10-03'),
(26, 11, 2, 10, '2019-10-03'),
(27, 11, 1, 10, '2019-10-03'),
(28, 12, 1, 30, '2019-10-03'),
(29, 13, 2, 20, '2019-10-03'),
(30, 14, 2, 15, '2019-10-03'),
(31, 14, 1, 15, '2019-10-03'),
(32, 15, 1, 20, '2019-10-03'),
(33, 16, 2, 30, '2019-10-03'),
(34, 17, 2, 10, '2019-10-03'),
(35, 17, 1, 10, '2019-10-03'),
(36, 18, 2, 20, '2019-10-03'),
(37, 18, 1, 20, '2019-10-03'),
(38, 19, 2, 30, '2019-10-03'),
(39, 19, 1, 30, '2019-10-03'),
(40, 20, 2, 11, '2019-10-03'),
(41, 20, 1, 11, '2019-10-03');

--
-- Triggers `received_food`
--
DELIMITER $$
CREATE TRIGGER `spnAddFood` AFTER INSERT ON `received_food` FOR EACH ROW begin
		UPDATE total_food 
		set Quantity = Quantity+new.amount WHERE FoodID = new.FoodID;
		end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `sponsors`
--

CREATE TABLE `sponsors` (
  `s_id` int(10) NOT NULL,
  `AreaID` int(11) DEFAULT NULL,
  `spn_nm` varchar(30) NOT NULL,
  `whatentry` varchar(30) NOT NULL,
  `mobno` int(10) NOT NULL,
  `email` varchar(20) NOT NULL,
  `fund` float DEFAULT '0',
  `food` float DEFAULT '0',
  `rawgrain` float DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sponsors`
--

INSERT INTO `sponsors` (`s_id`, `AreaID`, `spn_nm`, `whatentry`, `mobno`, `email`, `fund`, `food`, `rawgrain`) VALUES
(1, 1, 'Mandeep', 'restaurant', 2147483647, 'Mandeep', 0, 10, 0),
(2, 3, 'Manpreet', 'hospital', 2147483647, 'Manpreet', 10000, 0, 0),
(3, 2, 'Mrinal', 'rwa', 2147483647, 'Mrinal', 0, 0, 20),
(4, 3, 'NITIN', 'event caterer', 2147483647, 'NITIN', 12000, 0, 0),
(5, 1, 'Nachiketa ', 'factory', 2147483647, 'Nachiketa ', 0, 25, 0),
(6, 2, 'Nakusha', 'hotel', 2147483647, 'Nakusha', 0, 0, 21),
(7, 3, 'Narendran', 'individual', 2147483647, 'Narendran', 15000, 0, 0),
(8, 2, 'Naresh', 'college', 2147483647, 'Naresh', 0, 13, 0),
(9, 4, 'PRAMOD', 'social group', 2147483647, 'PRAMOD', 0, 0, 25),
(10, 4, 'Pardeep', 'mess', 2035006370, 'Pardeep', 20000, 10, 0),
(11, 2, 'Prabhakar', 'restaurant', 2147483647, 'Prabhakar', 0, 10, 10),
(12, 4, 'Pranay', 'hospital', 2147483647, 'Pranay', 15000, 0, 30),
(13, 2, 'Prasad ', 'rwa', 2147483647, 'Prasad ', 20000, 20, 0),
(14, 4, 'Prasanta', 'event caterer', 2147483647, 'Prasanta', 0, 15, 15),
(15, 2, 'RADHA', 'factory', 2147483647, 'RADHA', 15000, 0, 20),
(16, 3, 'Raghava', 'hotel', 2147483647, 'Raghava', 30000, 30, 0),
(17, 4, 'Raghavan', 'individual', 2147483647, 'Raghavan', 10000, 10, 10),
(18, 4, 'Raja Babu', 'college', 2147483647, 'Raja Babu', 0, 20, 20),
(19, 2, 'Rama Devi', 'social group', 2147483647, 'Rama Devi', 25000, 30, 30),
(20, 1, 'ATHARVA', 'mess', 2147483647, 'ATHARVA', 0, 11, 11);

--
-- Triggers `sponsors`
--
DELIMITER $$
CREATE TRIGGER `spnTrigger1` AFTER INSERT ON `sponsors` FOR EACH ROW begin         IF new.food > 0 THEN               INSERT into             received_food(s_id,FoodID,amount,date_tran)               values(new.s_id,2,new.food,now());              END IF;            IF new.rawgrain > 0 THEN              INSERT into               received_food(s_id,FoodID,amount,date_tran)               values(new.s_id,1,new.rawgrain,now());              END IF;             IF new.fund > 0 THEN               INSERT into               s_fund(s_id,amount,date_tran)               values(new.s_id,new.fund,now());           END IF;        end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `s_fund`
--

CREATE TABLE `s_fund` (
  `SFund_ID` int(11) NOT NULL,
  `s_id` int(11) DEFAULT NULL,
  `amount` float NOT NULL,
  `date_tran` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `s_fund`
--

INSERT INTO `s_fund` (`SFund_ID`, `s_id`, `amount`, `date_tran`) VALUES
(7, 2, 10000, '2019-10-03'),
(8, 4, 12000, '2019-10-03'),
(9, 7, 15000, '2019-10-03'),
(10, 10, 20000, '2019-10-03'),
(11, 12, 15000, '2019-10-03'),
(12, 13, 20000, '2019-10-03'),
(13, 15, 15000, '2019-10-03'),
(14, 16, 30000, '2019-10-03'),
(15, 17, 10000, '2019-10-03'),
(16, 19, 25000, '2019-10-03');

--
-- Triggers `s_fund`
--
DELIMITER $$
CREATE TRIGGER `SpnAddFund` AFTER INSERT ON `s_fund` FOR EACH ROW begin
			UPDATE total_fund 
			set Fund = Fund+new.amount WHERE F_id = 1;
			end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `total_food`
--

CREATE TABLE `total_food` (
  `FoodID` int(11) NOT NULL,
  `Quantity` float NOT NULL,
  `food_type` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `total_food`
--

INSERT INTO `total_food` (`FoodID`, `Quantity`, `food_type`) VALUES
(1, 212, 'raw'),
(2, 204, 'coocked');

-- --------------------------------------------------------

--
-- Table structure for table `total_fund`
--

CREATE TABLE `total_fund` (
  `F_id` int(11) NOT NULL,
  `Fund` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `total_fund`
--

INSERT INTO `total_fund` (`F_id`, `Fund`) VALUES
(1, 193650);

-- --------------------------------------------------------

--
-- Table structure for table `user_account`
--

CREATE TABLE `user_account` (
  `emailID` varchar(30) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_account`
--

INSERT INTO `user_account` (`emailID`, `password`) VALUES
('Admin', ' ');

-- --------------------------------------------------------

--
-- Table structure for table `volunteer`
--

CREATE TABLE `volunteer` (
  `v_id` int(11) NOT NULL,
  `AreaID` int(11) DEFAULT NULL,
  `fname` varchar(20) NOT NULL,
  `lname` varchar(20) NOT NULL,
  `gender` tinyint(1) NOT NULL DEFAULT '1',
  `email` varchar(20) NOT NULL,
  `mobno` int(10) NOT NULL,
  `DOB` varchar(20) NOT NULL,
  `organization` varchar(30) NOT NULL,
  `education` varchar(20) NOT NULL,
  `why_to_join` varchar(60) NOT NULL,
  `duration` varchar(7) NOT NULL,
  `status` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `volunteer`
--

INSERT INTO `volunteer` (`v_id`, `AreaID`, `fname`, `lname`, `gender`, `email`, `mobno`, `DOB`, `organization`, `education`, `why_to_join`, `duration`, `status`) VALUES
(1, 1, 'Sanjana', 'Badami', 1, 'Sanjana', 2147483647, '02-10-1999', 'PICT', 'B.E', 'A', '1100101', 1),
(2, 1, 'Sanskriti', 'Agarwal', 1, 'Sanskriti', 2147483647, '01-10-1999', 'COEP', 'B.A', 'B', '1111001', 1),
(3, 1, 'Shachi', 'Agate', 1, 'Shachi', 2147483647, '30-09-1999', 'PVG', 'B.COM', 'C', '1000101', 2),
(4, 1, 'Shakti', 'Aggarwal', 1, 'Shakti', 2147483647, '29-09-1999', 'PCCOE', 'LLB', 'D', '1010110', -1),
(5, 1, 'Sheetal', 'Agrawal', 1, 'Sheetal', 2147483647, '28-09-1999', 'PPS', 'M.B.B.S', 'E', '1010101', 1),
(6, 1, 'Shilpa', 'Ahluwalia', 1, 'Shilpa', 2147483647, '27-09-1989', 'RSCOE', 'B.A.M.S', 'A', '1111110', 1),
(7, 1, 'Shivangi', 'Ahuja', 1, 'Shivangi', 2147483647, '28-09-1989', 'VJTI', 'DIPLOMA', 'B', '1111110', 2),
(8, 1, 'Shreya', 'Amble', 1, 'Shreya', 2147483647, '29-09-1989', 'IIT BOMBAY', 'C.A', 'C', '1100101', -1),
(9, 1, 'Shruti', 'Anand', 1, 'Shruti', 2147483647, '30-09-1989', 'IIT BOMBAY', 'B.E', 'D', '1111001', 1),
(10, 1, 'Shubha', 'Andra', 1, 'Shubha', 2147483647, '01-10-1989', 'SIGHGAD', 'B.E', 'E', '1000101', 1),
(11, 1, 'Shraddha', 'Anne', 1, 'Shraddha', 2147483647, '02-10-1989', 'TCS', 'B.A', 'A', '1010110', 2),
(12, 1, 'Shweta', 'Apte', 1, 'Shweta', 2147483647, '03-10-1989', 'LTI', 'B.COM', 'B', '1010101', -1),
(13, 1, 'Sneha', 'Arora', 1, 'Sneha', 2147483647, '04-10-1989', 'SAPIENT', 'LLB', 'C', '1111110', 0),
(14, 1, 'Soumya', 'Arya', 1, 'Soumya', 2147483647, '05-10-1989', 'RAKUTEN', 'M.B.B.S', 'D', '1111110', 1),
(15, 1, 'Sushma', 'Atwal', 1, 'Sushma', 2147483647, '06-10-1989', 'SE2', 'B.A.M.S', 'E', '1100101', 2),
(16, 1, 'Swati', 'Aurora', 1, 'Swati', 2147483647, '06-11-1987', 'PUBMATIC', 'DIPLOMA', 'A', '1111001', -1),
(17, 1, 'Aashu', 'Babu', 1, 'Aashu', 2147483647, '18-01-1987', 'FINSTA', 'C.A', 'B', '1000101', 0),
(18, 1, 'Anamol', 'Badal', 1, 'Anamol', 2147483647, '01-04-1986', 'GLOBAL SOLUTION', 'B.E', 'C', '1010110', 1),
(19, 1, 'Anish', 'Badami', 1, 'Anish', 2147483647, '13-06-1985', 'EQ TECH', 'B.E', 'D', '1010101', 2),
(20, 2, 'Appa Rao', 'Bahl', 1, 'Appa Rao', 2147483647, '25-08-1984', 'TCS', 'B.A', 'E', '1111110', -1),
(21, 2, 'Appayya', 'Bahri', 1, 'Appayya', 2147483647, '07-11-1983', 'LTI', 'B.COM', 'A', '1111110', 0),
(22, 2, 'Arindam', 'Bawa', 1, 'Arindam', 2147483647, '19-01-1983', 'PICT', 'LLB', 'B', '1111110', 1),
(23, 2, 'Aryaman', 'Bedi', 1, 'Aryaman', 2147483647, '02-04-1982', 'COEP', 'M.B.B.S', 'C', '1100101', 2),
(24, 2, 'Aseem', 'Behl', 1, 'Aseem', 2147483647, '14-06-1981', 'PVG', 'B.A.M.S', 'D', '1111001', -1),
(25, 2, 'Ashish', 'Ben', 1, 'Ashish', 2147483647, '26-08-1980', 'PCCOE', 'DIPLOMA', 'E', '1000101', 0),
(26, 2, 'Sambasiva Rao', 'Bera', 1, 'Sambasiva Rao', 2147483647, '08-11-1979', 'PPS', 'C.A', 'A', '1010110', 1),
(27, 2, 'Santosh', 'Bhagat', 1, 'Santosh', 2147483647, '20-01-1979', 'RSCOE', 'B.E', 'B', '1010101', 2),
(28, 2, 'Shambhav', 'Bhakta', 1, 'Shambhav', 2035006370, '03-04-1978', 'VJTI', 'B.E', 'C', '1111110', -1),
(29, 2, 'Shashi', 'Bhalla', 1, 'Shashi', 2147483647, '15-06-1977', 'IIT BOMBAY', 'B.A', 'D', '1111110', 0),
(30, 2, 'Shirish ', 'Bhandari', 1, 'Shirish ', 2147483647, '27-08-1976', 'IIT BOMBAY', 'B.COM', 'E', '1100101', 1),
(31, 2, 'Shyam', 'Bhardwaj', 1, 'Shyam', 2147483647, '09-11-1975', 'SIGHGAD', 'LLB', 'A', '1111001', 2),
(32, 2, 'Sikkil', 'Bhargava', 1, 'Sikkil', 2147483647, '21-01-1975', 'TCS', 'M.B.B.S', 'B', '1000101', -1),
(33, 2, 'Sitaram', 'Bhasin', 1, 'Sitaram', 2147483647, '04-04-1974', 'LTI', 'B.A.M.S', 'C', '1010110', 0),
(34, 2, 'Siva Rao ', 'Bhat', 1, 'Siva Rao ', 2147483647, '16-06-1973', 'SAPIENT', 'DIPLOMA', 'D', '1010101', 1),
(35, 2, 'Sonal', 'Bhatia', 1, 'Sonal', 2147483647, '28-08-1972', 'RAKUTEN', 'C.A', 'E', '1111110', 2),
(36, 2, 'Sreedharan', 'Bhatnagar', 1, 'Sreedharan', 2147483647, '10-11-1971', 'SE2', 'B.E', 'A', '1111110', -1),
(37, 2, 'Subramaniam', 'Bhatt', 1, 'Subramaniam', 2147483647, '22-01-1971', 'PUBMATIC', 'B.E', 'B', '1100101', 0),
(38, 2, 'Sukhdev ', 'Bhattacharyya', 1, 'Sukhdev ', 2147483647, '01-10-1972', 'FINSTA', 'B.A', 'C', '1111001', 1),
(39, 2, 'Nishant ', 'Bhatti', 1, 'Nishant ', 2147483647, '11-06-1974', 'GLOBAL SOLUTION', 'B.COM', 'D', '1000101', 2),
(40, 2, 'Suryanarayana', 'Bhavsar', 1, 'Suryanarayana', 2147483647, '19-02-1976', 'EQ TECH', 'LLB', 'E', '1010110', -1),
(41, 2, 'ayan ', 'Bir', 1, 'ayan ', 2147483647, '29-10-1977', 'TCS', 'M.B.B.S', 'A', '1010101', 0),
(42, 2, 'Babu ', 'Biswas', 1, 'Babu ', 2147483647, '09-07-1979', 'LTI', 'B.A.M.S', 'B', '1111110', 1),
(43, 2, 'Balasubramaniam', 'Boase', 1, 'Balasubramaniam', 2147483647, '18-03-1981', 'SANSTHA PANGAON', 'DIPLOMA', 'C', '1111110', 2),
(44, 2, 'Bhagwati', 'Bobal', 1, 'Bhagwati', 2147483647, '26-11-1982', 'NORTH EAST MULTIPURPOSE', 'C.A', 'D', '1100101', -1),
(45, 2, 'Bimal ', 'Bora', 1, 'Bimal ', 2147483647, '05-08-1984', 'SANJOGA', 'B.E', 'E', '1111001', 0),
(46, 2, 'Binod', 'Bora', 1, 'Binod', 2147483647, '15-04-1986', 'SOCIETY KARNATAKA ', 'B.E', 'A', '1000101', 1),
(47, 2, 'Brijesh', 'Borah', 1, 'Brijesh', 2147483647, '24-12-1987', 'SVOJAS FOUNDATION', 'B.A', 'B', '1010110', 2),
(48, 2, 'dnyanu', 'Borde', 1, 'dnyanu', 2147483647, '02-09-1989', 'Ummat-e- Muhammadiya', 'B.COM', 'C', '1010101', -1),
(49, 2, 'Chandramouli', 'Borra', 1, 'Chandramouli', 2147483647, '13-05-1991', 'PICT', 'LLB', 'D', '1111110', 0),
(50, 2, 'Chetan ', 'Bose', 1, 'Chetan ', 2147483647, '20-01-1993', 'COEP', 'M.B.B.S', 'E', '1111110', 1),
(51, 2, 'kalpit', 'Brahmbhatt', 1, 'kalpit', 2147483647, '30-09-1994', 'PVG', 'B.A.M.S', 'A', '1100101', 2),
(52, 2, 'Deepan', 'Brar', 1, 'Deepan', 2147483647, '09-06-1996', 'PCCOE', 'DIPLOMA', 'B', '1111001', -1),
(53, 2, 'MANSI', 'Buch', 1, 'MANSI', 2147483647, '17-02-1998', 'PPS', 'C.A', 'C', '1000101', 0),
(54, 3, 'Gautam ', 'Buch', 1, 'Gautam ', 2147483647, '08-07-1997', 'RSCOE', 'B.E', 'D', '1010110', 1),
(55, 3, 'Ghantasala', 'Bumb', 1, 'Ghantasala', 2147483647, '26-11-1996', 'VJTI', 'B.E', 'E', '1010101', 2),
(56, 3, 'ROHAN', 'Butala', 1, 'ROHAN', 2147483647, '16-04-1996', 'IIT BOMBAY', 'B.A', 'A', '1111110', -1),
(57, 3, 'Hanumantha Rao', 'Chacko', 1, 'Hanumantha Rao', 2147483647, '05-09-1995', 'IIT BOMBAY', 'B.COM', 'B', '1111110', 0),
(58, 3, 'Harbhajan', 'Chad', 1, 'Harbhajan', 2147483647, '24-01-1995', 'SIGHGAD', 'LLB', 'C', '1100101', 1),
(59, 3, 'Harikrishna', 'Chada', 1, 'Harikrishna', 2147483647, '14-06-1994', 'TCS', 'M.B.B.S', 'D', '1111001', 2),
(60, 3, 'OMKAR', 'Chadha', 1, 'OMKAR', 2147483647, '02-11-1993', 'LTI', 'B.A.M.S', 'E', '1000101', -1),
(61, 3, 'Ishwar ', 'Chahal', 0, 'Ishwar ', 2147483647, '23-03-1993', 'SAPIENT', 'DIPLOMA', 'A', '1010110', 0),
(62, 3, 'ADITYA', 'Chakrabarti', 0, 'ADITYA', 2147483647, '11-08-1992', 'RAKUTEN', 'C.A', 'B', '1010101', 1),
(63, 3, 'Jaisingrao', 'Chakraborty', 0, 'Jaisingrao', 2147483647, '31-12-1991', 'SE2', 'B.E', 'C', '1111110', 2),
(64, 3, 'Jayendra', 'Chana', 0, 'Jayendra', 2147483647, '21-05-1991', 'PUBMATIC', 'B.E', 'D', '1111110', -1),
(65, 3, 'Jeona', 'Chand', 0, 'Jeona', 2147483647, '09-10-1990', 'FINSTA', 'B.A', 'E', '1100101', 0),
(66, 3, 'Jigar ', 'Chanda', 0, 'Jigar ', 2147483647, '27-02-1990', 'GLOBAL SOLUTION', 'B.COM', 'A', '1111001', 1),
(67, 3, 'Jitu ', 'Chander', 0, 'Jitu ', 2147483647, '18-07-1989', 'EQ TECH', 'LLB', 'B', '1000101', 2),
(68, 3, 'KETAN', 'Chandra', 0, 'KETAN', 2147483647, '06-12-1988', 'TCS', 'M.B.B.S', 'C', '1010110', -1),
(69, 3, 'Keki', 'Chandran', 0, 'Keki', 2147483647, '26-04-1988', 'LTI', 'B.A.M.S', 'D', '1010101', 0),
(70, 3, 'Keshavadasa', 'Char', 0, 'Keshavadasa', 2147483647, '15-09-1987', 'SANSTHA PANGAON', 'DIPLOMA', 'E', '1111110', 1),
(71, 3, 'Krishna Das', 'Chatterjee', 0, 'Krishna Das', 2147483647, '03-02-1987', 'NORTH EAST MULTIPURPOSE', 'C.A', 'A', '1111110', 2),
(72, 3, 'Krishnamurti', 'Din', 0, 'Krishnamurti', 2147483647, '24-06-1986', 'SANJOGA', 'B.E', 'B', '1100101', -1),
(73, 3, 'Kushal ', 'Divan', 0, 'Kushal ', 2147483647, '12-11-1985', 'SOCIETY KARNATAKA ', 'B.E', 'C', '1111001', 0),
(74, 3, 'Kutumba Rao', 'Dixit', 0, 'Kutumba Rao', 2147483647, '02-04-1985', 'SVOJAS FOUNDATION', 'B.A', 'D', '1000101', 1),
(75, 3, 'SHARDUL', 'Doctor', 0, 'SHARDUL', 2147483647, '21-08-1984', 'Ummat-e- Muhammadiya', 'B.COM', 'E', '1010110', 2),
(76, 3, 'Lakshmikantam', 'Dora', 0, 'Lakshmikantam', 2147483647, '10-01-1984', 'PICT', 'LLB', 'A', '1010101', -1),
(77, 4, 'Lal', 'Doshi', 0, 'Lal', 2147483647, '31-05-1983', 'COEP', 'M.B.B.S', 'B', '1111110', 0),
(78, 4, 'MAYANK', 'Dua', 0, 'MAYANK', 2147483647, '19-10-1982', 'PVG', 'B.A.M.S', 'C', '1111110', 1),
(79, 4, 'Mandar ', 'Dube', 0, 'Mandar ', 2147483647, '09-03-1982', 'PCCOE', 'DIPLOMA', 'D', '1100101', 2),
(80, 4, 'Mandeep', 'Dubey', 0, 'Mandeep', 2147483647, '28-07-1981', 'PPS', 'C.A', 'E', '1111001', -1),
(81, 4, 'Manpreet', 'Dugal', 0, 'Manpreet', 2147483647, '16-12-1980', 'RSCOE', 'B.E', 'A', '1000101', 0),
(82, 4, 'Mrinal', 'Dugar', 0, 'Mrinal', 2147483647, '06-05-1980', 'VJTI', 'B.E', 'B', '1010110', 1),
(83, 4, 'NITIN', 'Dugar', 0, 'NITIN', 2147483647, '25-09-1979', 'IIT BOMBAY', 'B.A', 'C', '1010101', 2),
(84, 4, 'Nachiketa ', 'Dutt', 0, 'Nachiketa ', 2147483647, '26-10-1979', 'IIT BOMBAY', 'B.COM', 'D', '1111110', -1),
(85, 4, 'Nakusha', 'Dutta', 0, 'Nakusha', 2147483647, '27-10-1979', 'SIGHGAD', 'LLB', 'E', '1111110', 0),
(86, 4, 'Narendran', 'Dyal', 0, 'Narendran', 2147483647, '28-10-1979', 'TCS', 'M.B.B.S', 'A', '1100101', 1),
(87, 4, 'Naresh', 'Edwin', 0, 'Naresh', 2147483647, '29-10-1979', 'LTI', 'B.A.M.S', 'B', '1111001', 2),
(88, 4, 'PRAMOD', 'Gaba', 0, 'PRAMOD', 2147483647, '30-10-1979', 'SAPIENT', 'DIPLOMA', 'C', '1000101', -1),
(89, 4, 'Pardeep', 'Gade', 0, 'Pardeep', 2147483647, '31-10-1979', 'RAKUTEN', 'C.A', 'D', '1010110', 0),
(90, 4, 'Prabhakar', 'Gala', 0, 'Prabhakar', 2147483647, '01-11-1979', 'SE2', 'B.E', 'E', '1010101', 1),
(91, 4, 'Pranay', 'Gandhi', 0, 'Pranay', 2147483647, '02-11-1979', 'PUBMATIC', 'B.E', 'A', '1111110', 2),
(92, 4, 'Prasad ', 'Ganesan', 0, 'Prasad ', 2147483647, '03-11-1979', 'FINSTA', 'B.A', 'B', '1111110', -1),
(93, 4, 'Prasanta', 'Ganesh', 0, 'Prasanta', 2147483647, '04-11-1979', 'GLOBAL SOLUTION', 'B.COM', 'C', '1100101', 0),
(94, 4, 'RADHA', 'Ganguly', 0, 'RADHA', 2147483647, '05-11-1979', 'EQ TECH', 'LLB', 'D', '1111001', 1),
(95, 4, 'Raghava', 'Gara', 0, 'Raghava', 2147483647, '06-11-1979', 'TCS', 'M.B.B.S', 'E', '1000101', 2),
(96, 4, 'Raghavan', 'Garde', 0, 'Raghavan', 2147483647, '07-11-1979', 'LTI', 'B.A.M.S', 'A', '1010110', -1),
(97, 4, 'Raja Babu', 'Garg', 0, 'Raja Babu', 2147483647, '08-11-1979', 'SANSTHA PANGAON', 'DIPLOMA', 'B', '1010101', 0),
(98, 4, 'Rama Devi', 'Gera', 0, 'Rama Devi', 2147483647, '09-11-1979', 'NORTH EAST MULTIPURPOSE', 'C.A', 'C', '1111110', 1),
(99, 4, 'ATHARVA', 'Ghose', 0, 'ATHARVA', 2147483647, '10-11-1979', 'SANJOGA', 'B.E', 'D', '1111110', 2),
(100, 4, 'ANIKET', 'Ghosh', 0, 'ANIKET', 2147483647, '11-11-1979', 'SOCIETY KARNATAKA ', 'B.A', 'E', '1100101', -1);

-- --------------------------------------------------------

--
-- Table structure for table `vol_allocation`
--

CREATE TABLE `vol_allocation` (
  `AllID` int(11) NOT NULL,
  `v_id` int(11) NOT NULL,
  `date_tran` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vol_allocation`
--

INSERT INTO `vol_allocation` (`AllID`, `v_id`, `date_tran`) VALUES
(1, 1, '2019-10-05'),
(1, 5, '2019-10-05'),
(1, 9, '2019-10-05');

--
-- Triggers `vol_allocation`
--
DELIMITER $$
CREATE TRIGGER `vol_tri` BEFORE INSERT ON `vol_allocation` FOR EACH ROW begin
set new.date_tran = now();
end
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `allocation`
--
ALTER TABLE `allocation`
  ADD PRIMARY KEY (`AllID`),
  ADD KEY `C_ID` (`C_ID`),
  ADD KEY `FoodID` (`FoodID`);

--
-- Indexes for table `area`
--
ALTER TABLE `area`
  ADD PRIMARY KEY (`AreaID`);

--
-- Indexes for table `consumer`
--
ALTER TABLE `consumer`
  ADD PRIMARY KEY (`C_ID`),
  ADD KEY `AreaID` (`AreaID`),
  ADD KEY `FoodID` (`FoodID`);

--
-- Indexes for table `donor`
--
ALTER TABLE `donor`
  ADD PRIMARY KEY (`d_id`);

--
-- Indexes for table `received_food`
--
ALTER TABLE `received_food`
  ADD PRIMARY KEY (`R_ID`),
  ADD KEY `s_id` (`s_id`),
  ADD KEY `FoodID` (`FoodID`);

--
-- Indexes for table `sponsors`
--
ALTER TABLE `sponsors`
  ADD PRIMARY KEY (`s_id`),
  ADD KEY `AreaID` (`AreaID`);

--
-- Indexes for table `s_fund`
--
ALTER TABLE `s_fund`
  ADD PRIMARY KEY (`SFund_ID`),
  ADD KEY `s_id` (`s_id`);

--
-- Indexes for table `total_food`
--
ALTER TABLE `total_food`
  ADD PRIMARY KEY (`FoodID`);

--
-- Indexes for table `total_fund`
--
ALTER TABLE `total_fund`
  ADD PRIMARY KEY (`F_id`);

--
-- Indexes for table `user_account`
--
ALTER TABLE `user_account`
  ADD PRIMARY KEY (`emailID`);

--
-- Indexes for table `volunteer`
--
ALTER TABLE `volunteer`
  ADD PRIMARY KEY (`v_id`),
  ADD KEY `AreaID` (`AreaID`);

--
-- Indexes for table `vol_allocation`
--
ALTER TABLE `vol_allocation`
  ADD KEY `AllID` (`AllID`),
  ADD KEY `v_id` (`v_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `allocation`
--
ALTER TABLE `allocation`
  MODIFY `AllID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `area`
--
ALTER TABLE `area`
  MODIFY `AreaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `consumer`
--
ALTER TABLE `consumer`
  MODIFY `C_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `donor`
--
ALTER TABLE `donor`
  MODIFY `d_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `received_food`
--
ALTER TABLE `received_food`
  MODIFY `R_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `sponsors`
--
ALTER TABLE `sponsors`
  MODIFY `s_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `s_fund`
--
ALTER TABLE `s_fund`
  MODIFY `SFund_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `volunteer`
--
ALTER TABLE `volunteer`
  MODIFY `v_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `allocation`
--
ALTER TABLE `allocation`
  ADD CONSTRAINT `allocation_ibfk_2` FOREIGN KEY (`FoodID`) REFERENCES `total_food` (`FoodID`);

--
-- Constraints for table `consumer`
--
ALTER TABLE `consumer`
  ADD CONSTRAINT `consumer_ibfk_1` FOREIGN KEY (`AreaID`) REFERENCES `area` (`AreaID`),
  ADD CONSTRAINT `consumer_ibfk_2` FOREIGN KEY (`FoodID`) REFERENCES `total_food` (`FoodID`);

--
-- Constraints for table `received_food`
--
ALTER TABLE `received_food`
  ADD CONSTRAINT `received_food_ibfk_1` FOREIGN KEY (`s_id`) REFERENCES `sponsors` (`s_id`),
  ADD CONSTRAINT `received_food_ibfk_2` FOREIGN KEY (`FoodID`) REFERENCES `total_food` (`FoodID`);

--
-- Constraints for table `sponsors`
--
ALTER TABLE `sponsors`
  ADD CONSTRAINT `sponsors_ibfk_1` FOREIGN KEY (`AreaID`) REFERENCES `area` (`AreaID`);

--
-- Constraints for table `s_fund`
--
ALTER TABLE `s_fund`
  ADD CONSTRAINT `s_fund_ibfk_1` FOREIGN KEY (`s_id`) REFERENCES `sponsors` (`s_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
