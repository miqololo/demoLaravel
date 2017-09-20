-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Июл 17 2017 г., 11:38
-- Версия сервера: 10.1.9-MariaDB
-- Версия PHP: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `demoapp`
--
CREATE DATABASE IF NOT EXISTS `demoapp` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `demoapp`;

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2017_07_16_002327_create_permission_tables', 1),
(4, '2017_07_16_173530_add_username_field_to_users_table', 1),
(7, '2017_07_16_220702_add_description_to_users_table', 2),
(9, '2017_07_16_224146_create_sessions_table', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'create', '2017-07-19 19:00:00', '2017-07-02 19:00:00'),
(2, 'edit', '2017-07-15 19:00:00', '2017-07-15 19:00:00'),
(3, 'delete', '2017-07-15 19:00:00', '2017-07-15 19:00:00'),
(4, 'status', '2017-07-15 19:00:00', '2017-07-15 19:00:00');

-- --------------------------------------------------------

--
-- Структура таблицы `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'super_admin', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('NjpQzTAiTgRBpenGXO34BWHy8Y0Q1MNUyDhEQwGt', 2, '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoicHplRmRUSFVoUXh5SHpuT3dwczhWbmhqSXluMFJSVXQ5ejBsUmhlYiI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjUyOiJodHRwOi8vbG9jYWxob3N0L2RlbW9BcHBsaWNhdGlvbi9wdWJsaWMvdXNlcnM/cGFnZT0yIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6Mjt9', 1500283271);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `password`, `remember_token`, `created_at`, `updated_at`, `username`, `active`, `first_name`, `last_name`, `description`) VALUES
(2, '$2y$10$XtGBWIzD9rZK3jLwCp.tbu0itO8V0tlzZNELqv8WAulKdxlCzLS96', 'KZ7aYbXlY1ak8I7SxOK8PyGYPqRi3Wfc3RnKNpXSFeSChm7ORacYYRmTL0U5', '2017-07-16 14:23:32', '2017-07-16 17:27:16', 'admin', 1, 'Admin', 'Admin', 'fdsfsfdgfdsgfdg'),
(3, '$2y$10$Fm46q6Y8O6tpycLqpIZLbue5TX3D3I4dttiSvZxLl/Hirjp44uANu', '9fCEbX0XsTNZgTNHQefdIehgz01ZsXcu3KV9j1dWCCScArss4Fy1USvkBzJS', '2017-07-16 14:26:21', '2017-07-16 15:26:27', 'user', 1, 'User', 'User', NULL),
(6, '$2y$10$eALW/OlgflFQgiqhGlZxXONN3qQxsRhBAvYTjaTEQRS/69v3J7r1i', NULL, '2017-07-16 15:28:24', '2017-07-16 15:28:24', 'user2', 0, 'Disabled', 'User', NULL),
(7, '$2y$10$uHjSZqg4lKi0ybCjBoVjHeSSWNTD2bAcTxtqD3WogTUH3stOxttc2', '6w0bBqbEoXZyPMDJiravBdzuZI5gcXR9WblvqTlgcALhev5u75rwXe3QbHbO', '2017-07-16 09:23:32', '2017-07-16 10:26:06', 'admin2', 1, 'Admin2', 'Admin2', NULL),
(8, '$2y$10$Fm46q6Y8O6tpycLqpIZLbue5TX3D3I4dttiSvZxLl/Hirjp44uANu', '9fCEbX0XsTNZgTNHQefdIehgz01ZsXcu3KV9j1dWCCScArss4Fy1USvkBzJS', '2017-07-16 09:26:21', '2017-07-16 10:26:27', 'user3', 1, 'User3', 'User', NULL),
(9, '$2y$10$eALW/OlgflFQgiqhGlZxXONN3qQxsRhBAvYTjaTEQRS/69v3J7r1i', NULL, '2017-07-16 10:28:24', '2017-07-16 10:28:24', 'user4', 0, 'Disabled', 'User', NULL),
(10, '$2y$10$uHjSZqg4lKi0ybCjBoVjHeSSWNTD2bAcTxtqD3WogTUH3stOxttc2', '6w0bBqbEoXZyPMDJiravBdzuZI5gcXR9WblvqTlgcALhev5u75rwXe3QbHbO', '2017-07-16 09:23:32', '2017-07-16 10:26:06', 'admin3', 1, 'Admin2', 'Admin2', NULL),
(11, '$2y$10$Fm46q6Y8O6tpycLqpIZLbue5TX3D3I4dttiSvZxLl/Hirjp44uANu', '9fCEbX0XsTNZgTNHQefdIehgz01ZsXcu3KV9j1dWCCScArss4Fy1USvkBzJS', '2017-07-16 09:26:21', '2017-07-16 10:26:27', 'user545', 1, 'User3', 'User', NULL),
(12, '$2y$10$eALW/OlgflFQgiqhGlZxXONN3qQxsRhBAvYTjaTEQRS/69v3J7r1i', NULL, '2017-07-16 10:28:24', '2017-07-16 10:28:24', 'user45', 0, 'Disabled', 'User', NULL),
(13, '$2y$10$uHjSZqg4lKi0ybCjBoVjHeSSWNTD2bAcTxtqD3WogTUH3stOxttc2', '6w0bBqbEoXZyPMDJiravBdzuZI5gcXR9WblvqTlgcALhev5u75rwXe3QbHbO', '2017-07-16 09:23:32', '2017-07-16 10:26:06', 'admin72', 1, 'Admin2', 'Admin2', NULL),
(14, '$2y$10$Fm46q6Y8O6tpycLqpIZLbue5TX3D3I4dttiSvZxLl/Hirjp44uANu', '9fCEbX0XsTNZgTNHQefdIehgz01ZsXcu3KV9j1dWCCScArss4Fy1USvkBzJS', '2017-07-16 09:26:21', '2017-07-16 10:26:27', 'user375', 1, 'User3', 'User', NULL),
(15, '$2y$10$eALW/OlgflFQgiqhGlZxXONN3qQxsRhBAvYTjaTEQRS/69v3J7r1i', NULL, '2017-07-16 10:28:24', '2017-07-16 10:28:24', 'user467', 0, 'Disabled', 'User', NULL),
(16, '$2y$10$uHjSZqg4lKi0ybCjBoVjHeSSWNTD2bAcTxtqD3WogTUH3stOxttc2', '6w0bBqbEoXZyPMDJiravBdzuZI5gcXR9WblvqTlgcALhev5u75rwXe3QbHbO', '2017-07-16 09:23:32', '2017-07-16 10:26:06', 'admin2ee', 1, 'Admin2', 'Admin2', NULL),
(17, '$2y$10$Fm46q6Y8O6tpycLqpIZLbue5TX3D3I4dttiSvZxLl/Hirjp44uANu', '9fCEbX0XsTNZgTNHQefdIehgz01ZsXcu3KV9j1dWCCScArss4Fy1USvkBzJS', '2017-07-16 09:26:21', '2017-07-16 10:26:27', 'user3qwe', 1, 'User3', 'User', NULL),
(18, '$2y$10$eALW/OlgflFQgiqhGlZxXONN3qQxsRhBAvYTjaTEQRS/69v3J7r1i', NULL, '2017-07-16 10:28:24', '2017-07-16 10:28:24', 'user4ewr', 0, 'Disabled', 'User', NULL),
(19, '$2y$10$uHjSZqg4lKi0ybCjBoVjHeSSWNTD2bAcTxtqD3WogTUH3stOxttc2', 'sgKYwykT6x9J9kkV7ApyYBs4f6lHZdIYZhmkeoNqIkTYRXmJVO4aVPfY1vU8', '2017-07-16 17:15:54', '2017-07-16 17:15:54', 'gago', 1, 'dfadfdsfasd', 'dfsgdsfgfdsg', NULL),
(24, '$2y$10$1sUjbKngij0AsPuYoGug4OJhIN23Us6TqDrCOXGGcYjuQO/kh2H0.', '602eHpKQbquwME1G8f0ecHZodnsOE84ZLMbg6bnxrujI3m0tHVw9RWgjXBI6', '2017-07-16 17:26:03', '2017-07-16 17:26:03', 'miqololo', 1, 'Mikayel', 'Galstyan', NULL),
(25, '$2y$10$SUhzTkvoz9p7ib4wH3VwIeaJdkCfhXoSUFZJrH28jrTju4E.8rU7G', NULL, '2017-07-17 04:35:53', '2017-07-17 04:35:53', 'novella11', 0, 'Tara', 'Hilll', NULL),
(26, '$2y$10$H5wZh5UbH1i3AbjaFxkY5uX1eTLCMGAf5tpkgOs4BnwwNOrigeL3q', NULL, '2017-07-17 04:35:53', '2017-07-17 04:35:53', 'maribel.crist', 0, 'Cyril', 'Hagenes', NULL),
(27, '$2y$10$UaB66J9LSYA/hnNlqXvMV.IecAdqxJR5zE1vHgSZrcKfwQLae3FGK', NULL, '2017-07-17 04:35:54', '2017-07-17 04:35:54', 'mitchell.kelley', 0, 'Giovani', 'Gerlach', NULL),
(28, '$2y$10$I9tz5gN0Rw1bDFN/jSks3.lA3J5plKST7wpWHOBhGrhmLgG.JhJ8e', NULL, '2017-07-17 04:35:54', '2017-07-17 04:35:54', 'otho75', 0, 'Noble', 'Cole', NULL),
(29, '$2y$10$o.KUvC8C83p3DIjYHgRamO3j/n1tCPbfkNgnJMk7tLmbJ32ON.beO', NULL, '2017-07-17 04:35:54', '2017-07-17 04:35:54', 'ldicki', 0, 'Greyson', 'Bartell', NULL),
(30, '$2y$10$z5G03IoyfAsxBQqfkUlZQOixH8WVTXThwRcPOBfXVqUwjy8JJrb2.', NULL, '2017-07-17 04:35:54', '2017-07-17 04:35:54', 'emily.bergnaum', 0, 'Rose', 'Steuber', NULL),
(31, '$2y$10$NqxdVE5A/IC4g/Kz20Nt.O9qKgN86xlMaBMvZIeO9zljY1ut4uzxG', NULL, '2017-07-17 04:35:54', '2017-07-17 04:35:54', 'grimes.maximillian', 0, 'Wilhelm', 'Gutkowski', NULL),
(32, '$2y$10$gKKHAQKFOUsqDpyCqMYJUuNZJsHABlOP7ckwBVu4CtkVIsX.Wwbs6', NULL, '2017-07-17 04:35:55', '2017-07-17 04:35:55', 'white.maxie', 0, 'Hunter', 'Paucek', NULL),
(33, '$2y$10$gi5TG9r1HfUsikTJPasvEe/Xjf6wo34n4zWIv.ZcjbkfpfkHCExP.', NULL, '2017-07-17 04:35:55', '2017-07-17 04:35:55', 'jess.turner', 0, 'Kathlyn', 'Zemlak', NULL),
(34, '$2y$10$aMeyvrD7/nJLNsV5NHpgG.fcJPb4HL7zrCyddQ0b8PGfPivzMKqRe', NULL, '2017-07-17 04:35:55', '2017-07-17 04:35:55', 'lhilll', 0, 'Magnolia', 'Kuvalis', NULL),
(35, '$2y$10$33SaGhxeSPaWEF49ASXbwuuDH.xGm421SDvSeaK56A81RGDtmncsm', NULL, '2017-07-17 04:35:55', '2017-07-17 04:35:55', 'dubuque.ernesto', 0, 'Mozell', 'O''Conner', NULL),
(36, '$2y$10$pbYjFcHCNiQw0yHEG4mhVenYKYs2UGvoJzmsw1rXq4M5fduTM9mDW', NULL, '2017-07-17 04:35:55', '2017-07-17 04:35:55', 'elfrieda16', 0, 'Bartholome', 'Schimmel', NULL),
(37, '$2y$10$y21PRq41If2tf.M.qcPr6uB5.5p/lNhgv6zScYD8OBoWG/uJRSKfC', NULL, '2017-07-17 04:35:55', '2017-07-17 04:35:55', 'heather18', 0, 'Maximillia', 'Hand', NULL),
(38, '$2y$10$A/dkIweELq1Z2rCxTR5CHOIVMGmpHiqKykkZsT/qt8W/lclBtOqp2', NULL, '2017-07-17 04:35:56', '2017-07-17 04:35:56', 'clarissa37', 0, 'Emilio', 'Blick', NULL),
(39, '$2y$10$VyjFGm4IcS9eLY/T1j9aRe4MoK.DVk6ZZuMmPoVtrUSNUl52Pco4a', NULL, '2017-07-17 04:35:56', '2017-07-17 04:35:56', 'wkris', 0, 'Audrey', 'Hilpert', NULL),
(40, '$2y$10$QumFA9jQY0MF3XoQ3kNX7OrU6xt3gOGQNTw9/sEm8s9dAnCL6mGWa', NULL, '2017-07-17 04:35:56', '2017-07-17 04:35:56', 'declan.reichel', 0, 'Katelin', 'Rowe', NULL),
(41, '$2y$10$VTCbQVgCkrFEHXgvZp20c.vDIXi8Lx5SGOCLi.qTEDymTfzG7e3pq', NULL, '2017-07-17 04:35:56', '2017-07-17 04:35:56', 'gregoria80', 0, 'Winifred', 'Bartoletti', NULL),
(42, '$2y$10$lUAk.8UM.94x69C3gK2UserT2z9pBeV1FMcZPD1etd4HfQ63u1EFC', NULL, '2017-07-17 04:35:56', '2017-07-17 04:35:56', 'oswaldo.auer', 0, 'Malinda', 'Hermiston', NULL),
(43, '$2y$10$8CDgXeUNqBtBQuoo0K1bfOiOkDi.1ZC7.S77RMoCnifjqxgJDi1zm', NULL, '2017-07-17 04:35:56', '2017-07-17 04:35:56', 'emills', 0, 'Tillman', 'Raynor', NULL),
(44, '$2y$10$24/sEkmhrSpPFqb8Q/LNIOZicVO/18P58IlLr6s0GW/A16Bh1SkjK', NULL, '2017-07-17 04:35:57', '2017-07-17 04:35:57', 'alene69', 0, 'Gregg', 'Swift', NULL),
(45, '$2y$10$GaQuq/OgQ5sZfbwO/X6Nyudg6Tdd7tl1xK8oaxkfGXsrTPU17Is86', NULL, '2017-07-17 04:35:57', '2017-07-17 04:35:57', 'johanna20', 0, 'Malika', 'Wehner', NULL),
(46, '$2y$10$CCP2FvoH7Ka.dhWAyn9BaeqnDj0R.Ate4GEkvNgdq1j1ihoFBEyPq', NULL, '2017-07-17 04:35:57', '2017-07-17 04:35:57', 'howe.jack', 0, 'Marc', 'Crooks', NULL),
(47, '$2y$10$VPqync8YhOItDqdOXBjWw.2hsxumKWXq433.rD8dMR2.Fz44C/4aa', NULL, '2017-07-17 04:35:57', '2017-07-17 04:35:57', 'damore.kyler', 0, 'Chesley', 'Jacobi', NULL),
(48, '$2y$10$hp1lEpph40g0M7/gL7BWAeaS.n8ww9RsdWLzE8FLXgctyR3/2OERS', NULL, '2017-07-17 04:35:57', '2017-07-17 04:35:57', 'lhaley', 0, 'Calista', 'Sauer', NULL),
(49, '$2y$10$Z2YNLPutQ8vA.U4iEOJsyO6UyyZka/qw./oI.7LloBU9LhvtFB87C', NULL, '2017-07-17 04:35:57', '2017-07-17 04:35:57', 'kuvalis.thad', 0, 'Llewellyn', 'Klocko', NULL),
(50, '$2y$10$NkYUjwKRGc4vEMymnuEdseQEqRouFObvqihgsKvED8912C9e/i7ha', NULL, '2017-07-17 04:35:58', '2017-07-17 04:35:58', 'arvel.ondricka', 0, 'Alex', 'Rutherford', NULL),
(51, '$2y$10$v7or3MbcSmm.a5ILKTQUGOV1t7AiV43G7db8MvgJMitof1se7GLs2', NULL, '2017-07-17 04:35:58', '2017-07-17 04:35:58', 'arlie11', 0, 'Verona', 'Frami', NULL),
(52, '$2y$10$.3ttIBHPTiHzOzq6uuC2FOPyr1vvCpUKYuowAlcbem.BYUaaKXFSa', NULL, '2017-07-17 04:35:58', '2017-07-17 04:35:58', 'rath.gaylord', 0, 'Tracy', 'Dare', NULL),
(53, '$2y$10$6Z4ks0C1XoRVO59Y.Q01TuoW0vk2oylfLgei83Vn95782SjSRrxUG', NULL, '2017-07-17 04:35:58', '2017-07-17 04:35:58', 'schimmel.eusebio', 0, 'Autumn', 'Wolff', NULL),
(54, '$2y$10$tiSI67Fi7p2oGGrH/evgaOHwbBKRdTjCGDjSWuLZClW6XqYnOHo6e', NULL, '2017-07-17 04:35:58', '2017-07-17 04:35:58', 'twila.stehr', 0, 'Chaz', 'Torphy', NULL),
(55, '$2y$10$FtTu1kkFZjdY.NA1iVoqDOL.cdSpgY9nI9I5FrdY8w.o1NFAe2JAW', NULL, '2017-07-17 04:35:58', '2017-07-17 04:35:58', 'rbauch', 0, 'Adeline', 'Kutch', NULL),
(56, '$2y$10$e1qFWEgtdcBoBEtfALSW8.s1AbqGaZMF7T/sjtP/9lAJaWkNSw/oC', NULL, '2017-07-17 04:35:59', '2017-07-17 04:35:59', 'eden.kulas', 0, 'Yasmine', 'Bahringer', NULL),
(57, '$2y$10$23S1Js2657x4Rv6Hg4YV9ObsiKm1ZJrRYL54whFbgyBlBTQbVY/4y', NULL, '2017-07-17 04:35:59', '2017-07-17 04:35:59', 'andrew42', 0, 'Donavon', 'Lind', NULL),
(58, '$2y$10$KI7kNXEiwJLSc9OwmiecEuNoJG4L8l5Lx/WvVT2wlk24tw7Nb0q3W', NULL, '2017-07-17 04:35:59', '2017-07-17 04:35:59', 'trycia41', 0, 'Gregoria', 'Graham', NULL),
(59, '$2y$10$k.jD4r7bFx6zNpa.VLtEtOcipokbq35zVjVXxiuseRWXGV6g3TNO2', NULL, '2017-07-17 04:35:59', '2017-07-17 04:35:59', 'bmaggio', 0, 'Charlotte', 'Roberts', NULL),
(60, '$2y$10$VMuLfgtjIEAemIRtSy9YNOTrERpjKMglTklTD2qu0syIHOceXgCry', NULL, '2017-07-17 04:35:59', '2017-07-17 04:35:59', 'gustave.stokes', 0, 'Steve', 'Fritsch', NULL),
(61, '$2y$10$iCNfZC/IuZaMVbTkuMtC8exI6EUotmCY2ri5y5ZstHboGWmo5ZrZa', NULL, '2017-07-17 04:35:59', '2017-07-17 04:35:59', 'auer.noelia', 0, 'Brendon', 'Mayer', NULL),
(62, '$2y$10$8F91MpIqO5RH3sPQPEYQdOQJiOl0wmLYWeacE9UflbZjeSUZuq4jS', NULL, '2017-07-17 04:35:59', '2017-07-17 04:35:59', 'jorge.carroll', 0, 'Ramiro', 'Lemke', NULL),
(63, '$2y$10$aPei8Q0rCTAP87EAca7KfOhIVHJ/CdYPmkV1gdkxziZUdAwoCwaHO', NULL, '2017-07-17 04:36:00', '2017-07-17 04:36:00', 'qbogan', 0, 'Evangeline', 'Collins', NULL),
(64, '$2y$10$5ENyS8zfjPI9vvYfzFYR2eS8ufUcyt4on7ieimUYz71BZot2HOZ4C', NULL, '2017-07-17 04:36:00', '2017-07-17 04:36:00', 'maye.wilkinson', 0, 'Russel', 'Jakubowski', NULL),
(65, '$2y$10$BOQpoG2Ide8FmHvsdL6lUOG.ovOti.h7hmZPip45U1H9UaWhMVWSG', NULL, '2017-07-17 04:36:00', '2017-07-17 04:36:00', 'jdach', 0, 'Hailie', 'Brown', NULL),
(66, '$2y$10$YsP3AIZCWgDgkqwFE/ByHuvqDiIlXbAIdU0MqDD/O5AFX2P0vKZGS', NULL, '2017-07-17 04:36:00', '2017-07-17 04:36:00', 'jordan.mcglynn', 0, 'Julia', 'Pfannerstill', NULL),
(67, '$2y$10$aYXXKBivkpE3wMeVWNz.d.ka7RMnnGrZNVw.UbB2lImXT5w9fUA.a', NULL, '2017-07-17 04:36:00', '2017-07-17 04:36:00', 'watsica.dion', 0, 'Shanelle', 'Okuneva', NULL),
(68, '$2y$10$l6jal6emfuIr03Ci0.6VBe842XQrcEgGmjwBFPI5MecFniZnMRRfO', NULL, '2017-07-17 04:36:00', '2017-07-17 04:36:00', 'dhyatt', 0, 'Lawson', 'Gaylord', NULL),
(69, '$2y$10$jHyNq5LvVQ.O7vCr5mRFretWGwCBQ8q87O9eHX3rJ2phh.ipqdkK6', NULL, '2017-07-17 04:36:01', '2017-07-17 04:36:01', 'casimer64', 0, 'Wilfrid', 'Klocko', NULL),
(70, '$2y$10$ZaiTimDhRySuC./IRTb7ve3loF7Vz1G622MMEuGbkTMXo05q9fA5q', NULL, '2017-07-17 04:36:01', '2017-07-17 04:36:01', 'jaleel64', 0, 'Tad', 'Marvin', NULL),
(71, '$2y$10$POXamm6oyb1YBT8D8XXuBuj9tD/r1C4BdMCHFGOyumWlhU0zQQqLu', NULL, '2017-07-17 04:36:01', '2017-07-17 04:36:01', 'floyd.weber', 0, 'Heber', 'Marks', NULL),
(72, '$2y$10$t97uRXLI.ylqHPh9Z3GX/u/Ls8n0SYE07peyhWVBYWK4JKjcPH5cO', NULL, '2017-07-17 04:36:01', '2017-07-17 04:36:01', 'ethan04', 0, 'Freda', 'Parker', NULL),
(73, '$2y$10$IgkRN4OKzv4uggcqV70tzuHDxz/QiJf/D9mTbTmrzvRwYjbfFfo4m', NULL, '2017-07-17 04:36:01', '2017-07-17 04:36:01', 'bupton', 0, 'Velma', 'Yost', NULL),
(74, '$2y$10$kl7iBPPhzvoItPz/kY7fKemispU6F4RTIKmwIeOOdHMPIgjbNgGJu', NULL, '2017-07-17 04:36:01', '2017-07-17 04:36:01', 'gleichner.corine', 0, 'Adan', 'Bergnaum', NULL),
(75, '$2y$10$P4vyXWGoDV1W6V1d7uP05.zzuQNiLCAiiZ860GIUiLDgcPKVsMstO', NULL, '2017-07-17 04:36:02', '2017-07-17 04:36:02', 'ivy08', 0, 'Mae', 'Beier', NULL),
(76, '$2y$10$ItB4HX3V65hvvSsRHbMvI.4FoOZuQmvlGuSp2j7GgtKMv0nWNhZz6', NULL, '2017-07-17 04:36:02', '2017-07-17 04:36:02', 'rubye.gleichner', 0, 'Flo', 'Baumbach', NULL),
(77, '$2y$10$AHfRS5gCy7K9ktNsmvgtEOcKzRvHr5g8lK6.NHRWDcYI6hO1HukMW', NULL, '2017-07-17 04:36:02', '2017-07-17 04:36:02', 'ellis14', 0, 'Kassandra', 'Abshire', NULL),
(78, '$2y$10$QXrr8OYTYUiUEeIpWt3SVeICJ5zxTM8VFKUDGJY0/geILRlVzal2.', NULL, '2017-07-17 04:36:02', '2017-07-17 04:36:02', 'guy.luettgen', 0, 'Leila', 'Skiles', NULL),
(79, '$2y$10$cCWlz/27zAUL1AQDSnpfkO3e/TvqHB4s7eUWW/s5MzWnGsh2AV7my', NULL, '2017-07-17 04:36:02', '2017-07-17 04:36:02', 'jaclyn.hoppe', 0, 'Camden', 'Boehm', NULL),
(80, '$2y$10$Yl7q7QaBVZDYKsxlkGoHpufCAAJK1QJHWgVZ.VmGgnwHazaOOEAky', NULL, '2017-07-17 04:36:03', '2017-07-17 04:36:03', 'orogahn', 0, 'Libbie', 'Smith', NULL),
(81, '$2y$10$rtq16mG.5bWFNekLnl7kpeixyG2bLvLdytpFuDrPYp/3.V85cfdIq', NULL, '2017-07-17 04:36:03', '2017-07-17 04:36:03', 'owhite', 0, 'Madyson', 'Streich', NULL),
(82, '$2y$10$cSfl79EVJTGV2A5C4YhVOOwlbvv1MNyFFVDYtFd14fT1jEh/LGVNO', NULL, '2017-07-17 04:36:03', '2017-07-17 04:36:03', 'eschuster', 0, 'Martin', 'Labadie', NULL),
(83, '$2y$10$7mi9I/a6T1t4DaL/HMWI8.S7gwyFq6mFcssK/8ACOsyKde44.eueG', NULL, '2017-07-17 04:36:03', '2017-07-17 04:36:03', 'pouros.janessa', 0, 'Leann', 'Tromp', NULL),
(84, '$2y$10$hEHmRtlWkqh1DKKJMzHFJejKvS/Z4PAZe8T5RC3.wU9dkCzptrkJe', NULL, '2017-07-17 04:36:03', '2017-07-17 04:36:03', 'kbashirian', 0, 'Hassie', 'Bahringer', NULL),
(85, '$2y$10$NzEGtgGvnA0/pYVMjHdLsedvNm7wQGgnlNnPVrajDipUFcOFUH1B.', NULL, '2017-07-17 04:36:03', '2017-07-17 04:36:03', 'joanne.orn', 0, 'Lera', 'Schaefer', NULL),
(86, '$2y$10$xluRltc685xDS5hVQNXE5.2wn9y2PTW/51ZCF1Rr/4SdfRqsCHhxC', NULL, '2017-07-17 04:36:04', '2017-07-17 04:36:04', 'sporer.zetta', 0, 'Avery', 'Hermiston', NULL),
(87, '$2y$10$TbajKn9xc3xFIwVqI.JfD.woQckAcF7N9biKNyTm/XMpjrdcft78.', NULL, '2017-07-17 04:36:04', '2017-07-17 04:36:04', 'kchamplin', 0, 'Annette', 'Beahan', NULL),
(88, '$2y$10$3RWNECqZ5c2R8E9mWaD.tudgwYkOzwWtdKP8xUweMrnTGPeGW/Bom', NULL, '2017-07-17 04:36:04', '2017-07-17 04:36:04', 'jacinthe58', 0, 'Lorena', 'Crona', NULL),
(89, '$2y$10$gW1GZbGAVDsZ8b8j.ZO2Au8UfTgKGkzlJPcwBPCFeeazatFk8K0bC', NULL, '2017-07-17 04:36:04', '2017-07-17 04:36:04', 'windler.myrna', 0, 'Vickie', 'Kuhn', NULL),
(90, '$2y$10$DsdIhaHLdJ4V932VE.mLmeZHnAferEfP7I32HaPCMDm7WxRSGLIm2', NULL, '2017-07-17 04:36:04', '2017-07-17 04:36:04', 'shanie.sipes', 0, 'Bria', 'Sipes', NULL),
(91, '$2y$10$EpeZzam9lwHtKi1q0w0NJORnhOUDmGzv7K7N2SIsgySwWp06t7/q6', NULL, '2017-07-17 04:36:04', '2017-07-17 04:36:04', 'bartell.ernestina', 0, 'Liana', 'Zboncak', NULL),
(92, '$2y$10$0ipRvJf9qH7TLxEfQQSLLO7oIGnD/ELC9UDX4p6ICmWvKn06Nmqz2', NULL, '2017-07-17 04:36:05', '2017-07-17 04:36:05', 'gabe.witting', 0, 'Kennedy', 'Kuhic', NULL),
(93, '$2y$10$SLzogei7RLI6QDR/94UJXOsNaY70MEmnk.l43xbygc6Dtw07Hebha', NULL, '2017-07-17 04:36:05', '2017-07-17 04:36:05', 'feil.darius', 0, 'Retta', 'Waelchi', NULL),
(94, '$2y$10$Hmth2ruk5ASR3EMFAAObueSXLkyxRwPaNOwRkxyDbmn7UwkL3eCEa', NULL, '2017-07-17 04:36:05', '2017-07-17 04:36:05', 'ushields', 0, 'Cesar', 'Bernier', NULL),
(95, '$2y$10$DZildylakHlmMmlg3rTeMOtrWORS9fRwidPZg3QsCTND2YJ8x0yBm', NULL, '2017-07-17 04:36:05', '2017-07-17 04:36:05', 'larson.enoch', 0, 'Zelma', 'Nienow', NULL),
(96, '$2y$10$oipTr42oUKcLN.9a9rxJ7O4Vwqj6z9BzTeWbdlYv8MVvqHnumi9jW', NULL, '2017-07-17 04:36:05', '2017-07-17 04:36:05', 'godfrey00', 0, 'Rosa', 'Padberg', NULL),
(97, '$2y$10$NcYZGQNW9u6cPLlABl4EXedfJq/1T0p3zkTiPRmgCdHGWFd/SqPoC', NULL, '2017-07-17 04:36:05', '2017-07-17 04:36:05', 'piper.harber', 0, 'Verla', 'Cassin', NULL),
(98, '$2y$10$p42uSNETsA4DPBRTP92deOGUbAJ.Kw1CNh5v9lqYuHiyyuI2IlGCe', NULL, '2017-07-17 04:36:06', '2017-07-17 04:36:06', 'therzog', 0, 'Kari', 'Emmerich', NULL),
(99, '$2y$10$BOQYDZyikEICYKgIJFFuFeMbKU/6F8VUk0vIIlJxDmxiEe4OGdVF2', NULL, '2017-07-17 04:36:06', '2017-07-17 04:36:06', 'lindgren.laron', 0, 'Reinhold', 'Pouros', NULL),
(100, '$2y$10$lSba89oAu68pScM4pNwlOuLHhb4WuT5/CUPKC4ILBepTo0VZgX0JK', NULL, '2017-07-17 04:36:06', '2017-07-17 04:36:06', 'lea.greenholt', 0, 'Katrine', 'Cummerata', NULL),
(101, '$2y$10$a/jMafEjlh6TdV51adiso.gDZkH6uez7NBShz/jXnDuDNa2nCh3KG', NULL, '2017-07-17 04:36:06', '2017-07-17 04:36:06', 'lubowitz.annamae', 0, 'Katarina', 'Lang', NULL),
(102, '$2y$10$j7/0I.SZ4IZM98Utg7BAC..JZC9uPlTQBruLXOrOkCxGeTzEIvxCa', NULL, '2017-07-17 04:36:06', '2017-07-17 04:36:06', 'cooper.emard', 0, 'Armani', 'Sawayn', NULL),
(103, '$2y$10$mRnypzumd6p8qXWk.rzsMOXUE2rg09iGiID7ggoldczd0IAY4vrMi', NULL, '2017-07-17 04:36:06', '2017-07-17 04:36:06', 'nelda21', 0, 'Gardner', 'Pacocha', NULL),
(104, '$2y$10$DQgZIzSGShe4xJ/S84/I1exDZivFrT2r.xQiqvirmxOZ3HSYKV7Tu', NULL, '2017-07-17 04:36:07', '2017-07-17 04:36:07', 'durgan.lilly', 0, 'Emilie', 'Mueller', NULL),
(105, '$2y$10$yu0I8JkKjj4/jkb.VcHblunXZMRFvnPv4t3ZrkG75noB1PKl84z1y', NULL, '2017-07-17 04:36:07', '2017-07-17 04:36:07', 'juliana.volkman', 0, 'Karianne', 'Predovic', NULL),
(106, '$2y$10$pS9PbISHz/yIVin1m.QMk.MP.Dhh2MLrOu78.PQ/8f1Ty3XIUwMbq', NULL, '2017-07-17 04:36:07', '2017-07-17 04:36:07', 'leonel.mann', 0, 'Rickie', 'Armstrong', NULL),
(107, '$2y$10$Lx6gt36CNfwN4UUiCz4jWu7Pas325teIAml3rNS/H17jZyfv7qUFm', NULL, '2017-07-17 04:36:07', '2017-07-17 04:36:07', 'lbraun', 0, 'Elenora', 'Brekke', NULL),
(108, '$2y$10$gTQC6AA6CDltFpOqyX24r.TDZSFXaEz7xhXNQPH8WENEVskpOJXzC', NULL, '2017-07-17 04:36:07', '2017-07-17 04:36:07', 'abel.gibson', 0, 'Rogelio', 'Parisian', NULL),
(109, '$2y$10$OarFOJvaYf6CNuq4Fe0GfuX5G7IYGkHScLN/QIJJM/zK68Bmht8zm', NULL, '2017-07-17 04:36:07', '2017-07-17 04:36:07', 'trystan.wolff', 0, 'Queenie', 'Schowalter', NULL),
(110, '$2y$10$CVa48GEUq5GsaaHLF/wSKuvsVwFnqgFre7lUCQiIMCgBVlXZAWoUC', NULL, '2017-07-17 04:36:08', '2017-07-17 04:36:08', 'rafaela24', 0, 'Raphael', 'Kemmer', NULL),
(111, '$2y$10$uU/x0mtI1GerKRkPLrM3NOXUH8CilNLU.Olr441J8k4J.XbqejQBy', NULL, '2017-07-17 04:36:08', '2017-07-17 04:36:08', 'bryce.klein', 0, 'Gaetano', 'Welch', NULL),
(112, '$2y$10$5Cu9lDnFKyKfKW5YbIBH5OF27x6WB6uHggsRH660QVh0dbouoLeEW', NULL, '2017-07-17 04:36:08', '2017-07-17 04:36:08', 'josiane.mayer', 0, 'Therese', 'Purdy', NULL),
(113, '$2y$10$964hcWNi6Jso3zWp0Et4keK2S1ihMiMymzhryElHZNMWRfSXqDLu2', NULL, '2017-07-17 04:36:08', '2017-07-17 04:36:08', 'sporer.grayson', 0, 'Mellie', 'Botsford', NULL),
(114, '$2y$10$1U.I3w7lA0l.l1ORQCMpo.qrh9JgsvwpNvsrHVhSjZ/SIlAiYrK22', NULL, '2017-07-17 04:36:08', '2017-07-17 04:36:08', 'ngleason', 0, 'Granville', 'Blick', NULL),
(115, '$2y$10$wA2JlBtJAoZTP1Y908dO1u26EqUXj1puBMjhpt2x76r0QG0mNgbqG', NULL, '2017-07-17 04:36:09', '2017-07-17 04:36:09', 'penelope53', 0, 'Krystal', 'Wuckert', NULL),
(116, '$2y$10$roeII1sDK.M92TIDsDhuDuvnTvFHf7OxCYJ..Wepa.kgL/beLRR9e', NULL, '2017-07-17 04:36:09', '2017-07-17 04:36:09', 'schimmel.anna', 0, 'Adele', 'Paucek', NULL),
(117, '$2y$10$yTcFXfVuCJFNOwiuNZ52b.qc6s.y9vVSrc0V9So/lRXeuCEWjS19a', NULL, '2017-07-17 04:36:10', '2017-07-17 04:36:10', 'toy.robbie', 0, 'Marcel', 'Rempel', NULL),
(118, '$2y$10$/zJOVUQ7229np6FmSlAcYe4nGsKnRuHaNF.XaoM01vtTE4y2Miv.O', NULL, '2017-07-17 04:36:10', '2017-07-17 04:36:10', 'reinger.anabelle', 0, 'Vaughn', 'Schiller', NULL),
(119, '$2y$10$mdOP2KA092fEwkJGe7GMSeLEnXV55V8bbgOHLLclhCTUIRq0sJCse', NULL, '2017-07-17 04:36:11', '2017-07-17 04:36:11', 'fay.destany', 0, 'Ola', 'Bradtke', NULL),
(120, '$2y$10$d3mmuTmIPyc4xO7Y5KX1Ge6QCMoLmqdF7zBS7lGANEIAK.o2B4rSu', NULL, '2017-07-17 04:36:11', '2017-07-17 04:36:11', 'sadie79', 0, 'Candice', 'Stokes', NULL),
(121, '$2y$10$bBNa.hZbvakW9bxU0FcH7eUyQZHjc06RyUNsBREly.NRXhPGbVbWG', NULL, '2017-07-17 04:36:11', '2017-07-17 04:36:11', 'nlakin', 0, 'Aylin', 'Gutkowski', NULL),
(122, '$2y$10$VNg2ns9PwgoqXu9vyNX.6OVAyGKQ02n8klrcgEKiEMB6JjGK6QUZ6', NULL, '2017-07-17 04:36:11', '2017-07-17 04:36:11', 'lela.hamill', 0, 'Sabina', 'Marquardt', NULL),
(123, '$2y$10$N6mX/CNuvLsUVOB.DqFZj.QmRXUvBrfVGDW2S3d4fqiUgjhilLFpu', NULL, '2017-07-17 04:36:12', '2017-07-17 04:36:12', 'noel35', 0, 'Alphonso', 'Price', NULL),
(124, '$2y$10$8D5U8htLSXlnZXXl7e/ExOSUD38pZe36.y0Q4nG4bMIcDlD3VZMeC', NULL, '2017-07-17 04:36:12', '2017-07-17 04:36:12', 'ellie.weber', 0, 'Ottilie', 'Rutherford', NULL),
(125, '$2y$10$Br3odDPuCf49TdOOF2YIF.RLob1p2A4TFRutvrgGFfgiVcEO3cx.2', NULL, '2017-07-17 04:36:12', '2017-07-17 04:36:12', 'effertz.marlene', 0, 'Clara', 'Beatty', NULL),
(126, '$2y$10$PKRa3eS14LSH56dHAJIJr.wtJU0kU2fbWAKReJ.sJsYK2CN3MzY2e', NULL, '2017-07-17 04:36:12', '2017-07-17 04:36:12', 'bfeest', 0, 'Marquis', 'Fay', NULL),
(127, '$2y$10$YvCnUPsZMhEwdPP7HJ.BJ.SErdUyGpYfTwViHDMjEExeaGBtNEk6C', NULL, '2017-07-17 04:36:12', '2017-07-17 04:36:12', 'mclaughlin.gavin', 0, 'Guadalupe', 'Dietrich', NULL),
(128, '$2y$10$6H1bN3OOE8.HRyr.SSss.OzmdFmE8XmrxLFJg3qxfXV7MQza/ToP.', NULL, '2017-07-17 04:36:12', '2017-07-17 04:36:12', 'hettinger.timothy', 0, 'Jimmie', 'Crist', NULL),
(129, '$2y$10$nEJDHHrnFYRFnKcAaVjTUORHo/Yo.YeSCxNrVSuiiG4Hmjchk.gzC', NULL, '2017-07-17 04:36:13', '2017-07-17 04:36:13', 'konopelski.alicia', 0, 'Emmie', 'Watsica', NULL),
(130, '$2y$10$8llefDVe61LogDrjgd5xLOOjMMAsoXIsH5161xnNHmTBAgawvd6BO', NULL, '2017-07-17 04:36:13', '2017-07-17 04:36:13', 'gleason.mae', 0, 'Sarina', 'Olson', NULL),
(131, '$2y$10$4v5eURnFThVaDoCo76ZJOe/O1OoDkHzTpxEJGc6YfS7aGVICB.jjq', NULL, '2017-07-17 04:36:13', '2017-07-17 04:36:13', 'elwin.price', 0, 'Leonel', 'Stamm', NULL),
(132, '$2y$10$8sgPQ.jj7bbxdi9y6V965efZtDUm.vUnmmdcZP4tvACVVYzdx63Ie', NULL, '2017-07-17 04:36:13', '2017-07-17 04:36:13', 'markus03', 0, 'Christiana', 'Hegmann', NULL),
(133, '$2y$10$SjSewFWj/K0CcKVxrgey4eWy5XK9H2MoXPr2n63.bSz4M.ya45F8G', NULL, '2017-07-17 04:36:13', '2017-07-17 04:36:13', 'trent83', 0, 'Alvis', 'Davis', NULL),
(134, '$2y$10$hyGbBo3Uly0.7pVuRTvLgOWuA0DiFSLuuaLt8ATkSoBsjBJJatj3W', NULL, '2017-07-17 04:36:14', '2017-07-17 04:36:14', 'lila86', 0, 'Katherine', 'Cole', NULL),
(135, '$2y$10$rXKfDcxLlT4.zDqlO56xJeBcb49RSHvpY2CHZNbd8SGqhHTEO6M3.', NULL, '2017-07-17 04:36:14', '2017-07-17 04:36:14', 'ykessler', 0, 'Nia', 'Lynch', NULL),
(136, '$2y$10$w9Izm4gc61m2v.E8jy7a6.6PsRm4jjG/FKMP0YynK12wC.s7/8lge', NULL, '2017-07-17 04:36:14', '2017-07-17 04:36:14', 'serenity.howell', 0, 'Alize', 'Botsford', NULL),
(137, '$2y$10$SV9EvityNzOboNe7QuJd.eG0K3LpeuPUMuhAzwy1LtnCzmXu2jIvO', NULL, '2017-07-17 04:36:14', '2017-07-17 04:36:14', 'kole47', 0, 'Maiya', 'Kuvalis', NULL),
(138, '$2y$10$Kz/W4cDrJSA42AJdwsQP/uwLRNazblHGu3Hy4esiOLM4UdJIB3H1e', NULL, '2017-07-17 04:36:14', '2017-07-17 04:36:14', 'murazik.virgil', 0, 'Cara', 'Keebler', NULL),
(139, '$2y$10$vDfIj4d8sAMtFRRRFuSJ0e0u1EBPGvjfCign8G3I3u/MS1wq79c1S', NULL, '2017-07-17 04:36:14', '2017-07-17 04:36:14', 'wehner.jess', 0, 'Bryon', 'Kuhlman', NULL),
(140, '$2y$10$.mWrRb6Rt6AbloYlSLLuXOWAeUe55p1d1tlrGiSvyEmhZL/EHRcbq', NULL, '2017-07-17 04:36:15', '2017-07-17 04:36:15', 'blick.jaylen', 0, 'Caden', 'Kuhn', NULL),
(141, '$2y$10$fqE1QPP4g3EIZSRULdHFQeSf06UG0PxBfjkUDzP1DlTsO6yBvbyB2', NULL, '2017-07-17 04:36:15', '2017-07-17 04:36:15', 'swift.keshaun', 0, 'Roma', 'Predovic', NULL),
(142, '$2y$10$JKc/EPVqcMI8rv7YNL68B.sPY3eevxGPvCMBHmLT1JPaJnpUyzAXW', NULL, '2017-07-17 04:36:15', '2017-07-17 04:36:15', 'bogisich.palma', 0, 'Gage', 'O''Reilly', NULL),
(143, '$2y$10$PlMiHZTFB4J7MgX3Bnub.eLqohsWayGDj.ipr35IeNXMWWHIYsHj.', NULL, '2017-07-17 04:36:15', '2017-07-17 04:36:15', 'hudson.stan', 0, 'Regan', 'Mayert', NULL),
(144, '$2y$10$apbVA2SZUKrQO4cKaTyRBeQd9DEIZsZt8URL0bXMekTZvwNra6LzS', NULL, '2017-07-17 04:36:15', '2017-07-17 04:36:15', 'uhagenes', 0, 'Emilia', 'Emmerich', NULL),
(145, '$2y$10$JuaYjdQ2XJZ0RiKnwKDiFejWh2EUjHXUavxPX9wh/IaeEjy1aLKdG', NULL, '2017-07-17 04:36:15', '2017-07-17 04:36:15', 'crooks.concepcion', 0, 'Virgie', 'Bogan', NULL),
(146, '$2y$10$mjlxEXL3ERIY1BNBUf5mQefllSn2xkvEYcFkUyziNckfrZpjpyyze', NULL, '2017-07-17 04:36:16', '2017-07-17 04:36:16', 'letitia38', 0, 'Dawn', 'Thiel', NULL),
(147, '$2y$10$h97YiTnATc.UuCyHxDO1.uHYq9PEGJLWIRHScBx9blGLnvE58qiXm', NULL, '2017-07-17 04:36:16', '2017-07-17 04:36:16', 'kemmer.vidal', 0, 'Lenna', 'Mann', NULL),
(148, '$2y$10$Al6pVs8ywh/D6hQl/rr8husEwPzu0pxfb2G4qD4Wq7ny9/F0GF3G2', NULL, '2017-07-17 04:36:16', '2017-07-17 04:36:16', 'heathcote.dax', 0, 'Betsy', 'Jerde', NULL),
(149, '$2y$10$LiPvGbWCzjhRQcpzDpAmse/PH/BuJn67AV1p5C4R4EJFQTSK4CiTq', NULL, '2017-07-17 04:36:16', '2017-07-17 04:36:16', 'zechariah46', 0, 'Princess', 'Kassulke', NULL),
(150, '$2y$10$IRu7rrdnmW0xXMTGw/aXXu46vEhCqDaf7l5DSRQ5c3fvc1N/EnG0O', NULL, '2017-07-17 04:36:16', '2017-07-17 04:36:16', 'hshanahan', 0, 'Dena', 'Klocko', NULL),
(151, '$2y$10$PHoDoz8fb7V3Ka7za8OR4Oe162IA2uHKNZMDBF6X51h.3UYGDtZmG', NULL, '2017-07-17 04:36:16', '2017-07-17 04:36:16', 'mante.landen', 0, 'Tatyana', 'Thompson', NULL),
(152, '$2y$10$DDWnl4H8xYK5e4KljZ45aOu0/AvO9hSkaveJi59BJvcrpgfGvQWPm', NULL, '2017-07-17 04:36:17', '2017-07-17 04:36:17', 'mmohr', 0, 'Daphne', 'Koss', NULL),
(153, '$2y$10$iVHzX0jeGqr9UGXSqdpbzOS7MUcIDXvVUax2PH2L40YlEZZUE.5lq', NULL, '2017-07-17 04:36:17', '2017-07-17 04:36:17', 'myron32', 0, 'Vincent', 'Hyatt', NULL),
(154, '$2y$10$piIdIAHmuUk2h/pxgPSu/O3oG7X7o8TgyGpb8Mea9a7bSBCGjLEgy', NULL, '2017-07-17 04:36:17', '2017-07-17 04:36:17', 'hilbert.mohr', 0, 'Matilda', 'Prohaska', NULL),
(155, '$2y$10$6QaKR2TJDwxleqUzr7V01OIBUSEnHAhbDu5VQT88NbCfsgVXM1da6', NULL, '2017-07-17 04:36:17', '2017-07-17 04:36:17', 'dking', 0, 'Andreanne', 'Jast', NULL),
(156, '$2y$10$3ZrChvKtZRf1KNerSKp88.Cw9eRiedaRpgstWZ.iHpa8MYu6G.kni', NULL, '2017-07-17 04:36:17', '2017-07-17 04:36:17', 'raymundo.feeney', 0, 'Tevin', 'Runolfsson', NULL),
(157, '$2y$10$WCu9Fov0gJd6FmAARmXBSuPbeBCGYf6rYrpHAFc.Wv46bGin66ZY6', NULL, '2017-07-17 04:36:17', '2017-07-17 04:36:17', 'carolanne.beahan', 0, 'Brian', 'Ullrich', NULL),
(158, '$2y$10$znhICtvutLdw0zschA37MOU30pDgS0mHzUQEVGL/ulTgs8ufVfNKi', NULL, '2017-07-17 04:36:18', '2017-07-17 04:36:18', 'brenden.bauch', 0, 'Autumn', 'Prosacco', NULL),
(159, '$2y$10$Xbuugf1msl2WQM78IZzES.IPOETqP0Yv5G.B7AqS7mIuT5iHWbppK', NULL, '2017-07-17 04:36:18', '2017-07-17 04:36:18', 'emelie81', 0, 'Caroline', 'Keebler', NULL),
(160, '$2y$10$IuzRUnw79hbReWUbdSAs8Og7XBlAMXq6hqcTkLQERInJNCKkAU6zS', NULL, '2017-07-17 04:36:18', '2017-07-17 04:36:18', 'jettie99', 0, 'Carmella', 'Skiles', NULL),
(161, '$2y$10$8j5/Jn3dHJ7QdT8LhjQUIOGLO4BxzxH37YQotrDoASy0OOA2eVWm6', NULL, '2017-07-17 04:36:18', '2017-07-17 04:36:18', 'colleen86', 0, 'Verda', 'Rempel', NULL),
(162, '$2y$10$FsZmp3gc7G9AG8HE79TA/.OyEnHFeX7JBuw3rTfIniacEqFKL6uoq', NULL, '2017-07-17 04:36:18', '2017-07-17 04:36:18', 'roscoe30', 0, 'Donna', 'Crooks', NULL),
(163, '$2y$10$2BIzyBepqY8JcGHTMkbXDuAG06quL1FHAcDmWvlu3/6z5IvvCAPRG', NULL, '2017-07-17 04:36:18', '2017-07-17 04:36:18', 'sanford.dayne', 0, 'Jermey', 'Schroeder', NULL),
(164, '$2y$10$7b..zA8YXpRVZjwN2yTuw.zevG3BntQv.cB71/AUd9q4EApXvFSoq', NULL, '2017-07-17 04:36:18', '2017-07-17 04:36:18', 'xmills', 0, 'Erik', 'Gutkowski', NULL),
(165, '$2y$10$/oyVO5lyifHhEACqSF8wW.Jh02jPIQAuFKjVI.p797.hggzqRtYDi', NULL, '2017-07-17 04:36:18', '2017-07-17 04:36:18', 'mittie.mccullough', 0, 'Dwight', 'Cremin', NULL),
(166, '$2y$10$WFderlVpupnPOlynSBzFX..4OygBg4BM4KYdkjOeIzfUk3SK8fSWC', NULL, '2017-07-17 04:36:19', '2017-07-17 04:36:19', 'kattie.zulauf', 0, 'Gilbert', 'Klein', NULL),
(167, '$2y$10$TR/gS7hjN7YdExWesXeU5uLfEEoUb5iZP0PB3BIZG1MoN8YmXnOza', NULL, '2017-07-17 04:36:19', '2017-07-17 04:36:19', 'arvid.zemlak', 0, 'Dominic', 'Johnson', NULL),
(168, '$2y$10$hoQT0nK7B1/Av1rVLAluR.3vsyPY/jn5tzeWShG1r58zBR/8DYBnu', NULL, '2017-07-17 04:36:19', '2017-07-17 04:36:19', 'raymond66', 0, 'Terrence', 'O''Kon', NULL),
(169, '$2y$10$JxCI5OH9vHoKP6v/qa6J2OFdXPAxtfH959xAjrUBfOamBgUUQeCGK', NULL, '2017-07-17 04:36:19', '2017-07-17 04:36:19', 'fritsch.clementina', 0, 'Orland', 'Powlowski', NULL),
(170, '$2y$10$KhePJr8z0FXo.oFEJbEKMem97GtnKajOVxbePhECPPC0RRopf7gCm', NULL, '2017-07-17 04:36:19', '2017-07-17 04:36:19', 'bebert', 0, 'Solon', 'Gerhold', NULL),
(171, '$2y$10$0ECyWqNzpMy8ppNC2s4bzuhDGwfnFQtYNgnaUK6Eiia.0INfo06zK', NULL, '2017-07-17 04:36:19', '2017-07-17 04:36:19', 'owen.aufderhar', 0, 'Alexanne', 'Hoeger', NULL),
(172, '$2y$10$b1uNTXB2QpLfNnr7SBW.EeD9CmuTJwqcdSqdHongT856CuDac8S8O', NULL, '2017-07-17 04:36:19', '2017-07-17 04:36:19', 'cbreitenberg', 0, 'Gerda', 'Hackett', NULL),
(173, '$2y$10$.5ijeRcvO9G9Vb.R3zausebHfUWRM0g8P3Iir8iaLBhnrHEH9yoWi', NULL, '2017-07-17 04:36:20', '2017-07-17 04:36:20', 'lledner', 0, 'Cassandra', 'Mitchell', NULL),
(174, '$2y$10$Eh158dzOf6b2axValxtgeeAjAxmXKRbQeaUyIU3NTrTSBKigg9tOm', NULL, '2017-07-17 04:36:20', '2017-07-17 04:36:20', 'sandrine37', 0, 'Tremayne', 'Hills', NULL),
(175, '$2y$10$Mnlqs4jZxfjbsehqZQgJMOmPZUS9PRNWkUNKS4j2E2kjWcJpK87w.', NULL, '2017-07-17 04:36:20', '2017-07-17 04:36:20', 'newton.mosciski', 0, 'Russell', 'Cruickshank', NULL),
(176, '$2y$10$wJmiwh9FVR7oIyzqH4V5xeOZ0qOMxFNUtQ6OmINAqQjaBjjRo/kGC', NULL, '2017-07-17 04:36:20', '2017-07-17 04:36:20', 'mdouglas', 0, 'Gaetano', 'Gutkowski', NULL),
(177, '$2y$10$JIrOevtKVRJ80QGDae9jYuCgBOkvT/MlgMoRBTJNv7GmYujThBtEO', NULL, '2017-07-17 04:36:20', '2017-07-17 04:36:20', 'della88', 0, 'Efren', 'Wehner', NULL),
(178, '$2y$10$IylV.4lsw4wPNw4lmaZEHO75jjFHvn5vbiDEU.UcwkhSrBNqfxhnm', NULL, '2017-07-17 04:36:20', '2017-07-17 04:36:20', 'myles53', 0, 'Rollin', 'Kiehn', NULL),
(179, '$2y$10$VYZAcPF2tPn5tyvNKRUSxOmmoa6VP57L35FbTmMUxWBIN1gXoxTKO', NULL, '2017-07-17 04:36:20', '2017-07-17 04:36:20', 'considine.zechariah', 0, 'Berenice', 'Cartwright', NULL),
(180, '$2y$10$l5TalsXectOhwULcGMDrHen1oow4NZO.kz3OAFiNZXO2jIcyWs7jm', NULL, '2017-07-17 04:36:21', '2017-07-17 04:36:21', 'zulauf.kathlyn', 0, 'Dayna', 'Rice', NULL),
(181, '$2y$10$eKsnIZ1baHwbVbVfgH3dcOyzYDe/TBOZKPh1BKA0urGdyaMn4jQsq', NULL, '2017-07-17 04:36:21', '2017-07-17 04:36:21', 'hildegard38', 0, 'Cortney', 'Gerlach', NULL),
(182, '$2y$10$o0XgTeHda6tIwkYtk.iOjeqPZunyQSq5tNbqI25tLUyXyP9gGS7di', NULL, '2017-07-17 04:36:21', '2017-07-17 04:36:21', 'rhuels', 0, 'Thaddeus', 'Tremblay', NULL),
(183, '$2y$10$OXx9ew5sAz6CruZmiTCuLegkiGwXltN5HbsXp5ah6aIqXyFhAzn2G', NULL, '2017-07-17 04:36:21', '2017-07-17 04:36:21', 'sdurgan', 0, 'Wallace', 'Olson', NULL),
(184, '$2y$10$25CM5G8v0xCqLTl.opNKD.Gpl1GicrYwYHmaQobFUgsF6KwPO7sdi', NULL, '2017-07-17 04:36:21', '2017-07-17 04:36:21', 'marilyne50', 0, 'Ariel', 'Fahey', NULL),
(185, '$2y$10$fci/Iob2tbEwdIHGfw4sz.IkAFDJHoTmWCcWnGSWLSyPQS04I.xVO', NULL, '2017-07-17 04:36:21', '2017-07-17 04:36:21', 'makenna16', 0, 'Linnea', 'Torp', NULL),
(186, '$2y$10$ruzlN8ONAOe1jr32gMKQUe39xYOXUtCWrCt9AI0OpZnqPWLYOAuuu', NULL, '2017-07-17 04:36:21', '2017-07-17 04:36:21', 'belle.wolf', 0, 'Herman', 'Toy', NULL),
(187, '$2y$10$JXDfV0pC6gIdXyuOC69r1.6ZIIL66rCV1TlFqm6NOuS7YiSYkjDSq', NULL, '2017-07-17 04:36:22', '2017-07-17 04:36:22', 'vgorczany', 0, 'Rolando', 'Kuhn', NULL),
(188, '$2y$10$xXo2BQ0dbwv/ZU7euZYGDu7U1pjdGLkqSjUEGrc2SUZ1d8WpsggG6', NULL, '2017-07-17 04:36:22', '2017-07-17 04:36:22', 'joseph12', 0, 'Vivian', 'Gislason', NULL),
(189, '$2y$10$kx.PiZRPeJjAQMmI3ULOtOsgQNyaWP9ItCBaf5IF21ppqvRJRqYeS', NULL, '2017-07-17 04:36:22', '2017-07-17 04:36:22', 'skuhn', 0, 'Chadd', 'Lebsack', NULL),
(190, '$2y$10$cm.YWbokr50Dg0gklhE2Q.MSXSPuKMpVPFbJzFOr4g1iuZsESU0wC', NULL, '2017-07-17 04:36:22', '2017-07-17 04:36:22', 'briana40', 0, 'Doris', 'Murphy', NULL),
(191, '$2y$10$7awm9o8N/kvjSAv2HtU1a.pKXGmDfIglPETCGFzEMZQZ4o6yhynKu', NULL, '2017-07-17 04:36:22', '2017-07-17 04:36:22', 'reed.walter', 0, 'Connor', 'Feil', NULL),
(192, '$2y$10$tKz2BHVWs7W.BAplR.wTbe/d98mOpcl6.0eCw/MLxIf4GO47.mK7C', NULL, '2017-07-17 04:36:22', '2017-07-17 04:36:22', 'alanna.quigley', 0, 'Terry', 'Bauch', NULL),
(193, '$2y$10$gnCTc8HtOyriYJcKmAwHZeame5fHM3MXq/zGMw55HxOQ5YTijbu4i', NULL, '2017-07-17 04:36:22', '2017-07-17 04:36:22', 'pshanahan', 0, 'Hilario', 'Streich', NULL),
(194, '$2y$10$y2T1Gyvxmrcr/Y9x/AWDoOJecrp6rUNuRUErHcNe.frJLE7.H1r7u', NULL, '2017-07-17 04:36:23', '2017-07-17 04:36:23', 'ggreenholt', 0, 'Jada', 'Quitzon', NULL),
(195, '$2y$10$wWqfxEnPvcmNG4S.piOoLOHZ3gJJHy2ePT12DsaERXIE1Xar4T0Q6', NULL, '2017-07-17 04:36:23', '2017-07-17 04:36:23', 'bashirian.cullen', 0, 'Wilmer', 'Hirthe', NULL),
(196, '$2y$10$iaztz16JlvTtDYWj896BD.krTaHU3Pd5OGgWJj6fqBFCRyZPEEdES', NULL, '2017-07-17 04:36:23', '2017-07-17 04:36:23', 'lamar.marquardt', 0, 'Marcelle', 'Schuppe', NULL),
(197, '$2y$10$FRmfMiAAutokPIJMmGsZTe5gZIaVSmSez7244Y6yAUn3OwqaG6ChG', NULL, '2017-07-17 04:36:23', '2017-07-17 04:36:23', 'kory02', 0, 'Kiara', 'Sporer', NULL),
(198, '$2y$10$CTbfHzQsU7f.nRTBjb8vNujmUMLWP9NGeVSOqxH3YrEuDhvfwqtry', NULL, '2017-07-17 04:36:23', '2017-07-17 04:36:23', 'moriah41', 0, 'Morgan', 'Fisher', NULL),
(199, '$2y$10$weFVDmLukxRmBVzqAtmTSu3OnQP5IrFUY1dZzobT1caJM1VzxLkP2', NULL, '2017-07-17 04:36:23', '2017-07-17 04:36:23', 'sigmund.connelly', 0, 'Elinor', 'Wuckert', NULL),
(200, '$2y$10$dXgJtNoqktsHq9DXydTWOeS93B8BUTar4TnJRuFkcaE57BqXmr6/2', NULL, '2017-07-17 04:36:24', '2017-07-17 04:36:24', 'hessel.hanna', 0, 'Maria', 'Medhurst', NULL),
(201, '$2y$10$rNqvWN6mBpAI5JRU815FE.6VBfFRHHR6T0124PySThyzGgu3ycVBO', NULL, '2017-07-17 04:36:24', '2017-07-17 04:36:24', 'morar.favian', 0, 'Jeanie', 'Goldner', NULL),
(202, '$2y$10$Wl5ZZSFxo.gAcEBLfjziyufJSUqxvFDR2T9gysJ6yko0Zb0fRglGy', NULL, '2017-07-17 04:36:24', '2017-07-17 04:36:24', 'strosin.earnest', 0, 'Maryam', 'Beier', NULL),
(203, '$2y$10$MPi7D1xj315FVY7QuEN7kepq1QvgvLRNLKwl3hd4V2VH57zNQ.k2y', NULL, '2017-07-17 04:36:24', '2017-07-17 04:36:24', 'owilderman', 0, 'Francesco', 'Hirthe', NULL),
(204, '$2y$10$XNwTOsrHWlXiefARRfV1BuDsigiEWVLtDrHSRaKOedJQDH5p1WsoW', NULL, '2017-07-17 04:36:24', '2017-07-17 04:36:24', 'beahan.hallie', 0, 'Trudie', 'Tromp', NULL),
(205, '$2y$10$7DBRGLBSA3VV3GHVYR7fAeb9FRFH7Ux47sJeHZpKCaeNvtv2.HNoK', NULL, '2017-07-17 04:36:24', '2017-07-17 04:36:24', 'bergstrom.quinn', 0, 'Nichole', 'O''Hara', NULL),
(206, '$2y$10$aqXbnFzVlGOgMzs/WkLilOMWrwWgkEFwMd1sJgGjbr6df/IQObSXC', NULL, '2017-07-17 04:36:24', '2017-07-17 04:36:24', 'tamia47', 0, 'Megane', 'Grimes', NULL),
(207, '$2y$10$ra8QzSpJYB0ugA5lSJW6x.hx.Mvqo6zRpB9hP6maDFlDAJRBu11la', NULL, '2017-07-17 04:36:25', '2017-07-17 04:36:25', 'salma85', 0, 'Ofelia', 'Bartoletti', NULL),
(208, '$2y$10$X5BclpSIGU4GhVm/5cpjMuO5xxjfczzr4328wA3ZvECOXdm/fE.nm', NULL, '2017-07-17 04:36:25', '2017-07-17 04:36:25', 'pchamplin', 0, 'Helmer', 'Heller', NULL),
(209, '$2y$10$X6uDPwlzez4VJGjUEI3TtuS5Le7GpZIQzVqHRHeyrsrEx7QjJ.whW', NULL, '2017-07-17 04:36:25', '2017-07-17 04:36:25', 'rratke', 0, 'Gerson', 'Swift', NULL),
(210, '$2y$10$MuNhMAcKqTxtHgaLbRx6P.bFKqmckkfvxXRsakHuVB.juMNbM5WWq', NULL, '2017-07-17 04:36:25', '2017-07-17 04:36:25', 'ukeebler', 0, 'Carole', 'McKenzie', NULL),
(211, '$2y$10$4k76iCnfvVwQTUmw4xvqDOB3tOkDrTSlcvQfcmzvrrJexmRwRwYEu', NULL, '2017-07-17 04:36:25', '2017-07-17 04:36:25', 'ymoore', 0, 'Kieran', 'Jerde', NULL),
(212, '$2y$10$Z2aXVXh1WA5OWba/H0/SK.GvT7zhe5mSnW0KVZIJVKGXmRvdnDnOe', NULL, '2017-07-17 04:36:25', '2017-07-17 04:36:25', 'adriana.lang', 0, 'Elody', 'Marvin', NULL),
(213, '$2y$10$Y8Fsja2bxwkM0uGMEaG5L.Efz4gJi4/TGoCxT4cgji4Lj8RPUO0S.', NULL, '2017-07-17 04:36:26', '2017-07-17 04:36:26', 'keven.goldner', 0, 'Laurianne', 'Gerlach', NULL),
(214, '$2y$10$5SuCfGrE8A40VwnNIT/iE.hNf6YQiYzZ71qqCP7rLWZT6BmV6ui9G', NULL, '2017-07-17 04:36:26', '2017-07-17 04:36:26', 'hobart.walker', 0, 'Ana', 'Christiansen', NULL),
(215, '$2y$10$CaQeAgn7qvgng8jROCn8d.A/ooIA5kzWyLEyTArnEUm4neP8aAAY.', NULL, '2017-07-17 04:36:26', '2017-07-17 04:36:26', 'alene.wyman', 0, 'Eveline', 'Wunsch', NULL),
(216, '$2y$10$Gjh.QubMJLBK1vwt88FhrOXO1jphap0GXrnR94oiwri/Dmmfe8W3i', NULL, '2017-07-17 04:36:26', '2017-07-17 04:36:26', 'alejandra98', 0, 'Maryse', 'McCullough', NULL),
(217, '$2y$10$hG2welalXN8I2Zwh2gz/Rej6jih3zEHo4x1e5B7h/ouVA07s.yYTa', NULL, '2017-07-17 04:36:26', '2017-07-17 04:36:26', 'jason.windler', 0, 'Retta', 'Cartwright', NULL),
(218, '$2y$10$n17fpIAWAwYWL31WafHTb.4hhzNz5OBZF..rAoGg9chBEWGc7PY8C', NULL, '2017-07-17 04:36:26', '2017-07-17 04:36:26', 'andrew56', 0, 'Archibald', 'Abbott', NULL),
(219, '$2y$10$3AXqoR7WoLOQWIpwKfPZleKSI2yS/Sd3gS8xxt6xUz7qqM8rki8B6', NULL, '2017-07-17 04:36:27', '2017-07-17 04:36:27', 'wcasper', 0, 'Destiny', 'Corkery', NULL),
(220, '$2y$10$J6nJHoa2WxMV8VWO685xhuMjAjpfkvb/aE5SVrzjrRBq17w/B9u5W', NULL, '2017-07-17 04:36:27', '2017-07-17 04:36:27', 'kohler.leone', 0, 'Zechariah', 'Nolan', NULL),
(221, '$2y$10$ebYZbKy7EIwL7zURk564AOVWe81wBQryoRu6ugKrZ/qXw.zLjHe6G', NULL, '2017-07-17 04:36:27', '2017-07-17 04:36:27', 'cummerata.stella', 0, 'Cordia', 'Lubowitz', NULL),
(222, '$2y$10$jukSVfgdpkPWgTfONM4GRu41C9yIwpDhvEldzBb4YoAkMuUwJNwKC', NULL, '2017-07-17 04:36:27', '2017-07-17 04:36:27', 'francis48', 0, 'Heber', 'Haag', NULL),
(223, '$2y$10$ZLAw5CnsJoNWNT6ziA3vx.oMWwKsnELKeF/Tlt4OvsqkFCZzFyVHS', NULL, '2017-07-17 04:36:27', '2017-07-17 04:36:27', 'ashly21', 0, 'Cristopher', 'Bode', NULL),
(224, '$2y$10$wIe2u5vKQ8T6et8ZpbBKNulnlwgIunnpUrtg/zrNAnFkeuBuHyz..', NULL, '2017-07-17 04:36:27', '2017-07-17 04:36:27', 'delbert12', 0, 'Hardy', 'Hansen', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `user_has_permissions`
--

CREATE TABLE `user_has_permissions` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `permission_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `user_has_roles`
--

CREATE TABLE `user_has_roles` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `user_has_roles`
--

INSERT INTO `user_has_roles` (`role_id`, `user_id`) VALUES
(1, 2);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Индексы таблицы `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_unique` (`name`);

--
-- Индексы таблицы `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Индексы таблицы `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Индексы таблицы `sessions`
--
ALTER TABLE `sessions`
  ADD UNIQUE KEY `sessions_id_unique` (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`);

--
-- Индексы таблицы `user_has_permissions`
--
ALTER TABLE `user_has_permissions`
  ADD PRIMARY KEY (`user_id`,`permission_id`),
  ADD KEY `user_has_permissions_permission_id_foreign` (`permission_id`);

--
-- Индексы таблицы `user_has_roles`
--
ALTER TABLE `user_has_roles`
  ADD PRIMARY KEY (`role_id`,`user_id`),
  ADD KEY `user_has_roles_user_id_foreign` (`user_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT для таблицы `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT для таблицы `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=225;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `user_has_permissions`
--
ALTER TABLE `user_has_permissions`
  ADD CONSTRAINT `user_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_has_permissions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `user_has_roles`
--
ALTER TABLE `user_has_roles`
  ADD CONSTRAINT `user_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_has_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
