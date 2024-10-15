-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 15, 2024 at 03:51 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `accompanyme`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `username`, `password`) VALUES
(1, 'allen', 'allen'),
(2, 'ceddos', '$2y$10$xOz04uMGTlZoNu.WmKyDJe023zqKkuIKfgz20w1pegx.RT6Y8K9ra'),
(3, 'ced', '$2y$10$1nR2tJAXOLd48XvFl0mgQe2EXWbQ6fikgaW2VsXFf8fZT/ccjkBSC'),
(4, 'lenlen', '$2y$10$pfwhFVLqEkKzhLHjDRZnIOjdIfbdRM8kQdKHyOodOf7ceYYtjHqNq'),
(5, 'bebe', '$2y$10$aBnicSDCsCKy0rEkTCtX0.YW0uUh1Sdm/AX.3KpBTnp.sqoyfeZyC');

-- --------------------------------------------------------

--
-- Table structure for table `attractions`
--

CREATE TABLE `attractions` (
  `attr_id` int(11) NOT NULL,
  `attraction_name` varchar(30) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  `parking` enum('Available','Not Available','Unspecified') DEFAULT 'Unspecified',
  `entrance_fee` varchar(10) DEFAULT NULL,
  `dining` enum('Available','Not Available','Unspecified') DEFAULT 'Unspecified',
  `operating_hours` time DEFAULT NULL,
  `contact_details` varchar(100) DEFAULT NULL,
  `history` varchar(1000) DEFAULT NULL,
  `operating_hours_from` varchar(50) NOT NULL,
  `operating_hours_to` varchar(50) NOT NULL,
  `city_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `attractions`
--

INSERT INTO `attractions` (`attr_id`, `attraction_name`, `description`, `image`, `parking`, `entrance_fee`, `dining`, `operating_hours`, `contact_details`, `history`, `operating_hours_from`, `operating_hours_to`, `city_id`) VALUES
(1, 'Seascape', 'A seascape is a photograph, painting, or other work of art which depicts the sea, in other words an example of marine art. The word originated as a formation from landscape, which was first used for images of land in art. By a similar development, \"seascape\" has also come to mean actual perceptions of the sea itself.', '../images/001 (2).jpg', 'Available', 'Dont know', 'Available', NULL, 'government', 'A seascape is a photograph, painting, or other work of art which depicts the sea, in other words an example of marine art. The word originated as a formation from landscape, which was first used for images of land in art. By a similar development, \"seascape\" has also come to mean actual perceptions of the sea itself.', '9', '10', 1),
(2, 'Church of Sto. Sepulcro (Landa', 'landayan', '../images/Prague Outrun City29458_square_20230702_221729_626_14.jpg', 'Available', 'wala yata', 'Available', NULL, 'nakay mama', 'mahaba, kaya pass muna', '9', '5', 1),
(3, 'Historic Alberto Mansion', 'In 2009 or 2010, the house was reportedly sold to Gerry Acuzar by Gerardo Alberto, a fifth-generation descendant of the Jose Alberto Alonzo. Acuzar is the owner of Las Casas Filipinas de Acuzar, a resort in Bagac, Bataan known for incorporating heritage structures from other parts of the country.[1][4] The Alonzo clan allowed for the house\'s full relocation to the Bataan resort but the move was opposed by the city government of Biñan.[5] The Biñan government also offered to buy the property for ₱20 million but the owner reportedly declined the offer of the local government.[6]\r\n\r\nThe Biñan city government also issued an ordinance in 2011 declaring the Alberto Mansion a heritage site. On October 21, 2012, the roof of the building collapsed, which is suspected to be as a result of dismantling the interior for transfer to the Acuzar resort in Bataan.[6] The Biñan council also sought for the National Historical Commission of the Philippines to declare the building a National Historical Lan', '../images/alberto mansion.jpg', 'Available', 'meron yata', 'Available', NULL, 'beach@gmail.com', 'In 2009 or 2010, the house was reportedly sold to Gerry Acuzar by Gerardo Alberto, a fifth-generation descendant of the Jose Alberto Alonzo. Acuzar is the owner of Las Casas Filipinas de Acuzar, a resort in Bagac, Bataan known for incorporating heritage structures from other parts of the country.[1][4] The Alonzo clan allowed for the house\'s full relocation to the Bataan resort but the move was opposed by the city government of Biñan.[5] The Biñan government also offered to buy the property for ₱20 million but the owner reportedly declined the offer of the local government.[6]\r\n\r\nThe Biñan city government also issued an ordinance in 2011 declaring the Alberto Mansion a heritage site. On October 21, 2012, the roof of the building collapsed, which is suspected to be as a result of dismantling the interior for transfer to the Acuzar resort in Bataan.[6] The Biñan council also sought for the National Historical Commission of the Philippines to declare the building a National Historical Lan', '2', '4', 4);

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `city_id` int(11) NOT NULL,
  `city` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`city_id`, `city`) VALUES
(1, 'Alaminos'),
(2, 'Banilan'),
(3, 'Bay'),
(4, 'Biñan'),
(5, 'Cabuyao'),
(6, 'Calamba'),
(7, 'Calauan'),
(8, 'Canlubang'),
(9, 'Cavinti'),
(10, 'Del Remedio'),
(11, 'Famy'),
(12, 'General Mariano Alvarez'),
(13, 'Kalayaan'),
(14, 'Kay-anlog, Calamba'),
(15, 'Liliw'),
(16, 'Los Baños'),
(17, 'Lucban'),
(18, 'Lumban'),
(19, 'Luisiana'),
(20, 'Mabitac'),
(21, 'Magdalena'),
(22, 'Makiling'),
(23, 'Malitlit'),
(24, 'Mamatid'),
(25, 'Nagcarlan'),
(26, 'Paete'),
(27, 'Pagsajnan'),
(28, 'Pakil'),
(29, 'Parian'),
(30, 'Pila'),
(31, 'Pililla'),
(32, 'Punta'),
(33, 'Rizal'),
(34, 'San Pablo'),
(35, 'San Pedro'),
(36, 'Santa Cruz'),
(37, 'Santa Maria'),
(38, 'Santa Rosa'),
(39, 'Siniloan'),
(40, 'Tanay'),
(41, 'Turbina'),
(42, 'Victoria');

-- --------------------------------------------------------

--
-- Table structure for table `destinations`
--

CREATE TABLE `destinations` (
  `dest_id` int(11) NOT NULL,
  `city` varchar(30) NOT NULL,
  `attraction_name` varchar(30) NOT NULL,
  `image` varchar(500) DEFAULT NULL,
  `map` varchar(255) DEFAULT NULL,
  `weather` varchar(500) NOT NULL,
  `city_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `destinations`
--

INSERT INTO `destinations` (`dest_id`, `city`, `attraction_name`, `image`, `map`, `weather`, `city_id`) VALUES
(1, '', 'Seascape', '../images/001 (2).jpg', '', '', 1),
(2, '', 'Church of Sto. Sepulcro (Landa', '../images/Prague Outrun City29458_square_20230702_221729_626_14.jpg', '', '', 1),
(3, '', 'Historic Alberto Mansion', '../images/alberto mansion.jpg', '', '', 4);

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `attr_id` int(11) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `images` text DEFAULT NULL,
  `video` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `uid`, `attr_id`, `rating`, `message`, `images`, `video`, `created_at`) VALUES
