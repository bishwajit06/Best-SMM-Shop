-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 26, 2020 at 09:43 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommercphp`
--

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

CREATE TABLE `brand` (
  `brand_id` int(11) NOT NULL,
  `brand_title` varchar(50) NOT NULL,
  `time` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`brand_id`, `brand_title`, `time`) VALUES
(1, 'VHINNO SAREE', '2019-10-02'),
(2, 'HP', '2019-10-02'),
(3, 'SUMSANG', '2019-10-02'),
(4, 'SONY', '2019-10-02'),
(5, 'EASY', '2019-10-02'),
(6, 'DENIM', '2019-10-02');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(11) NOT NULL,
  `cat_title` varchar(50) NOT NULL,
  `time` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`, `time`) VALUES
(1, 'Electronics', '2019-10-02'),
(2, 'Ladies Wears', '2019-10-02'),
(3, 'Mens Wear', '2019-10-02'),
(4, 'Kids Wear', '2019-10-02'),
(5, 'Furnitures', '2019-10-02');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_cat` int(11) NOT NULL,
  `product_brand` int(100) NOT NULL,
  `product_title` varchar(255) DEFAULT NULL,
  `product_desc` text NOT NULL,
  `product_price` int(100) NOT NULL,
  `product_image` text NOT NULL,
  `product_keyword` text NOT NULL,
  `time` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_cat`, `product_brand`, `product_title`, `product_desc`, `product_price`, `product_image`, `product_keyword`, `time`) VALUES
(1, 2, 1, 'Jamdani Saree Gray', 'Some quick example text to build on Lorem Ipsum', 5000, '92.jpg', 'saree', '2019-10-03'),
(2, 2, 1, 'Silk Saree Red', 'Some quick example text to build on Lorem Ipsum3', 700, '91.jpg', '', '2019-10-03'),
(3, 2, 1, 'Jamdani Saree BLUE', 'Some quick example text to build on Lorem Ipsum4', 1000, '8.jpg', '', '2019-10-03'),
(4, 2, 1, 'Suti Jamdani Saree', 'Some quick example text to build on Lorem Ipsum5', 900, '9.jpg', '', '2019-10-03'),
(5, 2, 1, 'Jamdani Saree Light', 'Some quick example text to build on Lorem Ipsum7', 200, '1570100919-94.JPG', '', '0000-00-00'),
(6, 2, 1, 'RED saree Jamdani', 'Lorem ispum here is describtion', 600, '1570101260-93.JPG', '', '0000-00-00'),
(7, 3, 5, 'T-Shirt White', 'à¦†à¦ªà¦¨à¦¾à¦° à¦ªà§à¦°à¦¿à§Ÿ à¦®à¦¾à¦¨à§à¦·à¦Ÿà¦¿à¦° à¦œà¦¨à§à¦¯ à¦¹à¦¤à§‡ à¦ªà¦¾à¦°à§‡ à¦à¦•à', 200, '1570105860-1 (1).jpg', '', '0000-00-00'),
(8, 3, 5, 'T-Shirt Yellow', 'à¦†à¦ªà¦¨à¦¾à¦° à¦ªà§à¦°à¦¿à§Ÿ à¦®à¦¾à¦¨à§à¦·à¦Ÿà¦¿à¦° à¦œà¦¨à§à¦¯ à¦¹à¦¤à§‡ à¦ªà¦¾à¦°à§‡ à¦à¦•à', 300, '1570105902-1 (2).jpg', '', '0000-00-00'),
(9, 3, 5, 'Navy Blue Cotton Short', 'Fabrics : 60% Cotton + 40% Silk Fabrics : 60% ', 300, '1570105932-1 (3).jpg', '', '0000-00-00'),
(10, 1, 3, 'Mobile', 'Lorem Ipsum has been the industry\'s standard', 6000, '1570125846-mobile4.jpg', 'mobile', '2019-10-04'),
(11, 1, 4, 'Monitor Sony 304D', 'Lorem Ipsum has been the industry\'s standard', 40000, '1570126910-LEDTV2.jpg', '', '0000-00-00'),
(12, 1, 2, 'Laptop Lenovo 304D', 'Lorem Ipsum has been the industry\'s standard', 200, '1570127076-Laptop3.jpg', '', '0000-00-00'),
(13, 1, 2, 'Laptop', 'Lorem Ipsum has been the industrys standard', 100, '1570127906-Laptop2.jpg', '', '0000-00-00'),
(14, 1, 2, 'Laptop HP', 'Lorem Ipsum has been the industrys standard', 150, '1570127935-Laptop1.jpg', '', '0000-00-00'),
(15, 1, 4, 'TV', 'Lorem Ipsum has been the industrys standard', 300, '1570128004-LEDTV3.jpg', '', '0000-00-00'),
(16, 1, 3, 'Sumsung Phone', 'Lorem Ipsum has been the industrys standard', 6500, '1570128120-mobile5.jpg', '', '0000-00-00'),
(17, 1, 3, 'Mobile THN', 'Lorem Ipsum has been the industrys standard', 300, '1570128322-mobile3.jpg', '', '0000-00-00'),
(18, 1, 4, 'Mobile Sony 30TH', 'Lorem Ipsum has been the industrys standard', 5000, '1570128376-mobile2.jpg', '', '0000-00-00'),
(19, 1, 4, 'MONITOR LED', 'Lorem Ipsum has been the industrys standard', 5000, '1570208550-LEDTV1.jpg', '', '0000-00-00'),
(20, 1, 3, 'Mobile Sumsung 3652J', 'Lorem Ipsum has been the industrys standard', 10000, '1570208659-mobile1.jpg', '', '0000-00-00'),
(21, 1, 4, 'Sony Mobile 23KH', 'Lorem Ipsum has been the industrys standard', 7000, '1570208766-mobile6.jpg', '', '0000-00-00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brand`
--
ALTER TABLE `brand`
  MODIFY `brand_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
