-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 23 سبتمبر 2024 الساعة 22:44
-- إصدار الخادم: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce`
--

-- --------------------------------------------------------

--
-- بنية الجدول `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL,
  `cart_userid` int(11) NOT NULL,
  `cart_itemid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- إرجاع أو استيراد بيانات الجدول `cart`
--

INSERT INTO `cart` (`cart_id`, `cart_userid`, `cart_itemid`) VALUES
(151, 6, 2),
(152, 6, 2),
(153, 6, 2),
(154, 6, 2),
(155, 6, 2),
(156, 6, 2),
(157, 6, 2),
(158, 6, 2),
(159, 6, 2),
(160, 6, 2),
(161, 6, 2),
(162, 6, 2),
(163, 6, 2),
(164, 6, 2),
(165, 6, 2),
(166, 6, 2),
(167, 6, 2),
(168, 6, 1),
(169, 6, 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `cartview`
-- (See below for the actual view)
--
CREATE TABLE `cartview` (
`totalPrice` double
,`quantity` bigint(21)
,`item_id` int(11)
,`item_name` varchar(100)
,`item_name_ar` varchar(100)
,`item_desc` varchar(255)
,`item_desc_ar` varchar(255)
,`item_image` varchar(255)
,`item_count` int(11)
,`item_active` tinyint(4)
,`item_price` float
,`item_discount` int(11)
,`item_date` timestamp
,`item_cat` int(11)
,`cart_id` int(11)
,`cart_userid` int(11)
,`cart_itemid` int(11)
);

-- --------------------------------------------------------

--
-- بنية الجدول `categories`
--

CREATE TABLE `categories` (
  `categorie_id` int(11) NOT NULL,
  `categorie_name` varchar(100) NOT NULL,
  `categorie_name_ar` varchar(100) NOT NULL,
  `categorie_image` varchar(255) NOT NULL,
  `categorie_datetime` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- إرجاع أو استيراد بيانات الجدول `categories`
--

INSERT INTO `categories` (`categorie_id`, `categorie_name`, `categorie_name_ar`, `categorie_image`, `categorie_datetime`) VALUES
(1, 'camera', 'كاميرا', 'camera.svg', '2024-08-09 18:47:23'),
(2, 'mobile', 'موبايل', 'mobile.svg', '2024-08-09 19:02:31'),
(3, 'shoes', ' أحذية', 'shoes.svg', '2024-08-09 19:02:31'),
(4, 'dress', 'فستان', 'dress.svg', '2024-08-11 13:44:53'),
(5, 'camputers', 'حواسيب', 'computer.svg', '2024-08-11 13:46:03'),
(6, 'laptop', 'لابتوب', 'laptop.svg', '2024-08-22 12:01:10');

-- --------------------------------------------------------

--
-- بنية الجدول `favorites`
--

CREATE TABLE `favorites` (
  `favorite_id` int(11) NOT NULL,
  `favorite_userid` int(11) NOT NULL,
  `favorite_itemid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- بنية الجدول `items`
--

