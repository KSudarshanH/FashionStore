-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: fashion_store
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `cart_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`cart_id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `fk_cart_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1,1,'2026-08-17 11:51:49','2026-08-17 11:51:49'),(2,2,'2026-08-17 11:51:49','2026-08-17 11:51:49'),(3,3,'2026-08-17 11:51:49','2026-08-17 11:51:49'),(4,4,'2026-08-17 11:51:49','2026-08-17 11:51:49'),(5,5,'2026-08-23 07:50:32','2026-08-23 07:50:32'),(6,6,'2026-09-03 13:51:39','2026-09-03 13:51:39'),(7,7,'2026-11-01 11:29:46','2026-11-01 11:29:46'),(8,8,'2026-11-01 11:30:52','2026-11-01 11:30:52'),(9,9,'2026-11-01 11:33:01','2026-11-01 11:33:01'),(10,10,'2026-11-01 11:43:22','2026-11-01 11:43:22'),(11,11,'2026-11-01 12:47:25','2026-11-01 12:47:25'),(12,12,'2026-11-01 12:57:26','2026-11-01 12:57:26');
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_items`
--

DROP TABLE IF EXISTS `cart_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_items` (
  `cart_item_id` int NOT NULL AUTO_INCREMENT,
  `cart_id` int NOT NULL,
  `variant_id` int NOT NULL,
  `quantity` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`cart_item_id`),
  UNIQUE KEY `unique_cart_variant` (`cart_id`,`variant_id`),
  KEY `fk_cart_items_variant` (`variant_id`),
  CONSTRAINT `fk_cart_items_cart` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`cart_id`),
  CONSTRAINT `fk_cart_items_variant` FOREIGN KEY (`variant_id`) REFERENCES `product_variants` (`variant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_items`
--

LOCK TABLES `cart_items` WRITE;
/*!40000 ALTER TABLE `cart_items` DISABLE KEYS */;
INSERT INTO `cart_items` VALUES (3,2,18,1),(4,2,46,1),(5,3,23,1),(6,4,51,2),(25,1,2,4);
/*!40000 ALTER TABLE `cart_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `category_name` (`category_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Men','Fashion products for men'),(2,'Women','Fashion products for women'),(3,'Kids','Fashion products for kids'),(4,'Footwear','Shoes and other footwear'),(5,'Accessories','Fashion accessories');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `order_item_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `variant_id` int NOT NULL,
  `quantity` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`order_item_id`),
  KEY `fk_order_items_order` (`order_id`),
  KEY `fk_order_items_variant` (`variant_id`),
  CONSTRAINT `fk_order_items_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `fk_order_items_variant` FOREIGN KEY (`variant_id`) REFERENCES `product_variants` (`variant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,1,2,1,699.00),(2,1,10,1,1799.00),(3,1,16,1,499.00),(4,2,46,1,1999.00),(5,3,6,1,1199.00),(6,3,14,1,2299.00),(7,4,22,1,1599.00),(8,5,60,1,499.00),(9,5,23,1,1599.00),(10,5,46,1,1999.00),(11,5,5,1,1199.00),(12,5,10,1,1799.00),(13,5,2,2,699.00),(14,6,5,1,1199.00),(15,7,4,1,699.00),(16,7,21,1,1599.00),(17,8,59,1,899.00),(18,8,18,1,799.00),(19,8,1,1,699.00),(20,9,14,1,2499.00),(21,10,15,1,2499.00),(22,10,47,1,1999.00),(23,11,40,1,899.00),(24,11,6,1,1199.00),(25,12,4,1,699.00),(26,13,7,1,1199.00),(27,14,1,1,699.00),(28,14,46,1,1999.00),(29,15,2,3,699.00),(30,16,2,3,699.00),(31,17,2,3,699.00),(32,18,2,3,699.00),(33,19,2,3,699.00),(34,20,2,3,699.00);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `order_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `total_amount` decimal(10,2) NOT NULL,
  `order_status` varchar(30) NOT NULL DEFAULT 'PENDING',
  `payment_method` varchar(30) NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `fk_orders_user` (`user_id`),
  CONSTRAINT `fk_orders_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,'2026-08-17 11:51:49',2997.00,'DELIVERED','COD'),(2,1,'2026-08-17 11:51:49',1999.00,'SHIPPED','ONLINE'),(3,2,'2026-08-17 11:51:49',3498.00,'PROCESSING','ONLINE'),(4,3,'2026-08-17 11:51:49',1599.00,'PENDING','COD'),(5,1,'2026-08-22 15:17:20',8493.00,'PENDING','ONLINE'),(6,1,'2026-08-22 15:36:48',1199.00,'PENDING','COD'),(7,1,'2026-08-23 06:15:18',2298.00,'PENDING','COD'),(8,1,'2026-08-23 06:22:20',2397.00,'PENDING','ONLINE'),(9,1,'2026-08-23 06:29:24',2499.00,'PENDING','COD'),(10,5,'2026-08-23 08:00:28',4498.00,'PENDING','COD'),(11,5,'2026-09-02 17:53:59',2098.00,'PENDING','COD'),(12,5,'2026-09-02 18:00:11',699.00,'PENDING','COD'),(13,5,'2026-09-02 18:05:04',1199.00,'PENDING','COD'),(14,6,'2026-11-01 09:57:34',2698.00,'PENDING','COD'),(15,7,'2026-11-01 11:29:47',2097.00,'PENDING','COD'),(16,8,'2026-11-01 11:30:53',2097.00,'PENDING','COD'),(17,9,'2026-11-01 11:33:01',2097.00,'PENDING','COD'),(18,10,'2026-11-01 11:43:22',2097.00,'PENDING','COD'),(19,11,'2026-11-01 12:47:25',2097.00,'PENDING','COD'),(20,12,'2026-11-01 12:57:26',2097.00,'PENDING','COD');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_variants`
--

DROP TABLE IF EXISTS `product_variants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_variants` (
  `variant_id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `size` varchar(20) NOT NULL,
  `stock` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`variant_id`),
  UNIQUE KEY `unique_product_size` (`product_id`,`size`),
  CONSTRAINT `fk_variants_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_variants`
--

LOCK TABLES `product_variants` WRITE;
/*!40000 ALTER TABLE `product_variants` DISABLE KEYS */;
INSERT INTO `product_variants` VALUES (1,1,'S',15),(2,1,'M',2),(3,1,'L',18),(4,1,'XL',10),(5,2,'S',8),(6,2,'M',15),(7,2,'L',12),(8,2,'XL',6),(9,3,'30',8),(10,3,'32',15),(11,3,'34',12),(12,3,'36',7),(13,4,'S',5),(14,4,'M',10),(15,4,'L',8),(16,4,'XL',4),(17,5,'S',12),(18,5,'M',18),(19,5,'L',14),(20,5,'XL',7),(21,6,'S',8),(22,6,'M',12),(23,6,'L',10),(24,6,'XL',5),(25,7,'28',6),(26,7,'30',12),(27,7,'32',10),(28,7,'34',5),(29,8,'S',5),(30,8,'M',10),(31,8,'L',8),(32,8,'XL',4),(33,9,'XS',10),(34,9,'S',15),(35,9,'M',12),(36,9,'L',8),(37,10,'XS',6),(38,10,'S',10),(39,10,'M',8),(40,10,'L',5),(41,11,'XS',8),(42,11,'S',12),(43,11,'M',10),(44,11,'L',6),(45,12,'7',8),(46,12,'8',12),(47,12,'9',15),(48,12,'10',10),(49,12,'11',5),(50,13,'7',6),(51,13,'8',10),(52,13,'9',12),(53,13,'10',8),(54,13,'11',4),(55,14,'5',8),(56,14,'6',12),(57,14,'7',10),(58,14,'8',6),(59,15,'Free Size',25),(60,16,'Free Size',30);
/*!40000 ALTER TABLE `product_variants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `category_id` int NOT NULL,
  `product_name` varchar(150) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `color` varchar(50) NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`product_id`),
  KEY `fk_products_category` (`category_id`),
  CONSTRAINT `fk_products_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,1,'Classic Cotton T-Shirt','Comfortable regular fit cotton T-shirt for everyday wear',699.00,'Black','images/black-cotton-tshirt.jpg','2026-08-17 11:51:49'),(2,1,'Slim Fit Casual Shirt','Stylish slim fit casual shirt made from premium cotton',1199.00,'Blue','images/blue-casual-shirt.jpg','2026-08-17 11:51:49'),(3,1,'Regular Fit Jeans','Classic regular fit denim jeans for casual occasions',1799.00,'Dark Blue','images/dark-blue-jeans.jpg','2026-08-17 11:51:49'),(4,1,'Casual Bomber Jacket','Modern bomber jacket suitable for casual and outdoor wear',2499.00,'Black','images/black-bomber-jacket.jpg','2026-08-17 11:51:49'),(5,2,'Women Cotton Top','Comfortable and stylish cotton top for everyday wear',799.00,'White','images/white-women-top.jpg','2026-08-17 11:51:49'),(6,2,'Floral Summer Dress','Lightweight floral dress perfect for summer occasions',1599.00,'Pink','images/pink-floral-dress.jpg','2026-08-17 11:51:49'),(7,2,'High Waist Jeans','Trendy high waist denim jeans with comfortable fit',1899.00,'Light Blue','images/light-blue-women-jeans.jpg','2026-08-17 11:51:49'),(8,2,'Women Casual Jacket','Stylish casual jacket for everyday fashion',2299.00,'Beige','images/beige-women-jacket.jpg','2026-08-17 11:51:49'),(9,3,'Kids Printed T-Shirt','Comfortable printed cotton T-shirt for kids',499.00,'Yellow','images/yellow-kids-tshirt.jpg','2026-08-17 11:51:49'),(10,3,'Kids Denim Jeans','Comfortable denim jeans designed for kids',899.00,'Blue','images/blue-kids-jeans.jpg','2026-08-17 11:51:49'),(11,3,'Kids Casual Dress','Colorful casual dress suitable for everyday wear',999.00,'Red','images/red-kids-dress.jpg','2026-08-17 11:51:49'),(12,4,'Classic Running Shoes','Lightweight running shoes with comfortable cushioning',1999.00,'White','images/white-running-shoes.jpg','2026-08-17 11:51:49'),(13,4,'Casual Sneakers','Trendy casual sneakers suitable for everyday use',2299.00,'Black','images/black-casual-sneakers.jpg','2026-08-17 11:51:49'),(14,4,'Women Casual Flats','Comfortable and stylish flats for everyday use',1299.00,'Beige','images/beige-women-flats.jpg','2026-08-17 11:51:49'),(15,5,'Leather Wallet','Compact genuine leather wallet with multiple card slots',899.00,'Brown','images/brown-leather-wallet.jpg','2026-08-17 11:51:49'),(16,5,'Classic Baseball Cap','Adjustable casual baseball cap',499.00,'Black','images/black-baseball-cap.jpg','2026-08-17 11:51:49');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `password` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `pincode` varchar(10) NOT NULL,
  `country` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'K Sudarshan Hebbar','sudarshan@gmail.com','9876543210','password123','Jalahalli Cross','Udupi','Karnataka','576101','India','2026-08-17 11:51:49'),(2,'Rahul Sharma','rahul@gmail.com','9876543211','password123','45 Brigade Road','Bengaluru','Karnataka','560001','India','2026-08-17 11:51:49'),(3,'Ananya Rao','ananya@gmail.com','9876543212','password123','21 Park Street','Mysuru','Karnataka','570001','India','2026-08-17 11:51:49'),(4,'Priya Shetty','priya@gmail.com','9876543213','password123','18 Main Road','Mangaluru','Karnataka','575001','India','2026-08-17 11:51:49'),(5,'K Sudarshan Hebbar','ksudarshan@gmail.com','9876543201','sudarshan123','Ramachandrapura, Jalahalli','Bengaluru','Karnataka','560013','India','2026-08-23 07:49:14'),(6,'Raja','raj123@gmail.com','1236547809','raja@123','Jalahalli Cross','Bengaluru','Karnataka','530001','India','2026-09-03 13:02:11'),(7,'QA Master 1793532586','qa_1793532586@fashionstore.test','9998887777','password123','Apple Park 1, Cupertino','Pune','Maharashtra','411001','India','2026-11-01 11:29:46'),(8,'QA Tester 1793532652','qa_1793532652@fashionstore.test','9893532652','password123','42 Infinite Loop, Bandra West','Mumbai','Maharashtra','400050','India','2026-11-01 11:30:52'),(9,'QA Master 1793532780','qa_1793532780@fashionstore.test','9793532780','password123','Apple Park 1, Cupertino','Pune','Maharashtra','411001','India','2026-11-01 11:33:00'),(10,'QA Master 1793533401','qa_1793533401@fashionstore.test','9793533401','password123','Apple Park 1, Cupertino','Pune','Maharashtra','411001','India','2026-11-01 11:43:21'),(11,'QA Master 1793537244','qa_1793537244@fashionstore.test','9793537244','password123','Apple Park 1, Cupertino','Pune','Maharashtra','411001','India','2026-11-01 12:47:24'),(12,'QA Master 1793537845','qa_1793537845@fashionstore.test','9793537845','password123','Apple Park 1, Cupertino','Pune','Maharashtra','411001','India','2026-11-01 12:57:26');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-01 18:59:59
