-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 17-08-2019 a las 17:31:34
-- Versión del servidor: 5.7.19
-- Versión de PHP: 7.0.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `islatec`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE IF NOT EXISTS `clientes` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_cliente` varchar(255) NOT NULL,
  `telefono_cliente` char(30) NOT NULL,
  `email_cliente` varchar(64) NOT NULL,
  `direccion_cliente` varchar(255) NOT NULL,
  `status_cliente` tinyint(4) NOT NULL,
  `date_added` datetime NOT NULL,
  `nombre_comercial_cliente` varchar(255) NOT NULL,
  `poblacion_cliente` varchar(255) NOT NULL,
  `cp_cliente` int(11) NOT NULL,
  `provincia_cliente` varchar(255) NOT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `codigo_producto` (`nombre_cliente`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `nombre_cliente`, `telefono_cliente`, `email_cliente`, `direccion_cliente`, `status_cliente`, `date_added`, `nombre_comercial_cliente`, `poblacion_cliente`, `cp_cliente`, `provincia_cliente`) VALUES
(1, 'Services Line Integral Spain 2013 S.L.', '681242430', 'mcatala@servicesline.es', 'Camino de la milana nÂº 36', 1, '2019-07-11 19:51:10', '', 'palma', 7198, ''),
(2, 'Services Line', '627 16 54 85', 'miguelcatala90@gmail.com', 'roci', 1, '2019-07-11 20:40:57', ' ghj', 'palma', 7198, 'balear'),
(3, 'armando', '9755912', 'kenneth.zambrano4@gmail.com', 'qwdqwd', 1, '2019-08-12 16:00:06', 'amr', 'palma', 120002, 'baleares'),
(4, 'miki', '1231254213', 'miki@miki.com', 'calle miki', 1, '2019-08-12 17:56:07', 'mikiel', 'palma ', 1002, 'baleares');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `currencies`
--

DROP TABLE IF EXISTS `currencies`;
CREATE TABLE IF NOT EXISTS `currencies` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `symbol` varchar(255) NOT NULL,
  `precision` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `thousand_separator` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `decimal_separator` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `symbol`, `precision`, `thousand_separator`, `decimal_separator`, `code`) VALUES
(1, 'US Dollar', '$', '2', ',', '.', 'USD'),
(2, 'Libra Esterlina', '&pound;', '2', ',', '.', 'GBP'),
(3, 'Euro', 'â‚¬', '2', '.', ',', 'EUR'),
(4, 'South African Rand', 'R', '2', '.', ',', 'ZAR'),
(5, 'Danish Krone', 'kr ', '2', '.', ',', 'DKK'),
(6, 'Israeli Shekel', 'NIS ', '2', ',', '.', 'ILS'),
(7, 'Swedish Krona', 'kr ', '2', '.', ',', 'SEK'),
(8, 'Kenyan Shilling', 'KSh ', '2', ',', '.', 'KES'),
(9, 'Canadian Dollar', 'C$', '2', ',', '.', 'CAD'),
(10, 'Philippine Peso', 'P ', '2', ',', '.', 'PHP'),
(11, 'Indian Rupee', 'Rs. ', '2', ',', '.', 'INR'),
(12, 'Australian Dollar', '$', '2', ',', '.', 'AUD'),
(13, 'Singapore Dollar', 'SGD ', '2', ',', '.', 'SGD'),
(14, 'Norske Kroner', 'kr ', '2', '.', ',', 'NOK'),
(15, 'New Zealand Dollar', '$', '2', ',', '.', 'NZD'),
(16, 'Vietnamese Dong', 'VND ', '0', '.', ',', 'VND'),
(17, 'Swiss Franc', 'CHF ', '2', '\'', '.', 'CHF'),
(18, 'Quetzal Guatemalteco', 'Q', '2', ',', '.', 'GTQ'),
(19, 'Malaysian Ringgit', 'RM', '2', ',', '.', 'MYR'),
(20, 'Real Brasile&ntilde;o', 'R$', '2', '.', ',', 'BRL'),
(21, 'Thai Baht', 'THB ', '2', ',', '.', 'THB'),
(22, 'Nigerian Naira', 'NGN ', '2', ',', '.', 'NGN'),
(23, 'Peso Argentino', '$', '2', '.', ',', 'ARS'),
(24, 'Bangladeshi Taka', 'Tk', '2', ',', '.', 'BDT'),
(25, 'United Arab Emirates Dirham', 'DH ', '2', ',', '.', 'AED'),
(26, 'Hong Kong Dollar', '$', '2', ',', '.', 'HKD'),
(27, 'Indonesian Rupiah', 'Rp', '2', ',', '.', 'IDR'),
(28, 'Peso Mexicano', '$', '2', ',', '.', 'MXN'),
(29, 'Egyptian Pound', '&pound;', '2', ',', '.', 'EGP'),
(30, 'Peso Colombiano', '$', '2', '.', ',', 'COP'),
(31, 'West African Franc', 'CFA ', '2', ',', '.', 'XOF'),
(32, 'Chinese Renminbi', 'RMB ', '2', ',', '.', 'CNY');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_factura`
--

