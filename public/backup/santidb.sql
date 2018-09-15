-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 18, 2018 at 06:24 PM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 7.1.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `santidb`
--

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE `articles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(250) CHARACTER SET utf8 NOT NULL,
  `subject_id` int(10) UNSIGNED NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`id`, `name`, `subject_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'บทที่ 1', 1, 1, '2018-08-12 10:04:16', '2018-08-16 09:48:46'),
(2, 'บทที่ 2', 1, 1, '2018-08-12 10:04:16', '2018-08-16 09:53:12'),
(3, 'repellendus', 1, 1, '2018-08-12 10:04:16', '2018-08-12 10:04:16'),
(4, 'totam', 1, 1, '2018-08-12 10:04:16', '2018-08-12 10:04:16'),
(5, 'odit', 1, 1, '2018-08-12 10:04:16', '2018-08-12 10:04:16'),
(6, 'บทที่ 1', 1, 1, '2018-08-16 09:29:47', '2018-08-16 09:29:47');

-- --------------------------------------------------------

--
-- Table structure for table `article_tests`
--

CREATE TABLE `article_tests` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(250) CHARACTER SET utf8 NOT NULL,
  `type` int(10) UNSIGNED NOT NULL,
  `article_id` int(10) UNSIGNED NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `article_tests`
--

