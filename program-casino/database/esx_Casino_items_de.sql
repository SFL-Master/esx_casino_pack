-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Erstellungszeit: 31. Mai 2019 um 14:13
-- Server-Version: 5.7.26-0ubuntu0.18.04.1
-- PHP-Version: 7.2.17-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `essentialmode`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `items`
--

CREATE TABLE IF NOT EXISTS `items` (
  `name` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `limit` int(11) NOT NULL DEFAULT '-1',
  `rare` int(11) NOT NULL DEFAULT '0',
  `can_remove` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Daten für Tabelle `items`
--

INSERT INTO `items` (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES
    ('jager', 'Jägermeister', 5, 0, 1),
    ('vodka', 'Vodka', 5, 0, 1),
    ('rhum', 'Rhum', 5, 0, 1),
    ('whisky', 'Whisky', 5, 0, 1),
    ('tequila', 'Tequila', 5, 0, 1),
    ('martini', 'White Martini', 5, 0, 1),
    ('soda', 'Soda', 5, 0, 1),
    ('jusfruit', 'Fruchtsaft', 5, 0, 1),
    ('icetea', 'Ice Tea', 5, 0, 1),
    ('energy', 'Energy Drink', 5, 0, 1),
    ('drpepper', 'Dr. Pepper', 5, 0, 1),
    ('limonade', 'Limonade', 5, 0, 1),
    ('bolcacahuetes', 'Schüssel Erdnüsse', 5, 0, 1),
    ('bolnoixcajou', 'Schüssel Cashewnüsse', 5, 0, 1),
    ('bolpistache', 'Schüssel Pistazien', 5, 0, 1),
    ('bolchips', 'Schüssel Chips', 5, 0, 1),
    ('saucisson', 'Wurst', 5, 0, 1),
    ('grapperaisin', 'Ein paar Trauben', 5, 0, 1),
    ('jagerbomb', 'Jägerbomb', 5, 0, 1),
    ('golem', 'Golem', 5, 0, 1),
    ('whiskycoca', 'Whisky-Cola', 5, 0, 1),
    ('vodkaenergy', 'Vodka-Energy', 5, 0, 1),
    ('vodkafruit', 'Vodka Fruchtsaft', 5, 0, 1),
    ('rhumfruit', 'Rhum Fruchtsaft', 5, 0, 1),
    ('teqpaf', "Teq'paf", 5, 0, 1),
    ('rhumcoca', 'Rhum-Cola', 5, 0, 1),
    ('mojito', 'Mojito', 5, 0, 1),
    ('ice', 'Ice', 5, 0, 1),
    ('mixapero', 'Aperitif Mix', 3, 0, 1),
    ('metreshooter', 'Shooter meter', 3, 0, 1),
    ('jagercerbere', 'Jäger Cerberus', 3, 0, 1),
    ('menthe', 'Minze Blatt', 10, 0, 1),
	('cchip', 'CasinoChip', -1, 0, 1),
    ('yusuf', 'Luxushaut', -1, 0, 1);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`name`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
