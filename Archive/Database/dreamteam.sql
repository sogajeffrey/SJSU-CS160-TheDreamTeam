-- phpMyAdmin SQL Dump
-- version 4.2.10.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 05, 2014 at 08:36 PM
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
  `description` varchar(1024) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `listinginfo`
--

INSERT INTO `listinginfo` (`listingID`, `username`, `racquetID`, `price`, `neworUsed`, `dateListed`, `description`) VALUES
(1, 'srkanth', 1, 79.99, 'Used', '2014-11-30 23:26:09', 'Solid offering in good condition. Minor cosmetic damage near throat.'),
(2, 'ironman', 2, 799.99, 'Used', '2014-12-01 18:42:23', 'Exquisite offering! Rafael Nadal''s racquet of choice, signed by Rafa himself at the 2011 French Open!'),
(3, 'jayp', 3, 159.99, 'Used', '2014-12-01 18:44:30', 'Novak Djokovic''s racquet of choice. I used for just one tournament.'),
(4, 'jsu', 4, 89.99, 'Used', '2014-12-01 18:45:09', 'Andy Murray''s racquet. Bumper guard needs to be replaced. Other than that, great condition!'),
(5, 'shub', 5, 59.99, 'New', '2014-12-01 18:46:47', 'Clearance sale!'),
(6, 'etam', 6, 179.99, 'New', '2014-12-01 18:50:50', 'The perfect blend of stability and maneuverability!'),
(7, 'etam', 7, 69.99, 'Used', '2014-12-01 18:52:58', 'Underrated racquet. Minimal cosmetic damage.'),
(8, 'srkanth', 8, 94.99, 'New', '2014-12-04 23:33:16', 'Exclusive offer! Save big bucks on a silky smooth stick! For a limited time, free custom stringjob!'),
(9, 'shub', 9, 249.99, 'New', '2014-12-01 18:57:09', 'Limited offer! Strung with the Lendl pattern for enhanced control. Scalpel-like stability and precision on groundstrokes and volleys alike.'),
(10, 'jayp', 10, 39.99, 'Used', '2014-12-01 19:00:15', 'Great racquet, but the string broke and I don''t want to deal with it.');

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `racquetinfo`
--

INSERT INTO `racquetinfo` (`racquetID`, `modelName`, `brand`, `mass`, `length`, `swingweight`, `balancePoint`, `qualityIndex`) VALUES
(1, 'Pure Drive', 'Babolat', 11.1, 27, 308, -4, 1.116),
(2, 'AeroPro Drive', 'Babolat', 11.3, 27, 316, -4, 1.108),
(3, 'Graphene Speed MP', 'Head', 11, 27, 320, -3, 1.085),
(4, 'Graphene Radical Pro', 'Head', 11.5, 27, 326, -6, 1.051),
(5, 'Microgel Radical MP', 'Head', 11, 27, 315, -2, 1.124),
(6, 'EX03 Tour 100 16x18', 'Prince', 11.6, 27, 323, -7, 1.049),
(7, 'Organix 9', 'Volkl', 11.4, 27, 313, -5, 1.107),
(8, 'Blade 93', 'Wilson', 12, 27, 333, -6, 1.074),
(9, 'VCore Tour 89', 'Yonex', 12.1, 27, 335, -8, 1.034),
(10, 'Ezone Xi 98', 'Yonex', 11.5, 27, 324, -6, 1.058);

-- --------------------------------------------------------

--
-- Table structure for table `userinfo`
--

CREATE TABLE IF NOT EXISTS `userinfo` (
  `username` varchar(50) NOT NULL,
  `passwordMD5` varchar(50) NOT NULL,
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

INSERT INTO `userinfo` (`username`, `passwordMD5`, `firstName`, `lastName`, `email`, `phoneNumber`, `city`, `state`) VALUES
('etam', 'd41d8cd98f00b204e9800998ecf8427e', 'Eric', 'Tam', 'etam@yahoo.com', '415999887', 'San Jose', 'California'),
('ironman', 'd50ba4dd3fe42e17e9faa9ec29f89708', 'Tony', 'Stark', 'info@stark.com', '415-999-8872', 'San Jose', 'California'),
('jayman', '5ebe2294ecd0e0f08eab7690d2a6ee69', 'jayman', 'patel', 'jay@man.com', '12346', 'san jose', 'California'),
('jayp', '34819d7beeabb9260a5c854bc85b3e44', 'Jay', 'Patel', 'jay@hostname.com', '415-666-8877', 'Santa Clara', 'California'),
('jeff', '5ebe2294ecd0e0f08eab7690d2a6ee69', 'Jeffrey', 'Su', 'jeff@gmail.com', '408-123-4567', 'san jose', 'California'),
('jsu', '20dcb59f94e6da19c2496a89c3590dfa', 'Jeffrey', 'Su', 'su@life.com', '415-999-8177', 'San Jose', 'California'),
('lantan', 'f5729061a5d17570863f784405f112b4', 'Lauren', 'Tanner', 'ltanner@yahoo.com', '123-456-3423', 'San Jose', 'California'),
('marlee', 'dbbe5baa3f30086e33c57fa3f3471bdb', 'Maria', 'Lee', 'marialee@hotmail.com', '123-456-3457', 'San Jose', 'California'),
('shub', '095a12d561e56a14eaf6fce66a591145', 'Shubha', 'Ranganathan', 'shub@email.com', '415-999-8879', 'San Jose', 'California'),
('snarahar', '90affbd9a1954ec9ff029b7ad7183a16', 'sridhar', 'narahari', 'sridhar.narahari@gmail.com', '1234567890', 'milpitas', 'ca'),
('srkanth', '768a7026f49df32ae66f7dddae9446b6', 'Srikanth', 'Narahari', 'sri@sjsu.com', '408-123-1234', 'San Jose', 'California'),
('tbran', '62056df7cfd4298135043862ccc06fc3', 'Brandon', 'Thomas', 'tbran@gmail.com', '123-456-3421', 'San Jose', 'California'),
('tennislover', '1ca72ad62ed85e20f7319195bdc03740', 'Mark', 'Wheeler', 'mark.wheeler@gmail.com', '123-456-3429', 'San Jose', 'California'),
('testman', '5ebe2294ecd0e0f08eab7690d2a6ee69', 'test', 'man', 'test12@man.com', '123467', 'san jose', 'ca');

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
MODIFY `listingID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `racquetinfo`
--
ALTER TABLE `racquetinfo`
MODIFY `racquetID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
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
