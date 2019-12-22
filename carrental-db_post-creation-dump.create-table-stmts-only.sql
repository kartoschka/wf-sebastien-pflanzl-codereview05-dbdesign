CREATE TABLE `car_model` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `maker` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `car_object` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `color` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `condition_desc` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `model_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `location_id` (`location_id`),
  KEY `model_id` (`model_id`),
  CONSTRAINT `car_object_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `shop` (`id`),
  CONSTRAINT `car_object_ibfk_2` FOREIGN KEY (`model_id`) REFERENCES `car_model` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `check_in` (
  `id` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `passport_number` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `licence_number` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_id` (`employee_id`),
  CONSTRAINT `check_in_ibfk_1` FOREIGN KEY (`id`) REFERENCES `reservation` (`id`),
  CONSTRAINT `check_in_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `check_out` (
  `id` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_id` (`shop_id`),
  KEY `employee_id` (`employee_id`),
  CONSTRAINT `check_out_ibfk_1` FOREIGN KEY (`id`) REFERENCES `check_in` (`id`),
  CONSTRAINT `check_out_ibfk_2` FOREIGN KEY (`shop_id`) REFERENCES `shop` (`id`),
  CONSTRAINT `check_out_ibfk_3` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telephone` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `street` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `town` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postal_code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shop_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_id` (`shop_id`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`shop_id`) REFERENCES `shop` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `issue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fee` decimal(10,2) DEFAULT NULL,
  `state` enum('contested','agreed','paid','retracted') COLLATE utf8mb4_unicode_ci NOT NULL,
  `check_out_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `check_out_id` (`check_out_id`),
  CONSTRAINT `issue_ibfk_1` FOREIGN KEY (`check_out_id`) REFERENCES `check_out` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `reservation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `flexible_return` tinyint(1) DEFAULT 0,
  `customer_id` int(11) DEFAULT NULL,
  `object_id` int(11) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  KEY `object_id` (`object_id`),
  KEY `shop_id` (`shop_id`),
  CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `reservation_ibfk_4` FOREIGN KEY (`object_id`) REFERENCES `car_object` (`id`),
  CONSTRAINT `reservation_ibfk_5` FOREIGN KEY (`shop_id`) REFERENCES `shop` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `shop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `street` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `web_user` (
  `name` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dummy_password` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `customer_id` (`customer_id`),
  CONSTRAINT `web_user_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
