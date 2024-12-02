-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 02, 2024 at 01:54 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `uwu1.0.2`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(10) NOT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `full_name`, `password`, `email`) VALUES
(1, 'Kaif', '7479ff81bdd704409f81fd2573a6793c', 'iorisetsuna12589@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `block_list`
--

CREATE TABLE `block_list` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `blocked_user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `block_list`
--

INSERT INTO `block_list` (`id`, `user_id`, `blocked_user_id`) VALUES
(13, 12, 14);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `post_id`, `user_id`, `comment`, `created_at`) VALUES
(53, 20, 12, 'i love cheese', '2024-11-28 19:14:40'),
(54, 19, 12, 'very bad logo', '2024-11-28 19:15:35'),
(55, 17, 12, 'eto sundor manush hoi ?', '2024-11-28 19:20:40'),
(56, 20, 16, 'aa', '2024-12-01 12:08:27'),
(58, 22, 17, 'hi', '2024-12-01 13:18:05'),
(59, 20, 17, 'hi', '2024-12-01 13:18:30');

-- --------------------------------------------------------

--
-- Table structure for table `comment_likes`
--

CREATE TABLE `comment_likes` (
  `id` int(11) NOT NULL,
  `comment_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comment_likes`
--

INSERT INTO `comment_likes` (`id`, `comment_id`, `user_id`, `created_at`) VALUES
(2, 52, 12, '2024-11-23 22:30:31'),
(3, 55, 12, '2024-11-28 19:26:39'),
(4, 56, 16, '2024-12-01 12:08:45'),
(5, 53, 16, '2024-12-01 12:08:46'),
(7, 53, 17, '2024-12-01 13:18:24'),
(8, 56, 17, '2024-12-01 13:18:25');

-- --------------------------------------------------------

--
-- Table structure for table `followers_list`
--

CREATE TABLE `followers_list` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `follower_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `follow_list`
--

CREATE TABLE `follow_list` (
  `id` int(11) NOT NULL,
  `follower_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `follow_list`
--

INSERT INTO `follow_list` (`id`, `follower_id`, `user_id`) VALUES
(85, 13, 12),
(86, 12, 13),
(89, 16, 12),
(91, 14, 16),
(92, 17, 12),
(95, 16, 17);

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`id`, `post_id`, `user_id`) VALUES
(104, 20, 12),
(105, 19, 12),
(106, 18, 12),
(107, 17, 12),
(109, 20, 16),
(111, 22, 17),
(112, 20, 17);

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `from_user_id` int(11) NOT NULL,
  `to_user_id` int(11) NOT NULL,
  `msg` text NOT NULL,
  `read_status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `msg`, `read_status`, `created_at`) VALUES
(43, 13, 12, 'hi', 1, '2024-11-16 10:41:59'),
(44, 12, 13, 'hellow love', 0, '2024-11-16 10:42:34'),
(45, 12, 13, 'fds', 0, '2024-11-23 19:53:39'),
(46, 16, 14, 'hi', 1, '2024-12-01 12:12:00'),
(47, 14, 16, 'hello', 0, '2024-12-01 12:13:35'),
(48, 17, 16, 'hi', 1, '2024-12-01 13:19:28'),
(49, 16, 17, 'hloo', 0, '2024-12-01 13:20:12');

-- --------------------------------------------------------

--
-- Table structure for table `message_notifications`
--

CREATE TABLE `message_notifications` (
  `id` int(11) NOT NULL,
  `message_id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `status` enum('unread','read') DEFAULT 'unread',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `read_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `message_read_status`
--

CREATE TABLE `message_read_status` (
  `message_id` int(11) NOT NULL,
  `reader_id` int(11) NOT NULL,
  `read_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `to_user_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `from_user_id` int(11) NOT NULL,
  `read_status` int(11) NOT NULL DEFAULT 0,
  `post_id` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `to_user_id`, `message`, `created_at`, `from_user_id`, `read_status`, `post_id`) VALUES
(0, 14, 'started following you !', '2024-11-28 18:55:12', 12, 0, '0'),
(82, 10, 'Unblocked you !', '2021-12-06 08:16:11', 8, 1, '0'),
(83, 8, 'started following you !', '2021-12-06 08:16:59', 10, 1, '0'),
(84, 8, 'liked your post !', '2021-12-06 08:17:33', 10, 1, '12'),
(85, 8, 'commented on your post', '2021-12-06 08:17:41', 10, 1, '12'),
(86, 8, 'commented on your post', '2021-12-06 08:19:07', 10, 1, '5'),
(87, 10, 'blocked you', '2021-12-06 08:20:42', 8, 1, '0'),
(88, 10, 'Unblocked you !', '2021-12-06 08:21:09', 8, 1, '0'),
(89, 8, 'started following you !', '2021-12-06 08:21:34', 10, 1, '0'),
(90, 10, 'started following you !', '2021-12-06 08:22:17', 8, 1, '0'),
(91, 3, 'Unfollowed you !', '2021-12-06 08:26:01', 8, 0, '0'),
(92, 8, 'commented on your post', '2021-12-07 10:24:33', 11, 2, '6'),
(93, 11, 'blocked you', '2021-12-07 10:48:28', 8, 1, '0'),
(94, 11, 'Unblocked you !', '2021-12-07 11:04:05', 8, 1, '0'),
(95, 8, 'blocked you', '2021-12-07 11:08:54', 11, 1, '0'),
(96, 8, 'Unblocked you !', '2021-12-07 11:09:03', 11, 1, '0'),
(97, 8, 'blocked you', '2021-12-07 11:12:50', 10, 1, '0'),
(98, 8, 'Unblocked you !', '2021-12-07 11:13:04', 10, 1, '0'),
(99, 3, 'started following you !', '2024-11-16 07:21:01', 12, 0, '0'),
(100, 7, 'started following you !', '2024-11-16 07:21:05', 12, 0, '0'),
(101, 8, 'started following you !', '2024-11-16 07:21:18', 12, 0, '0'),
(102, 8, 'liked your post !', '2024-11-16 07:21:25', 12, 0, '5'),
(103, 8, 'unliked your post !', '2024-11-16 07:21:27', 12, 0, '5'),
(104, 8, 'liked your post !', '2024-11-16 07:21:28', 12, 0, '5'),
(105, 8, 'unliked your post !', '2024-11-16 07:21:29', 12, 0, '5'),
(106, 8, 'liked your post !', '2024-11-16 07:21:30', 12, 0, '5'),
(107, 8, 'unliked your post !', '2024-11-16 07:21:31', 12, 0, '5'),
(108, 8, 'liked your post !', '2024-11-16 07:21:32', 12, 0, '5'),
(109, 8, 'unliked your post !', '2024-11-16 07:21:33', 12, 0, '5'),
(110, 8, 'liked your post !', '2024-11-16 07:21:34', 12, 0, '5'),
(111, 8, 'unliked your post !', '2024-11-16 07:21:34', 12, 0, '5'),
(112, 8, 'commented on your post', '2024-11-16 07:21:43', 12, 0, '5'),
(113, 10, 'started following you !', '2024-11-16 07:23:27', 12, 0, '0'),
(114, 9, 'started following you !', '2024-11-16 07:23:28', 12, 0, '0'),
(115, 6, 'started following you !', '2024-11-16 07:23:28', 12, 0, '0'),
(116, 5, 'started following you !', '2024-11-16 07:23:29', 12, 0, '0'),
(117, 4, 'started following you !', '2024-11-16 07:23:30', 12, 0, '0'),
(118, 11, 'started following you !', '2024-11-16 07:23:33', 12, 0, '0'),
(119, 8, 'liked your post !', '2024-11-16 07:44:33', 12, 0, '5'),
(120, 12, 'started following you !', '2024-11-16 10:41:51', 13, 1, '0'),
(121, 13, 'started following you !', '2024-11-16 10:42:40', 12, 0, '0'),
(122, 13, 'commented on your post', '2024-11-16 10:42:53', 12, 2, '17'),
(123, 13, 'liked your post !', '2024-11-16 10:43:00', 12, 2, '17'),
(124, 13, 'unliked your post !', '2024-11-16 10:43:08', 12, 2, '17'),
(125, 13, 'liked your post !', '2024-11-16 10:43:08', 12, 2, '17'),
(126, 12, 'started following you !', '2024-11-23 22:53:32', 14, 1, '0'),
(127, 13, 'liked your post !', '2024-11-28 19:20:29', 12, 0, '17'),
(128, 13, 'commented on your post', '2024-11-28 19:20:40', 12, 0, '17'),
(129, 14, 'blocked you', '2024-11-28 19:27:54', 12, 0, '0'),
(130, 12, 'started following you !', '2024-12-01 12:07:04', 16, 1, '0'),
(131, 12, 'liked your post !', '2024-12-01 12:07:59', 16, 1, '20'),
(132, 12, 'commented on your post', '2024-12-01 12:08:26', 16, 1, '20'),
(133, 12, 'Unfollowed you !', '2024-12-01 12:10:59', 16, 1, '0'),
(134, 12, 'started following you !', '2024-12-01 12:11:10', 16, 1, '0'),
(135, 14, 'started following you !', '2024-12-01 12:11:13', 16, 0, '0'),
(136, 14, 'blocked you', '2024-12-01 12:11:45', 16, 0, '0'),
(137, 14, 'Unblocked you !', '2024-12-01 12:11:50', 16, 0, '0'),
(138, 16, 'started following you !', '2024-12-01 12:13:52', 14, 1, '0'),
(139, 12, 'started following you !', '2024-12-01 13:17:34', 17, 0, '0'),
(140, 16, 'started following you !', '2024-12-01 13:17:36', 17, 1, '0'),
(141, 16, 'liked your post !', '2024-12-01 13:17:59', 17, 1, '22'),
(142, 16, 'commented on your post', '2024-12-01 13:18:05', 17, 1, '22'),
(143, 12, 'liked your post !', '2024-12-01 13:18:19', 17, 0, '20'),
(144, 12, 'commented on your post', '2024-12-01 13:18:30', 17, 0, '20'),
(145, 16, 'Unfollowed you !', '2024-12-01 13:18:48', 17, 1, '0'),
(146, 16, 'started following you !', '2024-12-01 13:18:57', 17, 1, '0'),
(147, 16, 'blocked you', '2024-12-01 13:19:20', 17, 1, '0'),
(148, 16, 'Unblocked you !', '2024-12-01 13:19:22', 17, 1, '0'),
(149, 17, 'started following you !', '2024-12-01 13:20:24', 16, 0, '0');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_img` text NOT NULL,
  `post_text` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `post_img`, `post_text`, `created_at`) VALUES
(15, 12, '17317448373d8837b23486154a79a439d7fe219a8c.jpg', 'v', '2024-11-16 08:13:57'),
(17, 13, '1731753682274044824_1398678243886756_6474017338035330826_n.jpg', 'kaifs wifey', '2024-11-16 10:41:22'),
(18, 12, '173239300321ca34443beed805b10fb0e410802b5b.jpg', 'aot ', '2024-11-23 20:16:43'),
(19, 12, '1732820255UWU_1_-removebg-preview.png', 'uwu', '2024-11-28 18:57:35'),
(20, 12, '1732821163Untitled design.png', 'cheese', '2024-11-28 19:12:43'),
(22, 16, '1733055015Untitled.jpg', 'demo', '2024-12-01 12:10:15');

-- --------------------------------------------------------

--
-- Table structure for table `post_reports`
--

CREATE TABLE `post_reports` (
  `report_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `poster_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `post_img` text DEFAULT NULL,
  `reported_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `post_reports`
--

INSERT INTO `post_reports` (`report_id`, `post_id`, `poster_id`, `user_id`, `post_img`, `reported_at`) VALUES
(5, 17, 13, 12, '1731753682274044824_1398678243886756_6474017338035330826_n.jpg', '2024-11-23 22:05:16'),
(6, 20, 12, 16, '1732821163Untitled design.png', '2024-12-01 12:09:07'),
(7, 20, 12, 17, '1732821163Untitled design.png', '2024-12-01 13:17:56');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `gender` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` text NOT NULL,
  `profile_pic` varchar(255) NOT NULL DEFAULT 'default_profile.jpg',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ac_status` int(11) NOT NULL DEFAULT 0 COMMENT '0=not verified,1=active,2=blocked'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `gender`, `email`, `username`, `password`, `profile_pic`, `created_at`, `updated_at`, `ac_status`) VALUES
(12, 'alu', 'khor', 1, 'afdtrhnjsx@dak.com', 'alu', 'b9839cf7b6959e0763df69ba8468d618', '17317450448dbeaf1e2b153581a696fb00f44ef471.jpg', '2024-11-16 07:00:57', '2024-12-01 13:20:52', 2),
(13, 'Nashra', 'tul', 2, 'nushu@gmail.com', 'nushu_fake', '781bce03ccae2adcde04854be1014ff4', '1731753648296826981_1510622566025656_8672763609683832879_n.jpg', '2024-11-16 10:40:07', '2024-11-23 22:31:10', 1),
(14, 'wari', 'sa', 2, 'rawrwaris@gmail.com', 'warisa', '33161451690a97f50a92e325d1d57294', 'default_profile.jpg', '2024-11-23 22:37:13', '2024-11-23 22:50:11', 1),
(16, 'user ', 'one', 1, 'kaif.khan@northsouth.edu', 'demo', 'fe01ce2a7fbac8fafaed7c982a04e229', '1733054765Untitgasrled.jpg', '2024-12-01 12:03:00', '2024-12-01 12:06:05', 1),
(17, 'user ', 'two', 1, 'iorisetsuna12589@gmail.com', 'demotwo', '1066726e7160bd9c987c9968e0cc275a', '17330590051f238fa20bb7567f86390906457c74fd.jpg', '2024-12-01 13:15:15', '2024-12-01 13:16:45', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `block_list`
--
ALTER TABLE `block_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_block_list_user` (`user_id`),
  ADD KEY `fk_block_list_blocked_user` (`blocked_user_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_post_comment` (`post_id`),
  ADD KEY `fk_user_comment` (`user_id`);

--
-- Indexes for table `comment_likes`
--
ALTER TABLE `comment_likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comment_id` (`comment_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `followers_list`
--
ALTER TABLE `followers_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `follower_id` (`follower_id`);

--
-- Indexes for table `follow_list`
--
ALTER TABLE `follow_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_follower` (`follower_id`),
  ADD KEY `fk_user_follow` (`user_id`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_post_like` (`post_id`),
  ADD KEY `fk_user_like` (`user_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `message_notifications`
--
ALTER TABLE `message_notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `message_id` (`message_id`),
  ADD KEY `sender_id` (`sender_id`),
  ADD KEY `receiver_id` (`receiver_id`);

--
-- Indexes for table `message_read_status`
--
ALTER TABLE `message_read_status`
  ADD KEY `message_id` (`message_id`),
  ADD KEY `reader_id` (`reader_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_post` (`user_id`);

--
-- Indexes for table `post_reports`
--
ALTER TABLE `post_reports`
  ADD PRIMARY KEY (`report_id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `fk_poster` (`poster_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `block_list`
--
ALTER TABLE `block_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `comment_likes`
--
ALTER TABLE `comment_likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `followers_list`
--
ALTER TABLE `followers_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `follow_list`
--
ALTER TABLE `follow_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `message_notifications`
--
ALTER TABLE `message_notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=150;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `post_reports`
--
ALTER TABLE `post_reports`
  MODIFY `report_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `block_list`
--
ALTER TABLE `block_list`
  ADD CONSTRAINT `fk_block_list_blocked_user` FOREIGN KEY (`blocked_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_block_list_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `fk_post_comment` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_user_comment` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `comment_likes`
--
ALTER TABLE `comment_likes`
  ADD CONSTRAINT `comment_likes_ibfk_1` FOREIGN KEY (`comment_id`) REFERENCES `comments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comment_likes_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `followers_list`
--
ALTER TABLE `followers_list`
  ADD CONSTRAINT `followers_list_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `followers_list_ibfk_2` FOREIGN KEY (`follower_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `follow_list`
--
ALTER TABLE `follow_list`
  ADD CONSTRAINT `fk_follower` FOREIGN KEY (`follower_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_user_follow` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `fk_post_like` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_user_like` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `message_notifications`
--
ALTER TABLE `message_notifications`
  ADD CONSTRAINT `message_notifications_ibfk_1` FOREIGN KEY (`message_id`) REFERENCES `messages` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `message_notifications_ibfk_2` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `message_notifications_ibfk_3` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `message_read_status`
--
ALTER TABLE `message_read_status`
  ADD CONSTRAINT `message_read_status_ibfk_1` FOREIGN KEY (`message_id`) REFERENCES `messages` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `message_read_status_ibfk_2` FOREIGN KEY (`reader_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `fk_user_post` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `post_reports`
--
ALTER TABLE `post_reports`
  ADD CONSTRAINT `fk_poster` FOREIGN KEY (`poster_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `post_reports_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`),
  ADD CONSTRAINT `post_reports_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
