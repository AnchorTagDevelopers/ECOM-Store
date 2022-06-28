-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 28, 2022 at 10:34 AM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecom`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

DROP TABLE IF EXISTS `admin_users`;
CREATE TABLE IF NOT EXISTS `admin_users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`id`, `username`, `password`) VALUES
(1, 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categories` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `categories`, `status`) VALUES
(7, 'Baby Boys', 1),
(8, 'Girls', 1),
(9, 'Baby Girls', 1),
(10, 'Boys', 1);

-- --------------------------------------------------------

--
-- Table structure for table `contact_us`
--

DROP TABLE IF EXISTS `contact_us`;
CREATE TABLE IF NOT EXISTS `contact_us` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(75) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `comment` text NOT NULL,
  `added_on` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contact_us`
--

INSERT INTO `contact_us` (`id`, `name`, `email`, `mobile`, `comment`, `added_on`) VALUES
(1, 'Vishal', 'Vishal@gmail.com', '12345678910', 'Test Query', '2021-07-13 00:00:00'),
(2, 'Atif', 'atif@yahoo.com', '123456789', 'Testing', '2008-07-04 00:00:00'),
(3, 'Atif', 'Atif', 'Atif', 'Atif', '2021-07-26 01:48:27'),
(4, 'Atif', 'Atif', 'Atif', 'Atif', '2021-07-26 07:43:32');

-- --------------------------------------------------------

--
-- Table structure for table `myorder`
--

DROP TABLE IF EXISTS `myorder`;
CREATE TABLE IF NOT EXISTS `myorder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `address` varchar(250) NOT NULL,
  `city` varchar(50) NOT NULL,
  `pincode` int(11) NOT NULL,
  `payment_type` varchar(20) NOT NULL,
  `total_price` float NOT NULL,
  `payment_status` varchar(20) NOT NULL,
  `order_status` int(11) NOT NULL,
  `added_on` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `myorder`
--

INSERT INTO `myorder` (`id`, `user_id`, `address`, `city`, `pincode`, `payment_type`, `total_price`, `payment_status`, `order_status`, `added_on`) VALUES
(16, 3, 'FSB', 'FSB', 1234, 'COD', 590, 'success', 4, '2021-07-31 09:34:31'),
(15, 3, 'karac', 'karac', 32423, 'COD', 590, 'success', 5, '2021-07-31 09:32:11'),
(14, 3, 'Karachi', 'Karachi', 13123, 'COD', 1190, 'success', 1, '2021-07-31 09:30:46'),
(13, 3, 'Lahore', 'Lahoe', 234234, 'COD', 2380, 'success', 1, '2021-07-31 09:18:56'),
(12, 3, 'Lahore', 'Lahoe', 234234, 'COD', 2380, 'success', 1, '2021-07-31 09:16:03'),
(11, 3, 'Lahore', 'Lahore', 23234, 'COD', 1190, 'success', 2, '2021-07-31 08:37:24');

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE IF NOT EXISTS `order_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `price` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`id`, `order_id`, `product_id`, `qty`, `price`) VALUES
(5, 12, 17, 1, 1190),
(4, 11, 17, 1, 1190),
(6, 12, 16, 1, 1190),
(7, 13, 17, 1, 1190),
(8, 13, 16, 1, 1190),
(9, 14, 16, 1, 1190),
(10, 15, 18, 1, 590),
(11, 16, 18, 4, 590);

-- --------------------------------------------------------

--
-- Table structure for table `order_status`
--

DROP TABLE IF EXISTS `order_status`;
CREATE TABLE IF NOT EXISTS `order_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_status`
--

INSERT INTO `order_status` (`id`, `name`) VALUES
(1, 'Pending'),
(2, 'Processing'),
(3, 'Shipped'),
(4, 'Cancelled'),
(5, 'Complete');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categories_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `mrp` varchar(255) NOT NULL,
  `saleprice` float NOT NULL,
  `qty` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `short_desc` varchar(2000) NOT NULL,
  `description` text NOT NULL,
  `meta_keyword` varchar(2000) NOT NULL,
  `meta_title` varchar(2000) NOT NULL,
  `meta_description` varchar(2000) NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `categories_id`, `name`, `mrp`, `saleprice`, `qty`, `image`, `short_desc`, `description`, `meta_keyword`, `meta_title`, `meta_description`, `status`) VALUES
(15, 7, 'Baby Boy Overall Skin', 'OMBOA001', 1190, 26, '633986_OMBOA001.jpg', 'Kids Dangree', 'Kids Dangree', 'Kids Dangree', 'Kids Dangree', 'Kids Dangree', 1),
(16, 7, 'Baby Boy Overall Blue', 'OMBOA002', 1190, 5, '194480_OMBOA002 (1).jpg', 'Kids Dangree', 'Kids Dangree', 'Kids Dangree', 'Kids Dangree', 'Kids Dangree', 1),
(17, 7, 'Baby Boy Overall Red', 'OMBOA003', 1190, 20, '456203_OMBOA003 (1).jpg', 'Dangree', 'Dangree', 'Dangree', 'Dangree', 'Dangree', 1),
(18, 7, 'Cotton Bermuda Shorts', 'KSh004', 590, 4, '560634_KSh004 (2).jpg', 'Shorts', 'Shorts', 'Shorts', 'Shorts', 'Shorts', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `addedon` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `password`, `email`, `mobile`, `addedon`) VALUES
(1, 'atif', '0', 'myatifikram@yahoo.com', '231', '2021-07-27 00:00:00'),
(2, 'atif', '11100011', 'myatifikram@gmail.com', '1234340', '2021-07-27 00:00:00'),
(3, 'atif', 'Saher123*', 'myatifikram', '124', '2021-07-27 12:18:39'),
(4, 'Arslan', 'Najm123*', 'atifikram@brandsstudio.pk', '03214275883', '2021-07-27 12:19:35'),
(5, 'Rayyan', 'Saher123*', 'rayyan@yahoo.com', '03496471968', '2021-07-27 12:21:28'),
(6, 'atif', 'Saher123*', 'myatifikram@tahoo.com', '12213', '2021-07-27 12:35:09'),
(7, 'Atif', 'Saher123*', 'myatifikram@rahoo.com', '03214275883', '2021-07-27 02:28:55'),
(8, 'Atif', 'Saher123*', 'atif@yahoo.com', '012132', '2021-07-29 12:25:57'),
(9, 'Atif', 'Saher123*', 'mikram@yahoo.com', '123124', '2021-07-29 03:03:45'),
(10, 'Atif', 'Saher123*', 'mikramsd@yahoo.com', '123124', '2021-07-29 03:04:43'),
(11, 'Saher', '1234', 'saher@yahoo.com', '1234', '2021-07-29 03:06:12');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

DROP TABLE IF EXISTS `wishlist`;
CREATE TABLE IF NOT EXISTS `wishlist` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `added_on` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
