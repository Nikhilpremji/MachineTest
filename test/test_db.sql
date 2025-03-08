-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 08, 2025 at 07:32 AM
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
-- Database: `test_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `name`, `email`, `created_at`) VALUES
(1, 'nikhil', 'nikhil@gmail.com', '2025-03-08 05:56:43'),
(2, 'akhil', 'akhil@gmail.com', '2025-03-08 05:57:06'),
(3, 'amal', 'amal@gmail.com', '2025-03-08 05:57:24'),
(4, 'anu', 'anu@gmail.com', '2025-03-08 06:23:52'),
(5, 'abi', 'abi@gmail.com', '2025-03-08 06:23:52'),
(6, 'lakshmi', 'lakshmi@gmail.com', '2025-03-08 06:24:18'),
(7, 'arun', 'lakshmi@gmail.com', '2025-03-08 06:24:18'),
(8, 'sabin', 'sabin@gmail.com', '2025-03-08 06:24:39'),
(9, 'nandhu', 'nandhu@gmail.com', '2025-03-08 06:24:39'),
(10, 'nithin', 'nithin@gmail.com', '2025-03-08 06:24:51');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `total_amount` decimal(10,2) NOT NULL,
  `status` enum('pending','shipped','delivered','canceled') NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `customer_id`, `order_date`, `total_amount`, `status`) VALUES
(1, 1, '2024-11-30 18:30:00', 200.00, 'pending'),
(2, 2, '2025-01-01 06:02:00', 230.00, 'shipped'),
(3, 1, '2025-03-08 06:02:14', 340.00, 'pending'),
(4, 1, '2025-03-08 06:02:24', 270.00, 'delivered'),
(5, 2, '2025-03-08 06:02:32', 124.00, 'pending'),
(6, 1, '2025-03-08 06:02:43', 345.00, 'delivered'),
(7, 2, '2025-03-08 06:02:54', 456.00, 'shipped'),
(8, 3, '2025-03-08 06:22:31', 260.00, 'pending'),
(9, 5, '2025-03-08 06:25:26', 35.00, 'delivered'),
(10, 4, '2025-03-08 06:25:26', 678.00, 'pending'),
(11, 7, '2025-03-08 06:26:52', 233.00, 'shipped'),
(12, 9, '2025-03-08 06:27:01', 345.00, 'delivered');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `satus_index` (`status`),
  ADD KEY `customer_id` (`customer_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
