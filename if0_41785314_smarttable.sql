-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: sql113.infinityfree.com
-- Tempo de geração: 15-Jun-2026 às 16:55
-- Versão do servidor: 11.4.12-MariaDB
-- versão do PHP: 7.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `if0_41785314_smarttable`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `bar_orders`
--

CREATE TABLE `bar_orders` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `table_number` int(11) NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `customization` text DEFAULT NULL,
  `status` enum('pendente','preparando','pronto') NOT NULL DEFAULT 'pendente',
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `bar_orders`
--

INSERT INTO `bar_orders` (`id`, `order_id`, `table_number`, `item_name`, `quantity`, `customization`, `status`, `created_at`) VALUES
(9, 34, 3, 'Coca-Cola', 1, 'com gelo|bem fresca', 'pronto', '2026-06-15 19:45:35'),
(10, 36, 3, 'Coca-Cola', 1, 'com gelo|bem fresca', 'pronto', '2026-06-15 20:07:50'),
(11, 38, 3, 'Coca-Cola', 1, 'com gelo|bem fresca', 'pronto', '2026-06-15 20:10:03'),
(12, 40, 3, 'Coca-Cola', 1, 'com limão', 'pronto', '2026-06-15 20:14:13');

-- --------------------------------------------------------

--
-- Estrutura da tabela `manager_calls`
--

