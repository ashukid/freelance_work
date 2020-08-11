-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 22, 2020 at 06:41 PM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `z_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `email`, `password`, `is_active`) VALUES
(1, 'Keshweenpal Singh', 'keshweenkesh97@yahoo.com', '$2y$10$PrTsL47XHy5jgLxDp4JgT.l4wRxHcErV.a8KhuPa4GMS/GKHrx4X6', '0'),
(2, 'jessharry', 'jessharry29@gmail.com', '$2y$10$mkFRF1M7D/sE/mMjEHzs7eh1bH.BzVpJijMbyBw0SHt3dPtKOTvG.', '0');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `brand_id` int(100) NOT NULL,
  `brand_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_title`) VALUES
(2, 'Samsung'),
(3, 'Apple'),
(6, 'Oppo'),
(7, 'Xiaomi'),
(8, 'Huawei');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(10) NOT NULL,
  `p_id` int(10) NOT NULL,
  `ip_add` varchar(250) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `qty` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `p_id`, `ip_add`, `user_id`, `qty`) VALUES
(47, 47, '::1', 2, 1),
(48, 46, '::1', 3, 1),
(56, 41, '127.0.0.1', -1, 1),
(57, 46, '::1', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(100) NOT NULL,
  `cat_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`) VALUES
(12, 'Mobiles'),
(13, 'Tablets');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `trx_id` varchar(255) NOT NULL,
  `p_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(100) NOT NULL,
  `product_cat` int(11) NOT NULL,
  `product_brand` int(100) NOT NULL,
  `product_title` varchar(255) NOT NULL,
  `product_price` int(100) NOT NULL,
  `product_qty` int(11) NOT NULL,
  `product_desc` text NOT NULL,
  `product_image` text NOT NULL,
  `product_keywords` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_cat`, `product_brand`, `product_title`, `product_price`, `product_qty`, `product_desc`, `product_image`, `product_keywords`) VALUES
(41, 12, 3, 'Iphone 11 Pro Max 64GB Space Grey', 5500, 2400, 'OS: iOS 13, upgradable to iOS 13.1.2', '1574891875_64 grey.jpg', 'apple, iphone, iphone 11 pro max space grey, 11 pro max, grey, space grey'),
(46, 12, 3, 'Iphone 11 Pro Max 256 GB Space Grey', 6000, 2500, 'OS: iOS 13, upgradable to iOS 13.1.2', '1576686573_256 grey.jpg', 'apple, iphone, 11 pro max, space grey, iphone 11, pro max'),
(47, 12, 3, 'Iphone 11 Pro Max 64 GB Midnight Green', 5500, 2400, 'OS: iOS 13, upgradable to iOS 13.1.2 ', '1576686899_midnight green.jpg', 'apple, iphone, 11 pro max, midnight green, iphone 11, pro max, green'),
(48, 12, 3, 'Iphone 11 Pro Max 256 GB Green', 6600, 2400, 'OS: iOS 13, upgradable to iOS 13.1.2', '1576686976_midnight green.jpg', 'apple, iphone, 11 pro max, midnight green, iphone 11, pro max, green, 256gb, 256Gb'),
(49, 12, 3, 'Iphone 11 64 GB Black', 3400, 2400, 'OS: iOS 13, upgradable to iOS 13.1.2', '1576687452_iphone11-black.png', 'apple, iphone, iphone 11 black , 64gb iphone 11 black'),
(50, 12, 3, 'Iphone 11 256 GB Black', 4100, 2400, 'OS: iOS 13, upgradable to iOS 13.1.2 ', '1576687496_iphone11-black.png', 'apple, iphone, iphone 11 black , 256gb iphone 11 black, 256gb'),
(51, 12, 3, 'Iphone 11 64 GB Green', 3400, 2400, 'OS: iOS 13, upgradable to iOS 13.1.2', '1576687607_iphone11-green.jpg', 'apple, iphone, iphone 11 green , 64gb iphone 11 green, 64gb'),
(53, 12, 3, 'Iphone 11 256 GB Purple', 4100, 2500, 'OS: iOS 13, upgradable to iOS 13.1.2 ', '1576688011_iphone11-purple.png', 'apple, iphone, iphone 11 purple , 256gb iphone 11 purple, 256gb'),
(54, 12, 3, 'Iphone 11 64 GB Purple', 3400, 2400, 'OS: iOS 13, upgradable to iOS 13.1.2', '1576688048_iphone11-purple.png', 'apple, iphone, iphone 11 purple , 64gb iphone 11 purple, 64gb'),
(55, 12, 3, 'Iphone 11 256 GB Green', 4100, 2500, 'OS: iOS 13, upgradable to iOS 13.1.2', '1576688161_iphone11-green.jpg', 'apple, iphone, iphone 11 green , 256gb iphone 11 green, 256gb'),
(56, 12, 3, 'Iphone 11 256 GB White', 4100, 2500, 'OS: iOS 13, upgradable to iOS 13.1.2 ', '1576688349_iphone11-white.jpg', 'apple, iphone, iphone 11 white , 256gb iphone 11 white, 256gb'),
(57, 12, 3, 'Iphone 11 64 GB White', 3400, 2400, 'OS: iOS 13, upgradable to iOS 13.1.2 ', '1576688431_iphone11-white.jpg', 'apple, iphone, iphone 11 white , 64gb iphone 11 white, 64gb'),
(58, 12, 3, 'iPhone XS Max 64 GB Gold', 4300, 2400, 'Powered by a Apple A12. 12MP rear camera .', '1576688890_xs max gold.jpg', 'apple, iphone, iphone xs max 64gb, xs max gold, 64gb,xs max , gold'),
(59, 12, 3, 'iPhone XS Max 256GB Gold', 5000, 2500, 'Powered by a Apple A12. 12MP rear camera ', '1576688939_xs max gold.jpg', 'apple, iphone, iphone xs max 256gb, xs max gold, 256gb,xs max , gold'),
(60, 12, 3, 'iPhone XS Max 256GB Black', 5000, 2500, 'Powered by a Apple A12. 12MP rear camera', '1576689054_xs max black.jpg', 'apple, iphone, iphone xs max 256gb, xs max black, 256gb,xs max , black'),
(63, 12, 3, 'iPhone XS Max 64GB Black', 4300, 2500, 'Powered by a Apple A12. 12MP rear camera', '1576689127_xs max black.jpg', 'apple, iphone, iphone xs max 64gb, xs max black, 64gb,xs max , black'),
(66, 12, 2, 'Samsung Galaxy A80 - Angel Gold', 2500, 2400, '8GB RAM and 128GB of storage.Snapdragon 730 chipsety', '1576690640_samsung a80 gold.jpg', 'samsung, android, samsung a80, a80, A80, angel gold, gold'),
(68, 12, 2, 'Samsung Galaxy A80 - White', 2500, 2400, '8GB RAM and 128GB of storage.Snapdragon 730 chipset', '1576690858_a80 white.jpg', 'samsung, android, samsung a80, a80, A80, ghost white, white'),
(69, 12, 2, 'Samsung Galaxy A80 - Black', 2500, 2400, '8GB RAM and 128GB of storage.Snapdragon 730 chipsety', '1576690951_a89 black.jpg', 'samsung, android, samsung a80, a80, A80, phantom black, black'),
(73, 12, 2, 'Samsung Galaxy S10 - Royal Gold', 2500, 2400, '6.10-inch touchscreen display.', '1576692036_s10 royal gold.jpg', 'samsung, android, samsung s10, s10, S10, royal gold, gold'),
(74, 12, 2, 'Samsung Galaxy S10 - Silver', 2500, 2400, '6.10-inch touchscreen display.', '1576692069_s10 - crown silver.jpg', 'samsung, android, samsung s10, s10, S10, crown silver, silver'),
(75, 12, 2, 'Samsung Galaxy S10 - Black', 2500, 2400, 'Powered by 1.9GHz octa-C processor.8GB RAM.', '1576692230_s10 black.jpg', 'samsung, android, samsung s10, s10, S10, majestic black, black'),
(76, 12, 2, 'Samsung Galaxy Note 10- Aura Glow', 3700, 2400, 'Powered by a Exynos 9825.6.8-inch touchscreen', '1576696082_Samsung_note_10 aura glow.jpg', 'samsung, android, samsung note 10, note 10, Note 10, aura glow, white'),
(77, 12, 2, 'Samsung Galaxy Note 10- Aura Red', 3700, 2400, 'Powered by a Exynos 9825.6.8-inch touchscreen', '1576696166_galaxy_note_10_aura_red_2.jpg', 'samsung, android, samsung note 10, note 10, Note 10, aura red, red'),
(78, 12, 2, 'Samsung Galaxy Note 10- Aura Black', 3700, 2400, 'Powered by a Exynos 9825.6.8-inch touchscreen', '1576696293_samsung_galaxy_note10_aura_black.png', 'samsung, android, samsung note 10, note 10, Note 10, aura black, black'),
(79, 12, 2, 'Samsung Galaxy Note 10 plus - Aura Blue', 4200, 2400, '2 GB RAM and 256 GB internal storage. ', '1576698143_Samsung_Galaxy_Note10_Plus_Aura_Blue.jpg', 'samsung, android, samsung note 10 plus, note 10 plus, Note 10 plus, aura blue, blue'),
(80, 12, 2, 'Samsung Galaxy Note 10 plus - Aura Glow', 4200, 2400, '2 GB RAM and 256 GB internal storage. ', '1576698276_galaxy-note-10-plus- aura glow.jpg', 'samsung, android, samsung note 10 plus, note 10 plus, Note 10 plus, aura glow, white'),
(81, 12, 2, 'Samsung Galaxy Note 10 plus - Aura Pink', 4200, 2400, '2 GB RAM and 256 GB internal storage. ', '1576698360_note 10plus aura pink.jpg', 'samsung, android, samsung note 10 plus, note 10 plus, Note 10 plus, aura pink, pink'),
(82, 12, 2, 'Samsung Galaxy Fold - Cosmos Black', 8400, 2400, 'Two displays & 4.6-inch display in the center ', '1576698619_galaxy-fold_cosmos_black.jpg', 'samsung, android, samsung fold, galaxy fold, cosmos black. samsung galaxy fold black'),
(83, 12, 2, 'Samsung Galaxy Fold - Martian Green', 8400, 2400, 'Two displays & 4.6-inch display in the center ', '1576698757_samsung fold martian green.jpg', 'samsung, android, samsung fold, galaxy fold, martian green. samsung galaxy fold green, green'),
(84, 12, 6, 'Oppo A5 - Mirror Blue', 700, 2400, '6.20-inch touchscreen display.', '1576868313_a5 blue.jpg', 'oppo, oppo a5, a5, cheap, cheapest, blue, pink, mirror blue'),
(85, 12, 6, 'Oppo A5 - Mirror Pink', 700, 2400, '6.20-inch touchscreen display', '1576868453_a5 pink.jpg', 'oppo, oppo a5, a5, cheap, cheapest, pink, mirror pink, oppo a5 pink'),
(86, 12, 6, 'Oppo F11 - Fluorite Purple', 780, 2400, 'Powered by Octa core (2.1 GHz, Quad core, Cortex A73 + 2 GHz, Quad core, Cortex A53) processor.', '1576868744_oppo f11 purple.jpg', 'oppo, oppo f11, f11, cheap, cheapest, purple, fluorite purple, oppo f11 purple'),
(87, 12, 6, 'Oppo F11 - Marble Green', 780, 2400, 'Powered by Octa core processor.', '1576868804_oppo-f11 green.jpg', 'oppo, oppo f11, f11, cheap, cheapest, green, marble green, oppo f11 green'),
(88, 12, 6, 'Oppo Reno 2F - Sky White', 1365, 2400, '6.53-inch touchscreen display.', '1576869499_oppo reno 2f white.jpg', 'oppo, oppo reno, reno 2f, oppo reno 2f, sky white, white, oppo reno 2f white'),
(89, 12, 6, 'Oppo Reno 2F -Lake Green', 1365, 2400, '6.53-inch touchscreen display.', '1576869587_oppo reno 2f green.jpg', 'oppo, oppo reno, reno 2f, oppo reno 2f, lake green, green, oppo reno 2f green'),
(90, 12, 6, 'Oppo K1 - Blue', 772, 2400, '6.41-inch AMOLED display.Have fingerprint sensor.', '1576870089_Oppo_K1_blue.jpg', 'oppo, oppo k1, k1, oppo k1 blue, k1 blue'),
(91, 12, 6, 'Oppo K1 - Red', 772, 2400, '6.41-inch AMOLED display produces punchy and vivid colours', '1576870147_OppoK1 red.png', 'oppo, oppo k1, k1, oppo k1 red, k1 red'),
(92, 12, 7, 'Xiaomi Redmi Note 8 -  Cosmic Purple', 900, 2400, '6.3 Inch 4G LTE Smartphone Snapdragon  \r\n', '1578313907_redmi note 8 purple.jpg', 'xiaomi, redmi, note 8, redmi note 8, xiaomi redmi note 8, cosmic purple, purple, redmi note 8 purple'),
(93, 12, 7, 'Xiaomi Redmi Note 8 - Nepture Blue', 900, 2400, '6.3 Inch 4G LTE Smartphone Snapdragon  \r\n', '1578314048_redmi note 8 blue.jpg', 'xiaomi, redmi, note 8, redmi note 8, xiaomi redmi note 8, nepture blue, blue , redmi note 8 blue'),
(94, 12, 7, 'Xiaomi Redmi Note 8 - Moonlight White', 900, 2400, '6.3 Inch 4G Smartphone Snapdragon 665 ', '1578314185_Moonlight White redmi note 8.jpg', 'xiaomi, redmi, note 8, redmi note 8, xiaomi redmi note 8, Moonlight White, white , redmi note 8 white'),
(95, 12, 7, 'Xiaomi Mi 9 Pro - Dream Pearl White', 2300, 2400, '6.39 OLED panel with 1080 x 2340 pixels (FHD+) resolution', '1578314797_Xiaomi-Mi-9-Pro-white.jpg', 'xiaomi, mi 9 pro, xiaomi mi 9 pro, white, mi 9 pro white, dream white'),
(96, 12, 7, 'Xiaomi Mi 9 Pro - Titanium Black', 2300, 2400, '6.39 OLED panel with 1080 x 2340 pixels (FHD+) resolution', '1578314943_Xiaomi-Mi-9-Pro-black.jpg', 'xiaomi, mi 9 pro, xiaomi mi 9 pro, black, mi 9 pro black, Titanium Black'),
(97, 12, 7, 'Xiaomi Redmi K20 Pro - Carbon black', 1499, 2400, 'Powered by a Qualcomm SDM855 Snapdragon 855', '1578326617_redmi k20 pro black.jpg', 'xiaomi, Xiaomi Redmi K20 Pro, redmi k20 pro, k2 pro, redmi k20, black, redmi k20 pro black'),
(98, 12, 7, 'Xiaomi Redmi K20 Pro - Red', 1499, 2400, 'Powered by a Qualcomm SDM855 Snapdragon 855', '1578326747_redmi k20 red.jpg', 'xiaomi, Xiaomi Redmi K20 Pro, redmi k20 pro, k2 pro, redmi k20, red, redmi k20 pro red, Flame red'),
(101, 12, 7, 'Mi 9 Lite - Black', 1100, 2400, '48MP AI triple camera; 32MP AI selï¬e camera', '1578335897_mi 9 lite black.jpg', 'xiaomi, Mi 9 Lite black, xiaomi Mi 9 Lite black, black'),
(102, 12, 7, 'Mi 9 Lite - Blue', 1100, 2400, '48MP AI triple camera; 32MP AI selï¬e camera', '1578336101_Xiaomi-Mi-9-Lite-blue.jpg', 'xiaomi, Mi 9 Lite blue, xiaomi Mi 9 Lite blue, blue'),
(103, 12, 7, 'Mi 9 Lite - White', 1100, 2400, '48MP AI triple camera; 32MP AI selï¬e camera', '1578336210_mi 9 lite white.jpeg', 'xiaomi, Mi 9 Lite white, xiaomi Mi 9 Lite white, white'),
(104, 12, 7, 'Xiaomi Black Shark 2 Pro ', 2200, 2400, 'Powered by a Qualcomm Snapdragon 855+ ', '1578336602_black shark 2 pro.jpg', 'xiaomi, Black Shark 2, Black Shark 2 pro , xiaomi Black Shark 2'),
(105, 12, 8, 'Huawei P30 Pro - Pearl White', 2500, 2400, 'Have Kirin 980 processor', '1578574185_huawei-p30-pro white.jpg', 'huawei, huawei p30, p30, huawei p30 pro, p30 pro, white, pearl white, p30 white'),
(106, 12, 8, 'Huawei P30 Pro - Amber Sunrise', 2500, 2400, 'Have flagship Kirin 980 processor', '1578574285_huawei-p30-pro orange.jpg', 'huawei, huawei p30, p30, huawei p30 pro, p30 pro, orange, Amber Sunrise, p30 orange'),
(107, 12, 8, 'Huawei P30 Pro -Breathing Crystal', 2500, 2400, 'Have Kirin 980 processor, IP68 water and dust resistance', '1578574369_huawei-p30-pro blue.jpg', 'huawei, huawei p30, p30, huawei p30 pro, p30 pro, blue, Breathing Crystal, p30 blue'),
(108, 12, 8, 'Huawei Nova 5 Pro - Black', 1400, 2400, '6.39-inch smartphone.Quad-camera setup', '1578574749_huawei-nova-5-pro blck.jpg', 'huawei, huawei nova 5 pro black, nova 5 pro black, nova 5 pro, nova 5'),
(109, 12, 8, 'Huawei Nova 5 Pro - Green', 1400, 2400, '6.39-inch smartphone. Quad-camera setup', '1578574960_huawei-nova-5-pro green.jpg', 'huawei, huawei nova 5 pro, huawei nova 5 pro green, nova 5 pro green, nova 5 pro, nova 5'),
(110, 12, 8, 'Huawei Nova 5 Pro - Purple', 1400, 2400, '6.39-inch smartphone. Quad-camera setup', '1578575103_Huawei_Nova_5 purple.jpg', 'huawei, huawei nova 5 pro, huawei nova 5 pro purple, nova 5 pro purple, nova 5 pro, nova 5'),
(111, 12, 8, 'Huawei Y9 Prime -  Midnight Black', 800, 2400, 'Powered by an octa-core HiSilicon Kirin 710 ', '1578576627_huawei y9 prime black.jpg', 'huawei, huawei Y9 prime, huawei Y9 prime black, Y9 prime midnight black, y9 prime black'),
(112, 12, 8, 'Huawei Y9 Prime -  Sapphire Blue', 800, 2400, 'Powered by an octa-core HiSilicon Kirin 710', '1578576768_y9 prime blue.png', 'huawei, huawei Y9 prime, huawei Y9 Sapphire Blue, Y9 prime blue, y9 prime blue'),
(113, 12, 8, 'Huawei Y9 Prime -  Emerald Green', 800, 2400, 'Powered by an octa-core HiSilicon Kirin 710', '1578576863_y9 prime green.png', 'huawei, huawei Y9 prime, huawei Y9 prime Emerald Green, Y9 prime green, y9 prime Emerald Green'),
(114, 12, 8, 'Huawei Nova 4 - Aurora Blue', 1380, 2400, 'Powered by a Hisilicon Kirin 970. 128GB ROM', '1578578862_nova-4-crush-blue.jpg', 'huawei, Huawei Nova 4, Huawei Nova 4 blue, nova 4 blue, nova 4 aurora blue'),
(115, 12, 8, 'Huawei Nova 4 - Aurora Red', 1380, 2400, 'Powered by a Hisilicon Kirin 970. 128GB ROM', '1578578922_nova-4-crush-red.jpg', 'huawei, Huawei Nova 4, Huawei Nova 4 Red, nova 4 Red, nova 4 aurora Red'),
(116, 12, 8, 'Huawei Nova 4 - Aurora White', 1380, 2400, 'Powered by a Hisilicon Kirin 970. 128GB ROM', '1578579108_nova-4-crush-white.jpg', 'huawei, Huawei Nova 4, Huawei Nova 4 White, nova 4 White, nova 4 aurora White'),
(117, 12, 8, 'Huawei Mate 20 - Midnight Blue', 1600, 2400, 'Powered by a HiSilicon Kirin 980', '1578582019_mate 20 blue.jpg', 'huawei, Huawei Mate 20, Huawei Mate 20 Midnight Blue, mate 20 , mate 20 blue, mate 20 midnight blue'),
(118, 12, 8, 'Huawei Mate 20 - Twilight', 1600, 2400, 'Powered by a HiSilicon Kirin 980 ', '1578582119_Huawei-Mate-20-Twilight.png', 'huawei, Huawei Mate 20, Huawei Mate 20 Twilight, mate 20 , mate 20 blue, mate 20 Twilight'),
(119, 12, 8, 'Huawei Mate 20 - Black', 1600, 2400, 'Powered by a HiSilicon Kirin 980 ', '1578582690_mate 20 black.jpg', 'huawei, Huawei Mate 20, Huawei Mate 20 black, mate 20 , mate 20 black, mate 20 black'),
(120, 13, 3, 'iPad Mini 64GB - Rose Gold', 700, 2400, 'OS: iOS 12.1.3 CPU: Hexa-core ', '1578734665_ipad mini rose gold.jpg', 'apple, tab, tablet, ipad mini, ipad mini 2019, rose gold, ipad mini rose gold'),
(121, 13, 3, 'iPad Air 64GB - Silver', 1300, 2400, 'Large 10.5 inch Retina display. MY Edition', '1578735437_ipad air silver.jpg', 'apple, tab, ipad, ipad air, ipad air 2019, silver, ipad air silver'),
(122, 13, 3, 'iPad Air 64GB - Space Gray', 1300, 2400, 'Large 10.5 inch Retina display. MY Edition', '1578735757_ipad-air-space-gray.jpg', 'apple, tab, ipad, ipad air, ipad air 2019, Space Gray, ipad air Space Gray'),
(123, 13, 3, 'iPad Air 2 64GB - Space Gray', 2000, 2400, 'Large 10.5 inch Retina display. MY Edition', '1578736424_ipad air 2 space gray.jpg', 'apple, tab, ipad, ipad air 2, ipad air 2 2019, Space Gray, ipad air Space Gray'),
(124, 13, 3, 'iPad Air 2 64GB - Gold', 2000, 2400, 'PowerVR GPU has 8 cores.', '1578736586_ipad air 2 gold.jpg', 'apple, tab, ipad, ipad air 2, ipad air 2 2019, gold, ipad air gold'),
(125, 13, 3, 'iPad Air 2 64GB - Silver', 2000, 2400, 'PowerVR GPU has 8 cores.Uses fingerprint Touch ID sensor', '1578736609_ipad air 2 silver.jpg', 'apple, tab, ipad, ipad air 2, ipad air 2 2019, silver, ipad air silver'),
(126, 13, 3, 'iPad Mini 4 64GB - Space Gray', 1600, 2400, '7.9 LCD display, Apple A8 chipset, 5124 mAh battery', '1578741306_ipad mini 4 space grey.jpg', 'apple, tab, ipad, ipad mini 4, ipad min 4 2019, ipad mini 4 Space Gray, Space Gray'),
(127, 13, 3, 'iPad Mini 4 64GB - Silver', 1600, 2400, '7.9 LCD display, Apple A8 chipset. 2 GB RAM', '1578741379_ipad_mini_4-silver.jpg', 'apple, tab, ipad, ipad mini 4, ipad mini 4 2019, ipad mini 4 Silver, Silver'),
(128, 13, 3, 'iPad Mini 4 64GB - Gold', 1600, 2400, '7.9 LCD display, Apple A8 chipset. 2 GB RAM', '1578741439_ipad_mini_4-Gold.jpg', 'apple, tab, ipad, ipad mini 4, ipad mini 4 2019, ipad mini 4 Gold , Gold'),
(129, 13, 2, 'Samsung Galaxy Tab A 10.1 - Silver', 900, 2400, '10.10-inch touchscreen display.', '1578805187_galaxy tab a silver.jpg', 'samsung, tab , tablet, Samsung Galaxy Tab A 10.1 Silver, samsung tab, samsung tab A, galaxy tab'),
(130, 13, 2, 'Samsung Galaxy Tab A 10.1 - Gold', 900, 2400, '10.10-inch touchscreen display.', '1578805298_galaxy tab a gold.jpg', 'samsung, tab , tablet, Samsung Galaxy Tab A 10.1 Gold, samsung tab, samsung tab A, galaxy tab gold'),
(131, 13, 2, 'Samsung Galaxy Tab A 10.1 - Black', 900, 2400, '10.10-inch touchscreen display.', '1578805370_galaxy tab a black.jpg', 'samsung, tab , tablet, Samsung Galaxy Tab A 10.1 black, samsung tab, samsung tab A, galaxy tab black'),
(132, 13, 2, 'Samsung Galaxy Tab S6 (128GB) - Mountain Gray', 3100, 2400, '10.5 display, Snapdragon 855 chipset, ', '1578805711_tab s6 grey.jpg', 'samsung, tab , tablet, Samsung Galaxy Tab S6 Mountain Gray, galaxy tab s6 grey , galaxy tab Mountain Gray, tab s6 gray, tab s6 grey'),
(133, 13, 2, 'Samsung Galaxy Tab S6 (128GB) - Cloud Blue', 3100, 2400, '10.5 AMOLED display,Snapdragon 855 chipset', '1578805845_tab s6 blue.jpg', 'samsung, tab , tablet, Samsung Galaxy Tab S6 Cloud Blue, galaxy tab s6 blue , galaxy tab Cloud Blue, tab s6 blue'),
(134, 13, 2, 'Samsung Galaxy Tab S6 (128GB) - Rose Blush', 3100, 2400, '10.5 AMOLED display,Snapdragon 855 chipset', '1578805980_tab s6 pink.jpg', 'samsung, tab , tablet, Samsung Galaxy Tab S6 Rose Blush, galaxy tab s6 rose , galaxy tab Rose Blush, tab s6 rose,  galaxy tab s6 pink'),
(135, 13, 2, 'Galaxy Tab S5e (64GB) - Gold', 2000, 2400, 'Powered by a Octa Core processor.Has a 13MP rear camera', '1578808320_tab s5e gold.jpg', 'samsung, tab , tablet, Samsung Galaxy Tab S5e Gold, galaxy tab s5e gold , galaxy tab gold, tab s5e,  galaxy tab s5e'),
(136, 13, 2, 'Galaxy Tab S5e (64GB) - Black ', 2000, 2400, 'Powered by a Octa Core processor. 13MP rear camera.', '1578809435_tab s5e black.jpg', 'samsung, tab , tablet, Samsung Galaxy Tab S5e Black , galaxy tab s5e Black  , galaxy tab Black , tab s5e,  galaxy tab s5e'),
(137, 13, 2, 'Galaxy Tab S5e (64GB) - Silver', 2000, 2400, 'Powered by a Octa Core processor. 13MP rear camera. ', '1578809535_tab s5e silver.jpg', 'samsung, tab , tablet, Samsung Galaxy Tab S5e silver , galaxy tab s5e  silver, galaxy tab silver , tab s5e,  galaxy tab s5e'),
(138, 13, 2, 'Samsung Galaxy Tab S3 - Black', 2200, 2400, 'Powered by a Quad Core processor. 13MP rear camera', '1578810250_Tab-S3 black.png', 'samsung, tab , tablet, samsung tab s3 black, samsung tab s3, tab s3 , galaxy tab s3, galaxy tab s3 black, tab s3 , s3 tab black'),
(139, 13, 2, 'Samsung Galaxy Tab S3 - Silver', 2200, 2400, 'Powered by a Quad Core processor. 13MP rear camera', '1578810328_s3 tab silver.jpg', 'samsung, tab , tablet, samsung tab s3 silver, samsung tab s3, tab s3 , galaxy tab s3, galaxy tab s3 silver, tab s3 silver , s3 tab silver'),
(140, 13, 7, 'Xiaomi Mi Pad 4 Plus (64GB) - Black', 1140, 2400, '10.1 Display Qualcom Snapdragon 660', '1578825925_mi pad 4 plus black.jpg', 'xiaomi, tablet, xiaomi tablet, Xiaomi Mi Pad 4 Plus, mi pad 4 plus black, Xiaomi Mi Pad 4 Plus black, mi pad 4'),
(141, 13, 7, 'Xiaomi Mi Pad 4 Plus - Gold', 1140, 2400, '10.1\" Display Qualcomm Snapdragon 660,', '1578826452_mi pad 4 plus gold.jpg', 'xiaomi, tablet, xiaomi tablet, Xiaomi Mi Pad 4 Plus, mi pad 4 plus Gold, Xiaomi Mi Pad 4 Plus Gold, mi pad 4'),
(142, 13, 7, 'Xiaomi Mi Pad 4 - Gold', 230, 2400, 'Android 8.1 Chipset Qualcomm Snapdragon', '1578846480_mi pad 4 gold.jpg', 'xiaomi, tablet, xiaomi tablet, Xiaomi Mi Pad 4 , mi pad 4 Gold, Xiaomi Mi Pad 4 Gold, mi pad 4'),
(143, 13, 7, 'Xiaomi Mi Pad 4 - Black', 230, 2400, 'Android 8.1 (Oreo). Chipset	Qualcomm  Snapdragon', '1578846849_mi pad 4  black.jpg', 'xiaomi, tablet, xiaomi tablet, Xiaomi Mi Pad 4 , mi pad 4 black, Xiaomi Mi Pad 4 black, mi pad 4'),
(144, 13, 7, 'Xiaomi Mi Pad 3 - Gold', 890, 2400, 'IPS 1536 x 2048PX display with 326ppi', '1578920793_Xiaomi-Mi-Pad-3 gold.jpg', 'xiaomi, tablet, xiaomi tablet, Xiaomi Mi Pad 3 Champagne Gold , mi pad 3 Gold, Xiaomi Mi Pad 3 Gold, mi pad 3'),
(145, 13, 7, 'Xiaomi Mi Pad 2 - Dark Grey', 900, 2400, 'Powered by a Quad-core 2.24 GHz ', '1578921067_Xiaomi-Mi-Pad-2 -grey.jpg', 'xiaomi, tablet, xiaomi tablet, Xiaomi Mi Pad 2 Dark Grey , mi pad 2 grey, Xiaomi Mi Pad 2 grey, mi pad 2'),
(146, 13, 7, 'Xiaomi Mi Pad 2 - Gold', 900, 2400, 'Powered by a Quad-core 2.24 GHz ', '1578921189_Xiaomi-Mi-Pad-2 -gold.jpg', 'xiaomi, tablet, xiaomi tablet, Xiaomi Mi Pad 2 Champagne Gold , mi pad 2 gold, Xiaomi Mi Pad 2 gold, mi pad 2'),
(147, 13, 8, 'Huawei MediaPad M5 Lite - Grey', 1070, 2400, 'Powered by a HiSilicon Kirin 659\r\n', '1578922244_Huawei_MediaPad_M5_Lite grey.jpg', 'huawei, Huawei MediaPad M5 Lite, mediapad m5 lite grey, m5 lite grey, mediapad m5 grey, huawei mediapad grey,  huawei m5 lite grey ,mediapad m5 lite grey, m5 lite grey, mediapad m5 grey, huawei mediapad grey, huawei m5 lite grey'),
(148, 13, 8, 'Huawei MediaPad M5 Lite - Gold', 1070, 2400, 'Powered by a HiSilicon Kirin 659\r\n', '1578922435_huawei-mediapad-m5 gold.jpeg', 'huawei, Huawei MediaPad M5 Lite, mediapad m5 lite gold, m5 lite gold, mediapad m5 gold, huawei mediapad gold,  huawei m5 lite gold ,mediapad m5 lite gold, m5 lite gold, mediapad m5 gold, huawei mediapad gold, huawei m5 lite ggold'),
(149, 13, 8, 'Huawei MatePad Pro - Orange', 2100, 2400, 'Powered by a HiSilicon Kirin 990. It has a 13MP rear camera', '1578927694_huawei-mate-pad-pro orange.png', 'huawei, Huawei MatePad Pro, MatePad Pro, matepad, Huawei MatePad Pro orange , MatePad Pro orange, matepad orange'),
(150, 13, 8, 'Huawei MatePad Pro - Green', 2100, 2400, 'Powered by a HiSilicon Kirin 990. It has a 13MP rear camera', '1578928111_huawei-mate-pad-pro green.png', 'huawei, Huawei MatePad Pro, MatePad Pro, matepad, Huawei MatePad Pro green , MatePad Pro green, matepad green'),
(151, 13, 8, 'Huawei MatePad Pro - White', 2100, 2400, 'Powered by a HiSilicon Kirin 990. It has a 13MP rear camera', '1578928251_Huawei-MatePad-Pro - white.jpg', 'huawei, Huawei MatePad Pro, MatePad Pro, matepad, Huawei MatePad Pro white , MatePad Pro white, matepad white'),
(152, 13, 8, 'Huawei MatePad Pro - Gray', 2100, 2400, 'powered by a HiSilicon Kirin 990 (7 nm+). It has a 13MP rear camera ', '1578928310_huawei-matepad-pro grey.jpg', 'huawei, Huawei MatePad Pro, MatePad Pro, matepad, Huawei MatePad Pro white , MatePad Pro white, matepad white'),
(153, 13, 8, 'Huawei MediaPad M5 Pro - White', 1450, 2400, 'Powered by a HiSilicon Kirin 960 13MP rear camera', '1578944603_mediapad m5-pro white.jpg', 'huawei, Huawei MediaPad M5 Pro White, mediapad m5 pro, mediapad m5 pro white, mediapad m5, mediapad m5 white, m5 pro, m5 pro white, '),
(154, 13, 8, 'Huawei MediaPad M5 Pro - Gold', 1450, 2400, 'Powered by a HiSilicon Kirin 960 13MP rear camera ', '1578944743_mediapad m5-pro gold.jpg', 'huawei, Huawei MediaPad M5 Pro gold, mediapad m5 pro, mediapad m5 pro gold, mediapad m5, mediapad m5 gold, m5 pro, m5 pro gold');

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

CREATE TABLE `user_info` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(1, 'testing', 'singh', 'jessharry29@gmail.com', 'e2e32a176e944992bafe9fe65b0baf62', '0193160412', '48 jln indah 1/2', 'puchong'),
(2, 'sad', 'asdasdas', 'keshweenkesh97@yahoo.com', '25f9e794323b453885f5181f1b624d0b', '0193160412', '412431', 'sqeqeqe'),
(3, '', '', 'keshweenkesh97@yahoo.com', 'c8ae52070cac2f9bb6eba2b785cb3ed1', '', '', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `fk_product_cat` (`product_cat`),
  ADD KEY `fk_product_brand` (`product_brand`);

--
-- Indexes for table `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=155;

--
-- AUTO_INCREMENT for table `user_info`
--
ALTER TABLE `user_info`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_product_brand` FOREIGN KEY (`product_brand`) REFERENCES `brands` (`brand_id`),
  ADD CONSTRAINT `fk_product_cat` FOREIGN KEY (`product_cat`) REFERENCES `categories` (`cat_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
