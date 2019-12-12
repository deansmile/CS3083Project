-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 12, 2019 at 04:51 AM
-- Server version: 5.7.26
-- PHP Version: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `finstagram`
--

-- --------------------------------------------------------

--
-- Table structure for table `belongto`
--

DROP TABLE IF EXISTS `belongto`;
CREATE TABLE IF NOT EXISTS `belongto` (
  `member_username` varchar(20) NOT NULL,
  `owner_username` varchar(20) NOT NULL,
  `groupName` varchar(20) NOT NULL,
  PRIMARY KEY (`member_username`,`owner_username`,`groupName`),
  KEY `owner_username` (`owner_username`,`groupName`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
CREATE TABLE IF NOT EXISTS `comment` (
  `username` varchar(200) NOT NULL,
  `photoID` varchar(200) NOT NULL,
  `comment` varchar(200) NOT NULL,
  PRIMARY KEY (`username`,`photoID`,`comment`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`username`, `photoID`, `comment`) VALUES
('Panda', 'panda01.jpg', 'omg!!heart!'),
('TestUser', '16', 'cute!'),
('TestUser', '88', 'cute!'),
('TestUser', '88', 'nice!'),
('TestUser', 'cat in boots', 'cute hat!'),
('TestUser', 'cat in boots', 'cute!');

-- --------------------------------------------------------

--
-- Table structure for table `follow`
--

DROP TABLE IF EXISTS `follow`;
CREATE TABLE IF NOT EXISTS `follow` (
  `username_followed` varchar(20) NOT NULL,
  `username_follower` varchar(20) NOT NULL,
  `followstatus` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`username_followed`,`username_follower`),
  KEY `username_follower` (`username_follower`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `follow`
--

INSERT INTO `follow` (`username_followed`, `username_follower`, `followstatus`) VALUES
('Giana', 'TestUser', 1),
('Panda', 'Giana', 1),
('Giana', 'Panda', 1);

-- --------------------------------------------------------

--
-- Table structure for table `friendgroup`
--

DROP TABLE IF EXISTS `friendgroup`;
CREATE TABLE IF NOT EXISTS `friendgroup` (
  `groupOwner` varchar(20) NOT NULL,
  `groupName` varchar(20) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`groupOwner`,`groupName`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
CREATE TABLE IF NOT EXISTS `likes` (
  `username` varchar(20) NOT NULL,
  `photoID` varchar(22) NOT NULL,
  `liketime` datetime DEFAULT CURRENT_TIMESTAMP,
  `rating` int(11) DEFAULT NULL,
  PRIMARY KEY (`username`,`photoID`),
  KEY `photoID` (`photoID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`username`, `photoID`, `liketime`, `rating`) VALUES
('TestUser', '88', '2019-12-08 14:17:09', NULL),
('TestUser', '16', '2019-12-08 14:21:37', NULL),
('TestUser', '14', '2019-12-08 14:22:34', NULL),
('TestUser', 'cat9', '2019-12-08 14:23:30', NULL),
('TestUser', 'cat4', '2019-12-08 14:26:56', NULL),
('TestUser', 'cat1', '2019-12-08 14:27:53', NULL),
('TestUser', 'cat2', '2019-12-08 14:29:33', NULL),
('TestUser', 'suset.jpg', '2019-12-08 14:46:18', 8),
('TestUser', 'cat3', '2019-12-08 14:51:36', 5),
('TestUser', 'cat in boots', '2019-12-08 14:53:26', 10),
('TestUser', 'PIKACHU!', '2019-12-08 17:02:08', 9),
('Panda', 'kung fu panda.jpg', '2019-12-11 22:50:56', 10),
('Panda', 'panda01.jpg', '2019-12-11 22:55:48', 11);

-- --------------------------------------------------------

--
-- Table structure for table `photo`
--

DROP TABLE IF EXISTS `photo`;
CREATE TABLE IF NOT EXISTS `photo` (
  `photoID` varchar(100) NOT NULL,
  `postingdate` datetime DEFAULT CURRENT_TIMESTAMP,
  `filepath` varchar(100) DEFAULT NULL,
  `allFollowers` tinyint(1) DEFAULT NULL,
  `caption` varchar(100) DEFAULT NULL,
  `photoPoster` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`photoID`),
  KEY `photoPoster` (`photoPoster`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `photo`
--

INSERT INTO `photo` (`photoID`, `postingdate`, `filepath`, `allFollowers`, `caption`, `photoPoster`) VALUES
('cat.png', '2019-11-27 19:37:23', 'C:\\Users\\giana\\Downloads\\Finstagram\\Flask\\uploads\\cat.png', NULL, NULL, 'TestUser'),
('download.jpg', '2019-11-27 19:41:45', 'C:\\Users\\giana\\Downloads\\Finstagram\\Flask\\uploads\\download.jpg', NULL, NULL, 'TestUser'),
('suset.jpg', '2019-11-27 19:47:01', 'C:\\Users\\giana\\Downloads\\Finstagram\\Flask\\uploads\\suset.jpg', NULL, NULL, 'TestUser'),
('cat_cry.png', '2019-11-27 19:50:27', 'C:\\Users\\giana\\Downloads\\Finstagram\\Flask\\uploads\\cat_cry.png', NULL, NULL, 'TestUser'),
('tandon_stacked_color.jpg', '2019-11-27 21:31:05', 'C:\\Users\\giana\\Downloads\\Finstagram\\Flask\\uploads\\tandon_stacked_color.jpg', NULL, NULL, 'TestUser'),
('cat1', '2019-12-07 20:12:30', 'https://www.okhumane.org/wp-content/uploads/2016/03/community-cats.jpg', NULL, NULL, 'TestUser'),
('cat2', '2019-12-07 20:14:46', 'https://www.okhumane.org/wp-content/uploads/2016/03/community-cats.jpg', NULL, NULL, 'TestUser'),
('cat3', '2019-12-07 20:15:42', 'https://www.okhumane.org/wp-content/uploads/2016/03/community-cats.jpg', NULL, NULL, 'TestUser'),
('cat4', '2019-12-07 20:17:08', 'https://www.okhumane.org/wp-content/uploads/2016/03/community-cats.jpg', NULL, NULL, 'TestUser'),
('cat9', '2019-12-07 20:22:45', 'https://www.okhumane.org/wp-content/uploads/2016/03/community-cats.jpg', NULL, NULL, 'TestUser'),
('cat12', '2019-12-07 20:23:31', 'https://www.okhumane.org/wp-content/uploads/2016/03/community-cats.jpg', NULL, NULL, 'TestUser'),
('14', '2019-12-07 20:24:51', 'https://www.okhumane.org/wp-content/uploads/2016/03/community-cats.jpg', NULL, NULL, 'TestUser'),
('16', '2019-12-07 20:27:51', 'https://www.okhumane.org/wp-content/uploads/2016/03/community-cats.jpg', NULL, NULL, 'TestUser'),
('87', '2019-12-07 20:28:20', 'https://www.okhumane.org/wp-content/uploads/2016/03/community-cats.jpg', NULL, NULL, 'TestUser'),
('88', '2019-12-07 20:31:55', 'https://www.okhumane.org/wp-content/uploads/2016/03/community-cats.jpg', NULL, NULL, 'TestUser'),
('cat in boots', '2019-12-08 14:53:13', 'https://images-na.ssl-images-amazon.com/images/I/51VmmRDO1EL._SX425_.jpg', NULL, NULL, 'TestUser'),
('PIKACHU!', '2019-12-08 17:01:52', 'https://www.dhresource.com/0x0/f2/albu/g9/M01/3A/39/rBVaVVyQoLOAQLukAAKWNn96ilY853.jpg', NULL, NULL, 'TestUser'),
('panda01.jpg', '2019-12-09 21:12:14', 'C:\\Users\\giana\\Documents\\CS3083Project\\images\\panda01.jpg', 1, NULL, 'Giana'),
('kung fu panda.jpg', '2019-12-09 21:57:14', 'C:\\Users\\giana\\Documents\\CS3083Project\\Finstagram\\Flask\\static\\kung fu panda.jpg', 1, NULL, 'Giana'),
('Kung-Fu-Panda-270x400.jpg', '2019-12-11 23:27:19', 'C:\\Users\\giana\\Documents\\CS3083Project\\Finstagram\\Flask\\static\\Kung-Fu-Panda-270x400.jpg', 1, NULL, 'Panda');

-- --------------------------------------------------------

--
-- Table structure for table `sharedwith`
--

DROP TABLE IF EXISTS `sharedwith`;
CREATE TABLE IF NOT EXISTS `sharedwith` (
  `groupOwner` varchar(20) NOT NULL,
  `groupName` varchar(20) NOT NULL,
  `photoID` int(11) NOT NULL,
  PRIMARY KEY (`groupOwner`,`groupName`,`photoID`),
  KEY `photoID` (`photoID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tagged`
--

DROP TABLE IF EXISTS `tagged`;
CREATE TABLE IF NOT EXISTS `tagged` (
  `username` varchar(20) NOT NULL,
  `photoID` varchar(200) NOT NULL,
  `tagstatus` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`username`,`photoID`),
  KEY `photoID` (`photoID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tagged`
--

INSERT INTO `tagged` (`username`, `photoID`, `tagstatus`) VALUES
('TestUser', 'panda01.jpg', 1),
('Giana', 'kung fu panda.jpg', 1),
('TestUser', 'kung fu panda.jpg', 1),
('Giana', 'Kung-Fu-Panda-270x400.jpg', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `username` varchar(20) NOT NULL,
  `password` char(64) DEFAULT NULL,
  `firstName` varchar(20) DEFAULT NULL,
  `lastName` varchar(20) DEFAULT NULL,
  `bio` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`username`, `password`, `firstName`, `lastName`, `bio`) VALUES
('TestUser', 'Yang9858', 'Mufeng', 'Yang', ''),
('Giana', 'Yang9858', 'Giana', 'Yang', ''),
('Panda', 'Yang', 'Po', 'Panda', '');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