CREATE TABLE `manager_calls` (
  `id` int(11) NOT NULL,
  `table_number` int(11) DEFAULT NULL,
  `message` varchar(255) DEFAULT 'Cliente chamou o gerente',
  `status` enum('pendente','resolvido') NOT NULL DEFAULT 'pendente',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `resolved_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Extraindo dados da tabela `manager_calls`
--

INSERT INTO `manager_calls` (`id`, `table_number`, `message`, `status`, `created_at`, `resolved_at`) VALUES
(1, NULL, 'Cliente chamou o gerente na entrada', 'resolvido', '2026-05-21 01:04:20', '2026-05-22 12:25:45'),
(2, NULL, 'Cliente chamou o gerente na entrada', 'resolvido', '2026-05-21 01:04:25', '2026-05-22 12:25:46'),
(3, NULL, 'Cliente chamou o gerente na entrada', 'resolvido', '2026-05-22 12:57:28', '2026-05-22 13:11:19'),
(4, NULL, 'Cliente chamou o gerente na entrada', 'resolvido', '2026-05-27 08:14:24', '2026-05-27 08:15:08'),
(5, NULL, 'Cliente chamou o gerente na entrada', 'resolvido', '2026-05-28 14:07:49', '2026-05-29 01:02:22'),
(6, NULL, 'Cliente chamou o gerente na entrada', 'resolvido', '2026-06-03 04:09:56', '2026-06-03 04:10:08'),
(7, NULL, 'Cliente chamou o gerente na entrada', 'resolvido', '2026-06-08 08:56:56', '2026-06-09 06:07:52'),
(8, NULL, 'Cliente chamou o gerente na entrada', 'resolvido', '2026-06-15 19:44:33', '2026-06-15 19:49:18');

-- --------------------------------------------------------

--
-- Estrutura da tabela `menus`
--

CREATE TABLE `menus` (
  `id` int(11) NOT NULL,
  `name` varchar(120) NOT NULL,
  `description` text DEFAULT NULL,
  `category` enum('entrada','prato','bebida','sobremesa') NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `status` enum('disponivel','indisponivel') NOT NULL DEFAULT 'disponivel'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Extraindo dados da tabela `menus`
--

INSERT INTO `menus` (`id`, `name`, `description`, `category`, `price`, `status`) VALUES
(1, 'Pão de Alho', 'Pão torrado com manteiga de alho e ervas.', 'entrada', '3.50', 'disponivel'),
(2, 'Sopa do Dia', 'Sopa caseira preparada diariamente.', 'entrada', '2.90', 'disponivel'),
(3, 'Salada Mista', 'Alface, tomate, cebola e molho vinagrete.', 'entrada', '4.20', 'disponivel'),
(4, 'Bife da Casa', 'Bife grelhado com batatas fritas e molho especial.', 'prato', '14.90', 'disponivel'),
(5, 'Frango Grelhado', 'Peito de frango grelhado com arroz e salada.', 'prato', '11.50', 'disponivel'),
(6, 'Bacalhau à Brás', 'Bacalhau desfiado com batata palha e ovos.', 'prato', '13.80', 'disponivel'),
(7, 'Hambúrguer Gourmet', 'Hambúrguer com queijo, bacon e molho especial.', 'prato', '10.90', 'disponivel'),
(8, 'Pizza Margherita', 'Pizza com tomate, mozzarella e manjericão.', 'prato', '9.50', 'disponivel'),
(9, 'Água Mineral', 'Água natural 0.5L.', 'bebida', '1.50', 'disponivel'),
(10, 'Coca-Cola', 'Refrigerante lata 330ml.', 'bebida', '2.20', 'disponivel'),
(11, 'Sumo Natural', 'Sumo de laranja natural.', 'bebida', '3.00', 'disponivel'),
(12, 'Cerveja', 'Cerveja fresca 33cl.', 'bebida', '2.50', 'disponivel'),
(13, 'Vinho da Casa', 'Copo de vinho tinto ou branco.', 'bebida', '3.50', 'disponivel'),
(14, 'Mousse de Chocolate', 'Mousse caseira de chocolate.', 'sobremesa', '3.90', 'disponivel'),
(15, 'Bolo de Bolacha', 'Bolo tradicional com café e creme.', 'sobremesa', '4.20', 'disponivel'),
(16, 'Gelado', 'Bola de gelado à escolha.', 'sobremesa', '2.80', 'disponivel'),
(17, 'Pudim Flan', 'Pudim clássico com caramelo.', 'sobremesa', '3.50', 'disponivel'),
(19, 'Bolinhos de bacalhau', 'bolinhos de bacalhau, cremosos e crocantes.', 'entrada', '3.50', 'disponivel');

-- --------------------------------------------------------

--
-- Estrutura da tabela `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `table_number` int(11) NOT NULL,
  `total` decimal(10,2) NOT NULL DEFAULT 0.00,
  `status` enum('aberto','enviado','processando','pronto','finalizado','pagamento','pago','cancelado') NOT NULL DEFAULT 'aberto',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `payment_code` varchar(30) DEFAULT NULL,
  `payment_requested_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Extraindo dados da tabela `orders`
--

INSERT INTO `orders` (`id`, `table_number`, `total`, `status`, `created_at`, `payment_code`, `payment_requested_at`) VALUES
(34, 3, '2.20', 'cancelado', '2026-06-15 18:45:35', NULL, NULL),
(35, 3, '15.40', 'cancelado', '2026-06-15 18:46:33', NULL, NULL),
(36, 3, '2.20', 'pago', '2026-06-15 19:07:50', 'ST-3-7782', NULL),
(37, 3, '12.00', 'cancelado', '2026-06-15 19:07:56', 'ST-3-7782', NULL),
(38, 3, '2.20', 'cancelado', '2026-06-15 19:10:03', NULL, NULL),
(39, 3, '12.00', 'cancelado', '2026-06-15 19:10:10', NULL, NULL),
(40, 3, '2.20', 'cancelado', '2026-06-15 19:14:13', NULL, NULL),
(41, 3, '15.40', 'cancelado', '2026-06-15 19:14:51', NULL, NULL),
(42, 3, '11.50', 'pago', '2026-06-15 19:17:51', 'ST-3-9617', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `name` varchar(120) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `customization` text DEFAULT NULL,
  `category` varchar(50) NOT NULL DEFAULT 'outro'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Extraindo dados da tabela `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `menu_id`, `name`, `price`, `quantity`, `subtotal`, `customization`, `category`) VALUES