(1, 1, 1, 5, 'wala lang, 5 star lang natin', '[\"images\\/walpy_1692614375234.png\",\"images\\/walpy_1692614499230.png\",\"images\\/Warrior II22587_square_20230702_221154_997_41.jpg\"]', NULL, '2024-09-28 02:43:38'),
(2, 1, 1, 2, 'lalungs', '[]', NULL, '2024-09-28 02:44:05'),
(3, 2, 1, 5, 'five star', '[\"images\\/457834728_2009850866132802_6319898721283645222_n.jpg\"]', NULL, '2024-09-28 06:05:09'),
(4, 1, 1, 1, '1 lang', '[]', NULL, '2024-09-28 09:45:25'),
(5, 1, 1, 3, '3', '[]', NULL, '2024-09-28 09:47:00'),
(6, 1, 1, 3, '333', '[]', NULL, '2024-09-28 09:50:50'),
(7, 1, 1, 5, 'fs', '[]', NULL, '2024-09-28 09:52:00'),
(8, 1, 2, 2, '2 star lang, hehe', '[]', NULL, '2024-10-10 13:41:57'),
(9, 1, 2, 5, 'wala lang, basta 5 stars yan hahaha', '[\"images\\/download (1).jpg\"]', NULL, '2024-10-12 01:23:25'),
(10, 3, 2, 2, '2 stars lang dapat, di pa ako nakakapunta eh', '[\"images\\/462555106_504541662398914_8984029896456147358_n.jpg\"]', NULL, '2024-10-13 03:23:16'),
(11, 1, 3, 3, '3 lang, palagi namang sarado eh', '[]', NULL, '2024-10-13 12:33:51');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `uid` int(11) NOT NULL,
  `uemail` text NOT NULL,
  `uname` text NOT NULL,
  `upassword` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`uid`, `uemail`, `uname`, `upassword`) VALUES
(1, 'hello@gmail.com', 'cedced', '$2y$10$cKqLDdbIgdplt/WGmod/EOjRgsZLWEUYQ0tnUZ5RBehW02KIVS3Fy'),
(2, 'allenallen@gmail.com', 'ced', '$2y$10$9Ua6y7TbbqxkSNSC/ASVqOtrSgnNJ/jjfTRFrKyORdv0d.e2CneYS'),
(3, 'al@gmail.com', 'al', '$2y$10$QIg7lQ48TUBFOFt2K/1AzechXFA0csiepnMP3/pBkv04LESd1b.Mi');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `attractions`
--
ALTER TABLE `attractions`
  ADD PRIMARY KEY (`attr_id`),
  ADD KEY `fk_city` (`city_id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`city_id`);

--
-- Indexes for table `destinations`
--
ALTER TABLE `destinations`
  ADD PRIMARY KEY (`dest_id`),
  ADD KEY `city_id` (`city_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `attr_id` (`attr_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `uemail` (`uemail`) USING HASH,
  ADD UNIQUE KEY `uname` (`uname`) USING HASH;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `attractions`
--
ALTER TABLE `attractions`
  MODIFY `attr_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `city_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `destinations`
--
ALTER TABLE `destinations`
  MODIFY `dest_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attractions`
--
ALTER TABLE `attractions`
  ADD CONSTRAINT `fk_city` FOREIGN KEY (`city_id`) REFERENCES `cities` (`city_id`);

--
-- Constraints for table `destinations`
--
ALTER TABLE `destinations`
  ADD CONSTRAINT `destinations_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `cities` (`city_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`),
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`attr_id`) REFERENCES `attractions` (`attr_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
