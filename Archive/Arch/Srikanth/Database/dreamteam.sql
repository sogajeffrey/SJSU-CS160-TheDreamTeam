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
  `price` double NOT NULL,
  `neworUsed` enum('New','Used') NOT NULL DEFAULT 'Used',
  `dateListed` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `description` varchar(1024) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

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

INSERT INTO `userinfo` (`username`, `password`, `firstName`, `lastName`, `email`, `phoneNumber`, `city`, `state`) VALUES
('etam', '123456', 'Eric', 'Tam', 'etam@ghoo.com', '415-999-8876', 'San Jose', 'California'),
('ironman', 'iamironman', 'Tony', 'Stark', 'info@stark.com', '415-999-8872', 'San Jose', 'California'),
('jayp', 'mypassword', 'Jay', 'Patel', 'jay@hostname.com', '415-666-8877', 'Santa Clara', 'California'),
('jsu', 'dreamteam', 'Jeffrey', 'Su', 'su@life.com', '415-999-8177', 'San Jose', 'California'),
('lantan', 'liketocode', 'Lauren', 'Tanner', 'ltanner@yahoo.com', '123-456-3423', 'San Jose', 'California'),
('marlee', 'asmr3322', 'Maria', 'Lee', 'marialee@hotmail.com', '123-456-3457', 'San Jose', 'California'),
('shub', '65pass56', 'Shubha', 'Ranganathan', 'shub@email.com', '415-999-8879', 'San Jose', 'California'),
('srkanth', 'srknar', 'Srikanth', 'Narahari', 'sri@sjsu.com', '415-999-8877', 'San Jose', 'California'),
('tbran', 'brant', 'Brandon', 'Thomas', 'tbran@gmail.com', '123-456-3421', 'San Jose', 'California'),
('tennislover', 'ilovetennis', 'Mark', 'Wheeler', 'mark.wheeler@gmail.com', '123-456-3429', 'San Jose', 'California');


ALTER TABLE `listinginfo`
 ADD PRIMARY KEY (`listingID`), ADD KEY `username` (`username`), ADD KEY `racquetID` (`racquetID`);

ALTER TABLE `racquetinfo`
 ADD PRIMARY KEY (`racquetID`);

ALTER TABLE `userinfo`
 ADD PRIMARY KEY (`username`);


ALTER TABLE `listinginfo`
MODIFY `listingID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
ALTER TABLE `racquetinfo`
MODIFY `racquetID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;

ALTER TABLE `listinginfo`
ADD CONSTRAINT `listinginfo_ibfk_1` FOREIGN KEY (`username`) REFERENCES `userinfo` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `listinginfo_ibfk_2` FOREIGN KEY (`racquetID`) REFERENCES `racquetinfo` (`racquetID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
