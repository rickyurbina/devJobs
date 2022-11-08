-- -------------------------------------------------------------
-- TablePlus 5.1.0(468)
--
-- https://tableplus.com/
--
-- Database: devjobs
-- Generation Time: 2022-11-07 19:53:44.7120
-- -------------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


CREATE TABLE `candidatos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `vacante_id` bigint unsigned NOT NULL,
  `cv` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `candidatos_user_id_foreign` (`user_id`),
  KEY `candidatos_vacante_id_foreign` (`vacante_id`),
  CONSTRAINT `candidatos_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `candidatos_vacante_id_foreign` FOREIGN KEY (`vacante_id`) REFERENCES `vacantes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `categorias` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `categoria` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint unsigned NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `salarios` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `salario` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `rol` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `vacantes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `titulo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `salario_id` bigint unsigned NOT NULL,
  `categoria_id` bigint unsigned NOT NULL,
  `empresa` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ultimo_dia` date NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `imagen` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `publicado` int NOT NULL DEFAULT '1',
  `user_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `vacantes_salario_id_foreign` (`salario_id`),
  KEY `vacantes_categoria_id_foreign` (`categoria_id`),
  KEY `vacantes_user_id_foreign` (`user_id`),
  CONSTRAINT `vacantes_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`) ON DELETE CASCADE,
  CONSTRAINT `vacantes_salario_id_foreign` FOREIGN KEY (`salario_id`) REFERENCES `salarios` (`id`) ON DELETE CASCADE,
  CONSTRAINT `vacantes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `candidatos` (`id`, `user_id`, `vacante_id`, `cv`, `created_at`, `updated_at`) VALUES
(1, 5, 1, '52G8ZrXiqvW1RhaH6glZmRtTFHVg1ySRGHaG04kx.pdf', '2022-10-07 23:35:39', '2022-10-07 23:35:39'),
(2, 5, 1, '7QsILj6rx0X3gjUetu2c7AwRfbVljfUxsOwomKnE.pdf', '2022-10-07 23:43:41', '2022-10-07 23:43:41'),
(3, 5, 1, 'vVbJJ60gYYGFSD8eEQkd5Iq2dflllrZhcC1GB749.pdf', '2022-10-12 00:57:02', '2022-10-12 00:57:02'),
(4, 5, 1, '2UFxWAVp1autjGpmve9Fr2ysKwdIvjxUJ8iK87y7.pdf', '2022-10-12 00:57:33', '2022-10-12 00:57:33'),
(5, 5, 1, 'yLxnLl4usDgbGj8SNCyZgVx4w17nmAiZet2yck9W.pdf', '2022-10-12 01:00:33', '2022-10-12 01:00:33'),
(6, 5, 1, 'vtmmO72laVDQaulVK93OeRAB4Pz6EYq37mwza14Q.pdf', '2022-10-12 01:23:15', '2022-10-12 01:23:15'),
(7, 5, 2, 'gWJ6XEfAtdHBiYTy314Eecgc85isXMIfVsSVXOfr.pdf', '2022-10-12 01:55:41', '2022-10-12 01:55:41'),
(8, 5, 3, 'ijSKHZi75ZVIjIziT4AQUsBgSlHoSDhqvuq01QLz.pdf', '2022-10-14 03:48:11', '2022-10-14 03:48:11'),
(9, 5, 3, 'UwR9MeSPg4geQTWHNzIjWeksxeLffK6rRoWamvHG.pdf', '2022-10-14 03:53:41', '2022-10-14 03:53:41');