DROP TABLE IF EXISTS `detalle_factura`;
CREATE TABLE IF NOT EXISTS `detalle_factura` (
  `id_detalle` int(11) NOT NULL AUTO_INCREMENT,
  `numero_factura` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_venta` double NOT NULL,
  `id_partida` int(16) NOT NULL,
  PRIMARY KEY (`id_detalle`),
  KEY `numero_cotizacion` (`numero_factura`,`id_producto`)
) ENGINE=MyISAM AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `detalle_factura`
--

INSERT INTO `detalle_factura` (`id_detalle`, `numero_factura`, `id_producto`, `cantidad`, `precio_venta`, `id_partida`) VALUES
(50, 7, 45, 1, 15, 13),
(55, 9, 50, 1, 12, 19),
(53, 8, 48, 1, 12, 15),
(52, 8, 47, 4, 5, 14),
(49, 7, 44, 1, 15, 13),
(48, 7, 43, 1, 15, 13),
(51, 8, 46, 4, 5, 14),
(47, 7, 42, 1, 5, 12),
(46, 7, 41, 1, 5, 12),
(58, 9, 53, 1, 12, 20),
(57, 9, 52, 1, 12, 0),
(61, 9, 56, 3, 12, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_presupuesto`
--

DROP TABLE IF EXISTS `detalle_presupuesto`;
CREATE TABLE IF NOT EXISTS `detalle_presupuesto` (
  `id_detalle` int(11) NOT NULL AUTO_INCREMENT,
  `numero_presupuesto` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_venta` double NOT NULL,
  PRIMARY KEY (`id_detalle`),
  KEY `numero_presupuesto` (`numero_presupuesto`),
  KEY `id_producto` (`id_producto`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_proforma`
--

DROP TABLE IF EXISTS `detalle_proforma`;
CREATE TABLE IF NOT EXISTS `detalle_proforma` (
  `id_detalle` int(11) NOT NULL AUTO_INCREMENT,
  `numero_proforma` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_venta` double NOT NULL,
  PRIMARY KEY (`id_detalle`),
  KEY `numero_proforma` (`numero_proforma`),
  KEY `id_producto` (`id_producto`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturas`
--

DROP TABLE IF EXISTS `facturas`;
CREATE TABLE IF NOT EXISTS `facturas` (
  `id_factura` int(11) NOT NULL AUTO_INCREMENT,
  `numero_factura` int(11) NOT NULL,
  `fecha_factura` datetime NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_vendedor` int(11) NOT NULL,
  `condiciones` varchar(30) NOT NULL,
  `total_venta` varchar(20) NOT NULL,
  `estado_factura` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_factura`),
  UNIQUE KEY `numero_cotizacion` (`numero_factura`)
) ENGINE=MyISAM AUTO_INCREMENT=146 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `facturas`
--

INSERT INTO `facturas` (`id_factura`, `numero_factura`, `fecha_factura`, `id_cliente`, `id_vendedor`, `condiciones`, `total_venta`, `estado_factura`) VALUES
(145, 9, '2019-08-16 14:00:24', 1, 1, '1', '87.12', 2),
(144, 8, '2019-08-15 18:37:35', 4, 1, '1', '62.92', 2),
(143, 7, '2019-08-12 17:56:17', 4, 1, '1', '66.55', 1),
(142, 6, '2019-08-12 17:54:51', 3, 1, '1', '0', 1),
(141, 5, '2019-08-12 17:54:20', 3, 1, '1', '', 1),
(132, 3, '2019-08-12 15:32:43', 1, 1, '1', '0', 1),
(139, 4, '2019-08-12 16:07:16', 1, 1, '1', '0', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `partidas`
--

DROP TABLE IF EXISTS `partidas`;
CREATE TABLE IF NOT EXISTS `partidas` (
  `id_partida` int(16) NOT NULL AUTO_INCREMENT,
  `nombre_partida` varchar(50) NOT NULL,
  `datecreate` datetime NOT NULL,
  `numero_factura` int(16) NOT NULL,
  PRIMARY KEY (`id_partida`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `partidas`
--

INSERT INTO `partidas` (`id_partida`, `nombre_partida`, `datecreate`, `numero_factura`) VALUES
(14, 'PartidaMiki', '2019-08-15 18:38:23', 8),
(13, 'mikipart2', '2019-08-15 15:22:20', 7),
(12, 'mikipart', '2019-08-15 15:18:23', 7),
(15, 'mikini', '2019-08-15 18:39:02', 8),
(16, 'daniel', '2019-08-15 18:40:45', 8),
(17, 'nuew', '2019-08-16 12:08:25', 8),
(21, 'cualquiera', '2019-08-16 22:08:58', 9),
(23, 'cualquiera', '2019-08-16 22:09:27', 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfil`
--

DROP TABLE IF EXISTS `perfil`;
CREATE TABLE IF NOT EXISTS `perfil` (
  `id_perfil` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_empresa` varchar(150) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `ciudad` varchar(100) NOT NULL,
  `codigo_postal` varchar(100) NOT NULL,
  `estado` varchar(100) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `email` varchar(64) NOT NULL,
  `impuesto` int(2) NOT NULL,
  `moneda` varchar(6) NOT NULL,
  `logo_url` varchar(255) NOT NULL,
  PRIMARY KEY (`id_perfil`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `perfil`
--

INSERT INTO `perfil` (`id_perfil`, `nombre_empresa`, `direccion`, `ciudad`, `codigo_postal`, `estado`, `telefono`, `email`, `impuesto`, `moneda`, `logo_url`) VALUES
(1, 'SISTEMAS WEB LA', 'Colonias Los Andes  #250', 'Moncagua', '3301', 'San Miguel', '+(503) 2682-555', 'info@obedalvarado.pw', 21, 'â‚¬', 'img/1478792451_google30.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `presupuestos`
--

DROP TABLE IF EXISTS `presupuestos`;
CREATE TABLE IF NOT EXISTS `presupuestos` (
  `id_presupuesto` int(11) NOT NULL AUTO_INCREMENT,
  `numero_presupuesto` int(11) NOT NULL,
  `fecha_presupuesto` datetime NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_vendedor` int(11) NOT NULL,
  `condiciones` varchar(30) CHARACTER SET utf8 NOT NULL,
  `total_venta` varchar(20) CHARACTER SET utf8 NOT NULL,
  `estado_presupuesto` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_presupuesto`),
  KEY `numero_presupuesto` (`numero_presupuesto`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `presupuestos`
--

INSERT INTO `presupuestos` (`id_presupuesto`, `numero_presupuesto`, `fecha_presupuesto`, `id_cliente`, `id_vendedor`, `condiciones`, `total_venta`, `estado_presupuesto`) VALUES
(2, 100, '2019-07-19 00:00:00', 2, 1, '1', '0', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id_producto` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_producto` char(20) NOT NULL,
  `nombre_producto` char(255) NOT NULL,
  `status_producto` tinyint(4) NOT NULL,
  `date_added` datetime NOT NULL,
  `precio_producto` double NOT NULL,
  PRIMARY KEY (`id_producto`),
  UNIQUE KEY `codigo_producto` (`codigo_producto`)
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id_producto`, `codigo_producto`, `nombre_producto`, `status_producto`, `date_added`, `precio_producto`) VALUES
(21, 'qwd', 'qwdqwd', 1, '2019-08-10 17:06:48', 11),
(22, '123', 'miki', 1, '2019-08-10 17:07:31', 12),
(23, 'mmgv', 'mmg', 1, '2019-08-10 17:09:12', 1),
(24, 'as', 'mlk', 1, '2019-08-10 17:38:29', 12),
(25, 'asd', 'asd', 1, '2019-08-12 21:45:49', 12),
(26, 'new', 'nuevo', 1, '2019-08-14 20:44:06', 2),
(27, '1234', 'wqd', 1, '2019-08-15 12:44:03', 1),
(28, '664', 'asd22', 1, '2019-08-15 12:48:34', 12),
(29, 'g498', '123213', 1, '2019-08-15 12:50:16', 11),
(30, 'B861V', '21123', 1, '2019-08-15 12:51:42', 22),
(31, 'R206b', 'blbla', 1, '2019-08-15 12:53:58', 22),
(32, 'j846M', 'qwd', 1, '2019-08-15 12:54:41', 12),
(33, 'b729Z', 'qwd2', 1, '2019-08-15 12:54:47', 12),
(34, 'l750d', '124', 1, '2019-08-15 12:56:14', 124),
(35, 'o196X', 'blablacar', 1, '2019-08-15 12:57:47', 560),
(36, 'o351o', 'blablacar', 1, '2019-08-15 12:58:07', 560),
(37, 'b410m', 'casc', 1, '2019-08-15 13:14:26', 200),
(38, 'O793y', 'p10', 1, '2019-08-15 14:50:00', 10),
(39, 'y191K', 'newsss', 1, '2019-08-15 15:05:03', 12),
(40, 'i131y', 'otrqw', 1, '2019-08-15 15:17:49', 5),
(41, 'h653V', 'mikipro', 1, '2019-08-15 15:21:55', 5),
(42, 'B726l', 'mikipro2', 1, '2019-08-15 15:22:03', 5),
(43, 'K844B', 'sencondpro', 1, '2019-08-15 15:22:38', 15),
(44, 'X815k', 'sencondpro', 1, '2019-08-15 15:22:42', 15),
(45, 'V880A', 'sencondpro', 1, '2019-08-15 15:22:44', 15),
(46, 'Q954N', 'mikiproduct', 1, '2019-08-15 18:38:47', 5),
(47, 'Z258C', 'mikiproduct', 1, '2019-08-15 18:38:53', 5),
(48, 'k464g', 'wqdqwdwqd', 1, '2019-08-15 18:39:10', 12),
(49, 'h254b', 'primero', 1, '2019-08-16 14:00:40', 12),
(50, 'p719b', 'pro1', 1, '2019-08-16 14:28:38', 12),
(51, 'N716A', 'wqd', 1, '2019-08-16 14:33:13', 1),
(52, 'u862Y', 'dwq', 1, '2019-08-16 22:01:08', 12),
(53, 'u373a', 'pro', 1, '2019-08-16 22:08:21', 12),
(54, 'a181P', 'pro', 1, '2019-08-16 22:08:24', 12),
(55, 't737Q', 'pro', 1, '2019-08-16 22:08:27', 12),
(56, 'B134j', 'pro', 1, '2019-08-16 22:08:50', 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tmp`
--

DROP TABLE IF EXISTS `tmp`;
CREATE TABLE IF NOT EXISTS `tmp` (
  `id_tmp` int(11) NOT NULL AUTO_INCREMENT,
  `id_producto` int(11) NOT NULL,
  `cantidad_tmp` int(11) NOT NULL,
  `precio_tmp` double(8,2) DEFAULT NULL,
  `session_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_tmp`)
) ENGINE=MyISAM AUTO_INCREMENT=94 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'auto incrementing user_id of each user, unique index',
  `firstname` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `user_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'user''s name, unique',
  `user_password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'user''s password in salted and hashed format',
  `user_email` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'user''s email, unique',
  `date_added` datetime NOT NULL,
  `level` int(11) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_name` (`user_name`),
  UNIQUE KEY `user_email` (`user_email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='user data';

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`user_id`, `firstname`, `lastname`, `user_name`, `user_password_hash`, `user_email`, `date_added`, `level`) VALUES
(1, 'Obed', 'Alvarado', 'admin', '$2y$10$MPVHzZ2ZPOWmtUUGCq3RXu31OTB.jo7M9LZ7PmPQYmgETSNn19ejO', 'admin@admin.com', '2016-05-21 15:06:00', 0);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
