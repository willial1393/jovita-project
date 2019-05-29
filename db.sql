-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         8.0.16 - MySQL Community Server - GPL
-- SO del servidor:              Win64
-- HeidiSQL Versión:             10.1.0.5464
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para jovita-project
DROP DATABASE IF EXISTS `jovita-project`;
CREATE DATABASE IF NOT EXISTS `jovita-project` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `jovita-project`;

-- Volcando estructura para tabla jovita-project.activations
DROP TABLE IF EXISTS `activations`;
CREATE TABLE IF NOT EXISTS `activations` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `used` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `activations_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla jovita-project.activations: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `activations` DISABLE KEYS */;
/*!40000 ALTER TABLE `activations` ENABLE KEYS */;

-- Volcando estructura para tabla jovita-project.admin_activations
DROP TABLE IF EXISTS `admin_activations`;
CREATE TABLE IF NOT EXISTS `admin_activations` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `used` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `admin_activations_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla jovita-project.admin_activations: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `admin_activations` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_activations` ENABLE KEYS */;

-- Volcando estructura para tabla jovita-project.admin_password_resets
DROP TABLE IF EXISTS `admin_password_resets`;
CREATE TABLE IF NOT EXISTS `admin_password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `admin_password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla jovita-project.admin_password_resets: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `admin_password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_password_resets` ENABLE KEYS */;

-- Volcando estructura para tabla jovita-project.admin_users
DROP TABLE IF EXISTS `admin_users`;
CREATE TABLE IF NOT EXISTS `admin_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activated` tinyint(1) NOT NULL DEFAULT '0',
  `forbidden` tinyint(1) NOT NULL DEFAULT '0',
  `language` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_users_email_deleted_at_unique` (`email`,`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla jovita-project.admin_users: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `admin_users` DISABLE KEYS */;
INSERT INTO `admin_users` (`id`, `first_name`, `last_name`, `email`, `password`, `remember_token`, `activated`, `forbidden`, `language`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(1, 'Administrator', 'Administrator', 'admin@admin.com', '$2y$10$s7FGrycy41CDi7hOdOBUQ.uMlQOUL6Gc4uhtiqzyLzm8M9bbUyqGu', 'Ch3xHAIQoTYbttTORl2b46XN8reRBG4AtJznSJl1mWch4pJq4mn1OhGVnzr7', 1, 0, 'en', NULL, '2019-05-29 05:40:07', '2019-05-29 05:41:44');
/*!40000 ALTER TABLE `admin_users` ENABLE KEYS */;

-- Volcando estructura para tabla jovita-project.cliente
DROP TABLE IF EXISTS `cliente`;
CREATE TABLE IF NOT EXISTS `cliente` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `documento` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Describe el numero del documento de cada cliente, el numero es unico e irrepetible. NIT O LA CEDULA',
  `tipoDocumento` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Puede ser cedula de extranjeria, pasaprte, cedula.',
  `nombre` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Nombre del cliente.',
  `telefono` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Numero de telefono o celular del cliente',
  `correo` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Correo electronico del cliente. por ejemplo: juan@gmail.com',
  PRIMARY KEY (`id`),
  UNIQUE KEY `documento_UNIQUE` (`documento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla jovita-project.cliente: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;

-- Volcando estructura para tabla jovita-project.detallepedido
DROP TABLE IF EXISTS `detallepedido`;
CREATE TABLE IF NOT EXISTS `detallepedido` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `consecutivo` int(11) NOT NULL COMMENT 'Proporciona la identificacion del detalle de pedido.',
  `cantidad` int(11) DEFAULT NULL COMMENT 'Proporciona la identificacion del detalle de pedido.',
  `valorTotal` int(11) DEFAULT NULL COMMENT 'Valor total generado por los insumos solicitados.',
  `estado` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Describe la situacion del detalle de pedido. pueden ser: aprobado, corregido, autorizado.',
  `pedido_id` int(10) unsigned NOT NULL,
  `producto_codigo` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `consecutivo_UNIQUE` (`consecutivo`),
  KEY `fk_detallePedido_pedido1_idx` (`pedido_id`),
  KEY `fk_detallePedido_producto1_idx` (`producto_codigo`),
  CONSTRAINT `fk_detallePedido_pedido1` FOREIGN KEY (`pedido_id`) REFERENCES `pedido` (`id`),
  CONSTRAINT `fk_detallePedido_producto1` FOREIGN KEY (`producto_codigo`) REFERENCES `producto` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla jovita-project.detallepedido: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `detallepedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `detallepedido` ENABLE KEYS */;

-- Volcando estructura para tabla jovita-project.detalleventa
DROP TABLE IF EXISTS `detalleventa`;
CREATE TABLE IF NOT EXISTS `detalleventa` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `consecutivo` int(11) NOT NULL COMMENT 'Describe la identificacion del detalle de venta, es unico e irrepetible.',
  `totalVenta` int(11) DEFAULT NULL COMMENT 'Describe el valor total vendido.',
  `cantidad` int(11) DEFAULT NULL COMMENT 'Describe el numero de unidades de cada producto que se va a vender.',
  `PrecioUnidad` int(11) DEFAULT NULL,
  `estado` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Describe la situacion en el que se encuentra el Detalle de Venta.',
  `facturaVenta_id` int(10) unsigned NOT NULL,
  `producto_codigo` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `consecutivo_UNIQUE` (`consecutivo`),
  KEY `fk_detalleVenta_facturaVenta1_idx` (`facturaVenta_id`),
  KEY `fk_detalleVenta_producto1_idx` (`producto_codigo`),
  CONSTRAINT `fk_detalleVenta_facturaVenta1` FOREIGN KEY (`facturaVenta_id`) REFERENCES `facturaventa` (`id`),
  CONSTRAINT `fk_detalleVenta_producto1` FOREIGN KEY (`producto_codigo`) REFERENCES `producto` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla jovita-project.detalleventa: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `detalleventa` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalleventa` ENABLE KEYS */;

-- Volcando estructura para tabla jovita-project.facturaventa
DROP TABLE IF EXISTS `facturaventa`;
CREATE TABLE IF NOT EXISTS `facturaventa` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `numero` int(11) NOT NULL COMMENT 'numero de la identificacion de la factura.',
  `fecha` date DEFAULT NULL COMMENT 'Describe la fecha en que se realizo la venta. ',
  `estado` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Describe la situacion en el que esta la venta, pueden ser elaborado, enviado, aprobado, pagado, cerrado,en revision, corregido.',
  `cliente_id` int(10) unsigned NOT NULL,
  `usuario_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `numero_UNIQUE` (`numero`),
  KEY `fk_facturaVenta_cliente_idx` (`cliente_id`),
  KEY `fk_facturaVenta_usuario1_idx` (`usuario_id`),
  CONSTRAINT `fk_facturaVenta_cliente` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`),
  CONSTRAINT `fk_facturaVenta_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla jovita-project.facturaventa: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `facturaventa` DISABLE KEYS */;
/*!40000 ALTER TABLE `facturaventa` ENABLE KEYS */;

-- Volcando estructura para tabla jovita-project.media
DROP TABLE IF EXISTS `media`;
CREATE TABLE IF NOT EXISTS `media` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  `collection_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int(10) unsigned NOT NULL,
  `manipulations` json NOT NULL,
  `custom_properties` json NOT NULL,
  `order_column` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `media_model_type_model_id_index` (`model_type`,`model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla jovita-project.media: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
/*!40000 ALTER TABLE `media` ENABLE KEYS */;

-- Volcando estructura para tabla jovita-project.migrations
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla jovita-project.migrations: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2017_08_24_000000_create_activations_table', 1),
	(2, '2017_08_24_000000_create_admin_activations_table', 1),
	(3, '2017_08_24_000000_create_admin_password_resets_table', 1),
	(4, '2017_08_24_000000_create_admin_users_table', 1),
	(5, '2018_07_18_000000_create_wysiwyg_media_table', 1),
	(6, '2019_05_29_053918_create_media_table', 1),
	(7, '2019_05_29_053918_create_permission_tables', 1),
	(8, '2019_05_29_053923_fill_default_admin_user_and_permissions', 1),
	(9, '2019_05_29_053918_create_translations_table', 2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Volcando estructura para tabla jovita-project.model_has_permissions
DROP TABLE IF EXISTS `model_has_permissions`;
CREATE TABLE IF NOT EXISTS `model_has_permissions` (
  `permission_id` int(10) unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla jovita-project.model_has_permissions: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `model_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_has_permissions` ENABLE KEYS */;

-- Volcando estructura para tabla jovita-project.model_has_roles
DROP TABLE IF EXISTS `model_has_roles`;
CREATE TABLE IF NOT EXISTS `model_has_roles` (
  `role_id` int(10) unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla jovita-project.model_has_roles: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;
INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
	(1, 'Brackets\\AdminAuth\\Models\\AdminUser', 1);
/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;

-- Volcando estructura para tabla jovita-project.ofreproveedor
DROP TABLE IF EXISTS `ofreproveedor`;
CREATE TABLE IF NOT EXISTS `ofreproveedor` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identificacion` int(11) NOT NULL,
  `descuento` int(11) DEFAULT NULL,
  `estado` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unidad` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `precio` int(11) DEFAULT NULL,
  `proveedor_id` int(10) unsigned NOT NULL,
  `insumo_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `identificacion_UNIQUE` (`identificacion`),
  KEY `fk_ofreProveedor_proveedor1_idx` (`proveedor_id`),
  CONSTRAINT `fk_ofreProveedor_proveedor1` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla jovita-project.ofreproveedor: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `ofreproveedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `ofreproveedor` ENABLE KEYS */;

-- Volcando estructura para tabla jovita-project.pedido
DROP TABLE IF EXISTS `pedido`;
CREATE TABLE IF NOT EXISTS `pedido` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `numeroPedido` int(11) NOT NULL COMMENT 'Describe la identificacion del pedido.',
  `estado` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Describe la situacion en el que se encuentra el pedido. como: aprobado, revisado,enviado,corregido,cerrado.',
  `fecha` date DEFAULT NULL COMMENT 'Fecha en el cual se realizo el pedido.',
  `proveedor_id` int(10) unsigned NOT NULL,
  `usuario_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `numeroPedido_UNIQUE` (`numeroPedido`),
  KEY `fk_pedido_proveedor1_idx` (`proveedor_id`),
  KEY `fk_pedido_usuario1_idx` (`usuario_id`),
  CONSTRAINT `fk_pedido_proveedor1` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedor` (`id`),
  CONSTRAINT `fk_pedido_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla jovita-project.pedido: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;

-- Volcando estructura para tabla jovita-project.permissions
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla jovita-project.permissions: ~9 rows (aproximadamente)
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
	(1, 'admin', 'admin', '2019-05-29 05:40:07', '2019-05-29 05:40:07'),
	(2, 'admin.translation.index', 'admin', '2019-05-29 05:40:07', '2019-05-29 05:40:07'),
	(3, 'admin.translation.edit', 'admin', '2019-05-29 05:40:07', '2019-05-29 05:40:07'),
	(4, 'admin.translation.rescan', 'admin', '2019-05-29 05:40:07', '2019-05-29 05:40:07'),
	(5, 'admin.admin-user.index', 'admin', '2019-05-29 05:40:07', '2019-05-29 05:40:07'),
	(6, 'admin.admin-user.create', 'admin', '2019-05-29 05:40:07', '2019-05-29 05:40:07'),
	(7, 'admin.admin-user.edit', 'admin', '2019-05-29 05:40:07', '2019-05-29 05:40:07'),
	(8, 'admin.admin-user.delete', 'admin', '2019-05-29 05:40:07', '2019-05-29 05:40:07'),
	(9, 'admin.upload', 'admin', '2019-05-29 05:40:07', '2019-05-29 05:40:07');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;

-- Volcando estructura para tabla jovita-project.privilegios
DROP TABLE IF EXISTS `privilegios`;
CREATE TABLE IF NOT EXISTS `privilegios` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `venderProductos` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla jovita-project.privilegios: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `privilegios` DISABLE KEYS */;
/*!40000 ALTER TABLE `privilegios` ENABLE KEYS */;

-- Volcando estructura para tabla jovita-project.producto
DROP TABLE IF EXISTS `producto`;
CREATE TABLE IF NOT EXISTS `producto` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identificacion unica de cada producto.',
  `codigo` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `nombre` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Nombre del producto.',
  `unidad` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Unidad de medida de cada producto, por ejemplo:                   Litros.                                                                                       Gramos.',
  `precioP` int(11) DEFAULT NULL COMMENT 'Decribe el precio por unidad del producto. ',
  `estado` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Describe la situacion del producto, por ejemplo: agotado, disponible, descontinuado, critico , stockminimo.',
  `existencia` int(11) DEFAULT NULL COMMENT 'Describe el numero de existencias correspondiente a un producto.  por ejemplo 30 botellas de miel.',
  `tipo` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'VENTA' COMMENT 'Define si el producto es un insumo o es para venta',
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo_UNIQUE` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla jovita-project.producto: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;

-- Volcando estructura para tabla jovita-project.productoproveedor
DROP TABLE IF EXISTS `productoproveedor`;
CREATE TABLE IF NOT EXISTS `productoproveedor` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `producto_id` int(10) unsigned NOT NULL,
  `ofreProveedor_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_productoProveedor_producto1_idx` (`producto_id`),
  KEY `fk_productoProveedor_ofreProveedor1_idx` (`ofreProveedor_id`),
  CONSTRAINT `fk_productoProveedor_ofreProveedor1` FOREIGN KEY (`ofreProveedor_id`) REFERENCES `ofreproveedor` (`id`),
  CONSTRAINT `fk_productoProveedor_producto1` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla jovita-project.productoproveedor: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `productoproveedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `productoproveedor` ENABLE KEYS */;

-- Volcando estructura para tabla jovita-project.proveedor
DROP TABLE IF EXISTS `proveedor`;
CREATE TABLE IF NOT EXISTS `proveedor` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `codigo` int(11) NOT NULL COMMENT 'Identificacion del proveedor.',
  `empresa` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Nombre de la  empresa.',
  `representante` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Nombre del representante de la empresa.',
  `estado` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Situacion en que se encuentra el proveedor.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo_UNIQUE` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla jovita-project.proveedor: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;

-- Volcando estructura para tabla jovita-project.roles
DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla jovita-project.roles: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
	(1, 'Administrator', 'admin', '2019-05-29 05:40:07', '2019-05-29 05:40:07');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;

-- Volcando estructura para tabla jovita-project.role_has_permissions
DROP TABLE IF EXISTS `role_has_permissions`;
CREATE TABLE IF NOT EXISTS `role_has_permissions` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla jovita-project.role_has_permissions: ~9 rows (aproximadamente)
/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;
INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
	(1, 1),
	(2, 1),
	(3, 1),
	(4, 1),
	(5, 1),
	(6, 1),
	(7, 1),
	(8, 1),
	(9, 1);
/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;

-- Volcando estructura para tabla jovita-project.translations
DROP TABLE IF EXISTS `translations`;
CREATE TABLE IF NOT EXISTS `translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `namespace` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '*',
  `group` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` json NOT NULL,
  `metadata` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `translations_namespace_index` (`namespace`),
  KEY `translations_group_index` (`group`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla jovita-project.translations: ~64 rows (aproximadamente)
/*!40000 ALTER TABLE `translations` DISABLE KEYS */;
INSERT INTO `translations` (`id`, `namespace`, `group`, `key`, `text`, `metadata`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'brackets/admin-ui', 'admin', 'operation.succeeded', '[]', NULL, '2019-05-29 05:40:15', '2019-05-29 05:40:15', NULL),
	(2, 'brackets/admin-ui', 'admin', 'operation.failed', '[]', NULL, '2019-05-29 05:40:15', '2019-05-29 05:40:15', NULL),
	(3, 'brackets/admin-ui', 'admin', 'operation.not_allowed', '[]', NULL, '2019-05-29 05:40:15', '2019-05-29 05:40:15', NULL),
	(4, '*', 'admin', 'admin-user.columns.first_name', '[]', NULL, '2019-05-29 05:40:15', '2019-05-29 05:40:15', NULL),
	(5, '*', 'admin', 'admin-user.columns.last_name', '[]', NULL, '2019-05-29 05:40:15', '2019-05-29 05:40:15', NULL),
	(6, '*', 'admin', 'admin-user.columns.email', '[]', NULL, '2019-05-29 05:40:15', '2019-05-29 05:40:15', NULL),
	(7, '*', 'admin', 'admin-user.columns.password', '[]', NULL, '2019-05-29 05:40:15', '2019-05-29 05:40:15', NULL),
	(8, '*', 'admin', 'admin-user.columns.password_repeat', '[]', NULL, '2019-05-29 05:40:15', '2019-05-29 05:40:15', NULL),
	(9, '*', 'admin', 'admin-user.columns.activated', '[]', NULL, '2019-05-29 05:40:15', '2019-05-29 05:40:15', NULL),
	(10, '*', 'admin', 'admin-user.columns.forbidden', '[]', NULL, '2019-05-29 05:40:15', '2019-05-29 05:40:15', NULL),
	(11, '*', 'admin', 'admin-user.columns.language', '[]', NULL, '2019-05-29 05:40:15', '2019-05-29 05:40:15', NULL),
	(12, 'brackets/admin-ui', 'admin', 'forms.select_an_option', '[]', NULL, '2019-05-29 05:40:15', '2019-05-29 05:40:15', NULL),
	(13, '*', 'admin', 'admin-user.columns.roles', '[]', NULL, '2019-05-29 05:40:15', '2019-05-29 05:40:15', NULL),
	(14, 'brackets/admin-ui', 'admin', 'forms.select_options', '[]', NULL, '2019-05-29 05:40:15', '2019-05-29 05:40:15', NULL),
	(15, '*', 'admin', 'admin-user.actions.create', '[]', NULL, '2019-05-29 05:40:15', '2019-05-29 05:40:15', NULL),
	(16, 'brackets/admin-ui', 'admin', 'btn.save', '[]', NULL, '2019-05-29 05:40:15', '2019-05-29 05:40:15', NULL),
	(17, '*', 'admin', 'admin-user.actions.edit', '[]', NULL, '2019-05-29 05:40:15', '2019-05-29 05:40:15', NULL),
	(18, '*', 'admin', 'admin-user.actions.index', '[]', NULL, '2019-05-29 05:40:15', '2019-05-29 05:40:15', NULL),
	(19, 'brackets/admin-ui', 'admin', 'placeholder.search', '[]', NULL, '2019-05-29 05:40:15', '2019-05-29 05:40:15', NULL),
	(20, 'brackets/admin-ui', 'admin', 'btn.search', '[]', NULL, '2019-05-29 05:40:15', '2019-05-29 05:40:15', NULL),
	(21, '*', 'admin', 'admin-user.columns.id', '[]', NULL, '2019-05-29 05:40:15', '2019-05-29 05:40:15', NULL),
	(22, 'brackets/admin-ui', 'admin', 'btn.edit', '[]', NULL, '2019-05-29 05:40:15', '2019-05-29 05:40:15', NULL),
	(23, 'brackets/admin-ui', 'admin', 'btn.delete', '[]', NULL, '2019-05-29 05:40:15', '2019-05-29 05:40:15', NULL),
	(24, 'brackets/admin-ui', 'admin', 'pagination.overview', '[]', NULL, '2019-05-29 05:40:15', '2019-05-29 05:40:15', NULL),
	(25, 'brackets/admin-ui', 'admin', 'index.no_items', '[]', NULL, '2019-05-29 05:40:15', '2019-05-29 05:40:15', NULL),
	(26, 'brackets/admin-ui', 'admin', 'index.try_changing_items', '[]', NULL, '2019-05-29 05:40:15', '2019-05-29 05:40:15', NULL),
	(27, 'brackets/admin-ui', 'admin', 'btn.new', '[]', NULL, '2019-05-29 05:40:15', '2019-05-29 05:40:15', NULL),
	(28, 'brackets/admin-ui', 'admin', 'profile_dropdown.account', '[]', NULL, '2019-05-29 05:40:15', '2019-05-29 05:40:15', NULL),
	(29, 'brackets/admin-auth', 'admin', 'profile_dropdown.logout', '[]', NULL, '2019-05-29 05:40:15', '2019-05-29 05:40:15', NULL),
	(30, 'brackets/admin-ui', 'admin', 'sidebar.content', '[]', NULL, '2019-05-29 05:40:15', '2019-05-29 05:40:15', NULL),
	(31, 'brackets/admin-ui', 'admin', 'sidebar.settings', '[]', NULL, '2019-05-29 05:40:15', '2019-05-29 05:40:15', NULL),
	(32, '*', 'admin', 'admin-user.actions.edit_password', '[]', NULL, '2019-05-29 05:40:15', '2019-05-29 05:40:15', NULL),
	(33, '*', 'admin', 'admin-user.actions.edit_profile', '[]', NULL, '2019-05-29 05:40:15', '2019-05-29 05:40:15', NULL),
	(34, 'brackets/admin-auth', 'activations', 'email.line', '[]', NULL, '2019-05-29 05:40:15', '2019-05-29 05:40:15', NULL),
	(35, 'brackets/admin-auth', 'activations', 'email.action', '[]', NULL, '2019-05-29 05:40:15', '2019-05-29 05:40:15', NULL),
	(36, 'brackets/admin-auth', 'activations', 'email.notRequested', '[]', NULL, '2019-05-29 05:40:15', '2019-05-29 05:40:15', NULL),
	(37, 'brackets/admin-auth', 'admin', 'activations.activated', '[]', NULL, '2019-05-29 05:40:15', '2019-05-29 05:40:15', NULL),
	(38, 'brackets/admin-auth', 'admin', 'activations.invalid_request', '[]', NULL, '2019-05-29 05:40:15', '2019-05-29 05:40:15', NULL),
	(39, 'brackets/admin-auth', 'admin', 'activations.disabled', '[]', NULL, '2019-05-29 05:40:15', '2019-05-29 05:40:15', NULL),
	(40, 'brackets/admin-auth', 'admin', 'activations.sent', '[]', NULL, '2019-05-29 05:40:15', '2019-05-29 05:40:15', NULL),
	(41, 'brackets/admin-auth', 'admin', 'passwords.sent', '[]', NULL, '2019-05-29 05:40:15', '2019-05-29 05:40:15', NULL),
	(42, 'brackets/admin-auth', 'admin', 'passwords.reset', '[]', NULL, '2019-05-29 05:40:15', '2019-05-29 05:40:15', NULL),
	(43, 'brackets/admin-auth', 'admin', 'passwords.invalid_token', '[]', NULL, '2019-05-29 05:40:15', '2019-05-29 05:40:15', NULL),
	(44, 'brackets/admin-auth', 'admin', 'passwords.invalid_user', '[]', NULL, '2019-05-29 05:40:15', '2019-05-29 05:40:15', NULL),
	(45, 'brackets/admin-auth', 'admin', 'passwords.invalid_password', '[]', NULL, '2019-05-29 05:40:15', '2019-05-29 05:40:15', NULL),
	(46, 'brackets/admin-auth', 'admin', 'activation_form.title', '[]', NULL, '2019-05-29 05:40:15', '2019-05-29 05:40:15', NULL),
	(47, 'brackets/admin-auth', 'admin', 'activation_form.note', '[]', NULL, '2019-05-29 05:40:15', '2019-05-29 05:40:15', NULL),
	(48, 'brackets/admin-auth', 'admin', 'auth_global.email', '[]', NULL, '2019-05-29 05:40:15', '2019-05-29 05:40:15', NULL),
	(49, 'brackets/admin-auth', 'admin', 'activation_form.button', '[]', NULL, '2019-05-29 05:40:15', '2019-05-29 05:40:15', NULL),
	(50, 'brackets/admin-auth', 'admin', 'login.title', '[]', NULL, '2019-05-29 05:40:15', '2019-05-29 05:40:15', NULL),
	(51, 'brackets/admin-auth', 'admin', 'login.sign_in_text', '[]', NULL, '2019-05-29 05:40:15', '2019-05-29 05:40:15', NULL),
	(52, 'brackets/admin-auth', 'admin', 'auth_global.password', '[]', NULL, '2019-05-29 05:40:15', '2019-05-29 05:40:15', NULL),
	(53, 'brackets/admin-auth', 'admin', 'login.button', '[]', NULL, '2019-05-29 05:40:15', '2019-05-29 05:40:15', NULL),
	(54, 'brackets/admin-auth', 'admin', 'login.forgot_password', '[]', NULL, '2019-05-29 05:40:15', '2019-05-29 05:40:15', NULL),
	(55, 'brackets/admin-auth', 'admin', 'forgot_password.title', '[]', NULL, '2019-05-29 05:40:15', '2019-05-29 05:40:15', NULL),
	(56, 'brackets/admin-auth', 'admin', 'forgot_password.note', '[]', NULL, '2019-05-29 05:40:15', '2019-05-29 05:40:15', NULL),
	(57, 'brackets/admin-auth', 'admin', 'forgot_password.button', '[]', NULL, '2019-05-29 05:40:15', '2019-05-29 05:40:15', NULL),
	(58, 'brackets/admin-auth', 'admin', 'password_reset.title', '[]', NULL, '2019-05-29 05:40:15', '2019-05-29 05:40:15', NULL),
	(59, 'brackets/admin-auth', 'admin', 'password_reset.note', '[]', NULL, '2019-05-29 05:40:15', '2019-05-29 05:40:15', NULL),
	(60, 'brackets/admin-auth', 'admin', 'auth_global.password_confirm', '[]', NULL, '2019-05-29 05:40:15', '2019-05-29 05:40:15', NULL),
	(61, 'brackets/admin-auth', 'admin', 'password_reset.button', '[]', NULL, '2019-05-29 05:40:15', '2019-05-29 05:40:15', NULL),
	(62, '*', '*', 'Manage access', '[]', NULL, '2019-05-29 05:40:15', '2019-05-29 05:40:15', NULL),
	(63, '*', '*', 'Translations', '[]', NULL, '2019-05-29 05:40:15', '2019-05-29 05:40:15', NULL),
	(64, '*', '*', 'Configuration', '[]', NULL, '2019-05-29 05:40:15', '2019-05-29 05:40:15', NULL);
/*!40000 ALTER TABLE `translations` ENABLE KEYS */;

-- Volcando estructura para tabla jovita-project.usuario
DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `codigo` int(11) NOT NULL COMMENT 'Numero de identificacion del ususario.',
  `nombre` varchar(150) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Nombre del Usuario',
  `contrasena` varchar(25) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Describe la contraseña del usuario.',
  `estado` varchar(25) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Describe la situacion del usuario.habilitado o deshabilitado',
  `tipo` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `privilegios_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo_UNIQUE` (`codigo`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `fk_usuario_privilegios1_idx` (`privilegios_id`),
  CONSTRAINT `fk_usuario_privilegios1` FOREIGN KEY (`privilegios_id`) REFERENCES `privilegios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla jovita-project.usuario: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;

-- Volcando estructura para tabla jovita-project.wysiwyg_media
DROP TABLE IF EXISTS `wysiwyg_media`;
CREATE TABLE IF NOT EXISTS `wysiwyg_media` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `file_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wysiwygable_id` int(10) unsigned DEFAULT NULL,
  `wysiwygable_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wysiwyg_media_wysiwygable_id_index` (`wysiwygable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla jovita-project.wysiwyg_media: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `wysiwyg_media` DISABLE KEYS */;
/*!40000 ALTER TABLE `wysiwyg_media` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