(52, 34, 0, 'Coca-Cola', '0.00', 1, '2.20', 'com gelo|bem fresca', 'bebida'),
(53, 35, 0, 'Bife da Casa', '0.00', 1, '15.40', 'bem passado|+ batata frita', 'prato'),
(54, 36, 0, 'Coca-Cola', '0.00', 1, '2.20', 'com gelo|bem fresca', 'bebida'),
(55, 37, 0, 'Frango Grelhado', '0.00', 1, '12.00', 'mal passado|+ batata frita', 'prato'),
(56, 38, 0, 'Coca-Cola', '0.00', 1, '2.20', 'com gelo|bem fresca', 'bebida'),
(57, 39, 0, 'Frango Grelhado', '0.00', 1, '12.00', 'mal passado|+ batata frita', 'prato'),
(58, 40, 0, 'Coca-Cola', '0.00', 1, '2.20', 'com limão', 'bebida'),
(59, 41, 0, 'Bife da Casa', '0.00', 1, '15.40', 'mal passado|+ batata frita', 'prato'),
(60, 42, 0, 'Frango Grelhado', '0.00', 1, '11.50', 'mal passado', 'prato');

-- --------------------------------------------------------

--
-- Estrutura da tabela `order_movements`
--

CREATE TABLE `order_movements` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `status` varchar(50) NOT NULL,
  `message` text DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `order_movements`
--

INSERT INTO `order_movements` (`id`, `order_id`, `status`, `message`, `created_at`) VALUES
(1, 20, 'pronto', 'A cozinha finalizou o pedido.', '2026-06-02 11:59:28'),
(2, 22, 'pronto', 'A cozinha finalizou o pedido.', '2026-06-02 11:59:32'),
(3, 21, 'pronto', 'A cozinha finalizou o pedido.', '2026-06-02 11:59:35'),
(4, 18, 'pronto', 'A cozinha finalizou o pedido.', '2026-06-02 11:59:40'),
(5, 18, 'pronto', 'A cozinha finalizou o pedido.', '2026-06-02 11:59:46'),
(6, 18, 'pronto', 'A cozinha finalizou o pedido.', '2026-06-02 11:59:53'),
(7, 18, 'pronto', 'A cozinha finalizou o pedido.', '2026-06-02 11:59:59'),
(8, 18, 'pronto', 'A cozinha finalizou o pedido.', '2026-06-02 12:00:06'),
(9, 25, 'processando', 'A cozinha começou a preparar o pedido.', '2026-06-03 03:47:02'),
(10, 25, 'processando', 'A cozinha começou a preparar o pedido.', '2026-06-03 03:47:08'),
(11, 25, 'processando', 'A cozinha começou a preparar o pedido.', '2026-06-03 03:47:16'),
(12, 25, 'pronto', 'A cozinha finalizou o pedido.', '2026-06-03 03:48:10'),
(13, 25, 'pronto', 'A cozinha finalizou o pedido.', '2026-06-03 03:48:16'),
(14, 29, 'pronto', 'A cozinha finalizou o pedido.', '2026-06-03 13:15:32'),
(15, 29, 'pronto', 'A cozinha finalizou o pedido.', '2026-06-03 13:15:39'),
(16, 33, 'processando', 'A cozinha começou a preparar o pedido.', '2026-06-11 01:00:29'),
(17, 33, 'pronto', 'A cozinha finalizou o pedido.', '2026-06-11 01:02:35');

-- --------------------------------------------------------

--
-- Estrutura da tabela `php_sessions`
--

