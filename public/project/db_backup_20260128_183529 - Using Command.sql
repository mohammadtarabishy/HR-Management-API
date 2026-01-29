-- Database Export: hrManagement
-- Generated at 2026-01-28 18:35:29

DROP TABLE IF EXISTS `cache`;
CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `cache` (`key`,`value`,`expiration`) VALUES ('hrsystem_cache_a75f3f172bfb296f2e10cbfc6dfc1883','i:2;','1769621438');
INSERT INTO `cache` (`key`,`value`,`expiration`) VALUES ('hrsystem_cache_a75f3f172bfb296f2e10cbfc6dfc1883:timer','i:1769621438;','1769621438');

DROP TABLE IF EXISTS `cache_locks`;
CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `employee_logs`;
CREATE TABLE `employee_logs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` bigint unsigned DEFAULT NULL,
  `action` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `old_data` json DEFAULT NULL,
  `new_data` json DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_logs_employee_id_foreign` (`employee_id`),
  KEY `employee_logs_user_id_foreign` (`user_id`),
  CONSTRAINT `employee_logs_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE SET NULL,
  CONSTRAINT `employee_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `employees`;
CREATE TABLE `employees` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `salary` decimal(10,2) NOT NULL,
  `last_salary_change_at` timestamp NULL DEFAULT NULL,
  `position_id` bigint unsigned NOT NULL,
  `manager_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `employees_email_unique` (`email`),
  KEY `employees_position_id_foreign` (`position_id`),
  KEY `employees_manager_id_foreign` (`manager_id`),
  CONSTRAINT `employees_manager_id_foreign` FOREIGN KEY (`manager_id`) REFERENCES `employees` (`id`) ON DELETE SET NULL,
  CONSTRAINT `employees_position_id_foreign` FOREIGN KEY (`position_id`) REFERENCES `positions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=311 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('1','Mohammad Khair','mohammad@test.com','44.00','2026-01-28 17:30:03','1',NULL,'2026-01-28 12:14:53','2026-01-28 17:30:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('2','Ahmad','ahmad@test.com','2444.00',NULL,'2','1','2026-01-28 12:15:13','2026-01-28 15:18:44');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('3','Samer','samer@test.com','2000.00',NULL,'2','2','2026-01-28 12:15:41','2026-01-28 12:15:41');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('4','Taha','taha@test.com','2000.00',NULL,'2','3','2026-01-28 12:17:48','2026-01-28 12:17:48');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('5','rami','rami@test.com','4000.00',NULL,'3','2','2026-01-28 13:25:25','2026-01-28 13:25:25');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('6','bassam','bassam@test.com','5000.00',NULL,'4','5','2026-01-28 13:25:25','2026-01-28 13:25:25');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('7','jaber','jaber@test.com','4000.00',NULL,'5','1','2026-01-28 13:34:35','2026-01-28 13:34:35');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('8','besher','besher@test.com','5000.00',NULL,'4','7','2026-01-28 13:34:35','2026-01-28 13:34:35');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('9','Ayman','ayman@test.com','2000.00',NULL,'2','3','2026-01-28 17:03:24','2026-01-28 17:03:24');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('10','munir','munir@test.com','2030.00',NULL,'4','7','2026-01-28 17:19:49','2026-01-28 17:19:49');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('11','Employee pLVWJW','AUHOR7zj@example.com','4425.00',NULL,'1','1','2026-01-28 18:09:55','2026-01-28 18:09:55');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('12','Employee dILwLz','hgVYGedS@example.com','4370.00',NULL,'1','1','2026-01-28 18:09:55','2026-01-28 18:09:55');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('13','Employee KJpMP6','TU7ySJKr@example.com','4448.00',NULL,'1','1','2026-01-28 18:09:55','2026-01-28 18:09:55');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('14','Employee dHvLsa','1bkbWWpG@example.com','2671.00',NULL,'1','1','2026-01-28 18:09:55','2026-01-28 18:09:55');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('15','Employee MIFwiv','G5DV4MAe@example.com','4050.00',NULL,'1','1','2026-01-28 18:09:55','2026-01-28 18:09:55');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('16','Employee x5hu78','FM2ENdJo@example.com','3297.00',NULL,'1','1','2026-01-28 18:09:55','2026-01-28 18:09:55');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('17','Employee afPmTt','SJy9QFE1@example.com','4571.00',NULL,'1','1','2026-01-28 18:09:55','2026-01-28 18:09:55');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('18','Employee 7m9wrq','o9jTp5sh@example.com','1137.00',NULL,'1','1','2026-01-28 18:09:55','2026-01-28 18:09:55');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('19','Employee xxMS72','L8ncaUWP@example.com','862.00',NULL,'1','1','2026-01-28 18:09:55','2026-01-28 18:09:55');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('20','Employee 8jG98A','F52aWWmo@example.com','4779.00',NULL,'1','1','2026-01-28 18:09:55','2026-01-28 18:09:55');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('21','Employee VKfide','PVyNzzc3@example.com','2666.00',NULL,'1','1','2026-01-28 18:09:55','2026-01-28 18:09:55');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('22','Employee QjgzDl','hBeP8BH0@example.com','981.00',NULL,'1','1','2026-01-28 18:09:55','2026-01-28 18:09:55');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('23','Employee HP8wdE','FFa0pw3y@example.com','4131.00',NULL,'1','1','2026-01-28 18:09:55','2026-01-28 18:09:55');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('24','Employee XsFAvW','0kC8VMmY@example.com','4849.00',NULL,'1','1','2026-01-28 18:09:55','2026-01-28 18:09:55');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('25','Employee dNw43Z','1kgO618h@example.com','4238.00',NULL,'1','1','2026-01-28 18:09:55','2026-01-28 18:09:55');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('26','Employee 1VVTch','CbMbE18x@example.com','3646.00',NULL,'1','1','2026-01-28 18:09:55','2026-01-28 18:09:55');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('27','Employee MpDdXK','IIQAlFfg@example.com','3036.00',NULL,'1','1','2026-01-28 18:09:55','2026-01-28 18:09:55');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('28','Employee e1u2bJ','GtrKTFNG@example.com','4712.00',NULL,'1','1','2026-01-28 18:09:55','2026-01-28 18:09:55');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('29','Employee iYVBOL','Co53h4Ep@example.com','2320.00',NULL,'1','1','2026-01-28 18:09:55','2026-01-28 18:09:55');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('30','Employee IsKZAL','ALpj3mQ5@example.com','1104.00',NULL,'1','1','2026-01-28 18:09:55','2026-01-28 18:09:55');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('31','Employee 7lrRCL','N9WlkAMr@example.com','3867.00',NULL,'1','1','2026-01-28 18:09:55','2026-01-28 18:09:55');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('32','Employee xalcOp','jdnAjYVn@example.com','2571.00',NULL,'1','1','2026-01-28 18:09:55','2026-01-28 18:09:55');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('33','Employee kE5Vt2','Ghbah1BK@example.com','1132.00',NULL,'1','1','2026-01-28 18:09:55','2026-01-28 18:09:55');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('34','Employee KC0Kdb','QcN8SW4l@example.com','4999.00',NULL,'1','1','2026-01-28 18:09:55','2026-01-28 18:09:55');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('35','Employee OJLuEp','s79HRBin@example.com','3534.00',NULL,'1','1','2026-01-28 18:09:55','2026-01-28 18:09:55');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('36','Employee 66x2pD','Il9sfyZy@example.com','2513.00',NULL,'1','1','2026-01-28 18:09:55','2026-01-28 18:09:55');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('37','Employee 6QeMGy','OIQpYrzY@example.com','3376.00',NULL,'1','1','2026-01-28 18:09:55','2026-01-28 18:09:55');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('38','Employee m8mLop','ciXcE0Uu@example.com','1808.00',NULL,'1','1','2026-01-28 18:09:55','2026-01-28 18:09:55');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('39','Employee kPPCWq','tA9tn80Z@example.com','611.00',NULL,'1','1','2026-01-28 18:09:55','2026-01-28 18:09:55');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('40','Employee lqZ50k','k61vTfBa@example.com','3742.00',NULL,'1','1','2026-01-28 18:09:55','2026-01-28 18:09:55');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('41','Employee dwb1Rf','FtZCfptY@example.com','2694.00',NULL,'1','1','2026-01-28 18:09:55','2026-01-28 18:09:55');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('42','Employee kSg8vr','lyORt2UP@example.com','2167.00',NULL,'1','1','2026-01-28 18:09:55','2026-01-28 18:09:55');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('43','Employee ud4BO4','g6e0GtgV@example.com','1387.00',NULL,'1','1','2026-01-28 18:09:55','2026-01-28 18:09:55');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('44','Employee hY6Dy5','rHUbxa9v@example.com','1784.00',NULL,'1','1','2026-01-28 18:09:55','2026-01-28 18:09:55');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('45','Employee i7xpGg','03Q3Ym5R@example.com','626.00',NULL,'1','1','2026-01-28 18:09:55','2026-01-28 18:09:55');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('46','Employee TxuHkT','dGitPWZe@example.com','659.00',NULL,'1','1','2026-01-28 18:09:55','2026-01-28 18:09:55');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('47','Employee AIwwxN','lOaxhxjx@example.com','4068.00',NULL,'1','1','2026-01-28 18:09:55','2026-01-28 18:09:55');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('48','Employee iE3Ebs','5YiTk5HH@example.com','2378.00',NULL,'1','1','2026-01-28 18:09:55','2026-01-28 18:09:55');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('49','Employee Q2hoPc','oNq0rL8R@example.com','3371.00',NULL,'1','1','2026-01-28 18:09:55','2026-01-28 18:09:55');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('50','Employee agYyLA','wE8wcBrJ@example.com','3358.00',NULL,'1','1','2026-01-28 18:09:55','2026-01-28 18:09:55');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('51','Employee 3gs1gj','heHJ5qag@example.com','1032.00',NULL,'1','1','2026-01-28 18:09:55','2026-01-28 18:09:55');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('52','Employee rD67B4','OG1ow10c@example.com','1282.00',NULL,'1','1','2026-01-28 18:09:55','2026-01-28 18:09:55');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('53','Employee 3yYJPh','ZIjOrlSy@example.com','2191.00',NULL,'1','1','2026-01-28 18:09:55','2026-01-28 18:09:55');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('54','Employee 2AOZ6V','Ng0iFGU5@example.com','4095.00',NULL,'1','1','2026-01-28 18:09:55','2026-01-28 18:09:55');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('55','Employee 77Ax0z','dmJyhfkE@example.com','3216.00',NULL,'1','1','2026-01-28 18:09:55','2026-01-28 18:09:55');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('56','Employee B72CSP','4eTRWChh@example.com','1332.00',NULL,'1','1','2026-01-28 18:09:55','2026-01-28 18:09:55');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('57','Employee 0PcPhb','arA8wWFV@example.com','2358.00',NULL,'1','1','2026-01-28 18:09:55','2026-01-28 18:09:55');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('58','Employee OH2Am1','pwLud0WU@example.com','3487.00',NULL,'1','1','2026-01-28 18:09:55','2026-01-28 18:09:55');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('59','Employee D5L8SO','oD2iQg67@example.com','3351.00',NULL,'1','1','2026-01-28 18:09:55','2026-01-28 18:09:55');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('60','Employee ps5KcS','No4i4Drb@example.com','754.00',NULL,'1','1','2026-01-28 18:09:55','2026-01-28 18:09:55');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('61','Employee XHD80P','AyMXPjxI@example.com','2078.00',NULL,'1','1','2026-01-28 18:09:55','2026-01-28 18:09:55');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('62','Employee eP1JAV','1jJEKPkO@example.com','4127.00',NULL,'1','1','2026-01-28 18:09:55','2026-01-28 18:09:55');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('63','Employee Sp13ig','26ZWX9CM@example.com','533.00',NULL,'1','1','2026-01-28 18:09:55','2026-01-28 18:09:55');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('64','Employee Rp1diY','MgYQCkaW@example.com','3025.00',NULL,'1','1','2026-01-28 18:09:55','2026-01-28 18:09:55');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('65','Employee 3mw1n2','gYVDd5CT@example.com','2530.00',NULL,'1','1','2026-01-28 18:09:55','2026-01-28 18:09:55');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('66','Employee eos6Se','iUvfhs9Z@example.com','2245.00',NULL,'1','1','2026-01-28 18:09:55','2026-01-28 18:09:55');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('67','Employee xAA4rB','Hyr5zXmI@example.com','2667.00',NULL,'1','1','2026-01-28 18:09:55','2026-01-28 18:09:55');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('68','Employee r8xwxF','vXmbMUmD@example.com','2499.00',NULL,'1','1','2026-01-28 18:09:55','2026-01-28 18:09:55');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('69','Employee zFWgsU','FEb7HMcD@example.com','1148.00',NULL,'1','1','2026-01-28 18:09:55','2026-01-28 18:09:55');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('70','Employee 3JfnU6','hvq5DNTb@example.com','661.00',NULL,'1','1','2026-01-28 18:09:55','2026-01-28 18:09:55');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('71','Employee aioNDB','kpy1VOdz@example.com','1326.00',NULL,'1','1','2026-01-28 18:09:55','2026-01-28 18:09:55');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('72','Employee Zao1DK','0gMrRHeE@example.com','4626.00',NULL,'1','1','2026-01-28 18:09:55','2026-01-28 18:09:55');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('73','Employee wM1axo','Zni69jVp@example.com','2548.00',NULL,'1','1','2026-01-28 18:09:55','2026-01-28 18:09:55');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('74','Employee 3KlVzB','9h3mvtHw@example.com','3397.00',NULL,'1','1','2026-01-28 18:09:55','2026-01-28 18:09:55');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('75','Employee EdiZ28','bH7OypQ5@example.com','2071.00',NULL,'1','1','2026-01-28 18:09:55','2026-01-28 18:09:55');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('76','Employee dTvWlM','YrC1icOr@example.com','2976.00',NULL,'1','1','2026-01-28 18:09:55','2026-01-28 18:09:55');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('77','Employee OpTYT6','KYEPfEor@example.com','2949.00',NULL,'1','1','2026-01-28 18:09:55','2026-01-28 18:09:55');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('78','Employee DtbizY','z4nuuW3d@example.com','1850.00',NULL,'1','1','2026-01-28 18:09:55','2026-01-28 18:09:55');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('79','Employee kvjx3f','e2KV46GR@example.com','1649.00',NULL,'1','1','2026-01-28 18:09:55','2026-01-28 18:09:55');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('80','Employee 8R06Ky','PONVX9OQ@example.com','2991.00',NULL,'1','1','2026-01-28 18:09:55','2026-01-28 18:09:55');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('81','Employee s2GzRy','tpd3amJk@example.com','2708.00',NULL,'1','1','2026-01-28 18:09:55','2026-01-28 18:09:55');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('82','Employee 4NN00S','05bEBK3p@example.com','3276.00',NULL,'1','1','2026-01-28 18:09:55','2026-01-28 18:09:55');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('83','Employee kRw8zZ','M2oJHlT8@example.com','2893.00',NULL,'1','1','2026-01-28 18:09:55','2026-01-28 18:09:55');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('84','Employee Vy6ACI','W1atB8Ii@example.com','4867.00',NULL,'1','1','2026-01-28 18:09:55','2026-01-28 18:09:55');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('85','Employee iSNhxI','BfnkNphL@example.com','2404.00',NULL,'1','1','2026-01-28 18:09:55','2026-01-28 18:09:55');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('86','Employee QvKP7w','BgDXMhaf@example.com','4034.00',NULL,'1','1','2026-01-28 18:09:55','2026-01-28 18:09:55');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('87','Employee tezsNV','9acrgOBI@example.com','720.00',NULL,'1','1','2026-01-28 18:09:55','2026-01-28 18:09:55');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('88','Employee e3yZBh','PTZfBV6v@example.com','2114.00',NULL,'1','1','2026-01-28 18:09:55','2026-01-28 18:09:55');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('89','Employee RsVlBa','mlQKa8vx@example.com','543.00',NULL,'1','1','2026-01-28 18:09:55','2026-01-28 18:09:55');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('90','Employee gMn0vQ','IUs75XS6@example.com','992.00',NULL,'1','1','2026-01-28 18:09:55','2026-01-28 18:09:55');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('91','Employee SYUcRz','CKGCuKAY@example.com','1949.00',NULL,'1','1','2026-01-28 18:09:55','2026-01-28 18:09:55');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('92','Employee MlPBeJ','IPMlWaSW@example.com','1994.00',NULL,'1','1','2026-01-28 18:09:55','2026-01-28 18:09:55');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('93','Employee 3SgSNN','tST1z8Ds@example.com','4296.00',NULL,'1','1','2026-01-28 18:09:55','2026-01-28 18:09:55');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('94','Employee eEZcuU','uCmPhpFY@example.com','3144.00',NULL,'1','1','2026-01-28 18:09:55','2026-01-28 18:09:55');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('95','Employee VYjolF','2XT6DHzt@example.com','832.00',NULL,'1','1','2026-01-28 18:09:55','2026-01-28 18:09:55');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('96','Employee PQYQQ6','V26Oatb5@example.com','2841.00',NULL,'1','1','2026-01-28 18:09:55','2026-01-28 18:09:55');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('97','Employee D17ytI','K3O3tdW7@example.com','1491.00',NULL,'1','1','2026-01-28 18:09:55','2026-01-28 18:09:55');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('98','Employee RMBM1H','Y6i77rao@example.com','1672.00',NULL,'1','1','2026-01-28 18:09:55','2026-01-28 18:09:55');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('99','Employee QDXznG','fLb7YzpV@example.com','792.00',NULL,'1','1','2026-01-28 18:09:55','2026-01-28 18:09:55');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('100','Employee HKoW4o','prE5IZFu@example.com','3204.00',NULL,'1','1','2026-01-28 18:09:55','2026-01-28 18:09:55');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('101','Employee BUbvdn','VsJdHkSi@example.com','3585.00',NULL,'1','1','2026-01-28 18:09:55','2026-01-28 18:09:55');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('102','Employee NwInCy','M5pXz2P9@example.com','671.00',NULL,'1','1','2026-01-28 18:09:55','2026-01-28 18:09:55');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('103','Employee TCbhm2','mSJhoKXz@example.com','4848.00',NULL,'1','1','2026-01-28 18:09:55','2026-01-28 18:09:55');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('104','Employee afstqe','30nSVIjx@example.com','4959.00',NULL,'1','1','2026-01-28 18:09:55','2026-01-28 18:09:55');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('105','Employee ElFBNh','nqmNxXLr@example.com','528.00',NULL,'1','1','2026-01-28 18:09:55','2026-01-28 18:09:55');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('106','Employee YaK0gB','4H7mlB6z@example.com','1964.00',NULL,'1','1','2026-01-28 18:09:55','2026-01-28 18:09:55');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('107','Employee zuMU8D','rxLeU1BQ@example.com','4554.00',NULL,'1','1','2026-01-28 18:09:55','2026-01-28 18:09:55');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('108','Employee 01SuCZ','dCkbcVvI@example.com','2064.00',NULL,'1','1','2026-01-28 18:09:55','2026-01-28 18:09:55');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('109','Employee wyX8q3','kshNNZu1@example.com','770.00',NULL,'1','1','2026-01-28 18:09:55','2026-01-28 18:09:55');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('110','Employee 38kHiM','cz2DBOo8@example.com','4493.00',NULL,'1','1','2026-01-28 18:09:55','2026-01-28 18:09:55');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('111','Employee ar257d','4Zh9OD11@example.com','2087.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('112','Employee vpeaoQ','YO8uBI20@example.com','981.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('113','Employee 6mYBYo','b840C7wE@example.com','3648.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('114','Employee mkLcWH','cIsQ0RRN@example.com','1335.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('115','Employee K9eLFT','SrDdY5h4@example.com','2859.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('116','Employee DdWzJP','h0iUqTfZ@example.com','1050.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('117','Employee Mjzp3z','HTU0mvlf@example.com','610.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('118','Employee UYanTm','C7N82FJs@example.com','4154.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('119','Employee 9ceFRX','ghNojzH0@example.com','2206.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('120','Employee UBWuda','zw1FURTy@example.com','533.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('121','Employee pB4esN','lbiI1RnG@example.com','4680.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('122','Employee npGQnu','qpKFr20U@example.com','4656.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('123','Employee 4iuV0C','l4p4tw18@example.com','3605.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('124','Employee ZAAtBW','23vSzG3w@example.com','3259.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('125','Employee cWq3gK','zPw6IInY@example.com','2965.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('126','Employee 2jJPpo','d9WUkif5@example.com','4697.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('127','Employee eEFgvS','VP3B09he@example.com','3637.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('128','Employee IA0V71','9ae9QcB7@example.com','1355.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('129','Employee nwqk9T','7fzHdeFj@example.com','4662.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('130','Employee sWkC9f','7bQRGx86@example.com','1017.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('131','Employee FPiCX8','rwrDEhoY@example.com','2239.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('132','Employee 0D8OM2','ZaxQSz9U@example.com','1616.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('133','Employee 897CsK','weGqvfvr@example.com','692.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('134','Employee HEjTnG','04INVBhN@example.com','1585.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('135','Employee 3cBROF','37EmT28c@example.com','1490.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('136','Employee Meqoiy','ibwDib9v@example.com','1312.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('137','Employee 3hyCeV','zrKTblV8@example.com','4643.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('138','Employee f0d3KK','1sBjWWqS@example.com','529.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('139','Employee bGfRyG','mmPj3Otg@example.com','3378.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('140','Employee djMYkR','UO34O8M2@example.com','2384.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('141','Employee 7h4M08','VKzql2sf@example.com','4226.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('142','Employee Xcac8v','YQwLE9Pj@example.com','3581.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('143','Employee 6VjbyD','kDfSCnCp@example.com','3190.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('144','Employee nvrnrD','7at3irNk@example.com','3432.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('145','Employee bbYKcs','afDJ9cCJ@example.com','1088.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('146','Employee Lud9Be','Hq7jYacb@example.com','1613.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('147','Employee H9pdYj','KDSj3odA@example.com','4153.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('148','Employee 9vaL3S','qK5O9I2r@example.com','1402.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('149','Employee WdJbEu','6uqULF7H@example.com','2344.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('150','Employee Mj3Klm','zcrqB2CM@example.com','1775.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('151','Employee kltKUe','iMBDN4sU@example.com','649.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('152','Employee GgQhKj','yLFN8qKF@example.com','1319.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('153','Employee eoDIzA','BpM4qaWV@example.com','3478.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('154','Employee PTG5lA','IjmTjyik@example.com','4164.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('155','Employee OKFwbr','0CeYlMSX@example.com','4700.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('156','Employee LigllN','Aydkyreg@example.com','1266.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('157','Employee 1WSZ0T','KTXvtKSq@example.com','3999.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('158','Employee ebJSR1','hKGb6CFV@example.com','4986.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('159','Employee mUKkOk','zP0hWwIB@example.com','1060.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('160','Employee 7HPfla','h0Q2i2m1@example.com','4053.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('161','Employee aihGUj','DjTJRWHq@example.com','907.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('162','Employee R38fEs','J98L9UQI@example.com','4030.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('163','Employee 09Zs1g','ot1ydmir@example.com','1973.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('164','Employee VpCuba','XKNQOzPS@example.com','3723.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('165','Employee 9gPwKi','G66qjRMg@example.com','2134.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('166','Employee pW8yuF','2ehUReS4@example.com','3915.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('167','Employee FF0wJW','vrTOHDS4@example.com','2681.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('168','Employee 8Z0vHW','MZPXO8Nk@example.com','2035.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('169','Employee 46Jigw','N9i7wVcR@example.com','4967.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('170','Employee ps8AOb','6zNNceLw@example.com','1926.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('171','Employee i65Jxs','olAd0V8O@example.com','3822.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('172','Employee 9rDBfC','5fgHtlmP@example.com','4258.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('173','Employee hBOoGv','47YWGFuy@example.com','3532.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('174','Employee cVaHQ3','vpLDdmsV@example.com','3356.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('175','Employee p2JJ7I','EpSFieqS@example.com','694.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('176','Employee EnN4ip','vTf2pOEU@example.com','4229.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('177','Employee wytyeN','qBzDM67W@example.com','1583.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('178','Employee EJ3LZg','GQpIs3VR@example.com','1817.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('179','Employee Gi897E','Cowh6WK8@example.com','3104.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('180','Employee qAnQtA','WAOLuHkF@example.com','528.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('181','Employee Yyqjd2','6aPjZpdO@example.com','1030.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('182','Employee OHApAM','GSdIAzqF@example.com','691.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('183','Employee sr1tNX','39MOIkWO@example.com','4400.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('184','Employee vJMlip','KFnBUdJc@example.com','1032.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('185','Employee KGDS1y','PBrKvmsI@example.com','3292.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('186','Employee MrAhmm','Prko1GV7@example.com','990.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('187','Employee 8LXRj0','yMlpj1DY@example.com','2294.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('188','Employee eEcxth','E80twRc0@example.com','548.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('189','Employee V4Lxnu','XDsoFY3Z@example.com','3838.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('190','Employee vRILDq','wJFyp19C@example.com','4948.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('191','Employee NJg8GN','hCn58Wpr@example.com','1746.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('192','Employee 8XFwtH','DiZ5rQHF@example.com','2810.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('193','Employee jmAJ8U','xNW9k3dE@example.com','4935.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('194','Employee CixzNe','QMBMeFMu@example.com','3083.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('195','Employee WynQVh','MIqpfHcc@example.com','514.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('196','Employee 6XKY9k','mfZpbSQv@example.com','1545.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('197','Employee Un11EL','leL0BYSi@example.com','1457.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('198','Employee AiVeHn','ViGYyAdt@example.com','3941.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('199','Employee D7SWgl','Vx7sIf4h@example.com','3113.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('200','Employee bfOm28','x4NewCBz@example.com','2250.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('201','Employee o2FUMA','IvDhr0iQ@example.com','2853.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('202','Employee 1FH3cB','UJK17s8o@example.com','1370.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('203','Employee 7zGfOc','gcD6TDFg@example.com','3353.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('204','Employee AxIxvk','KUQm4THc@example.com','2271.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('205','Employee 8ks66i','no19nKZC@example.com','2154.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('206','Employee 4F1Rb4','fDjJOaLq@example.com','1109.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('207','Employee 4o1IUm','fFxBuH7q@example.com','2264.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('208','Employee nQevhe','sO7Cpm1O@example.com','519.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('209','Employee IRrjRr','swwecpWi@example.com','2544.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('210','Employee UxD5EO','UxiBWa7x@example.com','4025.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('211','Employee qmopW6','YLXD8a8g@example.com','777.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('212','Employee dIAKYA','X5lTmpPM@example.com','1988.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('213','Employee mpKXK8','gIu2vIF8@example.com','3105.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('214','Employee WSFFkM','R6DlQVuV@example.com','1081.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('215','Employee VocvkD','NXzTlvBT@example.com','3988.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('216','Employee vkyUDY','xTnA3PeY@example.com','2931.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('217','Employee aimLsJ','TmW0AEC2@example.com','4206.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('218','Employee DNHv1V','SUDuQ20X@example.com','2448.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('219','Employee YnDHUg','Wj1NtoD0@example.com','2395.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('220','Employee Ue5L1B','8a1K5kq4@example.com','4864.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('221','Employee 5dO2ci','v27DkeI5@example.com','3037.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('222','Employee hqAEVa','mRVzn597@example.com','3703.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('223','Employee w5TqwG','NxVtoThA@example.com','1375.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('224','Employee 7iKl0v','MpeHI4C0@example.com','3527.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('225','Employee oCxNSq','US1CoceF@example.com','2370.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('226','Employee jbeFMJ','Rmo4jbKW@example.com','770.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('227','Employee pkJIuV','VnpPIIxS@example.com','2824.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('228','Employee 9qi60m','srw4vajr@example.com','3209.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('229','Employee mXm8Ae','Px1eeGVr@example.com','4044.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('230','Employee Xe6wxd','zRuiR0yC@example.com','2970.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('231','Employee V37rJw','B7zQcfaq@example.com','4287.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('232','Employee a0q5eE','REnOBSfl@example.com','1929.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('233','Employee BPIBu2','itpGMILo@example.com','3267.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('234','Employee 8xS0PY','RfbG5JIb@example.com','2755.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('235','Employee krql7O','BwUTFClr@example.com','1952.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('236','Employee ZbpwK1','5T2McrGH@example.com','2858.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('237','Employee 0wJCr5','jYf7vt6D@example.com','2875.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('238','Employee OJVOvF','NCvTercq@example.com','3299.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('239','Employee azVLvf','VeaQrdkz@example.com','3124.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('240','Employee jpjOu8','WbQD9zCe@example.com','4566.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('241','Employee yRrlcJ','HOES9ByU@example.com','2642.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('242','Employee 377Cjz','Xru0Gla0@example.com','1308.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('243','Employee 2HRU8n','IUTxEaQ7@example.com','1036.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('244','Employee robi13','wWnlxycR@example.com','865.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('245','Employee jluG3P','HkonS3tC@example.com','3091.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('246','Employee e9PTFU','s1QCWETz@example.com','2761.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('247','Employee 1MYqV8','DQpWBnuU@example.com','2044.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('248','Employee igoimS','oTJhsFWO@example.com','2020.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('249','Employee GZrXAz','YkfdjjQR@example.com','649.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('250','Employee YoYbt6','a2KTDaVw@example.com','4135.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('251','Employee FzD4od','X4FHzZ1e@example.com','4661.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('252','Employee 4fbMXc','vrg3OxJS@example.com','4530.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('253','Employee 2WqRJV','h2VeWpwC@example.com','4969.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('254','Employee JLjwVD','CjCpLozn@example.com','4003.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('255','Employee 1NY2qO','KWzo3jQI@example.com','1498.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('256','Employee 17ZMld','oD9klYax@example.com','2210.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('257','Employee NQnnX0','cfbMioFI@example.com','2493.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('258','Employee ZhTEII','LVCanoVl@example.com','2229.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('259','Employee Uaap0M','fbksnurl@example.com','3150.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('260','Employee zn1r9v','8BcEktRi@example.com','501.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('261','Employee hf6PXb','UKhrIg5H@example.com','2898.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('262','Employee OvzWbV','W9uWWo9I@example.com','1541.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('263','Employee cMasf8','lFmV6KB8@example.com','4278.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('264','Employee YJURsU','aaYpyVq9@example.com','1513.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('265','Employee mdsvky','j6KPctT8@example.com','2759.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('266','Employee 00OP0p','UQkRb7Fx@example.com','3006.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('267','Employee 5D8CNT','MtUMMcVw@example.com','4750.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('268','Employee Fo8K5z','bU4uUwuz@example.com','1560.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('269','Employee UYCxbc','OLYj0QTQ@example.com','4581.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('270','Employee cHZCYA','qW5wmcO9@example.com','2599.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('271','Employee up7lWu','buXcocQ5@example.com','4300.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('272','Employee 10bhgu','7ZUvGUPX@example.com','785.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('273','Employee GzscBl','hxgSLHfS@example.com','2814.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('274','Employee qQDPtv','gpvtQaA8@example.com','3605.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('275','Employee CpFQNp','vvRCE2Th@example.com','3974.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('276','Employee KzCqOY','1q4BRXUh@example.com','3731.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('277','Employee 8KnVtv','JwZ9eTsY@example.com','4972.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('278','Employee zYY9Y7','z0ECOgTP@example.com','567.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('279','Employee QMtsaS','rThtNpVB@example.com','3279.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('280','Employee Vm4aCb','y2Lwwa4A@example.com','3064.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('281','Employee 1KZu5t','KcDBEEjD@example.com','1987.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('282','Employee 4WWcZ7','VOGZoMuu@example.com','534.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('283','Employee r2uHno','3ZiH1MKU@example.com','2015.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('284','Employee 4pEjMf','ChYRrkLm@example.com','4879.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('285','Employee H42bD8','hBykayAe@example.com','4926.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('286','Employee eEA5sI','potRNltT@example.com','1846.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('287','Employee OHLOtN','u6JZbEh4@example.com','3003.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('288','Employee ZVBbqt','o4vKKTaQ@example.com','4109.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('289','Employee 3Sfjcd','GELwMsl5@example.com','1945.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('290','Employee TGFy3t','CmzXWaZ3@example.com','505.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('291','Employee R5a1Ip','F3sJHE0k@example.com','1773.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('292','Employee 4Q7Td8','kFWzmjGb@example.com','4026.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('293','Employee FSLH5K','Qfvb77MS@example.com','4928.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('294','Employee eiUJvu','ACED69fd@example.com','4527.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('295','Employee MAyHsv','PyRyHZ4o@example.com','1054.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('296','Employee ei4Cmr','iYMYJkdM@example.com','4918.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('297','Employee hBbLAd','rpLCGfth@example.com','2638.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('298','Employee 3iHVwp','yuqTWEYo@example.com','3030.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('299','Employee XQGij2','RqYVrAFb@example.com','1457.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('300','Employee Tykb8q','xqPhbNbv@example.com','4352.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('301','Employee QKghuE','72BCCDjp@example.com','3449.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('302','Employee IM8Y2z','F7Q5OS7c@example.com','1628.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('303','Employee rCwSGb','1PU4hCss@example.com','3691.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('304','Employee yfZbxx','LtA85nlE@example.com','3096.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('305','Employee vKcteO','VpPrWUxU@example.com','1479.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('306','Employee CXdSec','PHygWf6I@example.com','834.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('307','Employee awpoVB','SjVJcf4h@example.com','4391.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('308','Employee 3HtLHD','pRnlnBq4@example.com','2160.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('309','Employee 11Aogp','EHmuWys0@example.com','4486.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');
INSERT INTO `employees` (`id`,`name`,`email`,`salary`,`last_salary_change_at`,`position_id`,`manager_id`,`created_at`,`updated_at`) VALUES ('310','Employee Qj9O9O','uaRo0Xh7@example.com','1828.00',NULL,'1','1','2026-01-28 18:10:03','2026-01-28 18:10:03');

DROP TABLE IF EXISTS `failed_jobs`;
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


DROP TABLE IF EXISTS `job_batches`;
CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `migrations` (`id`,`migration`,`batch`) VALUES ('1','0001_01_01_000000_create_users_table','1');
INSERT INTO `migrations` (`id`,`migration`,`batch`) VALUES ('2','0001_01_01_000001_create_cache_table','1');
INSERT INTO `migrations` (`id`,`migration`,`batch`) VALUES ('3','0001_01_01_000002_create_jobs_table','1');
INSERT INTO `migrations` (`id`,`migration`,`batch`) VALUES ('4','2026_01_27_170656_create_personal_access_tokens_table','1');
INSERT INTO `migrations` (`id`,`migration`,`batch`) VALUES ('5','2026_01_27_233523_create_positions_table','1');
INSERT INTO `migrations` (`id`,`migration`,`batch`) VALUES ('6','2026_01_27_233541_create_employees_table','1');
INSERT INTO `migrations` (`id`,`migration`,`batch`) VALUES ('7','2026_01_27_233559_create_employee_logs_table','1');
INSERT INTO `migrations` (`id`,`migration`,`batch`) VALUES ('8','2026_01_28_164709_create_employee_logs_table','2');

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  KEY `personal_access_tokens_expires_at_index` (`expires_at`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `personal_access_tokens` (`id`,`tokenable_type`,`tokenable_id`,`name`,`token`,`abilities`,`last_used_at`,`expires_at`,`created_at`,`updated_at`) VALUES ('1','App\Models\User','1','auth_token','aea513ad491bf7cc51635e237a65c97e4a45852a3961bf64737d2dc131645494','["*"]',NULL,NULL,'2026-01-28 12:14:11','2026-01-28 12:14:11');
INSERT INTO `personal_access_tokens` (`id`,`tokenable_type`,`tokenable_id`,`name`,`token`,`abilities`,`last_used_at`,`expires_at`,`created_at`,`updated_at`) VALUES ('2','App\Models\User','1','auth_token','f6a724c8150003ae3167faf09a38a77b78fdba424105a933ed8cccac60956b84','["*"]',NULL,NULL,'2026-01-28 12:14:23','2026-01-28 12:14:23');

DROP TABLE IF EXISTS `positions`;
CREATE TABLE `positions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `positions_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `positions` (`id`,`name`,`created_at`,`updated_at`) VALUES ('1','Founder',NULL,'2026-01-28 16:29:46');
INSERT INTO `positions` (`id`,`name`,`created_at`,`updated_at`) VALUES ('2','Backend Developer',NULL,NULL);
INSERT INTO `positions` (`id`,`name`,`created_at`,`updated_at`) VALUES ('3','Developer','2026-01-28 13:25:25','2026-01-28 13:25:25');
INSERT INTO `positions` (`id`,`name`,`created_at`,`updated_at`) VALUES ('4','Team Lead','2026-01-28 13:25:25','2026-01-28 13:25:25');
INSERT INTO `positions` (`id`,`name`,`created_at`,`updated_at`) VALUES ('5','Front End Developer','2026-01-28 13:34:35','2026-01-28 13:34:35');

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `users` (`id`,`name`,`email`,`email_verified_at`,`password`,`remember_token`,`created_at`,`updated_at`) VALUES ('1','Mohammad Tarabishy','admin@test.com',NULL,'$2y$12$wemSiUlLlsTgC2NpcwHk9.QSnj5HCX7qvwbXRua6mEX1dMCMobS1e',NULL,'2026-01-28 12:14:11','2026-01-28 12:14:11');

