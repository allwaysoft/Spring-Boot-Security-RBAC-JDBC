-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        8.0.22 - MySQL Community Server - GPL
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- 导出 product3 的数据库结构
CREATE DATABASE IF NOT EXISTS `product3` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `product3`;

-- 导出  表 product3.permissions 结构
CREATE TABLE IF NOT EXISTS `permissions` (
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  product3.permissions 的数据：~3 rows (大约)
INSERT INTO `permissions` (`name`, `description`) VALUES
	('ADMIN', NULL),
	('DELETE', 'delete'),
	('READ', 'read'),
	('WRITE', 'write');

-- 导出  表 product3.product 结构
CREATE TABLE IF NOT EXISTS `product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `brand` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `madein` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  product3.product 的数据：~1 rows (大约)
INSERT INTO `product` (`id`, `brand`, `madein`, `name`, `price`) VALUES
	(1, '666', '666', '数据库', 222);

-- 导出  表 product3.roles 结构
CREATE TABLE IF NOT EXISTS `roles` (
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  product3.roles 的数据：~3 rows (大约)
INSERT INTO `roles` (`name`, `description`) VALUES
	('ADMIN', 'Administrator role'),
	('USER_P1', 'Perfil 1'),
	('USER_P2', 'Perfil 2');

-- 导出  表 product3.roles_permissions 结构
CREATE TABLE IF NOT EXISTS `roles_permissions` (
  `role_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `permission` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`role_name`,`permission`),
  KEY `RP_1` (`role_name`),
  KEY `RP_2` (`permission`),
  CONSTRAINT `RP_1` FOREIGN KEY (`role_name`) REFERENCES `roles` (`name`),
  CONSTRAINT `RP_2` FOREIGN KEY (`permission`) REFERENCES `permissions` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  product3.roles_permissions 的数据：~4 rows (大约)
INSERT INTO `roles_permissions` (`role_name`, `permission`) VALUES
	('ADMIN', 'ADMIN'),
	('ADMIN', 'DELETE'),
	('ADMIN', 'READ'),
	('ADMIN', 'WRITE'),
	('USER_P1', 'READ'),
	('USER_P2', 'DELETE'),
	('USER_P2', 'WRITE');

-- 导出  表 product3.users 结构
CREATE TABLE IF NOT EXISTS `users` (
  `username` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(65) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` int DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  product3.users 的数据：~3 rows (大约)
INSERT INTO `users` (`username`, `email`, `name`, `password`, `enabled`) VALUES
	('admin', 'admin@example.com', 'Administrator', '$2a$10$2/LSmp3YoEOT97KzgrYODen7I88ErBovM2Qehw9DL1dW9DZ7DZSAm', 1),
	('u1', 'u1@example.com', 'User P1', '$2a$10$2/LSmp3YoEOT97KzgrYODen7I88ErBovM2Qehw9DL1dW9DZ7DZSAm', 1),
	('u2', 'u2@example.com', 'User P2', '$2a$10$2/LSmp3YoEOT97KzgrYODen7I88ErBovM2Qehw9DL1dW9DZ7DZSAm', 1);

-- 导出  表 product3.users_roles 结构
CREATE TABLE IF NOT EXISTS `users_roles` (
  `username` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`username`,`role_name`),
  KEY `UR_1` (`username`),
  KEY `UR_2` (`role_name`),
  CONSTRAINT `UR_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`),
  CONSTRAINT `UR_2` FOREIGN KEY (`role_name`) REFERENCES `roles` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 正在导出表  product3.users_roles 的数据：~0 rows (大约)
INSERT INTO `users_roles` (`username`, `role_name`) VALUES
	('admin', 'ADMIN'),
	('u1', 'USER_P1'),
	('u2', 'USER_P2');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
