SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;


CREATE TABLE IF NOT EXISTS `listinginfo` (
`listingID` int(11) NOT NULL,
  `username` varchar(20) DEFAULT NULL,
  `racquetID` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `neworUsed` varchar(20) DEFAULT NULL,
  `dateListed` date DEFAULT NULL,
  `dateSold` date DEFAULT NULL,
  `usernameBuyer` varchar(20) DEFAULT NULL,
  `sellerRating` varchar(20) DEFAULT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `picture` varchar(50) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

INSERT INTO `listinginfo` (`listingID`, `username`, `racquetID`, `price`, `neworUsed`, `dateListed`, `dateSold`, `usernameBuyer`, `sellerRating`, `description`, `picture`) VALUES
(1, 'srkanth', 2, 1000, 'new', '2014-10-05', NULL, NULL, NULL, 'buy this brand new racquet, free shipping', '.../images/srkanth/wilsonj.jpg'),
(2, 'srkanth', 3, 500, 'used', '2014-10-04', NULL, NULL, NULL, 'buy this brand new racquet, free shipping', '.../images/srkanth/asics109.jpg'),
(3, 'jayp', 1, 100, 'new', '2014-10-01', NULL, NULL, NULL, 'Cheapest racquet in the market!!!', '.../images/jayp/dunlopif98.jpg');

CREATE TABLE IF NOT EXISTS `racquetinfo` (
`racquetID` int(11) NOT NULL,
  `modelName` varchar(20) DEFAULT NULL,
  `brand` varchar(10) DEFAULT NULL,
  `mass` double DEFAULT NULL,
  `length` double DEFAULT NULL,
  `swingweight` double DEFAULT NULL,
  `balancePoint` double DEFAULT NULL,
  `qualityIndex` double DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

INSERT INTO `racquetinfo` (`racquetID`, `modelName`, `brand`, `mass`, `length`, `swingweight`, `balancePoint`, `qualityIndex`) VALUES
(1, 'iDapt Force 98', 'dunlop', 0.31751, 69.95, 317, 33.12, 1.1),
(2, 'Juice 100S', 'wilson', 0.31751, 68.58, 320, 33.02, 1.08),
(3, '109', 'asics', 0.292, 69.22, 313, 34, 1.078);

CREATE TABLE IF NOT EXISTS `userinfo` (
  `username` varchar(20) NOT NULL DEFAULT '',
  `password` varchar(20) DEFAULT NULL,
  `firstName` varchar(20) DEFAULT NULL,
  `lastName` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phoneNumber` varchar(20) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  `rating` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `userinfo` (`username`, `password`, `firstName`, `lastName`, `email`, `phoneNumber`, `city`, `state`, `rating`) VALUES
('etam', '789456123', 'Eric', 'Tam', 'etam@ghoo.com', NULL, NULL, NULL, NULL),
('ironman', 'WARMACHINEROX', 'Tony', 'stark', 'info@stark.com', NULL, NULL, NULL, NULL),
('jayp', 'dreamteam', 'Jay', 'Patel', 'jay@hostname.com', '415-666-8877', 'santa clara', 'california', NULL),
('jsu', 'abcd1234', 'Jeffrey', 'Su', 'su@life.com', NULL, NULL, NULL, NULL),
('shub', '1234abcd', 'Shubha', 'Ranganathan', 'shub@email.com', NULL, NULL, NULL, NULL),
('srkanth', 'dreamteam', 'Srikanth', 'Narahari', 'sri@sjsu.com', '415-999-8877', 'san jose', 'california', 5);


ALTER TABLE `listinginfo`
 ADD PRIMARY KEY (`listingID`), ADD KEY `username` (`username`), ADD KEY `racquetID` (`racquetID`);

ALTER TABLE `racquetinfo`
 ADD PRIMARY KEY (`racquetID`);

ALTER TABLE `userinfo`
 ADD PRIMARY KEY (`username`);


ALTER TABLE `listinginfo`
MODIFY `listingID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
ALTER TABLE `racquetinfo`
MODIFY `racquetID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;

ALTER TABLE `listinginfo`
ADD CONSTRAINT `listinginfo_ibfk_1` FOREIGN KEY (`username`) REFERENCES `userinfo` (`username`),
ADD CONSTRAINT `listinginfo_ibfk_2` FOREIGN KEY (`racquetID`) REFERENCES `racquetinfo` (`racquetID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
