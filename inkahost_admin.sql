-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 16-03-2021 a las 13:09:04
-- Versión del servidor: 10.3.28-MariaDB
-- Versión de PHP: 7.3.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `inkahost_admin`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acta`
--

CREATE TABLE `acta` (
  `id` int(11) NOT NULL,
  `num_acta` varchar(256) NOT NULL,
  `idvehiculo` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `inicio_cobertura` varchar(15) NOT NULL,
  `fin_cobertura` varchar(15) NOT NULL,
  `fecha` varchar(120) DEFAULT NULL,
  `ciudad` varchar(45) DEFAULT NULL,
  `year` text DEFAULT NULL,
  `sello` tinyint(4) DEFAULT 1,
  `fondo` tinyint(4) NOT NULL DEFAULT 1,
  `estado` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `acta`
--

INSERT INTO `acta` (`id`, `num_acta`, `idvehiculo`, `inicio_cobertura`, `fin_cobertura`, `fecha`, `ciudad`, `year`, `sello`, `fondo`, `estado`) VALUES
(1, '101', '1', '05-09-2020', '04-09-2021', 'Trujillo, 30 de Noviembre del 2020', '1', '20', 1, 1, 1),
(2, '102', '1', '05-09-2020', '04-09-2021', 'Trujillo, 30 de Noviembre del 2020', '1', '20', 1, 1, 1),
(3, '103', '2', '11-12-20', '10-12-21', 'Trujillo, 11 de Diciembre del 2020', '1', '20', 1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `almacenes`
--

CREATE TABLE `almacenes` (
  `id` int(11) NOT NULL,
  `almacen` text COLLATE utf8_unicode_ci NOT NULL,
  `ciudad` text COLLATE utf8_unicode_ci NOT NULL,
  `fondo` text COLLATE utf8_unicode_ci NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `almacenes`
--

INSERT INTO `almacenes` (`id`, `almacen`, `ciudad`, `fondo`, `fecha`) VALUES
(1, 'trujillo', 'Trujillo', 'vistas/img/almacenes/trujillo.jpg', '2019-04-14 03:02:52'),
(2, 'cajamarca', 'Cajamarca', 'vistas/img/almacenes/cajamarca.jpeg', '2019-04-14 03:02:55'),
(3, 'lima', 'Lima', 'vistas/img/almacenes/lima.jpg', '2019-04-14 03:02:59'),
(4, 'ayacucho', 'Ayacucho', 'vistas/img/almacenes/ayacucho.jpg', '2019-04-14 03:03:03'),
(5, 'piura', 'Piura', 'vistas/img/almacenes/piura.jpg', '2019-04-14 03:03:06'),
(6, 'ica', 'Ica', 'vistas/img/almacenes/ica.jpg', '2019-04-14 03:03:10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `almacen_articulo`
--

CREATE TABLE `almacen_articulo` (
  `id` int(11) NOT NULL,
  `producto` int(11) NOT NULL,
  `almacen` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `almacen_articulo`
--

INSERT INTO `almacen_articulo` (`id`, `producto`, `almacen`, `stock`, `fecha`) VALUES
(1, 1, 1, 10, '2019-04-14 04:07:31'),
(2, 2, 1, 30, '2019-04-14 04:07:34');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cabeceras`
--