CREATE TABLE `items` (
  `item_id` int(11) NOT NULL,
  `item_name` varchar(100) NOT NULL,
  `item_name_ar` varchar(100) NOT NULL,
  `item_desc` varchar(255) NOT NULL,
  `item_desc_ar` varchar(255) NOT NULL,
  `item_image` varchar(255) NOT NULL,
  `item_count` int(11) NOT NULL,
  `item_active` tinyint(4) NOT NULL DEFAULT 1,
  `item_price` float NOT NULL,
  `item_discount` int(11) NOT NULL,
  `item_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `item_cat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- إرجاع أو استيراد بيانات الجدول `items`
--

INSERT INTO `items` (`item_id`, `item_name`, `item_name_ar`, `item_desc`, `item_desc_ar`, `item_image`, `item_count`, `item_active`, `item_price`, `item_discount`, `item_date`, `item_cat`) VALUES
(1, 'lenovo 15', 'لينوفو 15', 'Stylish slim laptop Core 2.80 GHz processor and 16 RAM', 'لابتوب انيق رفيع معالج Core 2.80 GHz  وذاكرة 16 رام', 'lenovo15.jpg', 12, 1, 200, 10, '2024-08-24 10:55:50', 6),
(2, 'Canon EOS R50', 'كانون canon Eos', 'Combining a lightweight, compact body with a large 24.2MP APS-C sensor, the mirrorless Canon EOS R50 lets you elevate all your content and generate tons of likes. The Canon EOS R50 is the', 'تتيح لك كاميرا EOS R50 غير المزودة بمرآة من Canon ، التي تجمع بين هيكل خفيف الوزن وصغير الحجم ومستشعر APS-C كبير بدقة 24.2 ميجابكسل ، رفع مستوى كل المحتوى الخاص بك وإنشاء الكثير من الإعجابات. كاميرا EOS R50 من Canon ', 'canonEosR50.jpg', 80, 1, 800, 5, '2024-08-24 11:16:16', 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `itemsview`
-- (See below for the actual view)
--
CREATE TABLE `itemsview` (
`item_id` int(11)
,`item_name` varchar(100)
,`item_name_ar` varchar(100)
,`item_desc` varchar(255)
,`item_desc_ar` varchar(255)
,`item_image` varchar(255)
,`item_count` int(11)
,`item_active` tinyint(4)
,`item_price` float
,`item_discount` int(11)
,`item_date` timestamp
,`item_cat` int(11)
,`categorie_id` int(11)
,`categorie_name` varchar(100)
,`categorie_name_ar` varchar(100)
,`categorie_image` varchar(255)
,`categorie_datetime` timestamp
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `myfavorites`
-- (See below for the actual view)
--
CREATE TABLE `myfavorites` (
`item_id` int(11)
,`item_name` varchar(100)
,`item_name_ar` varchar(100)
,`item_desc` varchar(255)
,`item_desc_ar` varchar(255)
,`item_image` varchar(255)
,`item_count` int(11)
,`item_active` tinyint(4)
,`item_price` float
,`item_discount` int(11)
,`item_date` timestamp
,`item_cat` int(11)
,`favorite_id` int(11)
,`favorite_userid` int(11)
,`favorite_itemid` int(11)
,`user_id` int(11)
);

-- --------------------------------------------------------

--
-- بنية الجدول `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `user_phone` varchar(100) NOT NULL,
  `user_verfiycode` int(11) NOT NULL,
  `user_approve` tinyint(4) NOT NULL DEFAULT 0,
  `user_create` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- إرجاع أو استيراد بيانات الجدول `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `user_password`, `user_email`, `user_phone`, `user_verfiycode`, `user_approve`, `user_create`) VALUES
(1, 'hamz', 'b6737fc7368bbc970124bb2cd5c8dfc75b283432', 'arif@gmail.com', '1sss', 69686, 1, '2024-08-03 11:54:43'),
(2, 'mohamed', '4ed1b05bc3b383491835704aa372d5a1793fc193', 'mo@gmail.com', 'mmmm', 91280, 1, '2024-08-03 12:16:22'),
(3, 'hamza', '8cb2237d0679ca88db6464eac60da96345513964', 'bou.qahtan@gmail.cj', '83987183783', 35346, 1, '2024-08-06 14:24:13'),
(4, 'kddiidi', 'a579173f809c93cfb383cd3e78bf874e4c9faee5', 'bou.qahtan@gmail.com', '83454398374', 72872, 1, '2024-08-06 14:27:04'),
(5, 'ddfhkkd', '35b7c7b7a2f0f05cc94b4f76deb5b88ae2e403e4', 'hamza@gmail.com', '776385735', 38816, 0, '2024-08-06 14:31:02'),
(6, 'dkfjshs', '8cb2237d0679ca88db6464eac60da96345513964', 'hamza1@gmail.com', '77777777777', 45126, 1, '2024-09-12 12:20:15');

-- --------------------------------------------------------

--
-- Structure for view `cartview`
--
DROP TABLE IF EXISTS `cartview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `cartview`  AS SELECT sum(`items`.`item_price`) AS `totalPrice`, count(`cart`.`cart_id`) AS `quantity`, `items`.`item_id` AS `item_id`, `items`.`item_name` AS `item_name`, `items`.`item_name_ar` AS `item_name_ar`, `items`.`item_desc` AS `item_desc`, `items`.`item_desc_ar` AS `item_desc_ar`, `items`.`item_image` AS `item_image`, `items`.`item_count` AS `item_count`, `items`.`item_active` AS `item_active`, `items`.`item_price` AS `item_price`, `items`.`item_discount` AS `item_discount`, `items`.`item_date` AS `item_date`, `items`.`item_cat` AS `item_cat`, `cart`.`cart_id` AS `cart_id`, `cart`.`cart_userid` AS `cart_userid`, `cart`.`cart_itemid` AS `cart_itemid` FROM (`cart` join `items` on(`items`.`item_id` = `cart`.`cart_itemid`)) GROUP BY `cart`.`cart_itemid`, `cart`.`cart_userid` ;

-- --------------------------------------------------------

--
-- Structure for view `itemsview`
--
DROP TABLE IF EXISTS `itemsview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `itemsview`  AS SELECT `items`.`item_id` AS `item_id`, `items`.`item_name` AS `item_name`, `items`.`item_name_ar` AS `item_name_ar`, `items`.`item_desc` AS `item_desc`, `items`.`item_desc_ar` AS `item_desc_ar`, `items`.`item_image` AS `item_image`, `items`.`item_count` AS `item_count`, `items`.`item_active` AS `item_active`, `items`.`item_price` AS `item_price`, `items`.`item_discount` AS `item_discount`, `items`.`item_date` AS `item_date`, `items`.`item_cat` AS `item_cat`, `categories`.`categorie_id` AS `categorie_id`, `categories`.`categorie_name` AS `categorie_name`, `categories`.`categorie_name_ar` AS `categorie_name_ar`, `categories`.`categorie_image` AS `categorie_image`, `categories`.`categorie_datetime` AS `categorie_datetime` FROM (`items` join `categories` on(`categories`.`categorie_id` = `items`.`item_cat`)) ;

-- --------------------------------------------------------

--
-- Structure for view `myfavorites`
--
DROP TABLE IF EXISTS `myfavorites`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `myfavorites`  AS SELECT `items`.`item_id` AS `item_id`, `items`.`item_name` AS `item_name`, `items`.`item_name_ar` AS `item_name_ar`, `items`.`item_desc` AS `item_desc`, `items`.`item_desc_ar` AS `item_desc_ar`, `items`.`item_image` AS `item_image`, `items`.`item_count` AS `item_count`, `items`.`item_active` AS `item_active`, `items`.`item_price` AS `item_price`, `items`.`item_discount` AS `item_discount`, `items`.`item_date` AS `item_date`, `items`.`item_cat` AS `item_cat`, `favorites`.`favorite_id` AS `favorite_id`, `favorites`.`favorite_userid` AS `favorite_userid`, `favorites`.`favorite_itemid` AS `favorite_itemid`, `users`.`user_id` AS `user_id` FROM ((`favorites` join `items` on(`items`.`item_id` = `favorites`.`favorite_itemid`)) join `users` on(`users`.`user_id` = `favorites`.`favorite_userid`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `cart_itemid` (`cart_itemid`),
  ADD KEY `cart_userid` (`cart_userid`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`categorie_id`);

--
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`favorite_userid`,`favorite_itemid`),
  ADD UNIQUE KEY `favorite_id` (`favorite_id`) USING BTREE,
  ADD KEY `favorite_itemid` (`favorite_itemid`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `item_cat` (`item_cat`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=198;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `categorie_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `favorites`
--
ALTER TABLE `favorites`
  MODIFY `favorite_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=132;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- قيود الجداول المُلقاة.
--

--
-- قيود الجداول `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`cart_itemid`) REFERENCES `items` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`cart_userid`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- قيود الجداول `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `favorites_ibfk_1` FOREIGN KEY (`favorite_itemid`) REFERENCES `items` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `favorites_ibfk_2` FOREIGN KEY (`favorite_userid`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- قيود الجداول `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_ibfk_1` FOREIGN KEY (`item_cat`) REFERENCES `categories` (`categorie_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