INSERT INTO `categorias` (`id`, `categoria`, `created_at`, `updated_at`) VALUES
(1, 'Backend Developer', '2022-09-22 22:53:24', '2022-09-22 22:53:24'),
(2, 'Front end Developer', '2022-09-22 22:53:24', '2022-09-22 22:53:24'),
(3, 'Mobile Developer', '2022-09-22 22:53:24', '2022-09-22 22:53:24'),
(4, 'Techlead', '2022-09-22 22:53:24', '2022-09-22 22:53:24'),
(5, 'UX / UI Design', '2022-09-22 22:53:24', '2022-09-22 22:53:24'),
(6, 'Software Architecture', '2022-09-22 22:53:24', '2022-09-22 22:53:24'),
(7, 'Devops', '2022-09-22 22:53:24', '2022-09-22 22:53:24');

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_09_21_011936_add_rol_to_users_table', 2),
(9, '2022_09_21_013933_create_vacante_table', 3),
(10, '2022_09_22_222755_create_salarios_table', 3),
(11, '2022_09_22_224615_create_categorias_table', 3),
(13, '2022_09_23_004155_add_columns_to_vacantes_table', 4),
(14, '2022_10_07_211233_create_candidatos_table', 5),
(15, '2022_10_07_235030_create_notifications_table', 6);

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('2349bd63-8836-4d71-b9ab-33059949c010', 'App\\Notifications\\NuevoCandidato', 'App\\Models\\User', 3, '{\"id_vacante\":1,\"nombre_vacante\":\"Desarrollador React ACTUALIZADO\",\"usuario_id\":5}', '2022-10-20 01:42:12', '2022-10-12 01:00:33', '2022-10-26 01:42:12'),
('40659d7d-e546-409e-a542-2ff4bb73c982', 'App\\Notifications\\NuevoCandidato', 'App\\Models\\User', 3, '{\"id_vacante\":1,\"nombre_vacante\":\"Desarrollador React ACTUALIZADO\",\"usuario_id\":5}', '2022-10-21 01:42:12', '2022-10-12 01:23:15', '2022-10-26 01:42:12'),
('4b9a8d35-296c-4bf0-9420-6c1e26025917', 'App\\Notifications\\NuevoCandidato', 'App\\Models\\User', 3, '{\"id_vacante\":1,\"nombre_vacante\":\"Desarrollador React ACTUALIZADO\",\"usuario_id\":5}', '2022-10-22 01:42:12', '2022-10-12 00:57:33', '2022-10-26 01:42:12'),
('a9e4efab-e299-41d0-8798-80b70ac53041', 'App\\Notifications\\NuevoCandidato', 'App\\Models\\User', 3, '{\"id_vacante\":3,\"nombre_vacante\":\"Desarrollador Laravel\",\"usuario_id\":5}', '2022-10-14 03:48:25', '2022-10-14 03:48:12', '2022-10-14 03:48:25'),
('ae6dbd8b-8613-4f61-b607-2fbbf8a5d51f', 'App\\Notifications\\NuevoCandidato', 'App\\Models\\User', 3, '{\"id_vacante\":3,\"nombre_vacante\":\"Desarrollador Laravel\",\"usuario_id\":5}', '2022-10-14 03:57:26', '2022-10-14 03:53:41', '2022-10-14 03:57:26'),
('ca9396bb-2e61-49c2-b0fa-7fd07466f75c', 'App\\Notifications\\NuevoCandidato', 'App\\Models\\User', 3, '{\"id_vacante\":2,\"nombre_vacante\":\"React Native\",\"usuario_id\":5}', '2022-10-14 03:34:38', '2022-10-12 01:55:41', '2022-10-14 03:34:38');

INSERT INTO `salarios` (`id`, `salario`, `created_at`, `updated_at`) VALUES
(1, '$0 - $499', '2022-09-22 22:53:24', '2022-09-22 22:53:24'),
(2, '$500 - $749', '2022-09-22 22:53:24', '2022-09-22 22:53:24'),
(3, '$750 - $999', '2022-09-22 22:53:24', '2022-09-22 22:53:24'),
(4, '$1000 - $1499', '2022-09-22 22:53:24', '2022-09-22 22:53:24'),
(5, '$1500 - $1999', '2022-09-22 22:53:24', '2022-09-22 22:53:24'),
(6, '$2000 - $2499', '2022-09-22 22:53:24', '2022-09-22 22:53:24'),
(7, '$2500 - $2999', '2022-09-22 22:53:24', '2022-09-22 22:53:24'),
(8, '$3000 - $4999', '2022-09-22 22:53:24', '2022-09-22 22:53:24'),
(9, '+$5000', '2022-09-22 22:53:24', '2022-09-22 22:53:24');

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `rol`) VALUES
(3, 'Ricardo', 'correo@gmail.com', '2022-09-21 01:35:07', '$2y$10$mnTlj87YV.Tw6tINbQOkzOGwyuq7uZH9HHavL22DOZ27vWFNzJT66', NULL, '2022-09-21 01:34:47', '2022-09-21 01:35:07', 2),
(4, 'Melany Urbina', 'correo2@gmail.com', '2022-09-23 02:15:31', '$2y$10$S4xzwqap.2rICPbY99LQXekKc9f1u/CJbiLFglt57i7xq7pqUHilK', NULL, '2022-09-23 02:15:04', '2022-09-23 02:15:31', 2),
(5, 'Dev1', 'correoDev1@gmail.com', '2022-10-04 02:09:22', '$2y$10$D8MQv3J.bZXFhKZTOKM22.9P0jGgtY11ugTGdjto3sjQvKjM/X4A.', NULL, '2022-10-04 02:05:45', '2022-10-04 02:09:22', 1);

INSERT INTO `vacantes` (`id`, `created_at`, `updated_at`, `titulo`, `salario_id`, `categoria_id`, `empresa`, `ultimo_dia`, `descripcion`, `imagen`, `publicado`, `user_id`) VALUES
(1, '2022-09-23 01:30:30', '2022-10-04 01:53:30', 'Desarrollador React ACTUALIZADO', 6, 3, 'Uber', '2022-10-08', 'Se busca desarrollador ReactJS', '8RDR6jDFvBcxX6RWv5da8Lj6DIQ91GAEbvDGxnvK.jpg', 1, 3),
(2, '2022-09-23 01:51:19', '2022-09-23 01:51:19', 'React Native', 3, 3, 'Uber', '2022-10-08', 'Se busca desarrollador de aplicaciones en React Native', 'bbD0E6YVOn7VOzk7F5oF0m0tJj8JnRT0qFnwTcME.png', 1, 3),
(3, '2022-09-26 03:34:10', '2022-09-26 03:34:10', 'Desarrollador Laravel', 3, 1, 'U3 Digital', '2022-10-08', 'Se busca desarrollador de Backend, con conocimientos de Laravel', 'YWeKEJw3CJOcr19qbcbNj5stwSNYaWhf7mdneq83.png', 1, 3);



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;