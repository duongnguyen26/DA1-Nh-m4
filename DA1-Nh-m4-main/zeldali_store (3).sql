-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 08, 2024 at 01:38 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `zeldali_store`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int NOT NULL,
  `cate_name` varchar(255) NOT NULL,
  `type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `cate_name`, `type`) VALUES
(1, 'Áo sơ mi', 'Áo'),
(2, 'Áo jacket', 'Áo'),
(3, 'Áo blazer', 'Áo'),
(4, 'Quần tây', 'Quần'),
(5, 'Quần short', 'Quần'),
(6, 'Quần khaki', 'Quần'),
(7, 'Quần Jeans', 'Quần'),
(8, 'Tất', 'Phụ Kiện'),
(9, 'Dây lưng', 'Phụ Kiện'),
(10, 'Ví da', 'Phụ Kiện'),
(11, 'Cà vạt', 'Phụ Kiện');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int NOT NULL,
  `product_id` int NOT NULL,
  `user_id` int NOT NULL,
  `comment` text NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `product_id`, `user_id`, `comment`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'sản phẩm rất đẹp!!', '2024-12-04 18:42:09', '2024-12-04 18:42:09'),
(3, 2, 1, 'sản phẩm đẹp quá ạ', '2024-12-04 19:35:10', '2024-12-04 19:35:10');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `status` enum('pending','in transit','completed','canceled') DEFAULT 'pending',
  `payment_method` enum('cash','card','online') DEFAULT 'cash',
  `total_price` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `status`, `payment_method`, `total_price`, `created_at`) VALUES
(6, 1, 'canceled', 'cash', '690000.00', '2024-12-04 15:56:27'),
(7, 1, 'pending', 'cash', '427000.00', '2024-12-05 02:16:27');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` int NOT NULL,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `quantity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `product_name`, `price`, `quantity`) VALUES
(9, 6, 2, 'Áo sơ mi - AS240043D', '690000.00', 1),
(10, 7, 1, 'Áo sơ mi - AS230655D', '427000.00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `price` decimal(25,2) DEFAULT NULL,
  `description` text,
  `content` text,
  `type` varchar(10) NOT NULL,
  `status` enum('active','inactive') DEFAULT 'active',
  `category_id` int NOT NULL,
  `view` int DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `image`, `price`, `description`, `content`, `type`, `status`, `category_id`, `view`, `created_at`) VALUES
(1, 'Áo sơ mi - AS230655D', 'Assets/Admin/Uploads/674f6fcd2f64e6.92026083.png', '427000.00', 'Áo sơ mi dài tay, kiểu dáng Slim Fit dễ mặc, hợp form dáng.\r\nMàu sắc và kiểu dáng trẻ trung, kiểu dáng hiện đại, dễ phối đồ.\r\nChất liệu: 50% Bamboo, 50% Polyester', 'Áo sơ mi đẹp giá tốt', 'Áo', 'active', 1, 109, '2024-12-03 20:53:33'),
(2, 'Áo sơ mi - AS240043D', 'Assets/Admin/Uploads/674f703b773a16.91679962.png', '690000.00', 'Áo sơ mi đẹp giá tốt', 'Áo sơ mi đẹp giá tốt', 'Áo', 'active', 1, 5, '2024-12-03 20:55:23'),
(3, 'Áo sơ mi - AS220145D', 'Assets/Admin/Uploads/674f707eef7d10.84008632.png', '588000.00', 'Áo sơ mi dài tay, kiểu dáng Slim Fit dễ mặc, hợp form dáng.\r\nMàu sắc trẻ trung, kiểu dáng hiện đại, dễ phối đồ.\r\nChất liệu Bamboo mịn mát từ vải sợi tre thân thiện môi trường.', 'Áo sơ mi đẹp giá tốt', 'Áo', 'active', 1, 6, '2024-12-03 20:56:30'),
(4, 'Áo sơ mi - AS220136D', 'Assets/Admin/Uploads/674f74b6da88c7.50521595.png', '620000.00', 'Áo sơ mi dài tay, kiểu dáng Slim Fit dễ mặc, hợp form dáng.\r\nMàu sắc và kiểu dáng trẻ trung, kiểu dáng hiện đại, dễ phối đồ.\r\nChất liệu Bamboo mịn mát từ vải sợi tre thân thiện môi trường.', 'Áo sơ mi dài tay, kiểu dáng Slim Fit dễ mặc, hợp form dáng.', 'Áo', 'active', 1, 0, '2024-12-03 21:14:30'),
(5, 'Quần tây - QST242826', 'Assets/Admin/Uploads/674f7c5373deb0.41551657.png', '730000.00', 'Quần tây chất liệu: 100% Polyester Nano\r\nForm slim fit có tăng đơ tôn dáng người mặc. \r\nMàu sắc trung tính dễ phối đồ.', 'Quần tây chất liệu: 100% Polyester Nano', 'Quần', 'active', 4, 0, '2024-12-03 21:46:59'),
(6, 'Quần tây - QST242408', 'Assets/Admin/Uploads/674f7ca78456b3.79251092.png', '650000.00', 'Quần tây chất liệu: 70% Polyester, 27% Rayon, 3% Spandex\r\nForm slimfit có tăng đơ tôn dáng người mặc. \r\nMàu sắc trung tính dễ phối đồ.', 'Quần tây chất liệu: 70% Polyester, 27% Rayon, 3% Spandex', 'Quần', 'active', 4, 0, '2024-12-03 21:48:23'),
(7, 'Quần tây - QST231255', 'Assets/Admin/Uploads/674f7ce8570726.17232082.png', '700000.00', 'Quần tây chất liệu: 27% Rayon, 70% Polyester, 3% Spandex\r\nForm slim fit có tăng đơ tôn dáng người mặc. \r\nMàu sắc trung tính dễ phối đồ.', 'Quần tây chất liệu: 27% Rayon, 70% Polyester, 3% Spandex', 'Quần', 'active', 4, 0, '2024-12-03 21:49:28'),
(8, 'Quần tây - QST231240', 'Assets/Admin/Uploads/674f7d2b526868.86794050.png', '490000.00', 'Quần tây chất liệu: Nano\r\nForm slim fit có tăng đơ ôm dáng người mặc. \r\nMàu sắc trung tính dễ phối đồ.', 'Quần tây chất liệu: Nano', 'Quần', 'active', 4, 0, '2024-12-03 21:50:35'),
(9, 'Dây lưng - BELT232627', 'Assets/Admin/Uploads/674f7d95086ce9.35094827.png', '550000.00', 'Chất liệu: PU Leather', 'Chất liệu: PU Leather', 'Phụ Kiện', 'active', 9, 0, '2024-12-03 21:52:21'),
(10, 'Thắt lưng - BELT220593', 'Assets/Admin/Uploads/674f7dd5667e30.21169641.png', '495000.00', 'Chất liệu 100% da thật, tone màu nâu lịch lãm, sang trọng, dễ dàng phối tạo nên phong cách thanh lịch.', 'Chất liệu 100% da thật, tone màu nâu lịch lãm, sang trọng, dễ dàng phối tạo nên phong cách thanh lịch.', 'Phụ Kiện', 'active', 9, 0, '2024-12-03 21:53:25');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `role` enum('admin','user') DEFAULT 'user',
  `address` text,
  `status` enum('active','banned') DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fullname`, `email`, `password`, `phone`, `role`, `address`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Kiều văn Đạt', 'kieudat2k5@gmail.com', '$2y$10$JR.PFlTTrC49.IuEYoSKZOOQxDqyV2KnkSdSnWsvhToYFWIsHA2xa', '0333470486', 'admin', 'Thôn Bùng - Minh Đức - Ứng Hòa - Hà Nội', 'active', '2024-12-03 13:47:04', '2024-12-03 22:08:37'),
(2, 'Nguyễn Đức Dương', 'duongndph53424@gmail.com', '$2y$10$fur1qDvdSZ8d8woqmKNG4OiaxzKpaw8lmo/yvr7VKje7hhLWjMZtS', '0373757099', 'user', 'Thôn 10 - Xã phù lưu tế - Huyện Mỹ Đức - Thành phố Hà Nội', 'active', '2024-12-03 15:15:22', '2024-12-03 15:15:22');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
