-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Июл 09 2018 г., 19:40
-- Версия сервера: 10.1.33-MariaDB
-- Версия PHP: 7.2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `base1`
--

DELIMITER $$
--
-- Процедуры
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_log` (IN `eq_v` VARCHAR(255) CHARSET utf8, IN `log_v` VARCHAR(255) CHARSET utf8)  NO SQL
insert into `model11`
(id, log, time) 
SELECT id, log_v, NOW()
FROM `model1`
WHERE equataion = eq_v$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `set_model` (IN `eq_v` VARCHAR(128) CHARSET utf8, IN `so_v` VARCHAR(128) CHARSET utf8)  NO SQL
INSERT into model1 
(equataion, solution) 
VALUES 
(eq_v, so_v)
ON DUPLICATE KEY UPDATE 
solution = so_v$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Структура таблицы `model1`
--

CREATE TABLE `model1` (
  `id` int(10) UNSIGNED NOT NULL,
  `equataion` varchar(128) DEFAULT NULL,
  `solution` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `model1`
--

INSERT INTO `model1` (`id`, `equataion`, `solution`) VALUES
(1, '23*x-111\n', '[111/23]'),
(2, '111*\n', NULL),
(3, '384*x-1111\n', '[1111/384]'),
(4, '12-x-211\n', '[-199]'),
(6, '1346*', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `model11`
--

CREATE TABLE `model11` (
  `id` int(10) UNSIGNED NOT NULL,
  `log` varchar(128) DEFAULT NULL,
  `time` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `model11`
--

INSERT INTO `model11` (`id`, `log`, `time`) VALUES
(2, 'Error in equation', '2018-07-09 20:30:20'),
(6, 'Error in equation', '2018-07-09 20:30:20');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `model1`
--
ALTER TABLE `model1`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `уравнение` (`equataion`) USING BTREE,
  ADD KEY `id` (`id`);

--
-- Индексы таблицы `model11`
--
ALTER TABLE `model11`
  ADD UNIQUE KEY `id_2` (`id`),
  ADD KEY `id` (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `model1`
--
ALTER TABLE `model1`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `model11`
--
ALTER TABLE `model11`
  ADD CONSTRAINT `fk_model11_id` FOREIGN KEY (`id`) REFERENCES `model1` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
