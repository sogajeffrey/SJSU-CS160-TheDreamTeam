-- phpMyAdmin SQL Dump
-- version 4.2.10.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 30, 2014 at 11:10 PM
-- Server version: 5.6.21-log
-- PHP Version: 5.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `dreamteam`
--

-- --------------------------------------------------------

--
-- Table structure for table `listinginfo`
--

CREATE TABLE IF NOT EXISTS `listinginfo` (
`listingID` int(11) NOT NULL,
  `username` varchar(20) DEFAULT NULL,
  `racquetID` int(11) DEFAULT NULL,
  `price` double NOT NULL,
  `neworUsed` enum('New','Used') NOT NULL DEFAULT 'Used',
  `dateListed` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dateSold` date DEFAULT NULL,
  `usernameBuyer` varchar(50) DEFAULT NULL,
  `description` varchar(1024) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `listinginfo`
--

INSERT INTO `listinginfo` (`listingID`, `username`, `racquetID`, `price`, `neworUsed`, `dateListed`, `dateSold`, `usernameBuyer`, `description`) VALUES
(1, 'srkanth', 8, 94.99, 'New', '2014-11-30 23:33:16', NULL, NULL, 'Exclusive offer! Save big bucks on a silky smooth stick! For a limited time, free custom stringjob!'),
(4, 'srkanth', 1, 79.99, 'Used', '2014-11-30 23:26:09', NULL, NULL, 'Solid offering in good condition. Minor cosmetic damage near throat.');

-- --------------------------------------------------------

--
-- Table structure for table `racquetinfo`
--

CREATE TABLE IF NOT EXISTS `racquetinfo` (
`racquetID` int(11) NOT NULL,
  `modelName` varchar(20) DEFAULT NULL,
  `brand` varchar(10) DEFAULT NULL,
  `mass` double DEFAULT NULL,
  `length` double DEFAULT NULL,
  `swingweight` double DEFAULT NULL,
  `balancePoint` double DEFAULT NULL,
  `qualityIndex` double DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `racquetinfo`
--

INSERT INTO `racquetinfo` (`racquetID`, `modelName`, `brand`, `mass`, `length`, `swingweight`, `balancePoint`, `qualityIndex`) VALUES
(1, 'Pure Drive', 'Babolat', 11.1, 27, 308, -4, 1.116),
(2, 'AeroPro Drive', 'Babolat', 11.3, 27, 316, -4, 1.108),
(3, 'Graphene Speed MP', 'Head', 11, 27, 320, -3, 1.085),
(4, 'Graphene Radical Pro', 'Head', 11.5, 127, 326, -6, 1.051),
(5, 'Microgel Radical MP', 'Head', 11, 27, 315, -2, 1.124),
(6, 'EX03 Tour 100 16x18', 'Prince', 11.6, 27, 323, -7, 1.049),
(7, 'Organic 9', 'Volkl', 11.4, 27, 313, -5, 1.107),
(8, 'Blade 93', 'Wilson', 12, 27, 333, -6, 1.074),
(9, 'VCore Tour 89', 'Yonex', 12.1, 27, 335, -8, 1.034),
(10, 'Ezone Xi 98', 'Yonex', 11.5, 27, 324, -6, 1.058);

-- --------------------------------------------------------

--
-- Table structure for table `userinfo`
--

CREATE TABLE IF NOT EXISTS `userinfo` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `firstName` varchar(20) NOT NULL,
  `lastName` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phoneNumber` varchar(20) NOT NULL,
  `city` varchar(20) NOT NULL,
  `state` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userinfo`
--

INSERT INTO `userinfo` (`username`, `password`, `firstName`, `lastName`, `email`, `phoneNumber`, `city`, `state`) VALUES
('etam', '123456', 'Eric', 'Tam', 'etam@ghoo.com', '415-999-8876', 'San Jose', 'California'),
('ironman', '123456', 'Tony', 'stark', 'info@stark.com', '415-999-8872', 'San Jose', 'California'),
('jayp', '123456', 'Jay', 'Patel', 'jay@hostname.com', '415-666-8877', 'santa clara', 'California'),
('jsu', '123456', 'Jeffrey', 'Su', 'su@life.com', '415-999-8177', 'San Jose', 'California'),
('shub', '123456', 'Shubha', 'Ranganathan', 'shub@email.com', '415-999-8879', 'San Jose', 'California'),
('srkanth', '123456', 'Srikanth', 'Narahari', 'sri@sjsu.com', '415-999-8877', 'san jose', 'California'),
('test1', '123456', 'test1', 'man', 'test1@man.com', '123-456-3423', 'San Jose', 'California'),
('test2', '123456', 'test2', 'man', 'test2@man.com', '123-456-3423', 'San Jose', 'California'),
('test3', '123456', 'test3', 'man', 'test3@man.com', '123-456-3423', 'San Jose', 'California'),
('test4', '123456', 'test4', 'man', 'test4@man.com', '123-456-3423', 'San Jose', 'California');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `listinginfo`
--
ALTER TABLE `listinginfo`
 ADD PRIMARY KEY (`listingID`), ADD KEY `username` (`username`), ADD KEY `racquetID` (`racquetID`);

--
-- Indexes for table `racquetinfo`
--
ALTER TABLE `racquetinfo`
 ADD PRIMARY KEY (`racquetID`);

--
-- Indexes for table `userinfo`
--
ALTER TABLE `userinfo`
 ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `listinginfo`
--
ALTER TABLE `listinginfo`
MODIFY `listingID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `racquetinfo`
--
ALTER TABLE `racquetinfo`
MODIFY `racquetID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `listinginfo`
--
ALTER TABLE `listinginfo`
ADD CONSTRAINT `listinginfo_ibfk_1` FOREIGN KEY (`username`) REFERENCES `userinfo` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `listinginfo_ibfk_2` FOREIGN KEY (`racquetID`) REFERENCES `racquetinfo` (`racquetID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