INSERT INTO `article_tests` (`id`, `name`, `type`, `article_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'แบบทดสอบหลังเรียน', 1, 1, 1, '2018-08-15 08:45:46', '2018-08-18 03:46:34'),
(2, 'แบบทดสอบหลังเรียน', 2, 1, 1, '2018-08-15 08:45:46', '2018-08-18 03:22:48'),
(3, 'vitae', 1, 2, 1, '2018-08-15 08:45:46', '2018-08-15 08:45:46'),
(4, 'ea', 2, 2, 1, '2018-08-15 08:45:46', '2018-08-15 08:45:46'),
(5, 'optio', 1, 3, 1, '2018-08-15 08:45:46', '2018-08-15 08:45:46'),
(6, 'necessitatibus', 2, 3, 1, '2018-08-15 08:46:34', '2018-08-15 08:46:34'),
(7, 'sit', 1, 4, 1, '2018-08-15 08:46:34', '2018-08-15 08:46:34'),
(8, 'architecto', 2, 4, 1, '2018-08-15 08:46:34', '2018-08-15 08:46:34'),
(9, 'dolorum', 1, 5, 1, '2018-08-15 08:46:34', '2018-08-15 08:46:34'),
(10, 'voluptatem', 2, 5, 1, '2018-08-15 08:46:34', '2018-08-15 08:46:34');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2018_08_12_165129_create_subjects_table', 1),
(4, '2018_08_12_165224_create_articles_table', 1),
(5, '2018_08_12_165239_create_topics_table', 1),
(6, '2016_06_01_000001_create_oauth_auth_codes_table', 2),
(7, '2016_06_01_000002_create_oauth_access_tokens_table', 2),
(8, '2016_06_01_000003_create_oauth_refresh_tokens_table', 2),
(9, '2016_06_01_000004_create_oauth_clients_table', 2),
(10, '2016_06_01_000005_create_oauth_personal_access_clients_table', 2),
(11, '2018_08_13_113758_create_test_models_table', 2),
(12, '2018_08_13_124139_create_tests_table', 3),
(13, '2018_08_13_133422_create_questions_table', 4),
(15, '2018_08_14_133421_create_options_table', 5),
(20, '2018_08_15_150823_create_subject_tests_table', 10),
(21, '2018_08_15_150837_create_article_tests_table', 10);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('17a93cb411c795d8d0ddbc26ef34b475e82140a4be2f2f17bb3343fb49e50576212ee81e1d935879', 1, 2, NULL, '[]', 0, '2018-08-16 10:46:14', '2018-08-16 10:46:14', '2019-08-16 17:46:14'),
('d5834c7d6dd067401a8e4985fd756a2b55da144859278300c6a0df9ac09aa32da79af6a0ac19aea7', 1, 2, NULL, '[]', 0, '2018-08-13 05:04:55', '2018-08-13 05:04:55', '2019-08-13 12:04:55');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'P0LaINPvDJvUhayJo9b83AAM5SqRCtT2sDSN6F3B', 'http://localhost', 1, 0, 0, '2018-08-13 04:49:41', '2018-08-13 04:49:41'),
(2, NULL, 'Laravel Password Grant Client', 'esXFj5MfrAhjkz54UOt2WcfSAEV9X8nm3w5CgdNq', 'http://localhost', 0, 1, 0, '2018-08-13 04:49:41', '2018-08-13 04:49:41');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2018-08-13 04:49:41', '2018-08-13 04:49:41');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_refresh_tokens`
--

INSERT INTO `oauth_refresh_tokens` (`id`, `access_token_id`, `revoked`, `expires_at`) VALUES
('8351679c4b404217a9d5d524d86b0af82a1b187aea58efb3cbc13a2d6b4ffe9c54f7f4034c062d2f', '17a93cb411c795d8d0ddbc26ef34b475e82140a4be2f2f17bb3343fb49e50576212ee81e1d935879', 0, '2019-08-16 17:46:14'),
('a0513d5e85297abb3be71de8ece516a027b3d5775a9b455bfd431ade9130aa7ca3d0db35863048fc', 'd5834c7d6dd067401a8e4985fd756a2b55da144859278300c6a0df9ac09aa32da79af6a0ac19aea7', 0, '2019-08-13 12:04:55');

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

CREATE TABLE `options` (
  `id` int(10) UNSIGNED NOT NULL,
  `question_id` int(10) UNSIGNED NOT NULL,
  `value` int(10) UNSIGNED NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(250) CHARACTER SET utf8 NOT NULL,
  `test_id` int(10) UNSIGNED NOT NULL,
  `answer` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `name`, `test_id`, `answer`, `status`, `created_at`, `updated_at`) VALUES
(61, 'quia', 7, 0, 1, '2018-08-13 06:55:17', '2018-08-13 06:55:17'),
(62, 'omnis', 10, 0, 1, '2018-08-13 06:55:17', '2018-08-13 06:55:17'),
(63, 'commodi', 9, 0, 1, '2018-08-13 06:55:17', '2018-08-13 06:55:17'),
(64, 'quia', 9, 0, 1, '2018-08-13 06:55:17', '2018-08-13 06:55:17'),
(65, 'minus', 3, 0, 1, '2018-08-13 06:55:17', '2018-08-13 06:55:17'),
(66, 'autem', 3, 0, 1, '2018-08-13 06:55:17', '2018-08-13 06:55:17'),
(67, 'quas', 4, 0, 1, '2018-08-13 06:55:17', '2018-08-13 06:55:17'),
(68, 'delectus', 3, 0, 1, '2018-08-13 06:55:17', '2018-08-13 06:55:17'),
(69, 'dolores', 2, 0, 1, '2018-08-13 06:55:17', '2018-08-13 06:55:17'),
(70, 'numquam', 3, 0, 1, '2018-08-13 06:55:17', '2018-08-13 06:55:17'),
(71, 'qui', 12, 0, 1, '2018-08-13 06:55:17', '2018-08-13 06:55:17'),
(72, 'aliquid', 5, 0, 1, '2018-08-13 06:55:17', '2018-08-13 06:55:17'),
(73, 'magnam', 1, 0, 1, '2018-08-13 06:55:17', '2018-08-13 06:55:17'),
(74, 'dicta', 12, 0, 1, '2018-08-13 06:55:17', '2018-08-13 06:55:17'),
(75, 'architecto', 7, 0, 1, '2018-08-13 06:55:17', '2018-08-13 06:55:17'),
(76, 'omnis', 12, 0, 1, '2018-08-13 06:55:17', '2018-08-13 06:55:17'),
(77, 'voluptatibus', 6, 0, 1, '2018-08-13 06:55:17', '2018-08-13 06:55:17'),
(78, 'doloremque', 9, 0, 1, '2018-08-13 06:55:17', '2018-08-13 06:55:17'),
(79, 'impedit', 7, 0, 1, '2018-08-13 06:55:17', '2018-08-13 06:55:17'),
(80, 'laborum', 6, 0, 1, '2018-08-13 06:55:17', '2018-08-13 06:55:17'),
(81, 'ut', 2, 0, 1, '2018-08-13 06:55:17', '2018-08-13 06:55:17'),
(82, 'odio', 1, 0, 1, '2018-08-13 06:55:17', '2018-08-13 06:55:17'),
(83, 'qui', 7, 0, 1, '2018-08-13 06:55:17', '2018-08-13 06:55:17'),
(84, 'rem', 8, 0, 1, '2018-08-13 06:55:17', '2018-08-13 06:55:17'),
(85, 'consectetur', 7, 0, 1, '2018-08-13 06:55:17', '2018-08-13 06:55:17'),
(86, 'voluptatem', 4, 0, 1, '2018-08-13 06:55:17', '2018-08-13 06:55:17'),
(87, 'est', 8, 0, 1, '2018-08-13 06:55:17', '2018-08-13 06:55:17'),
(88, 'laborum', 3, 0, 1, '2018-08-13 06:55:17', '2018-08-13 06:55:17'),
(89, 'quaerat', 5, 0, 1, '2018-08-13 06:55:17', '2018-08-13 06:55:17'),
(90, 'inventore', 10, 0, 1, '2018-08-13 06:55:17', '2018-08-13 06:55:17'),
(91, 'voluptates', 2, 0, 1, '2018-08-13 06:55:17', '2018-08-13 06:55:17'),
(92, 'ex', 2, 0, 1, '2018-08-13 06:55:17', '2018-08-13 06:55:17'),
(93, 'sunt', 9, 0, 1, '2018-08-13 06:55:17', '2018-08-13 06:55:17'),
(94, 'molestias', 2, 0, 1, '2018-08-13 06:55:17', '2018-08-13 06:55:17'),
(95, 'deleniti', 5, 0, 1, '2018-08-13 06:55:17', '2018-08-13 06:55:17'),
(96, 'exercitationem', 5, 0, 1, '2018-08-13 06:55:17', '2018-08-13 06:55:17'),
(97, 'dolorem', 4, 0, 1, '2018-08-13 06:55:17', '2018-08-13 06:55:17'),
(98, 'rerum', 7, 0, 1, '2018-08-13 06:55:17', '2018-08-13 06:55:17'),
(99, 'rerum', 3, 0, 1, '2018-08-13 06:55:17', '2018-08-13 06:55:17'),
(100, 'ipsam', 8, 0, 1, '2018-08-13 06:55:17', '2018-08-13 06:55:17'),
(101, 'mollitia', 2, 0, 1, '2018-08-13 06:55:17', '2018-08-13 06:55:17'),
(102, 'ad', 5, 0, 1, '2018-08-13 06:55:17', '2018-08-13 06:55:17'),
(103, 'nobis', 6, 0, 1, '2018-08-13 06:55:17', '2018-08-13 06:55:17'),
(104, 'omnis', 7, 0, 1, '2018-08-13 06:55:17', '2018-08-13 06:55:17'),
(105, 'quis', 11, 0, 1, '2018-08-13 06:55:17', '2018-08-13 06:55:17'),
(106, 'natus', 1, 0, 1, '2018-08-13 06:55:17', '2018-08-13 06:55:17'),
(107, 'sunt', 5, 0, 1, '2018-08-13 06:55:17', '2018-08-13 06:55:17'),
(108, 'ea', 5, 0, 1, '2018-08-13 06:55:17', '2018-08-13 06:55:17'),
(109, 'similique', 5, 0, 1, '2018-08-13 06:55:17', '2018-08-13 06:55:17'),
(110, 'quisquam', 11, 0, 1, '2018-08-13 06:55:17', '2018-08-13 06:55:17'),
(111, 'magnam', 12, 0, 1, '2018-08-13 06:55:17', '2018-08-13 06:55:17'),
(112, 'voluptatibus', 4, 0, 1, '2018-08-13 06:55:17', '2018-08-13 06:55:17'),
(113, 'repellat', 8, 0, 1, '2018-08-13 06:55:17', '2018-08-13 06:55:17'),
(114, 'in', 3, 0, 1, '2018-08-13 06:55:17', '2018-08-13 06:55:17'),
(115, 'aliquid', 10, 0, 1, '2018-08-13 06:55:17', '2018-08-13 06:55:17'),
(116, 'itaque', 3, 0, 1, '2018-08-13 06:55:17', '2018-08-13 06:55:17'),
(117, 'sunt', 7, 0, 1, '2018-08-13 06:55:17', '2018-08-13 06:55:17'),
(118, 'aliquid', 4, 0, 1, '2018-08-13 06:55:17', '2018-08-13 06:55:17'),
(119, 'magni', 7, 0, 1, '2018-08-13 06:55:17', '2018-08-13 06:55:17'),
(120, 'ut', 6, 0, 1, '2018-08-13 06:55:17', '2018-08-13 06:55:17'),
(121, 'est', 7, 0, 1, '2018-08-15 08:16:53', '2018-08-15 08:16:53'),
(122, 'quasi', 10, 0, 1, '2018-08-15 08:16:53', '2018-08-15 08:16:53'),
(123, 'sunt', 4, 0, 1, '2018-08-15 08:16:53', '2018-08-15 08:16:53'),
(124, 'libero', 6, 0, 1, '2018-08-15 08:16:53', '2018-08-15 08:16:53'),
(125, 'quia', 8, 0, 1, '2018-08-15 08:16:53', '2018-08-15 08:16:53'),
(126, 'voluptatem', 12, 0, 1, '2018-08-15 08:16:53', '2018-08-15 08:16:53'),
(127, 'adipisci', 11, 0, 1, '2018-08-15 08:16:53', '2018-08-15 08:16:53'),
(128, 'sit', 1, 0, 1, '2018-08-15 08:16:53', '2018-08-15 08:16:53'),
(129, 'repudiandae', 2, 0, 1, '2018-08-15 08:16:53', '2018-08-15 08:16:53'),
(130, 'commodi', 5, 0, 1, '2018-08-15 08:16:53', '2018-08-15 08:16:53'),
(131, 'sed', 1, 0, 1, '2018-08-15 08:16:53', '2018-08-15 08:16:53'),
(132, 'repellendus', 5, 0, 1, '2018-08-15 08:16:53', '2018-08-15 08:16:53'),
(133, 'eveniet', 10, 0, 1, '2018-08-15 08:16:53', '2018-08-15 08:16:53'),
(134, 'praesentium', 4, 0, 1, '2018-08-15 08:16:53', '2018-08-15 08:16:53'),
(135, 'amet', 9, 0, 1, '2018-08-15 08:16:53', '2018-08-15 08:16:53'),
(136, 'fugit', 8, 0, 1, '2018-08-15 08:16:53', '2018-08-15 08:16:53'),
(137, 'iste', 6, 0, 1, '2018-08-15 08:16:53', '2018-08-15 08:16:53'),
(138, 'perferendis', 5, 0, 1, '2018-08-15 08:16:53', '2018-08-15 08:16:53'),
(139, 'et', 9, 0, 1, '2018-08-15 08:16:53', '2018-08-15 08:16:53'),
(140, 'officia', 10, 0, 1, '2018-08-15 08:16:53', '2018-08-15 08:16:53'),
(141, 'blanditiis', 6, 0, 1, '2018-08-15 08:16:53', '2018-08-15 08:16:53'),
(142, 'voluptas', 12, 0, 1, '2018-08-15 08:16:53', '2018-08-15 08:16:53'),
(143, 'ullam', 7, 0, 1, '2018-08-15 08:16:53', '2018-08-15 08:16:53'),
(144, 'ut', 12, 0, 1, '2018-08-15 08:16:53', '2018-08-15 08:16:53'),
(145, 'ea', 1, 0, 1, '2018-08-15 08:16:53', '2018-08-15 08:16:53'),
(146, 'vitae', 12, 0, 1, '2018-08-15 08:16:53', '2018-08-15 08:16:53'),
(147, 'quod', 1, 0, 1, '2018-08-15 08:16:53', '2018-08-15 08:16:53'),
(148, 'ex', 4, 0, 1, '2018-08-15 08:16:53', '2018-08-15 08:16:53'),
(149, 'quaerat', 4, 0, 1, '2018-08-15 08:16:53', '2018-08-15 08:16:53'),
(150, 'quasi', 1, 0, 1, '2018-08-15 08:16:53', '2018-08-15 08:16:53'),
(151, 'porro', 9, 0, 1, '2018-08-15 08:16:53', '2018-08-15 08:16:53'),
(152, 'minus', 8, 0, 1, '2018-08-15 08:16:53', '2018-08-15 08:16:53'),
(153, 'accusantium', 10, 0, 1, '2018-08-15 08:16:53', '2018-08-15 08:16:53'),
(154, 'fugiat', 2, 0, 1, '2018-08-15 08:16:53', '2018-08-15 08:16:53'),
(155, 'aliquid', 5, 0, 1, '2018-08-15 08:16:53', '2018-08-15 08:16:53'),
(156, 'voluptatem', 1, 0, 1, '2018-08-15 08:16:53', '2018-08-15 08:16:53'),
(157, 'ut', 7, 0, 1, '2018-08-15 08:16:53', '2018-08-15 08:16:53'),
(158, 'iste', 4, 0, 1, '2018-08-15 08:16:53', '2018-08-15 08:16:53'),
(159, 'asperiores', 7, 0, 1, '2018-08-15 08:16:53', '2018-08-15 08:16:53'),
(160, 'ipsa', 5, 0, 1, '2018-08-15 08:16:53', '2018-08-15 08:16:53'),
(161, 'magni', 2, 0, 1, '2018-08-15 08:16:53', '2018-08-15 08:16:53'),
(162, 'cumque', 1, 0, 1, '2018-08-15 08:16:53', '2018-08-15 08:16:53'),
(163, 'quibusdam', 9, 0, 1, '2018-08-15 08:16:53', '2018-08-15 08:16:53'),
(164, 'enim', 12, 0, 1, '2018-08-15 08:16:53', '2018-08-15 08:16:53'),
(165, 'quo', 12, 0, 1, '2018-08-15 08:16:53', '2018-08-15 08:16:53'),
(166, 'praesentium', 10, 0, 1, '2018-08-15 08:16:53', '2018-08-15 08:16:53'),
(167, 'sit', 5, 0, 1, '2018-08-15 08:16:53', '2018-08-15 08:16:53'),
(168, 'ut', 7, 0, 1, '2018-08-15 08:16:53', '2018-08-15 08:16:53'),
(169, 'quod', 12, 0, 1, '2018-08-15 08:16:53', '2018-08-15 08:16:53'),
(170, 'qui', 2, 0, 1, '2018-08-15 08:16:53', '2018-08-15 08:16:53'),
(171, 'nam', 7, 0, 1, '2018-08-15 08:16:53', '2018-08-15 08:16:53'),
(172, 'nemo', 11, 0, 1, '2018-08-15 08:16:53', '2018-08-15 08:16:53'),
(173, 'dolores', 7, 0, 1, '2018-08-15 08:16:53', '2018-08-15 08:16:53'),
(174, 'nemo', 3, 0, 1, '2018-08-15 08:16:53', '2018-08-15 08:16:53'),
(175, 'explicabo', 6, 0, 1, '2018-08-15 08:16:53', '2018-08-15 08:16:53'),
(176, 'earum', 10, 0, 1, '2018-08-15 08:16:53', '2018-08-15 08:16:53'),
(177, 'magni', 10, 0, 1, '2018-08-15 08:16:53', '2018-08-15 08:16:53'),
(178, 'corrupti', 10, 0, 1, '2018-08-15 08:16:53', '2018-08-15 08:16:53'),
(179, 'voluptas', 7, 0, 1, '2018-08-15 08:16:53', '2018-08-15 08:16:53'),
(180, 'ipsam', 10, 0, 1, '2018-08-15 08:16:53', '2018-08-15 08:16:53');

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(250) CHARACTER SET utf8 NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'การเขียนโปรแกรมภาษาซี', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subject_tests`
--

CREATE TABLE `subject_tests` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(250) CHARACTER SET utf8 NOT NULL,
  `type` int(10) UNSIGNED NOT NULL,
  `subject_id` int(10) UNSIGNED NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subject_tests`
--

INSERT INTO `subject_tests` (`id`, `name`, `type`, `subject_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'แบบทดสอบก่อนเรียน111222', 1, 1, 1, '2018-08-15 08:45:46', '2018-08-18 03:45:23'),
(2, 'แบบทดสอบบหลังบทเรียน', 2, 1, 1, '2018-08-15 08:46:34', '2018-08-18 02:51:29');

-- --------------------------------------------------------

--
-- Table structure for table `tests`
--

CREATE TABLE `tests` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(250) CHARACTER SET utf8 NOT NULL,
  `type` int(10) UNSIGNED NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tests`
--

INSERT INTO `tests` (`id`, `name`, `type`, `status`, `created_at`, `updated_at`) VALUES
(1, 'maxime', 1, 1, '2018-08-13 06:04:06', '2018-08-13 06:04:06'),
(2, 'labore', 2, 1, '2018-08-13 06:04:06', '2018-08-13 06:04:06'),
(3, 'sint', 3, 1, '2018-08-13 06:04:06', '2018-08-13 06:04:06'),
(4, 'eos', 3, 1, '2018-08-13 06:04:06', '2018-08-13 06:04:06'),
(5, 'voluptate', 3, 1, '2018-08-13 06:04:06', '2018-08-13 06:04:06'),
(6, 'quas', 3, 1, '2018-08-13 06:04:06', '2018-08-13 06:04:06'),
(7, 'repudiandae', 3, 1, '2018-08-13 06:04:06', '2018-08-13 06:04:06'),
(8, 'blanditiis', 4, 1, '2018-08-13 06:04:06', '2018-08-13 06:04:06'),
(9, 'in', 4, 1, '2018-08-13 06:04:06', '2018-08-13 06:04:06'),
(10, 'quia', 4, 1, '2018-08-13 06:04:06', '2018-08-13 06:04:06'),
(11, 'enim', 4, 1, '2018-08-13 06:04:06', '2018-08-13 06:04:06'),
(12, 'qui', 4, 1, '2018-08-13 06:04:06', '2018-08-13 06:04:06');

-- --------------------------------------------------------

--
-- Table structure for table `test_models`
--

CREATE TABLE `test_models` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `topics`
--

CREATE TABLE `topics` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(250) CHARACTER SET utf8 NOT NULL,
  `article_id` int(10) UNSIGNED NOT NULL,
  `detail` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `topics`
--

INSERT INTO `topics` (`id`, `name`, `article_id`, `detail`, `status`, `created_at`, `updated_at`) VALUES
(1, 'architecto', 1, 'Porro fugiat deleniti atque excepturi non consectetur nobis. Commodi reiciendis quasi itaque cumque repudiandae. Porro cum laudantium eligendi.', 1, '2018-08-12 10:05:25', '2018-08-12 10:05:25'),
(2, 'vitae', 3, 'Nam ipsum autem ut laudantium veritatis minima. Et exercitationem sed incidunt corrupti sed. Velit dolorum officia asperiores ea voluptatem voluptatum.', 1, '2018-08-12 10:05:25', '2018-08-12 10:05:25'),
(3, 'expedita', 4, 'Quidem earum ea assumenda laudantium cupiditate dolor. Natus sunt nobis explicabo eligendi debitis sed. Nesciunt inventore laudantium consequatur praesentium. Temporibus incidunt quia dicta sit. Velit sunt architecto corrupti.', 1, '2018-08-12 10:05:25', '2018-08-12 10:05:25'),
(4, 'dolores', 1, 'Rem dolorem quia magnam autem voluptatem. Quae harum nulla dolore natus sit ipsam assumenda. Non praesentium nemo facere labore mollitia aut sint. Fugiat tempora optio odit occaecati non consequuntur omnis.', 1, '2018-08-12 10:05:25', '2018-08-12 10:05:25'),
(5, 'commodi', 3, 'Recusandae enim aliquam mollitia quas iusto rem sit. Et nam atque id est. Eligendi dolor doloribus ullam blanditiis.', 1, '2018-08-12 10:05:25', '2018-08-12 10:05:25'),
(6, 'et', 1, 'Non ipsam ab velit eum vero odio id. Nulla repellat iure quia repellendus. Et eveniet fuga quam est.', 1, '2018-08-12 10:05:25', '2018-08-12 10:05:25'),
(7, 'rerum', 2, 'Dolore perspiciatis occaecati earum ut et. Et et laboriosam totam et non dolores. Est cum mollitia in quia quibusdam. Amet suscipit enim fugit porro minima.', 1, '2018-08-12 10:05:25', '2018-08-12 10:05:25'),
(8, 'tempore', 4, 'Qui quia qui non sapiente molestiae. Nihil iure reiciendis sunt eos explicabo. Aut optio est fugiat hic natus.', 1, '2018-08-12 10:05:25', '2018-08-12 10:05:25'),
(9, 'fugiat', 2, 'Deserunt ut qui nihil corrupti. Ipsam ab atque totam quos. Ipsum sapiente accusantium ad voluptas corporis. Molestias ad ut enim vel quia exercitationem.', 1, '2018-08-12 10:05:25', '2018-08-12 10:05:25'),
(10, 'nihil', 5, 'Qui maxime sapiente eos totam aliquid qui dolore. Minima ducimus libero voluptas aliquid a sit sunt. Laudantium voluptates error impedit officia. Quisquam enim provident sit mollitia voluptas dolores hic ipsa.', 1, '2018-08-12 10:05:25', '2018-08-12 10:05:25'),
(11, 'quisquam', 4, 'Nostrum voluptatum et eveniet aperiam qui officia earum nam. Accusantium ipsam sint numquam. Eveniet at expedita amet odit. Sed excepturi voluptas officia sapiente sequi ipsum.', 1, '2018-08-12 10:05:25', '2018-08-12 10:05:25'),
(12, 'quia', 4, 'Labore eveniet eaque a veritatis quod animi est aut. Culpa aliquid totam est quaerat a. Praesentium sequi rerum quas optio assumenda.', 1, '2018-08-12 10:05:25', '2018-08-12 10:05:25'),
(13, 'dicta', 4, 'Ad ut vitae aperiam non praesentium optio. Illum accusantium dolores possimus facere architecto. Error aut excepturi illum itaque perspiciatis.', 1, '2018-08-12 10:05:25', '2018-08-12 10:05:25'),
(14, 'eos', 4, 'Iste quia quia perspiciatis est culpa sint. Enim similique quia reiciendis accusantium officia quos praesentium. Sapiente minus dolores expedita maiores ipsam consectetur adipisci.', 1, '2018-08-12 10:05:25', '2018-08-12 10:05:25'),
(15, 'optio', 5, 'Aut voluptatibus debitis ex ea et aut et. Harum omnis dolorum dignissimos soluta ipsa. Velit eos et cumque qui numquam. Veniam ut sit maxime enim ad laboriosam.', 1, '2018-08-12 10:05:25', '2018-08-12 10:05:25'),
(16, 'id', 2, 'Dolor eligendi harum ut quae. Ut rem impedit aliquam totam. Ratione ex mollitia ab asperiores id ad omnis. Distinctio ab voluptate minus voluptas dolore.', 1, '2018-08-12 10:05:25', '2018-08-12 10:05:25'),
(17, 'rerum', 2, 'Assumenda est sed tempora voluptates veniam qui libero. Ullam iure et natus repudiandae reiciendis dolores. Aperiam dicta assumenda aut velit neque.', 1, '2018-08-12 10:05:25', '2018-08-12 10:05:25'),
(18, 'eaque', 1, 'Temporibus culpa labore sed aut ea. Sint est maiores iusto totam aperiam quia sed. Amet eos dolores nihil assumenda reprehenderit et.', 1, '2018-08-12 10:05:25', '2018-08-12 10:05:25'),
(19, 'rerum', 5, 'Illum asperiores similique non error iure. Ipsa non et adipisci eveniet laudantium voluptatem. Asperiores aut et accusamus ea quae illo.', 1, '2018-08-12 10:05:25', '2018-08-12 10:05:25'),
(20, 'nobis', 1, 'Iusto totam enim quis quas qui fugiat quis. Esse dolorem natus aspernatur magnam voluptatum numquam odit. Aut suscipit ut eaque tenetur amet. Eos id sint eius officia optio.', 1, '2018-08-12 10:05:25', '2018-08-12 10:05:25'),
(23, 'หัวข้อที่ 1.1', 6, 'รายละเอียด หัวข้อที่ 1.1', 1, '2018-08-16 10:52:39', '2018-08-16 10:52:39');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'ttt', 'ttt@ttt.com', '$2y$10$QPteDh.R9L.AEnkVaALtNuqOn.1/YQs2f.BwrJdLmPM80Wva7LipO', 'NxLxKvZHqsRxsoQnnGHzRttyTJEchj5xS0KoNFnVIX4ZWsBgADM604ahFG7C', '2018-08-13 05:00:08', '2018-08-13 05:00:08');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `articles_subject_id_index` (`subject_id`);

--
-- Indexes for table `article_tests`
--
ALTER TABLE `article_tests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `article_tests_article_id_foreign` (`article_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `options_question_id_index` (`question_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `questions_test_id_index` (`test_id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subject_tests`
--
ALTER TABLE `subject_tests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subject_tests_subject_id_foreign` (`subject_id`);

--
-- Indexes for table `tests`
--
ALTER TABLE `tests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `test_models`
--
ALTER TABLE `test_models`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `topics`
--
ALTER TABLE `topics`
  ADD PRIMARY KEY (`id`),
  ADD KEY `topics_article_id_index` (`article_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `articles`
--
ALTER TABLE `articles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `article_tests`
--
ALTER TABLE `article_tests`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `options`
--
ALTER TABLE `options`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=181;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `subject_tests`
--
ALTER TABLE `subject_tests`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tests`
--
ALTER TABLE `tests`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `test_models`
--
ALTER TABLE `test_models`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `topics`
--
ALTER TABLE `topics`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `articles`
--
ALTER TABLE `articles`
  ADD CONSTRAINT `articles_subject_id_foreign` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `article_tests`
--
ALTER TABLE `article_tests`
  ADD CONSTRAINT `article_tests_article_id_foreign` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `options`
--
ALTER TABLE `options`
  ADD CONSTRAINT `options_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `questions_test_id_foreign` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `subject_tests`
--
ALTER TABLE `subject_tests`
  ADD CONSTRAINT `subject_tests_subject_id_foreign` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `topics`
--
ALTER TABLE `topics`
  ADD CONSTRAINT `topics_article_id_foreign` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
