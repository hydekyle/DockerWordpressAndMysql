SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

CREATE DATABASE IF NOT EXISTS `galaga` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish2_ci;
USE `galaga`;

CREATE TABLE `scores` (
  `id` varchar(100) COLLATE utf8_spanish2_ci NOT NULL UNIQUE PRIMARY KEY,
  `alias` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `score` int NOT NULL,
  `avatar` varchar(100) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

COMMIT;