CREATE TABLE `php_sessions` (
  `id` varchar(128) NOT NULL,
  `data` mediumtext NOT NULL,
  `updated_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `php_sessions`
--

INSERT INTO `php_sessions` (`id`, `data`, `updated_at`) VALUES
('08b4394ea8738acafe78ca42ee10dffc', '', 1780951421),
('0b21a7f209e73509c31af058bca979b5', '', 1780999454),
('147a7cc5e1296f883c3d2c9e4820e95c', 'user_id|i:6;username|s:5:\"admin\";name|s:17:\"Gonçalo Ferreira\";role|s:5:\"admin\";last_ping|i:1781005607;', 1781005607),
('1ffb460025cb674964e2e8ef0980a8f1', 'mesa_numero|i:2;cart|a:0:{}last_ping|i:1781531624;user_id|i:6;username|s:5:\"admin\";name|s:17:\"Gonçalo Ferreira\";role|s:5:\"admin\";', 1781531624),
('215210d677ab13ac569fd82d50b9e1de', 'user_id|i:6;username|s:5:\"admin\";name|s:17:\"Gonçalo Ferreira\";role|s:5:\"admin\";last_ping|i:1781207576;', 1781207624),
('28091b8b44de7f7438dec65f8a569d6d', '', 1781522119),
('2851b9f0277848a4602a7dde7ee2dcd0', '', 1781030017),
('2df06cbf801d2a71cb40b219edaf6b92', 'user_id|i:6;username|s:5:\"admin\";name|s:17:\"Gonçalo Ferreira\";role|s:5:\"admin\";last_ping|i:1781524311;', 1781524311),
('41f01e2ce14cf558ff621af0f28e6078', 'user_id|i:35;username|s:5:\"Rosas\";name|s:15:\"Francisco Rosas\";role|s:6:\"garcom\";last_ping|i:1781170588;', 1781170717),
('4a1ef1922049bd840fbff8c1168e1f98', 'user_id|i:6;username|s:5:\"admin\";name|s:17:\"Gonçalo Ferreira\";role|s:5:\"admin\";last_ping|i:1781540441;', 1781540441),
('6383e23500e54aa89361cf64947050e6', 'user_id|i:6;username|s:5:\"admin\";name|s:17:\"Gonçalo Ferreira\";role|s:5:\"admin\";last_ping|i:1781549477;', 1781549477),
('7de4608be3773d4d41c6550401c53e34', '', 1781511125),
('7fd52a0905f9d1053ad279f5c284abba', '', 1781524704),
('85c8b27499182139bc0363c0f9eed244', '', 1781013044),
('8960f15c3ac24e34932375d83f3984b9', 'user_id|i:6;username|s:5:\"admin\";name|s:17:\"Gonçalo Ferreira\";role|s:5:\"admin\";last_ping|i:1781552281;', 1781552311),
('8dd0a9393d66e38a45c60ab88fda9c1a', 'mesa_numero|i:2;cart|a:0:{}last_ping|i:1780951621;', 1780951621),
('96e28f90bb625adb1c04837aecf13f6d', '', 1781163775),
('9a67e00fbf415195624d2249cb05d8d8', 'user_id|i:6;username|s:5:\"admin\";name|s:17:\"Gonçalo Ferreira\";role|s:5:\"admin\";last_ping|i:1781535527;', 1781535622),
('aef8b359e0b7f1dc0afafec99ed6330c', '', 1780956457),
('b4922b29084afc817ad489a1a69a92d5', 'user_id|i:6;username|s:5:\"admin\";name|s:17:\"Gonçalo Ferreira\";role|s:5:\"admin\";last_ping|i:1781011407;', 1781011407),
('bed3504d6967f63c0b1a73b43624926e', 'user_id|i:6;username|s:5:\"admin\";name|s:17:\"Gonçalo Ferreira\";role|s:5:\"admin\";last_ping|i:1781170648;', 1781170709),
('dcc8c4d50daed73b0d7591c95a0018b8', '', 1781540300),
('e691a2bf0bb9974db9efa11833507abf', '', 1780999514),
('eabdac7ed231b57e8e65279c326f7c3b', 'mesa_numero|i:2;cart|a:0:{}last_ping|i:1781167935;', 1781167935),
('ead726535438f7e56cb0b5aa8674ba33', '', 1781540993);

-- --------------------------------------------------------

--
-- Estrutura da tabela `restaurant_map`
--

CREATE TABLE `restaurant_map` (
  `id` int(11) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `label` varchar(120) DEFAULT 'Planta Principal',
  `ativo` tinyint(1) DEFAULT 1,
  `uploaded_at` datetime DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Extraindo dados da tabela `restaurant_map`
--

INSERT INTO `restaurant_map` (`id`, `filename`, `label`, `ativo`, `uploaded_at`) VALUES
(3, 'mapa_restaurante_1781165835.svg', 'Planta Principal', 1, '2026-06-11 01:17:15');

-- --------------------------------------------------------

--
-- Estrutura da tabela `system_settings`
--

CREATE TABLE `system_settings` (
  `id` int(11) NOT NULL,
  `restaurant_name` varchar(255) NOT NULL DEFAULT 'SmartTable',
  `primary_color` varchar(20) NOT NULL DEFAULT '#c9a84c',
  `secondary_color` varchar(20) NOT NULL DEFAULT '#e8c97a',
  `background_color` varchar(20) NOT NULL DEFAULT '#0d0600',
  `text_color` varchar(20) NOT NULL DEFAULT '#f5ead8',
  `font_family` varchar(255) NOT NULL DEFAULT 'Georgia',
  `logo` varchar(255) DEFAULT NULL,
  `background_image` varchar(255) DEFAULT NULL,
  `accent_color` varchar(20) NOT NULL DEFAULT '#86efac',
  `font_size` varchar(10) NOT NULL DEFAULT '15',
  `border_radius` varchar(10) NOT NULL DEFAULT '14',
  `sidebar_style` varchar(30) NOT NULL DEFAULT 'dark',
  `show_logo_text` tinyint(1) NOT NULL DEFAULT 1,
  `compact_mode` tinyint(1) NOT NULL DEFAULT 0,
  `updated_at` datetime DEFAULT NULL,
  `sidebar_bg` varchar(20) NOT NULL DEFAULT '#110800',
  `card_bg` varchar(20) NOT NULL DEFAULT '#1a0e04',
  `border_color` varchar(20) NOT NULL DEFAULT '#3a2a10',
  `input_bg` varchar(20) NOT NULL DEFAULT '#0d0600',
  `shadow_intensity` varchar(20) NOT NULL DEFAULT 'medium'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Extraindo dados da tabela `system_settings`
--

INSERT INTO `system_settings` (`id`, `restaurant_name`, `primary_color`, `secondary_color`, `background_color`, `text_color`, `font_family`, `logo`, `background_image`, `accent_color`, `font_size`, `border_radius`, `sidebar_style`, `show_logo_text`, `compact_mode`, `updated_at`, `sidebar_bg`, `card_bg`, `border_color`, `input_bg`, `shadow_intensity`) VALUES
(1, 'SmartTable', '#c9a84c', '#e8c97a', '#0d0600', '#f5ead8', 'Georgia', NULL, NULL, '#86efac', '15', '14', 'dark', 1, 0, '2026-05-29 13:33:51', '#110800', '#1a0e04', '#3a2a10', '#0d0600', 'medium');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tables`
--

CREATE TABLE `tables` (
  `id` int(11) NOT NULL,
  `number` int(11) NOT NULL,
  `capacity` int(11) NOT NULL,
  `occupied_seats` int(11) NOT NULL DEFAULT 0,
  `arrival_time` datetime DEFAULT NULL,
  `status` enum('livre','ocupada','reservada','manutencao') NOT NULL DEFAULT 'livre',
  `type_table` enum('quadrada','redonda','retangular') NOT NULL DEFAULT 'quadrada',
  `last_activity` datetime DEFAULT NULL,
  `main_unlocked` tinyint(1) NOT NULL DEFAULT 0,
  `dessert_unlocked` tinyint(1) NOT NULL DEFAULT 0,
  `entries_drinks_delivered_at` datetime DEFAULT NULL,
  `main_delivered_at` datetime DEFAULT NULL,
  `dessert_unlocked_at` datetime DEFAULT NULL,
  `main_unlocked_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Extraindo dados da tabela `tables`
--

INSERT INTO `tables` (`id`, `number`, `capacity`, `occupied_seats`, `arrival_time`, `status`, `type_table`, `last_activity`, `main_unlocked`, `dessert_unlocked`, `entries_drinks_delivered_at`, `main_delivered_at`, `dessert_unlocked_at`, `main_unlocked_at`) VALUES
(1, 1, 4, 0, NULL, 'livre', 'quadrada', '2026-05-18 04:41:31', 0, 0, NULL, NULL, NULL, NULL),
(2, 2, 4, 0, NULL, 'livre', 'quadrada', '2026-05-24 09:12:55', 0, 0, NULL, NULL, NULL, NULL),
(3, 3, 4, 0, NULL, 'livre', 'quadrada', NULL, 0, 0, NULL, NULL, NULL, NULL),
(4, 4, 4, 0, NULL, 'livre', 'quadrada', NULL, 0, 0, NULL, NULL, NULL, NULL),
(5, 5, 6, 0, NULL, 'livre', 'redonda', NULL, 0, 0, NULL, NULL, NULL, NULL),
(6, 6, 6, 0, NULL, 'livre', 'redonda', NULL, 0, 0, NULL, NULL, NULL, NULL),
(7, 7, 8, 0, NULL, 'livre', 'retangular', NULL, 0, 0, NULL, NULL, NULL, NULL),
(8, 8, 4, 0, NULL, 'livre', 'retangular', NULL, 0, 0, NULL, NULL, NULL, NULL),
(9, 9, 2, 0, NULL, 'livre', 'quadrada', NULL, 0, 0, NULL, NULL, NULL, NULL),
(10, 10, 4, 0, NULL, 'livre', 'retangular', NULL, 0, 0, NULL, NULL, NULL, NULL),
(11, 11, 6, 0, NULL, 'livre', 'redonda', NULL, 0, 0, NULL, NULL, NULL, NULL),
(25, 12, 4, 0, NULL, 'livre', 'quadrada', NULL, 0, 0, NULL, NULL, NULL, NULL),
(13, 13, 2, 0, NULL, 'livre', 'quadrada', NULL, 0, 0, NULL, NULL, NULL, NULL),
(14, 14, 4, 0, NULL, 'livre', 'quadrada', NULL, 0, 0, NULL, NULL, NULL, NULL),
(15, 15, 6, 0, NULL, 'livre', 'redonda', NULL, 0, 0, NULL, NULL, NULL, NULL),
(16, 16, 8, 0, NULL, 'livre', 'retangular', NULL, 0, 0, NULL, NULL, NULL, NULL),
(17, 17, 2, 0, NULL, 'livre', 'quadrada', NULL, 0, 0, NULL, NULL, NULL, NULL),
(18, 18, 4, 0, NULL, 'livre', 'quadrada', NULL, 0, 0, NULL, NULL, NULL, NULL),
(19, 19, 6, 0, NULL, 'livre', 'redonda', NULL, 0, 0, NULL, NULL, NULL, NULL),
(20, 20, 8, 0, NULL, 'livre', 'retangular', NULL, 0, 0, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(60) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('entrada','mesa','empregado_mesa','cozinha','bar','gerente','admin') NOT NULL DEFAULT 'empregado_mesa',
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `mesa_id` int(11) DEFAULT NULL,
  `name` varchar(90) NOT NULL,
  `email` varchar(100) NOT NULL,
  `rfid_code` varchar(100) DEFAULT NULL,
  `remember_token` varchar(255) DEFAULT NULL,
  `remember_expires` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`, `active`, `mesa_id`, `name`, `email`, `rfid_code`, `remember_token`, `remember_expires`) VALUES
(6, 'admin', '$2y$10$Lpr0eSkTuJM5JMtSjWBJI.UcyhiLrVzsZdXy40YHyc/Pr9IrAppmK', 'admin', 1, NULL, 'Gonçalo Ferreira', 'goncalo.costa.ferreira2008@gmail.com', '0012311962', '1323e6b4a5e73d7e37dbad93ee92ecbf639ea278c999c3e9c48aed3dff6a1fce', '2026-06-22 20:20:58'),
(10, 'João Teixeira', '$2y$10$14sV4J1/Pdhum0sRRplo2u2zU06qy6PixTi2o22wo5Zryha1/Onq2', 'empregado_mesa', 1, NULL, 'João Teixeira', 'joaoteixeira1999@gmail.com', NULL, NULL, NULL),
(33, 'Cozinha', '$2y$10$Px5e6aYqaaYJcQ3jJNh0HONFUGPIVMo9l6PIRvVKKHstRuS59qD.C', 'cozinha', 1, NULL, 'Cozinha', 'cozinha@gmail.com', '0012322509', 'd5a3894916a3bbac95c066a33eb57664fc857699367b613b76971addc072a652', '2026-06-22 19:46:41'),
(34, 'JLM', '$2y$10$bzJrqL8LjBwLYGcw3wnw4euEVU.brC3poyQ4q25B3VRISx9mtKfBu', 'admin', 1, NULL, 'Luis Mendes', 'josemendes@oficina.pt', '0004632759', NULL, NULL),
(35, 'Rosas', '$2y$10$pB2weR5c3tXB7lYQMcOnPOG8rggrIWrn9zKiHZH6adTv2kQ0xUv5e', 'empregado_mesa', 1, NULL, 'Francisco Rosas', 'franciscorosas@gmail.com', '0012311947', 'a743a91e2626770504a849b00cba4243aa15bd207a4ffb90bdd02b77c9d957db', '2026-06-22 20:17:57'),
(36, 'Pacheco', '$2y$10$xOtgum.ZBflgM2N2knADZejeTT.kenmUb0GxwIMIQ6RZ8rmVKW6yK', 'empregado_mesa', 1, NULL, 'Rodrigo', 'rodrigo@gmai.com', '0012322394', NULL, NULL),
(37, 'bar', '$2y$10$hgaEr1qAyLgCAt7../yp4.s1TIzhvl7Mf3O4mNuPmgTaYG1dzHkKO', 'bar', 1, NULL, 'Tiago Silva', 'bar@gmail.com', NULL, '4da372b7375cd07e9c6dc3de1bd6e895d5821899753c029056623dd0a7d409be', '2026-06-22 19:45:31'),
(38, 'Afonso', '$2y$10$LKBhjuNFD9ybLFSH.7PKw.tKCga8JL9p3C83TQGRG9C2tPpH6wl2e', 'empregado_mesa', 1, NULL, 'Afonso Silva', 'afonsosilva@gmail.com', '0004633641', NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `waiter_tables`
--

CREATE TABLE `waiter_tables` (
  `id` int(11) NOT NULL,
  `waiter_id` int(11) NOT NULL,
  `table_number` int(11) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Extraindo dados da tabela `waiter_tables`
--

INSERT INTO `waiter_tables` (`id`, `waiter_id`, `table_number`, `created_at`) VALUES
(54, 35, 3, '2026-06-06 15:08:26'),
(55, 35, 4, '2026-06-06 15:08:26'),
(56, 35, 5, '2026-06-06 15:08:26'),
(74, 38, 16, '2026-06-15 15:34:14'),
(52, 35, 1, '2026-06-06 15:08:26'),
(70, 10, 7, '2026-06-06 15:09:11'),
(69, 10, 6, '2026-06-06 15:09:11'),
(73, 10, 10, '2026-06-06 15:09:11'),
(75, 38, 17, '2026-06-15 15:34:14'),
(71, 10, 8, '2026-06-06 15:09:11'),
(72, 10, 9, '2026-06-06 15:09:11'),
(68, 36, 15, '2026-06-06 15:09:07'),
(67, 36, 14, '2026-06-06 15:09:07'),
(66, 36, 13, '2026-06-06 15:09:07'),
(65, 36, 12, '2026-06-06 15:09:07'),
(53, 35, 2, '2026-06-06 15:08:26'),
(64, 36, 11, '2026-06-06 15:09:07'),
(76, 38, 18, '2026-06-15 15:34:14'),
(77, 38, 19, '2026-06-15 15:34:14'),
(78, 38, 20, '2026-06-15 15:34:14');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `bar_orders`
--
ALTER TABLE `bar_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_order_id` (`order_id`);

--
-- Índices para tabela `manager_calls`
--
ALTER TABLE `manager_calls`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `order_movements`
--
ALTER TABLE `order_movements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_order_id` (`order_id`);

--
-- Índices para tabela `php_sessions`
--
ALTER TABLE `php_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_updated` (`updated_at`);

--
-- Índices para tabela `restaurant_map`
--
ALTER TABLE `restaurant_map`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `system_settings`
--
ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tables`
--
ALTER TABLE `tables`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `number` (`number`);

--
-- Índices para tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Índices para tabela `waiter_tables`
--
ALTER TABLE `waiter_tables`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_assignment` (`waiter_id`,`table_number`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `bar_orders`
--
ALTER TABLE `bar_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `manager_calls`
--
ALTER TABLE `manager_calls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de tabela `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT de tabela `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT de tabela `order_movements`
--
ALTER TABLE `order_movements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de tabela `restaurant_map`
--
ALTER TABLE `restaurant_map`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `tables`
--
ALTER TABLE `tables`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT de tabela `waiter_tables`
--
ALTER TABLE `waiter_tables`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