CREATE TABLE `cabeceras` (
  `id` int(11) NOT NULL,
  `ruta` text COLLATE utf8_spanish_ci NOT NULL,
  `titulo` text COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` text COLLATE utf8_spanish_ci DEFAULT NULL,
  `palabrasClaves` text COLLATE utf8_spanish_ci DEFAULT NULL,
  `portada` text COLLATE utf8_spanish_ci DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `cabeceras`
--

INSERT INTO `cabeceras` (`id`, `ruta`, `titulo`, `descripcion`, `palabrasClaves`, `portada`, `fecha`) VALUES
(1, 'inicio', 'TALENTUS TECHNOLOGY - Seguridad Satelital', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quisquam accusantium enim esse eos officiis sit officia', 'Lorem ipsum, dolor sit amet, consectetur, adipisicing, elit, Quisquam, accusantium, enim, esse', 'vistas/src/images/cabeceras/default.png', '2020-09-05 19:24:12'),
(2, 'plataforma', 'TALENTUS TECHNOLOGY - Plataforma', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quisquam accusantium enim esse eos officiis sit officia', 'Lorem ipsum, dolor sit amet, consectetur, adipisicing, elit, Quisquam, accusantium, enim, esse', 'vistas/src/images/cabeceras/default.png', '2020-09-05 19:24:15'),
(3, 'para-quien-es', 'TALENTUS TECHNOLOGY - Para Quien es', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris felis velit, volutpat nec molestie id, tempus eu enim. V', 'collar,ipsum,sit', 'vistas/src/images/cabeceras/default.png', '2020-09-05 19:24:23'),
(5, 'soluciones', 'TALENTUS TECHNOLOGY - Soluciones', '33', '333', 'vistas/src/images/cabeceras/default.png', '2020-09-05 19:24:26'),
(6, 'contacto', 'TALENTUS TECHNOLOGY - Contacto', '33', '333', 'vistas/src/images/cabeceras/default.png', '2020-09-05 19:24:28');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `categoria` text COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `categoria`, `descripcion`, `estado`) VALUES
(1, 'SIN CATEGORIA', 'PARA PRODUCTOS Y/O SERVICIOS SIN CATEGORIA', 1),
(2, 'MONITOREO Y RASTREO SATELITAL GPS', 'SERVICIOS DE MONITOREO', 1),
(3, 'CAMARAS DE SEGURIDAD', 'PRODUCTOS DE SEGURIDAD', 1),
(5, 'SISTEMA DE GESTIÓN INTEGRAL TALENSOFT', 'categoria de sistemas', 1),
(6, 'DISEÑO Y DESARROLLO DE PáGINAS WEB', '', 1),
(7, 'DISPOSITIVOS GPS', '', 1),
(8, 'ACCESORIOS DE EQUIPOS GPS', '', 1),
(9, 'SERVICIO TECNICO', '', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `certificado`
--

CREATE TABLE `certificado` (
  `id` int(11) NOT NULL,
  `num_certificado` text NOT NULL,
  `idcliente` text NOT NULL,
  `modelo_gps` text NOT NULL,
  `fin_cobertura` text NOT NULL,
  `fecha` text NOT NULL,
  `ciudad` text NOT NULL,
  `year` text NOT NULL,
  `sello` tinyint(4) NOT NULL DEFAULT 1,
  `fondo` tinyint(4) NOT NULL DEFAULT 1,
  `estado` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `certificado`
--

INSERT INTO `certificado` (`id`, `num_certificado`, `idcliente`, `modelo_gps`, `fin_cobertura`, `fecha`, `ciudad`, `year`, `sello`, `fondo`, `estado`) VALUES
(1, '101', '', '7', '04-09-2021', 'Trujillo, 30 de Noviembre del 2020', '1', '20', 1, 1, 1),
(2, '102', '2', '14', '10-12-21', 'Trujillo, 11 de Diciembre del 2020', '1', '20', 1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudad`
--

CREATE TABLE `ciudad` (
  `id` int(11) NOT NULL,
  `nombre` text DEFAULT NULL,
  `prefijo` text DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ciudad`
--

INSERT INTO `ciudad` (`id`, `nombre`, `prefijo`, `estado`) VALUES
(1, 'Trujillo', 'T', 1),
(2, 'Cajamarca', 'C', 1),
(3, 'Lima', 'L', 1),
(4, 'Piura', 'P', 1),
(5, 'Talara', 'TL', 1),
(6, 'Moquegua', 'MQ', 1),
(7, 'Tacna', 'TNC', 1),
(9, 'Junin', 'JN', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cobros`
--

CREATE TABLE `cobros` (
  `id` int(11) NOT NULL,
  `empresa` text COLLATE utf8_unicode_ci NOT NULL,
  `estado` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `fechaVen` date NOT NULL,
  `periodo` text COLLATE utf8_unicode_ci NOT NULL,
  `montoxunidad` decimal(10,0) NOT NULL,
  `cantidadUnidades` int(11) DEFAULT NULL,
  `ciudad` int(11) DEFAULT NULL,
  `tipoPago` text COLLATE utf8_unicode_ci NOT NULL,
  `observacion` text COLLATE utf8_unicode_ci NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `cobros`
--

INSERT INTO `cobros` (`id`, `empresa`, `estado`, `fechaVen`, `periodo`, `montoxunidad`, `cantidadUnidades`, `ciudad`, `tipoPago`, `observacion`, `fecha`) VALUES
(1, '5', '2', '2020-12-30', 'MENSUAL', 30, 1, 1, 'transferencia', '', '2021-01-05 00:30:01'),
(2, '', '0', '2020-11-05', 'TRIMESTRAL', 40, 2, 1, 'transferencia', '', '2021-02-03 19:10:17'),
(3, '38', '2', '2020-01-28', 'MENSUAL', 30, 1, 1, 'transferencia', '', '2021-02-19 14:55:03'),
(4, '4', '1', '2021-01-27', 'MENSUAL', 30, 2, 1, 'transferencia', '', '2021-01-11 22:02:57'),
(5, '3', '2', '2021-02-05', 'TRIMESTRAL', 40, 2, 1, 'transferencia', '', '2021-02-19 16:50:47'),
(6, '6', '2', '2021-02-14', 'MENSUAL', 30, 2, 1, 'transferencia', '', '2021-02-19 15:13:22'),
(7, '7', '1', '2020-12-19', 'MENSUAL', 35, 1, 1, 'transferencia', '', '2021-01-11 22:11:44'),
(8, '9', '2', '2021-01-17', 'MENSUAL', 30, 1, 1, 'transferencia', '', '2021-01-23 17:06:59'),
(9, '10', '2', '2021-01-22', 'MENSUAL', 35, 2, 1, 'transferencia', '', '2021-01-29 18:17:09'),
(10, '11', '1', '2021-07-30', 'ANUAL', 35, 3, 3, 'transferencia', '', '2021-01-11 22:19:37'),
(11, '12', '2', '2021-02-11', 'MENSUAL', 30, 2, 1, 'transferencia', '', '2021-02-19 15:01:31'),
(12, '13', '1', '2021-02-06', 'TRIMESTRAL', 35, 1, 1, 'transferencia', '', '2021-01-11 22:22:18'),
(13, '14', '2', '2021-02-15', 'MENSUAL', 40, 1, 1, 'transferencia', '', '2021-02-19 15:11:46'),
(14, '15', '2', '2021-01-26', 'MENSUAL', 40, 3, 2, 'transferencia', '', '2021-02-03 18:51:25'),
(15, '16', '1', '2021-01-15', 'MENSUAL', 30, 1, 3, 'transferencia', '', '2021-01-11 22:25:17'),
(16, '17', '1', '2021-01-18', 'MENSUAL', 25, 1, 1, 'transferencia', '', '2021-01-11 22:26:09'),
(17, '18', '1', '2021-01-07', 'MENSUAL', 25, 1, 1, 'transferencia', '', '2021-01-11 22:27:49'),
(18, '19', '2', '2021-01-19', 'MENSUAL', 5, 5, 1, 'transferencia', '', '2021-02-19 15:16:50'),
(19, '20', '2', '2021-01-15', 'MENSUAL', 20, 1, 1, 'transferencia', '', '2021-01-29 18:12:29'),
(20, '44', '2', '2021-01-20', 'MENSUAL', 20, 2, 1, 'transferencia', '', '2021-02-19 15:14:34'),
(21, '21', '1', '2021-02-07', 'MENSUAL', 35, 1, 1, 'transferencia', '', '2021-02-19 15:01:04'),
(22, '22', '0', '2021-01-28', 'MENSUAL', 30, 1, 1, 'transferencia', '', '2021-02-03 18:50:28'),
(23, '23', '2', '2021-02-15', 'MENSUAL', 30, 3, 1, 'transferencia', '', '2021-02-19 15:12:25'),
(24, '24', '1', '2021-01-20', 'MENSUAL', 30, 1, 1, 'transferencia', '', '2021-01-11 22:34:51'),
(25, '25', '2', '2021-02-04', 'MENSUAL', 30, 1, 1, 'transferencia', '', '2021-02-19 14:56:08'),
(26, '26', '1', '2021-01-20', 'MENSUAL', 25, 1, 1, 'transferencia', '', '2021-01-11 22:36:41'),
(27, '27', '0', '2021-01-05', 'MENSUAL', 35, 5, 1, 'transferencia', '', '2021-02-19 14:56:28'),
(28, '28', '2', '2021-02-12', 'MENSUAL', 25, 3, 1, 'transferencia', '', '2021-02-19 14:54:32'),
(29, '29', '2', '2021-01-17', 'MENSUAL', 30, 7, 1, 'Transferencia', '', '2021-01-25 19:16:11'),
(30, '30', '1', '2021-01-30', 'MENSUAL', 35, 2, 1, 'transferencia', '', '2021-01-11 22:40:23'),
(31, '31', '1', '2021-01-24', 'MENSUAL', 30, 1, 1, 'transferencia', '', '2021-01-11 22:41:01'),
(32, '32', '2', '2021-02-16', 'MENSUAL', 30, 3, 1, 'efectivo', '', '2021-02-19 15:15:17'),
(33, '33', '0', '2021-01-16', 'MENSUAL', 30, 1, 1, 'transferencia', '', '2021-02-19 15:12:57'),
(34, '34', '2', '2021-02-16', 'MENSUAL', 35, 1, 1, 'transferencia', '', '2021-02-19 15:19:55'),
(35, '35', '2', '2021-02-12', 'MENSUAL', 25, 1, 1, 'transferencia', '', '2021-02-19 15:10:47'),
(36, '36', '2', '2021-01-18', 'MENSUAL', 35, 3, 1, 'transferencia', '', '2021-02-15 19:39:36'),
(37, '37', '2', '2021-10-20', 'MENSUAL', 35, 1, 1, 'transferencia', '', '2021-01-29 18:18:22'),
(38, '38', '1', '2021-01-28', 'MENSUAL', 30, 1, 1, 'transferencia', '', '2021-01-11 22:46:12'),
(39, '39', '2', '2021-01-02', 'MENSUAL', 35, 1, 1, 'transferencia', '', '2021-02-15 16:43:38'),
(40, '51', '1', '2021-02-20', 'MENSUAL', 35, 1, 1, 'transferencia', 'PROTRACK', '2021-02-19 21:51:47'),
(41, '58', '2', '2021-02-13', 'MENSUAL', 30, 1, 1, 'transferencia', '', '2021-02-15 21:54:36'),
(42, '59', '2', '2021-02-10', 'MENSUAL', 35, 2, 1, 'transferencia', 'DEBE 300 SOLES DE UN GPS', '2021-02-15 21:55:56'),
(43, '52', '2', '2021-02-13', 'MENSUAL', 35, 1, 1, 'transferencia', '', '2021-02-15 21:57:29');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comercio`
--

CREATE TABLE `comercio` (
  `id` int(11) NOT NULL,
  `impuesto` float NOT NULL,
  `envioNacional` float NOT NULL,
  `envioInternacional` float NOT NULL,
  `tasaMinimaNal` float NOT NULL,
  `tasaMinimaInt` float NOT NULL,
  `pais` text COLLATE utf8_spanish_ci NOT NULL,
  `modoPaypal` text COLLATE utf8_spanish_ci NOT NULL,
  `clienteIdPaypal` text COLLATE utf8_spanish_ci NOT NULL,
  `llaveSecretaPaypal` text COLLATE utf8_spanish_ci NOT NULL,
  `modoPayu` text COLLATE utf8_spanish_ci NOT NULL,
  `merchantIdPayu` int(11) NOT NULL,
  `accountIdPayu` int(11) NOT NULL,
  `apiKeyPayu` text COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `comercio`
--

INSERT INTO `comercio` (`id`, `impuesto`, `envioNacional`, `envioInternacional`, `tasaMinimaNal`, `tasaMinimaInt`, `pais`, `modoPaypal`, `clienteIdPaypal`, `llaveSecretaPaypal`, `modoPayu`, `merchantIdPayu`, `accountIdPayu`, `apiKeyPayu`) VALUES
(1, 19, 1, 2, 10, 15, 'PE', 'sandbox', 'AfuLwWgt0oYKisZ_FOJDJ9IvGFvfVJi2lUE6GO08Q-LA1OhMeVhS79DABdCPb0PykT_0h9zvZQKQSGA_', 'EMnGzcnXE5tlJTZZWbi3ES7K7BH3-HI7rmOyliSYkc0WKVTEYnIf4VS4dGGiBWAQ7MeYxnYIVwxBJBsL', 'sandbox', 508029, 512321, '4Vj8eK4rloUd272L48hsrarnUA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contacto`
--

CREATE TABLE `contacto` (
  `id` int(11) NOT NULL,
  `flota` text COLLATE utf8_unicode_ci NOT NULL,
  `nombre` text COLLATE utf8_unicode_ci NOT NULL,
  `telefono` text COLLATE utf8_unicode_ci NOT NULL,
  `email` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contrato`
--

CREATE TABLE `contrato` (
  `id` int(11) NOT NULL,
  `idcliente` int(11) NOT NULL,
  `ciudad` text COLLATE utf8_unicode_ci NOT NULL,
  `plan` text COLLATE utf8_unicode_ci NOT NULL,
  `fecha` text COLLATE utf8_unicode_ci NOT NULL,
  `fondo` tinyint(4) NOT NULL,
  `sello` tinyint(4) NOT NULL,
  `estado` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `contrato`
--

INSERT INTO `contrato` (`id`, `idcliente`, `ciudad`, `plan`, `fecha`, `fondo`, `sello`, `estado`) VALUES
(2, 57, 'Trujillo', '50', '02/15/2021', 1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_contrato`
--

CREATE TABLE `detalle_contrato` (
  `id` int(11) NOT NULL,
  `idcontrato` int(11) NOT NULL,
  `idvehiculo` int(11) NOT NULL,
  `plan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `detalle_contrato`
--

INSERT INTO `detalle_contrato` (`id`, `idcontrato`, `idvehiculo`, `plan`) VALUES
(2, 2, 92, 30);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_ingreso`
--

CREATE TABLE `detalle_ingreso` (
  `id` int(11) NOT NULL,
  `idingreso` int(11) NOT NULL,
  `idarticulo` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_compra` decimal(11,2) NOT NULL,
  `precio_venta` decimal(11,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_venta`
--

CREATE TABLE `detalle_venta` (
  `id` int(11) NOT NULL,
  `idventa` int(11) NOT NULL,
  `idarticulo` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_venta` decimal(11,2) NOT NULL,
  `descuento` decimal(11,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `detalle_venta`
--

INSERT INTO `detalle_venta` (`id`, `idventa`, `idarticulo`, `cantidad`, `precio_venta`, `descuento`) VALUES
(1, 3, 2, 3, 14.00, 0.00),
(2, 3, 1, 2, 198.00, 0.00),
(3, 4, 2, 3, 14.00, 0.00),
(4, 4, 1, 2, 198.00, 0.00),
(5, 5, 2, 1, 14.00, 0.00),
(6, 5, 1, 2, 198.00, 0.00),
(7, 6, 2, 2, 14.00, 0.00),
(8, 6, 1, 3, 198.00, 0.00),
(9, 7, 2, 2, 14.00, 0.00),
(10, 7, 1, 3, 198.00, 0.00),
(11, 8, 2, 1, 14.00, 4.00),
(12, 8, 1, 2, 198.00, 7.00),
(13, 8, 3, 3, 13.00, 0.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dispositivos`
--

CREATE TABLE `dispositivos` (
  `id` int(11) NOT NULL,
  `modelo` text COLLATE utf8_unicode_ci NOT NULL,
  `marca` text COLLATE utf8_unicode_ci NOT NULL,
  `certificado` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `dispositivos`
--

INSERT INTO `dispositivos` (`id`, `modelo`, `marca`, `certificado`) VALUES
(1, 'TLT-2H', '', 'TRFM23655'),
(2, 'TK-318', '', 'TRFM23655'),
(3, 'TLT-2H', '', 'TRFM23655'),
(4, 'VT-310', '', 'TRFM23655'),
(5, 'VT600', '', 'TRFM23655'),
(6, 'FM1200', '', 'TRFM23655'),
(7, 'TK-103', '', 'TRFM23655'),
(8, 'TK-102', '', 'TRFM23655'),
(9, 'FMB920', '', 'TRFM23655'),
(10, 'MVT-340', '', 'TRFM23655'),
(11, 'MT-1C', '', 'TRFM23655'),
(12, 'G-05', '', 'TRFM23655'),
(14, 'TK-06A', '', ''),
(16, 'TLT-2H', 'COBAN', '.'),
(17, '303G', 'COBAN', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `divisas`
--

CREATE TABLE `divisas` (
  `id` int(11) NOT NULL,
  `divisa` text COLLATE utf8_unicode_ci NOT NULL,
  `simbolo` text COLLATE utf8_unicode_ci NOT NULL,
  `estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `flota`
--

CREATE TABLE `flota` (
  `id` int(11) NOT NULL,
  `nombre` text COLLATE utf8_unicode_ci NOT NULL,
  `idcliente` int(11) NOT NULL,
  `estado` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `flota`
--

INSERT INTO `flota` (`id`, `nombre`, `idcliente`, `estado`) VALUES
(3, 'SINISHA', 5, 1),
(4, 'ABELARDO', 4, 1),
(5, 'TRANSPORTE DE CARGA AGUILA ROJA', 3, 1),
(6, 'SINISHA NIKOLA', 5, 1),
(7, 'ABELARDO GUZMAN ', 4, 1),
(8, 'AGUILA ROJA', 3, 1),
(9, 'RUTH RAMOS', 6, 1),
(10, 'GILDDEL ABILA VICENTE', 7, 1),
(11, 'INOCENTE MATTOS', 8, 1),
(12, 'EVA TABACO MARIN', 9, 1),
(13, 'TRANSPORTES KYAR', 11, 1),
(14, 'CESAR M. BACA OLIVARES', 12, 1),
(15, 'CRISTIAN CARRANZA (AMIGO)', 13, 1),
(16, 'JULIO C BACA CARRASCO/MARR', 14, 1),
(17, 'WILSON CHAVARRY', 15, 1),
(18, 'ELOY ROMERO', 16, 1),
(19, 'SANTOS YUPANQUI', 17, 1),
(20, 'GLOBAL CERNA / SR. PEDRO', 19, 1),
(21, 'JUAN CASTRO MINCHOLA', 20, 1),
(22, 'WILLY RODRIGUEZ GUZMAN', 31, 1),
(23, 'GUEBER R. GALVEZ LOZANO', 21, 1),
(24, 'YAN P. VARGAS DE SANTANA', 22, 1),
(25, 'ROBERT HORIZONTE EXPRESS', 23, 1),
(26, 'ROGER IVAN RUIZ SALCEDO', 24, 1),
(27, 'SUSAN MIRELLA ZARSOSA RODRIGUEZ ', 25, 1),
(28, 'JHON ALEX VILLANTOY MALPARTIDA', 26, 1),
(29, 'EMTRANVI', 27, 1),
(30, 'HERNAN ESQUIVEL', 28, 1),
(31, 'OSWALDO GONZALES', 29, 1),
(32, 'EMPRESA MIRANDA', 30, 1),
(33, 'INVERSIONES SALVADOR', 32, 1),
(34, 'ALEXANDER YARLEQUE', 33, 1),
(35, 'MAYLCOOL TORRES', 34, 1),
(36, 'LUIS VASQUEZ RAYMONDI', 35, 1),
(37, 'MILTON MG5', 36, 1),
(38, 'ROSY DIONICIO', 37, 1),
(39, 'MANUEL V MORENO OTINIANO', 38, 1),
(40, 'TRANSPORTES SAN MATEO', 39, 1),
(41, 'COMPANY VIP', 40, 1),
(42, 'TAXI SEGURITY', 41, 1),
(43, 'ROSA MONTOYA', 42, 1),
(44, 'SAN MATEO', 43, 1),
(45, 'WILINTON ESCALANTE', 45, 1),
(46, 'SEGUNDO JORGE RUIZ RAMOS', 48, 1),
(47, 'KEVIN - ABEL', 51, 1),
(48, 'TRANSPORTES GAVAL', 57, 1),
(49, 'JORGE MARREROS', 58, 1),
(50, 'JORGE CALDERON', 59, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingreso`
--

CREATE TABLE `ingreso` (
  `id` int(11) NOT NULL,
  `idproveedor` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `tipo_comprobante` text COLLATE utf8_unicode_ci NOT NULL,
  `serie_comprobante` text COLLATE utf8_unicode_ci NOT NULL,
  `num_comprobante` text COLLATE utf8_unicode_ci NOT NULL,
  `fecha_hora` datetime NOT NULL,
  `impuesto` decimal(11,2) NOT NULL,
  `total_compra` decimal(11,2) NOT NULL,
  `divisa` text COLLATE utf8_unicode_ci NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `ingreso`
--

INSERT INTO `ingreso` (`id`, `idproveedor`, `idusuario`, `tipo_comprobante`, `serie_comprobante`, `num_comprobante`, `fecha_hora`, `impuesto`, `total_compra`, `divisa`, `estado`) VALUES
(1, 4, 1, 'Factura + IGV', 'T56', '0099', '2019-06-27 00:00:00', 18.00, 1700.00, 'PEN', 1),
(10, 184, 1, 'Boleta', '111', '1222', '2019-06-27 00:00:00', 0.00, 2000.00, 'PEN', 1),
(11, 4, 1, 'Boleta', '444', '333', '2019-08-25 00:00:00', 0.00, 0.00, 'PEN', 1),
(12, 185, 1, 'Factura + IGV', 'T-2019-', '019', '2020-01-29 00:00:00', 18.00, 0.00, 'MXN', 1),
(13, 209, 1, 'Boleta', '111', '111', '2020-07-09 00:00:00', 0.00, 0.00, 'USD', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lineas`
--

CREATE TABLE `lineas` (
  `id` int(11) NOT NULL,
  `numero` text COLLATE utf8_unicode_ci NOT NULL,
  `sim_card` text COLLATE utf8_unicode_ci NOT NULL,
  `placa` text COLLATE utf8_unicode_ci NOT NULL,
  `empresa` text COLLATE utf8_unicode_ci NOT NULL,
  `estado` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mensaje`
--

CREATE TABLE `mensaje` (
  `id` int(11) NOT NULL,
  `titulo` varchar(100) COLLATE utf16_spanish2_ci NOT NULL,
  `mensaje` varchar(500) COLLATE utf16_spanish2_ci NOT NULL,
  `usuario` int(11) NOT NULL,
  `desde` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `leido` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_spanish2_ci;

--
-- Volcado de datos para la tabla `mensaje`
--

INSERT INTO `mensaje` (`id`, `titulo`, `mensaje`, `usuario`, `desde`, `leido`) VALUES
(1, 'Asunti', 'Mensaje ', 1, '2020-08-11 21:38:29', 1),
(2, 'Prueba', 'Kalalala ', 1, '2020-08-11 21:38:29', 1),
(3, 'Preuba', 'Prueba rueba ', 1, '2020-08-11 21:35:17', 1),
(4, 'Prueba', 'Hola, prueba de mensaje', 1, '2020-08-11 21:56:00', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimientos`
--

CREATE TABLE `movimientos` (
  `id` int(11) NOT NULL,
  `producto` int(11) NOT NULL,
  `almacen` int(11) NOT NULL,
  `tipo` text COLLATE utf8_unicode_ci NOT NULL,
  `cantidad` int(11) NOT NULL,
  `usuario` int(11) NOT NULL,
  `fecha` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notificaciones`
--

CREATE TABLE `notificaciones` (
  `id` int(11) NOT NULL,
  `tipo` text COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8_unicode_ci NOT NULL,
  `idCobro` int(11) NOT NULL,
  `autor` text COLLATE utf8_unicode_ci NOT NULL,
  `estado` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `notificaciones`
--

INSERT INTO `notificaciones` (`id`, `tipo`, `descripcion`, `idCobro`, `autor`, `estado`, `fecha`) VALUES
(13, 'vencimiento', 'vencido', 26, 'sistema', 1, '2021-01-20 21:33:47'),
(14, 'vencimiento', 'vencido', 24, 'sistema', 1, '2021-01-20 21:33:47'),
(19, 'vencimiento', 'vencido', 16, 'sistema', 1, '2021-01-19 18:44:14'),
(20, 'vencimiento', 'vencido', 15, 'sistema', 1, '2021-01-19 18:44:14'),
(26, 'vencimiento', 'porvencer', 31, 'sistema', 1, '2021-01-14 20:16:34'),
(27, 'vencimiento', 'porvencer', 4, 'sistema', 1, '2021-01-19 18:43:50'),
(29, 'vencimiento', 'porvencer', 22, 'sistema', 1, '2021-01-19 18:43:50'),
(30, 'vencimiento', 'porvencer', 38, 'sistema', 1, '2021-01-19 18:43:50'),
(31, 'vencimiento', 'porvencer', 30, 'sistema', 1, '2021-01-20 00:18:40'),
(33, 'vencimiento', 'porvencer', 12, 'sistema', 1, '2021-01-29 18:06:22'),
(34, 'vencimiento', 'porvencer', 40, 'sistema', 1, '2021-02-19 21:51:47');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

CREATE TABLE `permisos` (
  `id` int(11) NOT NULL,
  `rol` text COLLATE utf8_unicode_ci NOT NULL,
  `permiso` text COLLATE utf8_unicode_ci NOT NULL,
  `estado` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `permisos`
--

INSERT INTO `permisos` (`id`, `rol`, `permiso`, `estado`) VALUES
(96, '1', 'almacen', 'true'),
(97, '1', 'id', '1'),
(98, '1', 'compras', 'true'),
(99, '1', 'ventas', 'true'),
(100, '1', 'vehiculos', 'true'),
(101, '1', 'administracion', 'true'),
(102, '1', 'tecnico', 'true'),
(103, '3', 'almacen', 'true'),
(104, '3', 'id', '3'),
(105, '3', 'compras', 'true'),
(106, '3', 'ventas', 'true'),
(107, '3', 'vehiculos', 'true'),
(108, '3', 'administracion', 'false'),
(109, '3', 'tecnico', 'true'),
(110, '4', 'almacen', 'false'),
(111, '4', 'id', '4'),
(112, '4', 'compras', 'true'),
(113, '4', 'ventas', 'false'),
(114, '4', 'vehiculos', 'true'),
(115, '4', 'administracion', 'false'),
(116, '4', 'tecnico', 'true'),
(117, '5', 'almacen', 'true'),
(118, '5', 'id', '5'),
(119, '5', 'compras', 'true'),
(120, '5', 'ventas', 'true'),
(121, '5', 'vehiculos', 'true'),
(122, '5', 'administracion', 'true'),
(123, '5', 'tecnico', 'true'),
(124, '6', 'almacen', 'false'),
(125, '6', 'id', '6'),
(126, '6', 'compras', 'false'),
(127, '6', 'ventas', 'false'),
(128, '6', 'vehiculos', 'false'),
(129, '6', 'administracion', 'false'),
(130, '6', 'tecnico', 'true'),
(176, '2', 'almacen', 'true'),
(177, '2', 'id', '2'),
(178, '2', 'compras', 'true'),
(179, '2', 'ventas', 'true'),
(180, '2', 'vehiculos', 'false'),
(181, '2', 'administracion', 'false'),
(182, '2', 'tecnico', 'false');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `id` int(11) NOT NULL,
  `tipo` text COLLATE utf8_unicode_ci NOT NULL,
  `nombre` text COLLATE utf8_unicode_ci NOT NULL,
  `apellido` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `tipo_documento` text COLLATE utf8_unicode_ci NOT NULL,
  `num_documento` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `direccion` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `telefono` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` text COLLATE utf8_unicode_ci NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`id`, `tipo`, `nombre`, `apellido`, `tipo_documento`, `num_documento`, `direccion`, `telefono`, `email`, `estado`) VALUES
(3, 'Cliente', 'Empresa de Transporte Águila Roja', 'null', 'RUC', '1111111111111', 'Chao - Trujillo', '993514908', '', 1),
(4, 'Cliente', 'ABELARDO', 'GUZMAN PINEDO', 'DNI', '1', 'Trujillo', '987915796', '.', 1),
(5, 'Cliente', 'SINISHA NIKOLA', 'MEJIA TOLEDO', 'DNI', '.', 'Trujillo', '990902889', '.', 1),
(6, 'Cliente', 'RUTH', 'RAMOS', 'DNI', '.', 'Trujillo', '976187400', '.', 1),
(7, 'Cliente', 'GILDDEL', 'ABILA VICENTE', 'DNI', '.', 'Trujillo', '962811206', '.', 1),
(8, 'Cliente', 'INOCENTE', 'MATTOS', 'DNI', '.', 'Trujillo', '914376239', '.', 1),
(9, 'Cliente', 'EVA', 'TABACO MARIN', 'DNI', '.', 'Trujillo', '949593500', '.', 1),
(10, 'Cliente', 'ROSA', 'MONTOYA', 'DNI', '.', 'Trujillo', '959666008', '.', 1),
(11, 'Cliente', 'TRANSPORTE KYAR', 'null', 'RUC', '.', 'LIMA', '922173597', '.', 1),
(12, 'Cliente', 'CESAR MIGUEL', 'BACA OLIVARES', 'DNI', '.', 'Trujillo', '942265399', '.', 1),
(13, 'Cliente', 'CRISTIAN AMIGO', 'CARRANZA', 'DNI', '.', 'Trujillo', '949915616', '.', 1),
(14, 'Cliente', 'JULIO C', 'BACA CARRASCO/Marr', 'DNI', '.', 'Trujillo', '933981310', '.', 1),
(15, 'Cliente', 'WILSON', 'CHAVARRY', 'DNI', '.', 'Cajamarca', '966257276', '.', 1),
(16, 'Cliente', 'ELOY', 'ROMERO', 'DNI', '.', 'Trujillo', '916718805', '.', 1),
(17, 'Cliente', 'SANTOS', 'YUPANQUI', 'DNI', '.', 'Trujillo', '987960596', '.', 1),
(18, 'Cliente', 'SEGUNDO JORGE', 'RUIZ RAMOS', 'DNI', '.', 'Trujillo', '948502647', '.', 1),
(19, 'Cliente', 'Global transportes', 'null', 'RUC', '.', 'Chao - Trujillo', '986 857 295', '', 1),
(20, 'Cliente', 'JUAN', 'CASTRO MINCHOLA', 'DNI', '', 'Trujillo', '941987316 / 948463155', '', 1),
(21, 'Cliente', 'GUEBER R.', 'GALVEZ LOZANO', 'DNI', '.', 'Trujillo', '949548781', '', 1),
(22, 'Cliente', 'YAN P.', 'VARGAS DE SANTANA', 'DNI', '.', 'Trujillo', ' 974 114 319', '', 1),
(23, 'Cliente', 'HORIZONTE EXPRESS - ROBERT', 'null', 'RUC', '.', 'Trujillo', '989483396', '', 1),
(24, 'Cliente', 'ROGER IVAN', 'RUIZ SALCEDO', 'DNI', '.', 'Trujillo', '948596101', '', 1),
(25, 'Cliente', 'Susan Mirella', 'Zarsosa Rodriguez', 'DNI', '.', 'Trujillo', '958978041', '', 1),
(26, 'Cliente', 'JHON ALEX', 'VILLANTOY MALPARTIDA', 'DNI', '.', 'Trujillo', '948332503', '', 1),
(27, 'Cliente', 'EMTRANVI', 'null', 'RUC', '.', 'Trujillo', '991696161', '', 1),
(28, 'Cliente', 'Hernan', 'Esquivel', 'DNI', '.', 'Trujillo', '987091439', '', 1),
(29, 'Cliente', 'OSWALDO', 'GONZALES', 'DNI', '.', 'Trujillo', '948250367', '', 1),
(30, 'Cliente', 'Empresa MIRANDA', 'null', 'RUC', '.', 'Trujillo', '984871443', '', 1),
(31, 'Cliente', 'WILLY', 'RODRIGUEZ GUZMAN', 'DNI', '.', 'Trujillo', '925728281', '', 1),
(32, 'Cliente', 'INVERSIONES SALVADOR', 'null', 'RUC', '.', 'Trujillo', '950078185', '', 1),
(33, 'Cliente', 'ALEXANDER', 'YARLEQUE', 'DNI', '.', 'Trujillo', '941627847', '', 1),
(34, 'Cliente', 'MAYLCOOL', 'TORRES', 'DNI', '.', 'Trujillo', '958995389', '', 1),
(35, 'Cliente', 'LUIS', 'VASQUEZ RAYMONDI', 'DNI', '.', 'Trujillo', '960617327', '', 1),
(36, 'Cliente', 'Milton MG5', 'GONZALES', 'DNI', '.', 'VIRU', '959732588', '', 1),
(37, 'Cliente', 'ROSY', 'DIONICIO', 'DNI', '.', 'Trujillo', '925726729', '', 1),
(38, 'Cliente', 'MANUEL V', 'MORENO OTINIANO', 'DNI', '.', 'Trujillo', '949953410', '', 1),
(39, 'Cliente', 'Transportes SAN MATEO - Roger', 'null', 'DNI', '.', 'Trujillo', '949 451 140', '', 1),
(40, 'Cliente', 'COMPANY VIP', 'null', 'RUC', '.', '.', '922 857 790', '.', 1),
(41, 'Cliente', 'TAXI SEGURITY', 'null', 'RUC', '.', 'Trujillo', '', '', 1),
(42, 'Cliente', 'ROSA', 'MONTOYA', 'DNI', '.', 'Trujillo', '', '', 1),
(43, 'Cliente', 'SAN MATEO', 'null', 'RUC', '.', 'Trujillo', '', '', 1),
(44, 'Cliente', 'WILLINTON', 'ESACALNTE', 'DNI', '.', 'Trujillo', '', '', 1),
(46, 'Cliente', 'INOCENTE', 'MATTOS', 'RUC', '.', 'Trujillo', '', '', 1),
(47, 'Cliente', 'SANTOS', 'YUPANQUI', 'DNI', '.', 'Trujillo', '', '', 1),
(48, 'Cliente', 'SEGUNDO JORGE', 'RUIZ RAMOS', 'DNI', '.', 'Trujillo', '', '', 1),
(50, 'Cliente', 'kevin', 'abel lopez', 'DNI', '17896967', 'Trujillo', '980263133', '', 1),
(51, 'Cliente', 'KEVIN - ABEL', 'MAYHUAY CACERES', 'DNI', '.', 'Trujillo', '980263133', '', 1),
(52, 'Cliente', 'Transportes RAVAL', 'null', 'RUC', '20605596747', 'Trujillo', ' 941 541 489', '', 1),
(53, 'Cliente', 'Transportes RAVAL', 'null', 'RUC', '20605596747', 'Trujillo', ' 941 541 489', '', 1),
(54, 'Cliente', 'Transportes RAVAL', 'null', 'RUC', '20605596747', 'Trujillo', ' 941 541 489', '', 1),
(55, 'Cliente', 'Transportes RAVAL', 'null', 'RUC', '20605596747', 'Trujillo', ' 941 541 489', '', 1),
(56, 'Cliente', 'Transportes RAVAL', 'null', 'RUC', '20605596747', 'Trujillo', ' 941 541 489', '', 1),
(57, 'Cliente', 'Transportes GAVAL', 'null', 'RUC', '20605596747', 'Trujillo', ' 941 541 489', '', 1),
(58, 'Cliente', 'JORGE', 'MARREROS', 'DNI', '.', 'Trujillo', '982 182 774', '', 1),
(59, 'Cliente', 'JORGE CALDERON', '', 'DNI', '.', 'Trujillo', '949854932', '', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plantilla`
--

CREATE TABLE `plantilla` (
  `id` int(11) NOT NULL,
  `razonSocial` text COLLATE utf8_unicode_ci NOT NULL,
  `ruc` text COLLATE utf8_unicode_ci NOT NULL,
  `logo` text COLLATE utf8_unicode_ci NOT NULL,
  `fondoLogin` text COLLATE utf8_unicode_ci NOT NULL,
  `icono` text COLLATE utf8_unicode_ci NOT NULL,
  `fondoContrato` text COLLATE utf8_unicode_ci NOT NULL,
  `fondoActa` text COLLATE utf8_unicode_ci NOT NULL,
  `fondoCertificado` text COLLATE utf8_unicode_ci NOT NULL,
  `fondoFirma` text COLLATE utf8_unicode_ci NOT NULL,
  `empresa` text COLLATE utf8_unicode_ci NOT NULL,
  `redesSociales` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `plantilla`
--

INSERT INTO `plantilla` (`id`, `razonSocial`, `ruc`, `logo`, `fondoLogin`, `icono`, `fondoContrato`, `fondoActa`, `fondoCertificado`, `fondoFirma`, `empresa`, `redesSociales`) VALUES
(1, 'Talentus technology EIRL', '20496172168', 'vistas/img/plantilla/logo.jpg', 'vistas/img/plantilla/fondoLogin.jpg', 'vistas/img/plantilla/icono.png', 'vistas/img/plantilla/fondoContrato.png', 'vistas/img/plantilla/fondoActa.png', 'vistas/img/plantilla/certificado.jpg', 'vistas/img/plantilla/fondoFirma.jpg', '[{\"nombre\":\"SYNTHESIS GROUP EIRL\",\"telefono\":\"949205558\",\"direccion\":\"Trujillo, Trujillo\",\"provincia\":\"Trujillo\",\"pais\":\"Perú\",\"lema\":\"Líderes en Seguridad Electrónica y Satelital\",\"cuenta\":\"245-2172979-0-27\",\"ruc\":\"20600984323\",\"correo\":\"info@synthesisgroup.es\"}]', '[{\"red\":\"facebook-f\",\"estilo\":\"facebookNegro\",\"url\":\"http://facebook.com/jhamnerx1x\",\"activo\":1},{\"red\":\"youtube\",\"estilo\":\"youtubeNegro\",\"url\":\"http://youtube.com/jhamnerx1x\",\"activo\":1},{\"red\":\"twitter\",\"estilo\":\"twitterNegro\",\"url\":\"http://twitter.com/jhamnerx1x\",\"activo\":1},{\"red\":\"google-plus\",\"estilo\":\"google-plusNegro\",\"url\":\"http://google.com/jhamnerx1x\",\"activo\":1},{\"red\":\"instagram\",\"estilo\":\"instagramNegro\",\"url\":\"http://instagram.com/jhamnerx1x\",\"activo\":1},{\"red\":\"pinterest\",\"estilo\":\"pinterestNegro\",\"url\":\"http://pinterest.com/jhamnerx1x\",\"activo\":1}]');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro_pagos`
--

CREATE TABLE `registro_pagos` (
  `id` int(11) NOT NULL,
  `idcobro` int(11) NOT NULL,
  `tipo_pago` text COLLATE utf8_unicode_ci NOT NULL,
  `cantidad` decimal(10,2) NOT NULL,
  `descripcion` text COLLATE utf8_unicode_ci NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `registro_pagos`
--

INSERT INTO `registro_pagos` (`id`, `idcobro`, `tipo_pago`, `cantidad`, `descripcion`, `fecha`) VALUES
(1, 1, 'transferencia', 30.00, '', '2021-01-04 18:32:57'),
(2, 3, 'transferencia', 30.00, '', '2021-01-05 00:16:44'),
(3, 3, 'transferencia', 30.00, '', '2021-01-05 00:28:16'),
(4, 1, 'transferencia', 30.00, '', '2021-01-05 00:30:01'),
(5, 11, 'transferencia', 60.00, '', '2021-01-11 22:56:37'),
(6, 27, 'transferencia', 175.00, '', '2021-01-13 17:45:06'),
(7, 28, 'transferencia', 75.00, '', '2021-01-13 17:52:55'),
(8, 6, 'transferencia', 60.00, '', '2021-01-19 19:16:47'),
(9, 8, 'transferencia', 30.00, '', '2021-01-23 17:06:59'),
(10, 13, 'transferencia', 40.00, '', '2021-01-23 17:09:06'),
(11, 25, 'transferencia', 30.00, '', '2021-01-23 17:22:27'),
(12, 32, 'efectivo', 90.00, '', '2021-01-23 17:31:35'),
(13, 29, 'Transferencia', 210.00, '', '2021-01-25 19:16:11'),
(14, 19, 'transferencia', 20.00, '', '2021-01-29 18:12:29'),
(15, 9, 'transferencia', 70.00, '', '2021-01-29 18:17:09'),
(16, 37, 'transferencia', 35.00, '', '2021-01-29 18:18:22'),
(17, 33, 'transferencia', 30.00, '', '2021-02-03 18:46:28'),
(18, 34, 'transferencia', 35.00, '', '2021-02-03 18:47:19'),
(19, 14, 'transferencia', 120.00, '', '2021-02-03 18:51:25'),
(20, 39, 'transferencia', 35.00, '', '2021-02-15 16:43:38'),
(21, 23, 'transferencia', 90.00, '', '2021-02-15 19:36:43'),
(22, 36, 'transferencia', 105.00, '', '2021-02-15 19:39:36'),
(23, 44, 'Efectivo', 45.00, 'pago 1', '2021-02-16 18:06:07'),
(24, 44, 'Efectivo', 45.00, 'aaa 2', '2021-02-16 18:07:08'),
(25, 28, 'transferencia', 75.00, '', '2021-02-19 14:54:32'),
(26, 3, 'transferencia', 30.00, '', '2021-02-19 14:55:03'),
(27, 35, 'transferencia', 25.00, '', '2021-02-19 15:10:47'),
(28, 13, 'transferencia', 40.00, '', '2021-02-19 15:11:46'),
(29, 6, 'transferencia', 60.00, '', '2021-02-19 15:13:22'),
(30, 20, 'transferencia', 40.00, '', '2021-02-19 15:14:34'),
(31, 18, 'transferencia', 25.00, '', '2021-02-19 15:16:50'),
(32, 5, 'transferencia', 80.00, '', '2021-02-19 16:50:47');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reportes`
--

CREATE TABLE `reportes` (
  `id` int(11) NOT NULL,
  `vehiculo` int(11) NOT NULL,
  `fecha_t` text COLLATE utf8_unicode_ci NOT NULL,
  `hora_t` text COLLATE utf8_unicode_ci NOT NULL,
  `fecha` text COLLATE utf8_unicode_ci NOT NULL,
  `detalle` text COLLATE utf8_unicode_ci NOT NULL,
  `fecha_mod` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `reportes`
--

INSERT INTO `reportes` (`id`, `vehiculo`, `fecha_t`, `hora_t`, `fecha`, `detalle`, `fecha_mod`, `estado`) VALUES
(1, 1, '2020-11-30', '19:51', '19:51', 'transmite por ratos', '2020-12-01 00:52:20', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reporte_detalle`
--

CREATE TABLE `reporte_detalle` (
  `id` int(11) NOT NULL,
  `id_reporte` int(11) NOT NULL,
  `detalle` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `reporte_detalle`
--

INSERT INTO `reporte_detalle` (`id`, `id_reporte`, `detalle`) VALUES
(1, 1, 'programar reconfiguracion');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `rol` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `rol`) VALUES
(1, 'admin'),
(2, 'cajera'),
(3, 'secretaria'),
(4, 'empleado'),
(5, 'administradora'),
(6, 'tecnico');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `id` int(11) NOT NULL,
  `idcategoria` int(11) NOT NULL,
  `codigo` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `tipo` text COLLATE utf8_unicode_ci NOT NULL,
  `nombre` text COLLATE utf8_unicode_ci NOT NULL,
  `precio` float NOT NULL,
  `stock` int(11) NOT NULL,
  `descripcion` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `imagen` text COLLATE utf8_unicode_ci NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `servicios`
--

INSERT INTO `servicios` (`id`, `idcategoria`, `codigo`, `tipo`, `nombre`, `precio`, `stock`, `descripcion`, `imagen`, `estado`, `fecha`) VALUES
(1, 1, '758493739392', 'articulo', 'EQUIPO GPS - TK-318', 198.99, 40, NULL, 'vistas/img/servicios/Equipo GPS - TK-318/Equipo GPS - TK-318.jpg', 1, '2020-03-08 00:50:11'),
(2, 1, '2', 'articulo', 'ANTENA GPS TERMINAL MACHO', 14.99, 10, '', 'vistas/img/servicios/592/592.jpg', 1, '2020-03-08 00:50:11'),
(3, 1, '3', 'articulo', 'RAMAL ENERGIA TK-318', 13.4, 13, '', 'vistas/img/servicios/default/default.png', 1, '2020-03-08 00:50:11'),
(10, 1, '10', 'articulo', 'RELAY 12V 4 TERMINALES NEGRO', 12, 0, '', 'vistas/img/servicios/default/default.png', 1, '2020-03-08 00:50:11'),
(11, 1, '11', 'servicio', 'MICROFONO', 33, 0, 'servicio de prueba', 'vistas/img/servicios/default/default.png', 1, '2020-03-08 00:50:11'),
(12, 5, '12', 'servicio', 'KIT DE 4 CáMARAS ? HDCVI 4CH + HDD 01 GRABADOR 4CH TRIBRIDO | H.264 | 120 FPS |', 759, 0, '', 'vistas/img/servicios/757/757.jpg', 1, '2020-08-09 02:01:19'),
(13, 3, '13', 'articulo', 'KIT DE 2 CAMARAS HD - DAHUA', 200, 70, 'aaa', 'vistas/img/servicios/KIT DE 2 CAMARAS HD - DAHUA/KIT DE 2 CAMARAS HD - DAHUA.jpg', 1, '2020-08-09 02:01:18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tareas`
--

CREATE TABLE `tareas` (
  `id` int(11) NOT NULL,
  `id_empleado` int(11) NOT NULL,
  `id_admin` int(11) NOT NULL,
  `tipo` text COLLATE utf8_unicode_ci NOT NULL,
  `vehiculo` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `sim` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `sim_card` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `nuevo_sim` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `nuevo_card` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `dispositivo` text COLLATE utf8_unicode_ci NOT NULL,
  `cliente` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `leido` int(11) NOT NULL DEFAULT 0,
  `estado` int(11) NOT NULL DEFAULT 0,
  `fecha` datetime NOT NULL,
  `hora` text COLLATE utf8_unicode_ci NOT NULL,
  `fecha_mod` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `tareas`
--

INSERT INTO `tareas` (`id`, `id_empleado`, `id_admin`, `tipo`, `vehiculo`, `sim`, `sim_card`, `nuevo_sim`, `nuevo_card`, `dispositivo`, `cliente`, `leido`, `estado`, `fecha`, `hora`, `fecha_mod`) VALUES
(1, 10, 1, '1', '1', '937985665', '938975654', '', '', '1', '1', 1, 1, '2020-12-01 00:00:00', '01:12', '2021-01-13 01:53:53');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipotarea`
--

CREATE TABLE `tipotarea` (
  `id` int(11) NOT NULL,
  `tipo` text COLLATE utf8_unicode_ci NOT NULL,
  `costo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `tipotarea`
--

INSERT INTO `tipotarea` (`id`, `tipo`, `costo`) VALUES
(1, 'Instalacion', 15),
(2, 'Cambio Sim', 15),
(3, 'Instalación con corte/Motor', 15),
(4, 'Instalacion con apertura de puertas', 20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` text COLLATE utf8_unicode_ci NOT NULL,
  `apellido` text COLLATE utf8_unicode_ci NOT NULL,
  `tipo_documento` text COLLATE utf8_unicode_ci NOT NULL,
  `num_documento` text COLLATE utf8_unicode_ci NOT NULL,
  `direccion` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `telefono` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `cargo` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `ciudad` text COLLATE utf8_unicode_ci NOT NULL,
  `login` text COLLATE utf8_unicode_ci NOT NULL,
  `clave` text COLLATE utf8_unicode_ci NOT NULL,
  `foto` text COLLATE utf8_unicode_ci NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `apellido`, `tipo_documento`, `num_documento`, `direccion`, `telefono`, `email`, `cargo`, `ciudad`, `login`, `clave`, `foto`, `estado`) VALUES
(1, 'Jhamner', 'Sifuentes', 'DNI', '75103149', 'Trujillo', '961482121', 'jhamnerx1x@gmail.com', '1', '1', 'Jhamner', '$2a$07$asxx54ahjppf45sd87a5auFL5K1.Cmt9ZheoVVuudOi5BCi10qWly', 'vistas/img/usuarios/jhamner/foto.png', 1),
(2, 'Jose', 'Reyes', 'DNI', '12345678', 'Trujillo, Trujillo', '', '', '1', '1', 'jose', '$2a$07$asxx54ahjppf45sd87a5auFL5K1.Cmt9ZheoVVuudOi5BCi10qWly', 'vistas/img/usuarios/jose/jose.jpg', 1),
(8, 'empleado', 'empleado', 'DNI', '75103149', 'Trujillo', '961482121', '961482121', '4', '1', 'empleado', '$2a$07$asxx54ahjppf45sd87a5auFL5K1.Cmt9ZheoVVuudOi5BCi10qWly', 'vistas/img/usuarios/default/default.jpg', 1),
(10, 'tecnico', 'tecnico', 'DNI', '455745446514', 'Trujillo', '961482121', '961482121', '6', '1', 'tecnico', '$2a$07$asxx54ahjppf45sd87a5auFL5K1.Cmt9ZheoVVuudOi5BCi10qWly', 'vistas/img/usuarios/default/default.jpg', 1),
(16, 'test', 'test', 'DNI', '75103149', 'Trujillo', '961482121', '961482121', '6', '3', 'test', '$2a$07$asxx54ahjppf45sd87a5auFL5K1.Cmt9ZheoVVuudOi5BCi10qWly', 'vistas/img/usuarios/default/default.jpg', 0),
(17, 'Jhamner', '', '', '75103149', '', '', 'jhamnerx@gmail.com', '7', '2', 'Jhamner', '$2a$07$asxx54ahjppf45sd87a5auFL5K1.Cmt9ZheoVVuudOi5BCi10qWly', 'vistas/img/usuarios/default/default.jpg', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculo`
--

CREATE TABLE `vehiculo` (
  `id` int(11) NOT NULL,
  `placa` text COLLATE utf8_unicode_ci NOT NULL,
  `marca` text COLLATE utf8_unicode_ci NOT NULL,
  `modelo` text COLLATE utf8_unicode_ci NOT NULL,
  `tipo` text COLLATE utf8_unicode_ci NOT NULL,
  `year` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `color` text COLLATE utf8_unicode_ci NOT NULL,
  `motor` text COLLATE utf8_unicode_ci NOT NULL,
  `serie` text COLLATE utf8_unicode_ci NOT NULL,
  `flota` int(11) DEFAULT NULL,
  `sim` text COLLATE utf8_unicode_ci NOT NULL,
  `operador` text COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8_unicode_ci NOT NULL,
  `dispositivo` text COLLATE utf8_unicode_ci NOT NULL,
  `idgps` text COLLATE utf8_unicode_ci NOT NULL,
  `estado` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `vehiculo`
--

INSERT INTO `vehiculo` (`id`, `placa`, `marca`, `modelo`, `tipo`, `year`, `color`, `motor`, `serie`, `flota`, `sim`, `operador`, `descripcion`, `dispositivo`, `idgps`, `estado`) VALUES
(1, 'T4H-510', 'KIA', 'PICANTO', 'HATHBACK', '2016', 'PLATA BRILLANTE', 'G3LAGP069755', 'KNABE511AHT365098', 1, '938053775', 'VIRGIN MOBIL', '', '7', '864893036547902', 1),
(2, 'T4K-210', 'JAC', 'j4', 'SEDAN', '2016', 'NEGRO', '8y766454354r65465t', '676f6654e', 2, '976565476', 'VIRGIN MOBIL', '', '2', '978753313557', 1),
(4, 'T3L-888', '', '', 'CAMION', '', '', '', '', 5, '941675614', 'CLARO', '', '2', '000050033542802', 1),
(5, 'T6H-947', '', '', 'CAMION', '', '', '', '', 5, '941675623', 'CLARO', '', '2', '000050033826502', 1),
(6, 'A1W-724', '.', '.', 'MICROBUS', '.', '.', '.', '.', 39, '938057542', 'VIRGIN MOBIL', '', '7', '863844050928925', 1),
(7, 'A6S-847', '.', '.', 'CAMION', '.', '.', '.', '.', 17, '937853376', 'VIRGIN MOBIL', '', '2', '000027039135967', 1),
(8, 'M5X-949', '.', '.', 'CAMION', '.', '.', '.', '.', 17, '937857713', '000026033063709', '', '2', '000026033063709', 1),
(9, 'M6J-910', '.', '.', 'CAMION', '.', '.', '.', '.', 17, '937828622', 'VIRGIN MOBIL', '', '2', '000026033038289', 1),
(10, 'AFT-712', '.', '.', 'CAMIONETA', '.', '.', '.', '.', 18, '975280849', 'VIRGIN MOBIL', '', '2', '000059046443933', 1),
(11, 'ATS-559', '', '', '', '', '', '', '', 21, '937846165', 'VIRGIN MOBIL', '', '3', '000057058992142', 1),
(12, 'AYN-645', '', '', '', '', '', '', '', 13, '937828153', 'VIRGIN MOBIL', '', '2', '000059046444204', 1),
(13, 'AZX-955', '', '', '', '', '', '', '', 13, '974671765', 'CLARO', '', '2', '000026033060465', 1),
(14, 'LGM-548', '', '', '', '', '', '', '', 13, '937830848', 'VIRGIN MOBIL', '', '2', '000022045972498', 1),
(15, 'BBG-533', '', '', '', '', '', '', '', 41, '937836074', 'VIRGIN MOBIL', '', '7', '864895031073545', 1),
(16, 'T3R-586', '', '', '', '', '', '', '', 41, '937875850', 'VIRGIN MOBIL', '', '7', '864872030329392', 1),
(17, 'T7A-656', '', '', '', '', '', '', '', 41, '937833393', 'VIRGIN MOBIL', '', '14', '9170987905', 1),
(18, 'T7D-633', '', '', '', '', '', '', '', 41, '937827640', 'VIRGIN MOBIL', '', '14', '9170987957', 1),
(19, 'T7E-643', '', '', '', '', '', '', '', 41, '937866228', 'VIRGIN MOBIL', '', '3', '000076043864296', 1),
(20, 'T5D-287', '', '', '', '', '', '', '', 41, '937834278', 'VIRGIN MOBIL', '', '14', '9171129137', 1),
(21, 'T4Y-309', '', '', '', '', '', '', '', 41, '937831093', 'VIRGIN MOBIL', '', '14', '9171129275', 1),
(22, 'T3I-595', '', '', '', '', '', '', '', 41, '937849865', 'VIRGIN MOBIL', '', '3', '000076044231925', 1),
(23, 'W4A-504', '', '', '', '', '', '', '', 41, '938057550', 'VIRGIN MOBIL', '', '7', '863844050928479', 1),
(24, 'BFL-765', '', '', '', '', '', '', '', 35, '940270238', 'CLARO', 'chip prepago', '3', '000057058771231', 1),
(25, 'BNU-339', '', '', '', '', '', '', '', 27, '937831234', 'VIRGIN MOBIL', '', '3', '000030046550258', 1),
(26, 'D7F-842', '', '', '', '', '', '', '', 7, '937846260', 'VIRGIN MOBIL', '', '3', '000057058999477', 1),
(27, 'F0C-949', '', '', '', '', '', '', '', 22, '937836908', 'VIRGIN MOBIL', '', '14', '000076044301553', 1),
(28, 'T8C-874', '', '', '', '', '', '', '', 7, '944581683', 'CLARO', '', '11', '6170849627', 1),
(29, 'D7Z-152', '', '', '', '', '', '', '', 14, '937831273', 'VIRGIN MOBIL', '', '2', '000030046721214', 1),
(30, 'T5L-967', '', '', '', '', '', '', '', 14, '937886761', 'VIRGIN MOBIL', '', '2', '000087985675371', 1),
(31, 'AFT-712', '', '', '', '', '', '', '', 18, '975280849', 'CLARO', '', '2', '000059046443933', 1),
(32, 'C8E-709', '', '', '', '', '', '', '', 31, '937832899', 'VIRGIN MOBIL', 'JUAN DIONICIO', '3', '000057058998123', 1),
(33, 'H2M-961', '', '', '', '', '', '', '', 31, '937831852', 'VIRGIN MOBIL', '', '2', '000093031190434', 1),
(34, 'Y1V-959', '', '', '', '', '', '', '', 31, '937828764', 'VIRGIN MOBIL', '', '3', '000057058998180', 1),
(35, 'D8B-486', '', '', '', '', '', '', '', 36, '938053778', 'VIRGIN MOBIL', '', '14', '9170909195', 1),
(36, 'F2A-958', '', '', '', '', '', '', '', 25, '937836495', 'VIRGIN MOBIL', '', '1', '000030046712718', 1),
(37, 'F6B-645', '', '', '', '', '', '', '', 42, '937858852', 'VIRGIN MOBIL', '', '3', '000076044232576', 1),
(38, 'M3P-440', '', '', '', '', '', '', '', 42, '938057541', 'VIRGIN MOBIL', '', '3', '000057058961816', 1),
(39, 'H1U-502', '', '', '', '', '', '', '', 9, '980897182', 'VIRGIN MOBIL', '', '2', '000093035533662', 1),
(40, 'X4E-340', '', '', '', '', '', '', '', 9, '913184226', 'CLARO', '', '2', '000032041712577', 1),
(41, 'M6C-822', '', '', '', '', '', '', '', 23, '938057543', 'VIRGIN MOBIL', '', '14', '9171129330', 1),
(42, 'T0G-885', '', '', '', '', '', '', '', 24, '937844505', 'VIRGIN MOBIL', 'TK-100', '14', '865205035062651', 1),
(43, 'T0S-809', '', '', '', '', '', '', '', 32, '937833938', 'VIRGIN MOBIL', '', '3', '000030046732054', 1),
(44, 'T8O-867', '', '', '', '', '', '', '', 32, '937846926', 'VIRGIN MOBIL', '', '3', '000030046741147', 1),
(45, 'T1L-015', '', '', '', '', '', '', '', 34, '938053770', 'VIRGIN MOBIL', '', '7', '864893036130014', 1),
(46, 'T1R-419', '', '', '', '', '', '', '', 31, '937832978', 'VIRGIN MOBIL', '', '2', '000098765432198', 1),
(47, 'T1T-730', '', '', '', '', '', '', '', 31, '937846255', 'VIRGIN MOBIL', 't2l-2h', '14', '000057058916596', 1),
(48, 'T1U-967', '', '', '', '', '', '', '', 25, '937832060', 'VIRGIN MOBIL', '', '14', '000030046741550', 1),
(49, 'T1Y-769', '', '', '', '', '', '', '', 20, '937845016', 'VIRGIN MOBIL', '', '2', '000076047225429', 1),
(50, 'T2G-347', '', '', '', '', '', '', '', 15, '982019906', 'VIRGIN MOBIL', '', '2', '000045032575094', 1),
(51, 'T2H-957', '', '', '', '', '', '', '', 33, '938053769', 'VIRGIN MOBIL', 'TLT-2H', '14', '000057058961873', 1),
(52, 'T4U-958', '', '', '', '', '', '', '', 33, '938053772', 'VIRGIN MOBIL', 'TLT-2H', '14', '000057058822174', 1),
(53, 'T2L-772', '', '', '', '', '', '', '', 43, '944582484', 'CLARO', '', '2', '000067046646379', 1),
(54, 'T2M-788', '', '', '', '', '', '', '', 43, '984728682', 'CLARO', '', '2', '000093035525510', 1),
(55, 'T2M-450', '', '', '', '', '', '', '', 37, '938057549', 'VIRGIN MOBIL', 'TLT-2H', '14', '000057058992332', 1),
(56, 'T8B-968', '', '', '', '', '', '', '', 37, '938057539', 'VIRGIN MOBIL', '', '2', '000093035528456', 1),
(57, 'T8C-953', '', '', '', '', '', '', '', 37, '938057538', 'VIRGIN MOBIL', 'TLT-2H', '14', '000057058996929', 1),
(58, 'T3N-950', '', '', '', '', '', '', '', 44, '938057533', 'VIRGIN MOBIL', '', '11', '6170849587', 1),
(59, 'T3Y-052', '', '', '', '', '', '', '', 45, '937846180', 'VIRGIN MOBIL', 'TLT-2H', '14', '000076044221033', 1),
(60, 'T3Y-150', '', '', '', '', '', '', '', 45, '937834256', 'VIRGIN MOBIL', 'TLT-2H', '14', '000076044228657', 1),
(61, 'T4A-968', '', '', '', '', '', '', '', 20, '937850249', 'VIRGIN MOBIL', '', '2', '000059046346615', 1),
(62, 'T4C-184', '', '', '', '', '', '', '', 10, '974667977', 'CLARO', '', '7', '864180033350633', 1),
(63, 'T4L-011', '', '', '', '', '', '', '', 6, '961850651', 'CLARO', '', '2', '000092030416067', 1),
(64, 'T4Q-964', '', '', '', '', '', '', '', 31, '937844833', 'VIRGIN MOBIL', '', '16', '000030046705167', 1),
(65, 'T4R-163', '', '', '', '', '', '', '', 42, '990683362', 'Movistar', 'maximo avila', '14', '9170988014', 1),
(66, 'T4R-176', '', '', '', '', '', '', '', 12, '913184117', 'CLARO', '', '2', '000093032693303', 1),
(67, 'T4R-537', '', '', '', '', '', '', '', 42, '976513976', 'Movistar', 'MAXIMO AVILA', '14', '9170909214', 1),
(68, 'T4S-176', '', '', '', '', '', '', '', 42, '937846216', 'VIRGIN MOBIL', '', '16', '000076044227725', 1),
(69, 'T4U-063', '', '', '', '', '', '', '', 16, '984367206', 'CLARO', '', '2', '000026039469926', 1),
(70, 'T5E-873', '', '', '', '', '', '', '', 11, '949324850', 'CLARO', '', '11', '6170849610', 1),
(71, 'T5F-438', '', '', '', '', '', '', '', 31, '937844827', 'VIRGIN MOBIL', '', '16', '000057058961964', 1),
(72, 'T5N-633', '', '', '', '', '', '', '', 19, '937846186', 'VIRGIN MOBIL', '', '11', '6170781424', 1),
(73, 'T5X-960', '', '', '', '', '', '', '', 20, '957281263', 'CLARO', '', '2', '000076047142921', 1),
(74, 'T6F-683', '', '', '', '', '', '', '', 28, '937854860', 'VIRGIN MOBIL', '', '16', '000030046707379', 1),
(75, 'T6O-652', '', '', '', '', '', '', '', 46, '962170779', 'Movistar', '', '16', '000076044216355', 1),
(76, 'T6W-661', '', '', '', '', '', '', '', 42, '968113464', 'Movistar', 'LUIS ALVA', '11', '6028063089', 1),
(77, 'T7A-660', '', '', '', '', '', '', '', 42, '990025227', 'Movistar', 'LENAR CENA', '14', '9170909472', 1),
(78, 'T7E-677', '', '', '', '', '', '', '', 42, '937828177', 'VIRGIN MOBIL', 'YUPANQUI', '17', '9170987926', 1),
(79, 'T7G-696', '', '', '', '', '', '', '', 42, '937828120', 'VIRGIN MOBIL', '', '16', '000076044228426', 1),
(80, 'T7G-902', '', '', '', '', '', '', '', 38, '938057537', 'VIRGIN MOBIL', '', '17', '863844050926481', 1),
(81, 'T7K-634', '', '', '', '', '', '', '', 42, '937828249', 'VIRGIN MOBIL', '', '16', '000030046668449', 1),
(82, 'T8N-936', '', '', '', '', '', '', '', 25, '937831519', 'VIRGIN MOBIL', '', '16', '000030046712395', 1),
(83, 'T8R-943', '', '', '', '', '', '', '', 26, '937832711', 'VIRGIN MOBIL', '', '7', '864893036130113', 1),
(84, 'T8Z-964', '', '', '', '', '', '', '', 29, '937836819', 'VIRGIN MOBIL', '', '16', '000030046707544', 1),
(85, 'T9B-961', '', '', '', '', '', '', '', 29, '937834693', 'VIRGIN MOBIL', '', '16', '000030046709830', 1),
(86, 'T9K-967', '', '', '', '', '', '', '', 29, '937881963', 'VIRGIN MOBIL', '', '16', '000030046693892', 1),
(87, 'T9T-950', '', '', '', '', '', '', '', 29, '937846219', 'VIRGIN MOBIL', '', '16', '000076043860823', 1),
(88, 'T8B-956', '', '', '', '', '', '', '', 29, '937834714', 'VIRGIN MOBIL', '', '16', '000030046714995', 1),
(89, 'V3L-954', '', '', '', '', '', '', '', 20, '937854401', 'VIRGIN MOBIL', '', '2', '000059046340188', 1),
(90, 'T7W-966', '', '', '', '', '', '', '', 33, '938053771', 'VIRGIN MOBIL', '', '16', '000057058922594', 1),
(91, 'BAJ-736', '.', '', '', '', '', '', '', 47, '938057540', 'VIRGIN MOBIL', 'PROTRACK', '17', '863844050927083', 1),
(92, 'T2E-787', '', '', '', '', '', '', '', 48, '938057547', 'VIRGIN MOBIL', '', '17', '863844051189469', 1),
(93, 'L120D', '', '', '', '', '', '', '', 49, '938057545', 'VIRGIN MOBIL', '', '17', '863844051190749', 1),
(94, 'T5D-833', '', '', '', '', '', '', '', 50, '938057546', 'VIRGIN MOBIL', '', '17', '863844051189196', 1),
(95, 'T7R-870', '', '', '', '', '', '', '', 50, '938070069', 'VIRGIN MOBIL', '', '17', '863844051191150', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `id` int(11) NOT NULL,
  `idcliente` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `tipo_comprobante` text COLLATE utf8_unicode_ci NOT NULL,
  `serie_comprobante` text COLLATE utf8_unicode_ci NOT NULL,
  `num_comprobante` text COLLATE utf8_unicode_ci NOT NULL,
  `fecha_hora` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `impuesto` decimal(11,2) NOT NULL,
  `total_venta` decimal(11,2) NOT NULL,
  `divisa` text COLLATE utf8_unicode_ci NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `venta`
--

INSERT INTO `venta` (`id`, `idcliente`, `idusuario`, `tipo_comprobante`, `serie_comprobante`, `num_comprobante`, `fecha_hora`, `impuesto`, `total_venta`, `divisa`, `estado`) VALUES
(1, 203, 1, 'Boleta', '5445', '444', '2019-08-25 05:00:00', 0.00, 213.00, 'PEN', 0),
(2, 203, 1, 'Boleta', '2332', '444', '2019-08-25 05:00:00', 0.00, 70.00, 'PEN', 0),
(3, 203, 1, 'Boleta', '44', '55', '2019-08-25 05:00:00', 0.00, 442.00, 'PEN', 0),
(4, 203, 1, 'Boleta', '44', '55', '2019-08-25 05:00:00', 0.00, 442.00, 'PEN', 0),
(5, 203, 1, 'Boleta', '99', '55', '2019-08-25 21:39:47', 0.00, 412.00, 'USD', 1),
(6, 203, 1, 'Boleta', '99', '55', '2020-02-15 17:27:17', 0.00, 626.00, 'USD', 0),
(7, 182, 1, 'Boleta', '99', '55', '2019-08-25 21:39:37', 0.00, 626.00, 'USD', 1),
(8, 182, 1, 'Factura IGV INC', '44', '44', '2020-08-09 03:15:49', 18.00, 438.00, 'USD', 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `acta`
--
ALTER TABLE `acta`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `almacenes`
--
ALTER TABLE `almacenes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `almacen_articulo`
--
ALTER TABLE `almacen_articulo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_articulo` (`producto`),
  ADD KEY `fk_almacen` (`almacen`);

--
-- Indices de la tabla `cabeceras`
--
ALTER TABLE `cabeceras`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `certificado`
--
ALTER TABLE `certificado`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ciudad`
--
ALTER TABLE `ciudad`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cobros`
--
ALTER TABLE `cobros`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `comercio`
--
ALTER TABLE `comercio`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `contacto`
--
ALTER TABLE `contacto`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `contrato`
--
ALTER TABLE `contrato`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalle_contrato`
--
ALTER TABLE `detalle_contrato`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalle_ingreso`
--
ALTER TABLE `detalle_ingreso`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_detalle_ingreso_ingreso` (`idingreso`);

--
-- Indices de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `dispositivos`
--
ALTER TABLE `dispositivos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `divisas`
--
ALTER TABLE `divisas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `flota`
--
ALTER TABLE `flota`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ingreso`
--
ALTER TABLE `ingreso`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `lineas`
--
ALTER TABLE `lineas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `mensaje`
--
ALTER TABLE `mensaje`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `movimientos`
--
ALTER TABLE `movimientos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `plantilla`
--
ALTER TABLE `plantilla`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `registro_pagos`
--
ALTER TABLE `registro_pagos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `reportes`
--
ALTER TABLE `reportes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `reporte_detalle`
--
ALTER TABLE `reporte_detalle`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `servicios_categoria` (`idcategoria`);

--
-- Indices de la tabla `tareas`
--
ALTER TABLE `tareas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipotarea`
--
ALTER TABLE `tipotarea`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `acta`
--
ALTER TABLE `acta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `almacenes`
--
ALTER TABLE `almacenes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `almacen_articulo`
--
ALTER TABLE `almacen_articulo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `cabeceras`
--
ALTER TABLE `cabeceras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `certificado`
--
ALTER TABLE `certificado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `ciudad`
--
ALTER TABLE `ciudad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `cobros`
--
ALTER TABLE `cobros`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT de la tabla `comercio`
--
ALTER TABLE `comercio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `contacto`
--
ALTER TABLE `contacto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `contrato`
--
ALTER TABLE `contrato`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `detalle_contrato`
--
ALTER TABLE `detalle_contrato`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `detalle_ingreso`
--
ALTER TABLE `detalle_ingreso`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `dispositivos`
--
ALTER TABLE `dispositivos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `divisas`
--
ALTER TABLE `divisas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `flota`
--
ALTER TABLE `flota`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT de la tabla `ingreso`
--
ALTER TABLE `ingreso`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `lineas`
--
ALTER TABLE `lineas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `mensaje`
--
ALTER TABLE `mensaje`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `movimientos`
--
ALTER TABLE `movimientos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=183;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT de la tabla `plantilla`
--
ALTER TABLE `plantilla`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `registro_pagos`
--
ALTER TABLE `registro_pagos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `reportes`
--
ALTER TABLE `reportes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `reporte_detalle`
--
ALTER TABLE `reporte_detalle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `tareas`
--
ALTER TABLE `tareas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tipotarea`
--
ALTER TABLE `tipotarea`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `almacen_articulo`
--
ALTER TABLE `almacen_articulo`
  ADD CONSTRAINT `fk_almacen` FOREIGN KEY (`almacen`) REFERENCES `almacenes` (`id`),
  ADD CONSTRAINT `fk_articulo` FOREIGN KEY (`producto`) REFERENCES `servicios` (`id`);

--
-- Filtros para la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD CONSTRAINT `servicios_categoria` FOREIGN KEY (`idcategoria`) REFERENCES `categorias` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
