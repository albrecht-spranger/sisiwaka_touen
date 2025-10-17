-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: sisiwaka_touen
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `artwork_media`
--

DROP TABLE IF EXISTS `artwork_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `artwork_media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `artwork_id` int(11) NOT NULL,
  `kind` enum('image','video') NOT NULL,
  `image_url` varchar(500) NOT NULL,
  `video_url` varchar(500) DEFAULT NULL,
  `alt_ja` varchar(255) DEFAULT NULL,
  `alt_en` varchar(255) DEFAULT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `valid` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `fk_artwork_media_artwork` (`artwork_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2993 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artwork_media`
--

LOCK TABLES `artwork_media` WRITE;
/*!40000 ALTER TABLE `artwork_media` DISABLE KEYS */;
INSERT INTO `artwork_media` VALUES (2743,1,'image','https://storage.googleapis.com/sisiwaka-touen-medias/001/001_01%E6%89%8B%E6%8C%81%E3%81%A1.jpg',NULL,NULL,NULL,1,1),(2744,1,'image','https://storage.googleapis.com/sisiwaka-touen-medias/001/001_02%E5%8F%B3.jpg',NULL,NULL,NULL,1,1),(2745,1,'image','https://storage.googleapis.com/sisiwaka-touen-medias/001/001_03%E6%AD%A3%E9%9D%A2.jpg',NULL,NULL,NULL,1,1),(2746,1,'image','https://storage.googleapis.com/sisiwaka-touen-medias/001/001_04%E5%B7%A6.jpg',NULL,NULL,NULL,1,1),(2747,1,'image','https://storage.googleapis.com/sisiwaka-touen-medias/001/001_05%E5%8F%96%E3%81%A3%E6%89%8B.jpg',NULL,NULL,NULL,1,1),(2748,1,'image','https://storage.googleapis.com/sisiwaka-touen-medias/001/001_06%E8%A6%8B%E8%BE%BC%E3%81%BF.jpg',NULL,NULL,NULL,1,1),(2749,1,'image','https://storage.googleapis.com/sisiwaka-touen-medias/001/001_07%E8%A3%8F.jpg',NULL,NULL,NULL,1,1),(2750,1,'image','https://storage.googleapis.com/sisiwaka-touen-medias/001/001_08%E5%A4%96%E5%81%B4%E6%8B%A1%E5%A4%A7.jpg',NULL,NULL,NULL,1,1),(2751,1,'image','https://storage.googleapis.com/sisiwaka-touen-medias/001/001_09%E5%86%85%E5%81%B4%E6%8B%A1%E5%A4%A7.jpg',NULL,NULL,NULL,1,1),(2752,1,'image','https://storage.googleapis.com/sisiwaka-touen-medias/001/001_10%E9%AB%98%E5%8F%B0%E6%8B%A1%E5%A4%A7.jpg',NULL,NULL,NULL,1,1),(2753,1,'video','https://storage.googleapis.com/sisiwaka-touen-medias/001/001_%E9%BB%92%E4%BA%80.jpg','https://storage.googleapis.com/sisiwaka-touen-medias/001/001_%E9%BB%92%E4%BA%80.mp4',NULL,NULL,1,1),(2754,30,'image','https://storage.googleapis.com/sisiwaka-touen-medias/030/030_01%E6%AD%A3%E9%9D%A21.jpg',NULL,NULL,NULL,30,1),(2755,30,'image','https://storage.googleapis.com/sisiwaka-touen-medias/030/030_03%E6%AD%A3%E9%9D%A23.jpg',NULL,NULL,NULL,30,1),(2756,30,'image','https://storage.googleapis.com/sisiwaka-touen-medias/030/030_04%E8%A6%8B%E8%BE%BC%E3%81%BF.jpg',NULL,NULL,NULL,30,1),(2757,30,'image','https://storage.googleapis.com/sisiwaka-touen-medias/030/030_05%E6%8E%A5%E5%86%99.jpg',NULL,NULL,NULL,30,1),(2758,30,'image','https://storage.googleapis.com/sisiwaka-touen-medias/030/030_06%E6%AD%A3%E9%9D%A24.jpg',NULL,NULL,NULL,30,1),(2759,30,'image','https://storage.googleapis.com/sisiwaka-touen-medias/030/030_07%E8%A3%8F.jpg',NULL,NULL,NULL,30,1),(2760,30,'image','https://storage.googleapis.com/sisiwaka-touen-medias/030/030_08%E6%89%8B%E6%8C%81%E3%81%A1.jpg',NULL,NULL,NULL,30,1),(2761,30,'video','https://storage.googleapis.com/sisiwaka-touen-medias/030/030_%E9%9B%AA%E5%A2%A8%E5%B3%B0.jpg','https://storage.googleapis.com/sisiwaka-touen-medias/030/030_%E9%9B%AA%E5%A2%A8%E5%B3%B0.mp4',NULL,NULL,30,1),(2762,32,'image','https://storage.googleapis.com/sisiwaka-touen-medias/032/032_01%E6%89%8B%E6%8C%81%E3%81%A1.jpg',NULL,NULL,NULL,32,1),(2763,32,'image','https://storage.googleapis.com/sisiwaka-touen-medias/032/032_02%E5%B7%A6.jpg',NULL,NULL,NULL,32,1),(2764,32,'image','https://storage.googleapis.com/sisiwaka-touen-medias/032/032_03%E6%AD%A3%E9%9D%A2.jpg',NULL,NULL,NULL,32,1),(2765,32,'image','https://storage.googleapis.com/sisiwaka-touen-medias/032/032_04%E5%8F%B3.jpg',NULL,NULL,NULL,32,1),(2766,32,'image','https://storage.googleapis.com/sisiwaka-touen-medias/032/032_05%E5%8F%96%E3%81%A3%E6%89%8B.jpg',NULL,NULL,NULL,32,1),(2767,32,'image','https://storage.googleapis.com/sisiwaka-touen-medias/032/032_06%E8%A6%8B%E8%BE%BC%E3%81%BF.jpg',NULL,NULL,NULL,32,1),(2768,32,'image','https://storage.googleapis.com/sisiwaka-touen-medias/032/032_07%E5%BA%95.jpg',NULL,NULL,NULL,32,1),(2769,32,'image','https://storage.googleapis.com/sisiwaka-touen-medias/032/032_08%E6%8E%A5%E5%86%99.jpg',NULL,NULL,NULL,32,1),(2770,32,'video','https://storage.googleapis.com/sisiwaka-touen-medias/032/032_%E8%9C%86%E3%81%AE%E7%BE%A4%E7%94%9F.jpg','https://storage.googleapis.com/sisiwaka-touen-medias/032/032_%E8%9C%86%E3%81%AE%E7%BE%A4%E7%94%9F.mp4',NULL,NULL,32,1),(2771,33,'image','https://storage.googleapis.com/sisiwaka-touen-medias/033/033_01%E6%89%8B%E6%8C%81%E3%81%A1.jpg',NULL,NULL,NULL,33,1),(2772,33,'image','https://storage.googleapis.com/sisiwaka-touen-medias/033/033_02%E5%B7%A6.jpg',NULL,NULL,NULL,33,1),(2773,33,'image','https://storage.googleapis.com/sisiwaka-touen-medias/033/033_03%E6%AD%A3%E9%9D%A2.jpg',NULL,NULL,NULL,33,1),(2774,33,'image','https://storage.googleapis.com/sisiwaka-touen-medias/033/033_04%E5%8F%B3.jpg',NULL,NULL,NULL,33,1),(2775,33,'image','https://storage.googleapis.com/sisiwaka-touen-medias/033/033_05%E5%8F%96%E3%81%A3%E6%89%8B.jpg',NULL,NULL,NULL,33,1),(2776,33,'image','https://storage.googleapis.com/sisiwaka-touen-medias/033/033_06%E8%A6%8B%E8%BE%BC%E3%81%BF.jpg',NULL,NULL,NULL,33,1),(2777,33,'image','https://storage.googleapis.com/sisiwaka-touen-medias/033/033_07%E5%BA%95.jpg',NULL,NULL,NULL,33,1),(2778,33,'video','https://storage.googleapis.com/sisiwaka-touen-medias/033/033_%E9%A2%A8%E6%B4%9E%E5%AE%9F%E9%A8%93.jpg','https://storage.googleapis.com/sisiwaka-touen-medias/033/033_%E9%A2%A8%E6%B4%9E%E5%AE%9F%E9%A8%93.mp4',NULL,NULL,33,1),(2779,34,'image','https://storage.googleapis.com/sisiwaka-touen-medias/034/034_01%E6%89%8B%E6%8C%81%E3%81%A1.jpg',NULL,NULL,NULL,34,1),(2780,34,'image','https://storage.googleapis.com/sisiwaka-touen-medias/034/034_02%E5%B7%A6.jpg',NULL,NULL,NULL,34,1),(2781,34,'image','https://storage.googleapis.com/sisiwaka-touen-medias/034/034_03%E6%AD%A3%E9%9D%A2.jpg',NULL,NULL,NULL,34,1),(2782,34,'image','https://storage.googleapis.com/sisiwaka-touen-medias/034/034_04%E5%8F%B3.jpg',NULL,NULL,NULL,34,1),(2783,34,'image','https://storage.googleapis.com/sisiwaka-touen-medias/034/034_05%E5%8F%96%E3%81%A3%E6%89%8B.jpg',NULL,NULL,NULL,34,1),(2784,34,'image','https://storage.googleapis.com/sisiwaka-touen-medias/034/034_06%E8%A6%8B%E8%BE%BC%E3%81%BF.jpg',NULL,NULL,NULL,34,1),(2785,34,'image','https://storage.googleapis.com/sisiwaka-touen-medias/034/034_07%E5%BA%95.jpg',NULL,NULL,NULL,34,1),(2786,34,'image','https://storage.googleapis.com/sisiwaka-touen-medias/034/034_08%E6%8B%A1%E5%A4%A7.jpg',NULL,NULL,NULL,34,1),(2787,34,'video','https://storage.googleapis.com/sisiwaka-touen-medias/034/034_%E7%89%A1%E8%A0%A3%E3%81%AE%E7%BE%A4%E7%94%9F.jpg','https://storage.googleapis.com/sisiwaka-touen-medias/034/034_%E7%89%A1%E8%A0%A3%E3%81%AE%E7%BE%A4%E7%94%9F.mp4',NULL,NULL,34,1),(2788,35,'image','https://storage.googleapis.com/sisiwaka-touen-medias/035/035_01%E6%89%8B%E6%8C%81%E3%81%A1.jpg',NULL,NULL,NULL,35,1),(2789,35,'image','https://storage.googleapis.com/sisiwaka-touen-medias/035/035_02%E5%B7%A6.jpg',NULL,NULL,NULL,35,1),(2790,35,'image','https://storage.googleapis.com/sisiwaka-touen-medias/035/035_03%E6%AD%A3%E9%9D%A2.jpg',NULL,NULL,NULL,35,1),(2791,35,'image','https://storage.googleapis.com/sisiwaka-touen-medias/035/035_04%E5%8F%B3.jpg',NULL,NULL,NULL,35,1),(2792,35,'image','https://storage.googleapis.com/sisiwaka-touen-medias/035/035_05%E5%8F%96%E3%81%A3%E6%89%8B.jpg',NULL,NULL,NULL,35,1),(2793,35,'image','https://storage.googleapis.com/sisiwaka-touen-medias/035/035_06%E8%A6%8B%E8%BE%BC%E3%81%BF.jpg',NULL,NULL,NULL,35,1),(2794,35,'image','https://storage.googleapis.com/sisiwaka-touen-medias/035/035_07%E5%BA%95.jpg',NULL,NULL,NULL,35,1),(2795,35,'image','https://storage.googleapis.com/sisiwaka-touen-medias/035/035_08%E5%81%B4%E9%9D%A2%E6%8B%A1%E5%A4%A7.jpg',NULL,NULL,NULL,35,1),(2796,35,'image','https://storage.googleapis.com/sisiwaka-touen-medias/035/035_09%E5%81%B4%E9%9D%A2%E6%8B%A1%E5%A4%A7.jpg',NULL,NULL,NULL,35,1),(2797,35,'image','https://storage.googleapis.com/sisiwaka-touen-medias/035/035_10%E5%8F%96%E3%81%A3%E6%89%8B%E8%A3%8F.jpg',NULL,NULL,NULL,35,1),(2798,35,'image','https://storage.googleapis.com/sisiwaka-touen-medias/035/035_11%E5%8F%A3%E6%8B%A1%E5%A4%A7.jpg',NULL,NULL,NULL,35,1),(2799,35,'image','https://storage.googleapis.com/sisiwaka-touen-medias/035/035_12%E9%AB%98%E5%8F%B0%E6%8B%A1%E5%A4%A7.jpg',NULL,NULL,NULL,35,1),(2800,35,'video','https://storage.googleapis.com/sisiwaka-touen-medias/035/035_%E5%9C%9F%E3%81%AE%E3%83%AA%E3%82%BA%E3%83%A0.jpg','https://storage.googleapis.com/sisiwaka-touen-medias/035/035_%E5%9C%9F%E3%81%AE%E3%83%AA%E3%82%BA%E3%83%A0.mp4',NULL,NULL,35,1),(2801,36,'image','https://storage.googleapis.com/sisiwaka-touen-medias/036/036_01%E6%89%8B%E6%8C%81%E3%81%A1.jpg',NULL,NULL,NULL,36,1),(2802,36,'image','https://storage.googleapis.com/sisiwaka-touen-medias/036/036_02%E5%B7%A6.jpg',NULL,NULL,NULL,36,1),(2803,36,'image','https://storage.googleapis.com/sisiwaka-touen-medias/036/036_03%E5%B7%A6%E6%8B%A1%E5%A4%A7.jpg',NULL,NULL,NULL,36,1),(2804,36,'image','https://storage.googleapis.com/sisiwaka-touen-medias/036/036_04%E6%AD%A3%E9%9D%A2.jpg',NULL,NULL,NULL,36,1),(2805,36,'image','https://storage.googleapis.com/sisiwaka-touen-medias/036/036_05%E6%AD%A3%E9%9D%A2%E6%8B%A1%E5%A4%A7.jpg',NULL,NULL,NULL,36,1),(2806,36,'image','https://storage.googleapis.com/sisiwaka-touen-medias/036/036_06%E5%8F%B3.jpg',NULL,NULL,NULL,36,1),(2807,36,'image','https://storage.googleapis.com/sisiwaka-touen-medias/036/036_07%E5%8F%B3%E6%8B%A1%E5%A4%A7.jpg',NULL,NULL,NULL,36,1),(2808,36,'image','https://storage.googleapis.com/sisiwaka-touen-medias/036/036_08%E5%8F%96%E3%81%A3%E6%89%8B.jpg',NULL,NULL,NULL,36,1),(2809,36,'image','https://storage.googleapis.com/sisiwaka-touen-medias/036/036_09%E5%8F%96%E3%81%A3%E6%89%8B%E6%8B%A1%E5%A4%A7.jpg',NULL,NULL,NULL,36,1),(2810,36,'image','https://storage.googleapis.com/sisiwaka-touen-medias/036/036_10%E8%A6%8B%E8%BE%BC%E3%81%BF.jpg',NULL,NULL,NULL,36,1),(2811,36,'image','https://storage.googleapis.com/sisiwaka-touen-medias/036/036_11%E8%A6%8B%E8%BE%BC%E3%81%BF%E6%8B%A1%E5%A4%A7.jpg',NULL,NULL,NULL,36,1),(2812,36,'image','https://storage.googleapis.com/sisiwaka-touen-medias/036/036_12%E8%A3%8F.jpg',NULL,NULL,NULL,36,1),(2813,36,'image','https://storage.googleapis.com/sisiwaka-touen-medias/036/036_13%E8%B6%B3%E6%8B%A1%E5%A4%A7.jpg',NULL,NULL,NULL,36,1),(2814,36,'video','https://storage.googleapis.com/sisiwaka-touen-medias/036/036_%E5%A4%A7%E5%9C%B0%E3%81%AE%E9%BC%93%E5%8B%95.jpg','https://storage.googleapis.com/sisiwaka-touen-medias/036/036_%E5%A4%A7%E5%9C%B0%E3%81%AE%E9%BC%93%E5%8B%95.mp4',NULL,NULL,36,1),(2815,37,'image','https://storage.googleapis.com/sisiwaka-touen-medias/037/037_01%E6%89%8B%E6%8C%81%E3%81%A1.jpg',NULL,NULL,NULL,37,1),(2816,37,'image','https://storage.googleapis.com/sisiwaka-touen-medias/037/037_02%E5%8F%B3.jpg',NULL,NULL,NULL,37,1),(2817,37,'image','https://storage.googleapis.com/sisiwaka-touen-medias/037/037_03%E6%AD%A3%E9%9D%A2.jpg',NULL,NULL,NULL,37,1),(2818,37,'image','https://storage.googleapis.com/sisiwaka-touen-medias/037/037_04%E5%B7%A6.jpg',NULL,NULL,NULL,37,1),(2819,37,'image','https://storage.googleapis.com/sisiwaka-touen-medias/037/037_05%E5%8F%96%E3%81%A3%E6%89%8B.jpg',NULL,NULL,NULL,37,1),(2820,37,'image','https://storage.googleapis.com/sisiwaka-touen-medias/037/037_06%E5%B7%A6%E6%8B%A1%E5%A4%A7.jpg',NULL,NULL,NULL,37,1),(2821,37,'image','https://storage.googleapis.com/sisiwaka-touen-medias/037/037_07%E6%AD%A3%E9%9D%A2%E6%8B%A1%E5%A4%A7.jpg',NULL,NULL,NULL,37,1),(2822,37,'image','https://storage.googleapis.com/sisiwaka-touen-medias/037/037_08%E5%8F%96%E3%81%A3%E6%89%8B%E3%81%AE%E8%A3%8F.jpg',NULL,NULL,NULL,37,1),(2823,37,'image','https://storage.googleapis.com/sisiwaka-touen-medias/037/037_09%E8%A6%8B%E8%BE%BC%E3%81%BF.jpg',NULL,NULL,NULL,37,1),(2824,37,'image','https://storage.googleapis.com/sisiwaka-touen-medias/037/037_10%E8%A6%8B%E8%BE%BC%E3%81%BF%E6%8B%A1%E5%A4%A7.jpg',NULL,NULL,NULL,37,1),(2825,37,'image','https://storage.googleapis.com/sisiwaka-touen-medias/037/037_11%E5%BA%95.jpg',NULL,NULL,NULL,37,1),(2826,37,'image','https://storage.googleapis.com/sisiwaka-touen-medias/037/037_12%E8%B6%B3%E6%8B%A1%E5%A4%A7.jpg',NULL,NULL,NULL,37,1),(2827,37,'video','https://storage.googleapis.com/sisiwaka-touen-medias/037/037_%E3%83%9B%E3%83%AF%E3%82%A4%E3%83%88%E3%82%BF%E3%82%A4%E3%82%AC%E3%83%BC.jpg','https://storage.googleapis.com/sisiwaka-touen-medias/037/037_%E3%83%9B%E3%83%AF%E3%82%A4%E3%83%88%E3%82%BF%E3%82%A4%E3%82%AC%E3%83%BC.mp4',NULL,NULL,37,1),(2828,38,'image','https://storage.googleapis.com/sisiwaka-touen-medias/038/038_01%E6%89%8B%E6%8C%81%E3%81%A1.jpg',NULL,NULL,NULL,38,1),(2829,38,'image','https://storage.googleapis.com/sisiwaka-touen-medias/038/038_02%E5%81%B4%E9%9D%A21.jpg',NULL,NULL,NULL,38,1),(2830,38,'image','https://storage.googleapis.com/sisiwaka-touen-medias/038/038_03%E5%81%B4%E9%9D%A22.jpg',NULL,NULL,NULL,38,1),(2831,38,'image','https://storage.googleapis.com/sisiwaka-touen-medias/038/038_04%E5%81%B4%E9%9D%A23.jpg',NULL,NULL,NULL,38,1),(2832,38,'image','https://storage.googleapis.com/sisiwaka-touen-medias/038/038_05%E5%81%B4%E9%9D%A24.jpg',NULL,NULL,NULL,38,1),(2833,38,'image','https://storage.googleapis.com/sisiwaka-touen-medias/038/038_06%E5%AF%84%E3%82%8A1.jpg',NULL,NULL,NULL,38,1),(2834,38,'image','https://storage.googleapis.com/sisiwaka-touen-medias/038/038_07%E5%AF%84%E3%82%8A2.jpg',NULL,NULL,NULL,38,1),(2835,38,'image','https://storage.googleapis.com/sisiwaka-touen-medias/038/038_08%E5%AF%84%E3%82%8A3.jpg',NULL,NULL,NULL,38,1),(2836,38,'image','https://storage.googleapis.com/sisiwaka-touen-medias/038/038_09%E5%AF%84%E3%82%8A4.jpg',NULL,NULL,NULL,38,1),(2837,38,'image','https://storage.googleapis.com/sisiwaka-touen-medias/038/038_10%E8%A6%8B%E8%BE%BC%E3%81%BF.jpg',NULL,NULL,NULL,38,1),(2838,38,'image','https://storage.googleapis.com/sisiwaka-touen-medias/038/038_11%E8%A6%8B%E8%BE%BC%E3%81%BF%E6%8B%A1%E5%A4%A7.jpg',NULL,NULL,NULL,38,1),(2839,38,'image','https://storage.googleapis.com/sisiwaka-touen-medias/038/038_12%E8%A3%8F.jpg',NULL,NULL,NULL,38,1),(2840,38,'image','https://storage.googleapis.com/sisiwaka-touen-medias/038/038_13%E8%B6%B3.jpg',NULL,NULL,NULL,38,1),(2841,38,'video','https://storage.googleapis.com/sisiwaka-touen-medias/038/038_%E9%B6%89%E5%B8%AF.jpg','https://storage.googleapis.com/sisiwaka-touen-medias/038/038_%E9%B6%89%E5%B8%AF.mp4',NULL,NULL,38,1),(2842,39,'image','https://storage.googleapis.com/sisiwaka-touen-medias/039/039_01%E6%89%8B%E6%8C%81%E3%81%A1.jpg',NULL,NULL,NULL,39,1),(2843,39,'image','https://storage.googleapis.com/sisiwaka-touen-medias/039/039_02%E5%B7%A6.jpg',NULL,NULL,NULL,39,1),(2844,39,'image','https://storage.googleapis.com/sisiwaka-touen-medias/039/039_03%E6%AD%A3%E9%9D%A2.jpg',NULL,NULL,NULL,39,1),(2845,39,'image','https://storage.googleapis.com/sisiwaka-touen-medias/039/039_04%E5%8F%B3.jpg',NULL,NULL,NULL,39,1),(2846,39,'image','https://storage.googleapis.com/sisiwaka-touen-medias/039/039_05%E5%8F%96%E3%81%A3%E6%89%8B.jpg',NULL,NULL,NULL,39,1),(2847,39,'image','https://storage.googleapis.com/sisiwaka-touen-medias/039/039_06%E5%B7%A6%E6%8B%A1%E5%A4%A7.jpg',NULL,NULL,NULL,39,1),(2848,39,'image','https://storage.googleapis.com/sisiwaka-touen-medias/039/039_07%E6%AD%A3%E9%9D%A2%E6%8B%A1%E5%A4%A7.jpg',NULL,NULL,NULL,39,1),(2849,39,'image','https://storage.googleapis.com/sisiwaka-touen-medias/039/039_08%E5%8F%B3%E6%8B%A1%E5%A4%A7.jpg',NULL,NULL,NULL,39,1),(2850,39,'image','https://storage.googleapis.com/sisiwaka-touen-medias/039/039_09%E5%8F%96%E3%81%A3%E6%89%8B%E6%8B%A1%E5%A4%A7.jpg',NULL,NULL,NULL,39,1),(2851,39,'image','https://storage.googleapis.com/sisiwaka-touen-medias/039/039_10%E8%A6%8B%E8%BE%BC%E3%81%BF.jpg',NULL,NULL,NULL,39,1),(2852,39,'image','https://storage.googleapis.com/sisiwaka-touen-medias/039/039_11%E8%A3%8F.jpg',NULL,NULL,NULL,39,1),(2853,39,'image','https://storage.googleapis.com/sisiwaka-touen-medias/039/039_12%E8%84%9A.jpg',NULL,NULL,NULL,39,1),(2854,39,'video','https://storage.googleapis.com/sisiwaka-touen-medias/039/039_%E5%87%AA%E3%81%AE%E6%99%82%E9%96%93.jpg','https://storage.googleapis.com/sisiwaka-touen-medias/039/039_%E5%87%AA%E3%81%AE%E6%99%82%E9%96%93.mp4',NULL,NULL,39,1),(2855,40,'image','https://storage.googleapis.com/sisiwaka-touen-medias/040/040_01%E6%89%8B%E6%8C%81%E3%81%A1.jpg',NULL,NULL,NULL,40,1),(2856,40,'image','https://storage.googleapis.com/sisiwaka-touen-medias/040/040_02_%E5%8F%B3.jpg',NULL,NULL,NULL,40,1),(2857,40,'image','https://storage.googleapis.com/sisiwaka-touen-medias/040/040_03%E6%AD%A3%E9%9D%A2.jpg',NULL,NULL,NULL,40,1),(2858,40,'image','https://storage.googleapis.com/sisiwaka-touen-medias/040/040_04%E5%B7%A6.jpg',NULL,NULL,NULL,40,1),(2859,40,'image','https://storage.googleapis.com/sisiwaka-touen-medias/040/040_05%E5%8F%96%E3%81%A3%E6%89%8B.jpg',NULL,NULL,NULL,40,1),(2860,40,'image','https://storage.googleapis.com/sisiwaka-touen-medias/040/040_06%E6%8B%A1%E5%A4%A701.jpg',NULL,NULL,NULL,40,1),(2861,40,'image','https://storage.googleapis.com/sisiwaka-touen-medias/040/040_07%E6%8B%A1%E5%A4%A702.jpg',NULL,NULL,NULL,40,1),(2862,40,'image','https://storage.googleapis.com/sisiwaka-touen-medias/040/040_08%E6%8B%A1%E5%A4%A703.jpg',NULL,NULL,NULL,40,1),(2863,40,'image','https://storage.googleapis.com/sisiwaka-touen-medias/040/040_09%E6%8B%A1%E5%A4%A704.jpg',NULL,NULL,NULL,40,1),(2864,40,'image','https://storage.googleapis.com/sisiwaka-touen-medias/040/040_10%E5%8F%96%E3%81%A3%E6%89%8B%E6%8B%A1%E5%A4%A7.jpg',NULL,NULL,NULL,40,1),(2865,40,'image','https://storage.googleapis.com/sisiwaka-touen-medias/040/040_11%E8%A6%8B%E8%BE%BC%E3%81%BF.jpg',NULL,NULL,NULL,40,1),(2866,40,'image','https://storage.googleapis.com/sisiwaka-touen-medias/040/040_12%E8%A3%8F.jpg',NULL,NULL,NULL,40,1),(2867,40,'image','https://storage.googleapis.com/sisiwaka-touen-medias/040/040_13%E8%B6%B3.jpg',NULL,NULL,NULL,40,1),(2868,40,'video','https://storage.googleapis.com/sisiwaka-touen-medias/040/040_%E5%A2%A8%E6%B5%81%E3%81%97.jpg','https://storage.googleapis.com/sisiwaka-touen-medias/040/040_%E5%A2%A8%E6%B5%81%E3%81%97.mp4',NULL,NULL,40,1),(2869,42,'image','https://storage.googleapis.com/sisiwaka-touen-medias/042/042_01%E6%89%8B%E6%8C%81%E3%81%A1.jpg',NULL,NULL,NULL,42,1),(2870,42,'image','https://storage.googleapis.com/sisiwaka-touen-medias/042/042_02%E5%8F%B3.jpg',NULL,NULL,NULL,42,1),(2871,42,'image','https://storage.googleapis.com/sisiwaka-touen-medias/042/042_03%E6%AD%A3%E9%9D%A2.jpg',NULL,NULL,NULL,42,1),(2872,42,'image','https://storage.googleapis.com/sisiwaka-touen-medias/042/042_04%E5%B7%A6.jpg',NULL,NULL,NULL,42,1),(2873,42,'image','https://storage.googleapis.com/sisiwaka-touen-medias/042/042_05%E6%8B%A1%E5%A4%A71.jpg',NULL,NULL,NULL,42,1),(2874,42,'image','https://storage.googleapis.com/sisiwaka-touen-medias/042/042_06%E6%8B%A1%E5%A4%A72.jpg',NULL,NULL,NULL,42,1),(2875,42,'image','https://storage.googleapis.com/sisiwaka-touen-medias/042/042_07%E6%8B%A1%E5%A4%A73.jpg',NULL,NULL,NULL,42,1),(2876,42,'image','https://storage.googleapis.com/sisiwaka-touen-medias/042/042_08%E8%A6%8B%E8%BE%BC%E3%81%BF.jpg',NULL,NULL,NULL,42,1),(2877,42,'image','https://storage.googleapis.com/sisiwaka-touen-medias/042/042_09%E8%A3%8F.jpg',NULL,NULL,NULL,42,1),(2878,42,'image','https://storage.googleapis.com/sisiwaka-touen-medias/042/042_10%E8%B6%B3.jpg',NULL,NULL,NULL,42,1),(2879,43,'image','https://storage.googleapis.com/sisiwaka-touen-medias/043/043_01%E6%89%8B%E6%8C%81%E3%81%A1.jpg',NULL,NULL,NULL,43,1),(2880,43,'image','https://storage.googleapis.com/sisiwaka-touen-medias/043/043_02%E6%AD%A3%E9%9D%A201.jpg',NULL,NULL,NULL,43,1),(2881,43,'image','https://storage.googleapis.com/sisiwaka-touen-medias/043/043_03%E6%AD%A3%E9%9D%A202.jpg',NULL,NULL,NULL,43,1),(2882,43,'image','https://storage.googleapis.com/sisiwaka-touen-medias/043/043_04%E6%AD%A3%E9%9D%A203.jpg',NULL,NULL,NULL,43,1),(2883,43,'image','https://storage.googleapis.com/sisiwaka-touen-medias/043/043_05%E6%AD%A3%E9%9D%A204.jpg',NULL,NULL,NULL,43,1),(2884,43,'image','https://storage.googleapis.com/sisiwaka-touen-medias/043/043_06%E6%8B%A1%E5%A4%A701.jpg',NULL,NULL,NULL,43,1),(2885,43,'image','https://storage.googleapis.com/sisiwaka-touen-medias/043/043_07%E6%8B%A1%E5%A4%A702.jpg',NULL,NULL,NULL,43,1),(2886,43,'image','https://storage.googleapis.com/sisiwaka-touen-medias/043/043_08%E6%8B%A1%E5%A4%A703.jpg',NULL,NULL,NULL,43,1),(2887,43,'image','https://storage.googleapis.com/sisiwaka-touen-medias/043/043_09%E6%8B%A1%E5%A4%A704.jpg',NULL,NULL,NULL,43,1),(2888,43,'image','https://storage.googleapis.com/sisiwaka-touen-medias/043/043_10%E6%8B%A1%E5%A4%A705.jpg',NULL,NULL,NULL,43,1),(2889,43,'image','https://storage.googleapis.com/sisiwaka-touen-medias/043/043_11%E8%A6%8B%E8%BE%BC%E3%81%BF01.jpg',NULL,NULL,NULL,43,1),(2890,43,'image','https://storage.googleapis.com/sisiwaka-touen-medias/043/043_12%E8%A6%8B%E8%BE%BC%E3%81%BF02.jpg',NULL,NULL,NULL,43,1),(2891,43,'image','https://storage.googleapis.com/sisiwaka-touen-medias/043/043_13%E8%A3%8F01.jpg',NULL,NULL,NULL,43,1),(2892,43,'image','https://storage.googleapis.com/sisiwaka-touen-medias/043/043_14%E8%A3%8F02.jpg',NULL,NULL,NULL,43,1),(2893,43,'image','https://storage.googleapis.com/sisiwaka-touen-medias/043/043_15%E8%A3%8F03.jpg',NULL,NULL,NULL,43,1),(2894,43,'video','https://storage.googleapis.com/sisiwaka-touen-medias/043/043_%E5%8D%98%E8%AA%BF%E4%BD%9C%E6%A5%AD1.jpg','https://storage.googleapis.com/sisiwaka-touen-medias/043/043_%E5%8D%98%E8%AA%BF%E4%BD%9C%E6%A5%AD1.mp4',NULL,NULL,43,1),(2895,43,'video','https://storage.googleapis.com/sisiwaka-touen-medias/043/043_%E5%8D%98%E8%AA%BF%E4%BD%9C%E6%A5%AD2.jpg','https://storage.googleapis.com/sisiwaka-touen-medias/043/043_%E5%8D%98%E8%AA%BF%E4%BD%9C%E6%A5%AD2.mp4',NULL,NULL,43,1),(2896,44,'image','https://storage.googleapis.com/sisiwaka-touen-medias/044/044_01%E6%89%8B%E6%8C%81%E3%81%A1.jpg',NULL,NULL,NULL,44,1),(2897,44,'image','https://storage.googleapis.com/sisiwaka-touen-medias/044/044_02%E6%AD%A3%E9%9D%A21.jpg',NULL,NULL,NULL,44,1),(2898,44,'image','https://storage.googleapis.com/sisiwaka-touen-medias/044/044_03%E6%AD%A3%E9%9D%A22.jpg',NULL,NULL,NULL,44,1),(2899,44,'image','https://storage.googleapis.com/sisiwaka-touen-medias/044/044_04%E6%AD%A3%E9%9D%A23.jpg',NULL,NULL,NULL,44,1),(2900,44,'image','https://storage.googleapis.com/sisiwaka-touen-medias/044/044_05%E6%8B%A1%E5%A4%A71.jpg',NULL,NULL,NULL,44,1),(2901,44,'image','https://storage.googleapis.com/sisiwaka-touen-medias/044/044_06%E6%8B%A1%E5%A4%A72.jpg',NULL,NULL,NULL,44,1),(2902,44,'image','https://storage.googleapis.com/sisiwaka-touen-medias/044/044_07%E8%A6%8B%E8%BE%BC%E3%81%BF.jpg',NULL,NULL,NULL,44,1),(2903,44,'image','https://storage.googleapis.com/sisiwaka-touen-medias/044/044_08%E8%A6%8B%E8%BE%BC%E3%81%BF2.jpg',NULL,NULL,NULL,44,1),(2904,44,'image','https://storage.googleapis.com/sisiwaka-touen-medias/044/044_09%E8%A3%8F%E6%AD%A3%E9%9D%A2.jpg',NULL,NULL,NULL,44,1),(2905,44,'image','https://storage.googleapis.com/sisiwaka-touen-medias/044/044_10%E8%A3%8F%E6%96%9C%E3%82%81.jpg',NULL,NULL,NULL,44,1),(2906,44,'image','https://storage.googleapis.com/sisiwaka-touen-medias/044/044_11%E8%B6%B3.jpg',NULL,NULL,NULL,44,1),(2907,44,'video','https://storage.googleapis.com/sisiwaka-touen-medias/044/044_%E3%82%A4%E3%82%BD%E3%82%AE%E3%83%B3%E3%83%81%E3%83%A3%E3%82%AF.jpg','https://storage.googleapis.com/sisiwaka-touen-medias/044/044_%E3%82%A4%E3%82%BD%E3%82%AE%E3%83%B3%E3%83%81%E3%83%A3%E3%82%AF.mp4',NULL,NULL,44,1),(2908,45,'image','https://storage.googleapis.com/sisiwaka-touen-medias/045/045_01%E6%89%8B%E6%8C%81%E3%81%A1.jpg',NULL,NULL,NULL,45,1),(2909,45,'image','https://storage.googleapis.com/sisiwaka-touen-medias/045/045_02%E5%8F%B3.jpg',NULL,NULL,NULL,45,1),(2910,45,'image','https://storage.googleapis.com/sisiwaka-touen-medias/045/045_03%E6%AD%A3%E9%9D%A2.jpg',NULL,NULL,NULL,45,1),(2911,45,'image','https://storage.googleapis.com/sisiwaka-touen-medias/045/045_04%E5%B7%A6.jpg',NULL,NULL,NULL,45,1),(2912,45,'image','https://storage.googleapis.com/sisiwaka-touen-medias/045/045_05%E5%8F%96%E3%81%A3%E6%89%8B.jpg',NULL,NULL,NULL,45,1),(2913,45,'image','https://storage.googleapis.com/sisiwaka-touen-medias/045/045_06%E5%8F%B3%E6%8B%A1%E5%A4%A7.jpg',NULL,NULL,NULL,45,1),(2914,45,'image','https://storage.googleapis.com/sisiwaka-touen-medias/045/045_07%E6%AD%A3%E9%9D%A2%E6%8B%A1%E5%A4%A7.jpg',NULL,NULL,NULL,45,1),(2915,45,'image','https://storage.googleapis.com/sisiwaka-touen-medias/045/045_08%E5%B7%A6%E6%8B%A1%E5%A4%A7.jpg',NULL,NULL,NULL,45,1),(2916,45,'image','https://storage.googleapis.com/sisiwaka-touen-medias/045/045_09%E5%8F%96%E3%81%A3%E6%89%8B%E6%8B%A1%E5%A4%A7.jpg',NULL,NULL,NULL,45,1),(2917,45,'image','https://storage.googleapis.com/sisiwaka-touen-medias/045/045_10%E8%A6%8B%E8%BE%BC%E3%81%BF.jpg',NULL,NULL,NULL,45,1),(2918,45,'image','https://storage.googleapis.com/sisiwaka-touen-medias/045/045_11%E8%A6%8B%E8%BE%BC%E3%81%BF%E6%8B%A1%E5%A4%A7.jpg',NULL,NULL,NULL,45,1),(2919,45,'image','https://storage.googleapis.com/sisiwaka-touen-medias/045/045_12%E5%BA%95.jpg',NULL,NULL,NULL,45,1),(2920,45,'image','https://storage.googleapis.com/sisiwaka-touen-medias/045/045_13%E3%81%A9%E3%81%93%E3%81%8B%E3%81%AE%E6%8B%A1%E5%A4%A7.jpg',NULL,NULL,NULL,45,1),(2921,45,'image','https://storage.googleapis.com/sisiwaka-touen-medias/045/045_14%E5%8F%96%E3%81%A3%E6%89%8B%E8%A3%8F.jpg',NULL,NULL,NULL,45,1),(2922,50,'image','https://storage.googleapis.com/sisiwaka-touen-medias/050/050_01%E6%89%8B%E6%8C%81%E3%81%A1.jpg',NULL,NULL,NULL,50,1),(2923,50,'image','https://storage.googleapis.com/sisiwaka-touen-medias/050/050_02%E5%8F%B3.jpg',NULL,NULL,NULL,50,1),(2924,50,'image','https://storage.googleapis.com/sisiwaka-touen-medias/050/050_03%E6%AD%A3%E9%9D%A2.jpg',NULL,NULL,NULL,50,1),(2925,50,'image','https://storage.googleapis.com/sisiwaka-touen-medias/050/050_04%E5%B7%A6.jpg',NULL,NULL,NULL,50,1),(2926,50,'image','https://storage.googleapis.com/sisiwaka-touen-medias/050/050_05%E5%8F%96%E3%81%A3%E6%89%8B.jpg',NULL,NULL,NULL,50,1),(2927,50,'image','https://storage.googleapis.com/sisiwaka-touen-medias/050/050_06%E5%8F%B3%E6%8B%A1%E5%A4%A7.jpg',NULL,NULL,NULL,50,1),(2928,50,'image','https://storage.googleapis.com/sisiwaka-touen-medias/050/050_07%E6%AD%A3%E9%9D%A2%E6%8B%A1%E5%A4%A7.jpg',NULL,NULL,NULL,50,1),(2929,50,'image','https://storage.googleapis.com/sisiwaka-touen-medias/050/050_08%E5%8F%96%E3%81%A3%E6%89%8B%E6%8B%A1%E5%A4%A7.jpg',NULL,NULL,NULL,50,1),(2930,50,'image','https://storage.googleapis.com/sisiwaka-touen-medias/050/050_09%E8%A6%8B%E8%BE%BC%E3%81%BF.jpg',NULL,NULL,NULL,50,1),(2931,50,'image','https://storage.googleapis.com/sisiwaka-touen-medias/050/050_10%E8%A6%8B%E8%BE%BC%E3%81%BF%E6%8B%A1%E5%A4%A7.jpg',NULL,NULL,NULL,50,1),(2932,50,'image','https://storage.googleapis.com/sisiwaka-touen-medias/050/050_11%E5%8F%96%E3%81%A3%E6%89%8B%E8%A3%8F.jpg',NULL,NULL,NULL,50,1),(2933,50,'image','https://storage.googleapis.com/sisiwaka-touen-medias/050/050_12%E5%BA%95.jpg',NULL,NULL,NULL,50,1),(2934,50,'image','https://storage.googleapis.com/sisiwaka-touen-medias/050/050_13%E8%B6%B3.jpg',NULL,NULL,NULL,50,1),(2935,50,'video','https://storage.googleapis.com/sisiwaka-touen-medias/050/050_%E3%81%86%E3%81%A3%E3%81%8B%E3%82%8A%E3%83%92%E3%83%A7%E3%82%A6%E3%83%A2%E3%83%B3%E3%83%80%E3%82%B3.jpg','https://storage.googleapis.com/sisiwaka-touen-medias/050/050_%E3%81%86%E3%81%A3%E3%81%8B%E3%82%8A%E3%83%92%E3%83%A7%E3%82%A6%E3%83%A2%E3%83%B3%E3%83%80%E3%82%B3.mp4',NULL,NULL,50,1),(2936,51,'image','https://storage.googleapis.com/sisiwaka-touen-medias/051/051_01%E6%89%8B%E6%8C%81%E3%81%A1.jpg',NULL,NULL,NULL,51,1),(2937,51,'image','https://storage.googleapis.com/sisiwaka-touen-medias/051/051_02%E5%8F%B3.jpg',NULL,NULL,NULL,51,1),(2938,51,'image','https://storage.googleapis.com/sisiwaka-touen-medias/051/051_03%E6%AD%A3%E9%9D%A2.jpg',NULL,NULL,NULL,51,1),(2939,51,'image','https://storage.googleapis.com/sisiwaka-touen-medias/051/051_04%E5%B7%A6.jpg',NULL,NULL,NULL,51,1),(2940,51,'image','https://storage.googleapis.com/sisiwaka-touen-medias/051/051_05%E5%8F%96%E3%81%A3%E6%89%8B.jpg',NULL,NULL,NULL,51,1),(2941,51,'image','https://storage.googleapis.com/sisiwaka-touen-medias/051/051_06%E5%8F%B3%E6%8B%A1%E5%A4%A7.jpg',NULL,NULL,NULL,51,1),(2942,51,'image','https://storage.googleapis.com/sisiwaka-touen-medias/051/051_07%E6%AD%A3%E9%9D%A2%E6%8B%A1%E5%A4%A7.jpg',NULL,NULL,NULL,51,1),(2943,51,'image','https://storage.googleapis.com/sisiwaka-touen-medias/051/051_08%E5%B7%A6%E6%8B%A1%E5%A4%A7.jpg',NULL,NULL,NULL,51,1),(2944,51,'image','https://storage.googleapis.com/sisiwaka-touen-medias/051/051_09%E5%8F%96%E3%81%A3%E6%89%8B%E6%8B%A1%E5%A4%A7.jpg',NULL,NULL,NULL,51,1),(2945,51,'image','https://storage.googleapis.com/sisiwaka-touen-medias/051/051_10%E5%8F%96%E3%81%A3%E6%89%8B%E8%A3%8F.jpg',NULL,NULL,NULL,51,1),(2946,51,'image','https://storage.googleapis.com/sisiwaka-touen-medias/051/051_11%E8%A3%8F.jpg',NULL,NULL,NULL,51,1),(2947,51,'image','https://storage.googleapis.com/sisiwaka-touen-medias/051/051_12%E8%B6%B3.jpg',NULL,NULL,NULL,51,1),(2948,51,'video','https://storage.googleapis.com/sisiwaka-touen-medias/051/051_%E5%B3%B6%E3%81%AE%E7%B2%BE%E9%9C%8A.jpg','https://storage.googleapis.com/sisiwaka-touen-medias/051/051_%E5%B3%B6%E3%81%AE%E7%B2%BE%E9%9C%8A.mp4',NULL,NULL,51,1),(2949,52,'image','https://storage.googleapis.com/sisiwaka-touen-medias/052/052_01%E6%89%8B%E6%8C%81%E3%81%A1.jpg',NULL,NULL,NULL,52,1),(2950,53,'image','https://storage.googleapis.com/sisiwaka-touen-medias/053/053_01%E6%89%8B%E6%8C%81%E3%81%A1.jpg',NULL,NULL,NULL,53,1),(2951,53,'image','https://storage.googleapis.com/sisiwaka-touen-medias/053/053_02%E5%8F%B3.jpg',NULL,NULL,NULL,53,1),(2952,53,'image','https://storage.googleapis.com/sisiwaka-touen-medias/053/053_03%E6%AD%A3%E9%9D%A2.jpg',NULL,NULL,NULL,53,1),(2953,53,'image','https://storage.googleapis.com/sisiwaka-touen-medias/053/053_04%E5%B7%A6.jpg',NULL,NULL,NULL,53,1),(2954,53,'image','https://storage.googleapis.com/sisiwaka-touen-medias/053/053_05%E5%8F%96%E3%81%A3%E6%89%8B.jpg',NULL,NULL,NULL,53,1),(2955,53,'image','https://storage.googleapis.com/sisiwaka-touen-medias/053/053_06%E5%8F%B3%E6%8B%A1%E5%A4%A7.jpg',NULL,NULL,NULL,53,1),(2956,53,'image','https://storage.googleapis.com/sisiwaka-touen-medias/053/053_07%E6%AD%A3%E9%9D%A2%E6%8B%A1%E5%A4%A7.jpg',NULL,NULL,NULL,53,1),(2957,53,'image','https://storage.googleapis.com/sisiwaka-touen-medias/053/053_08%E5%B7%A6%E6%8B%A1%E5%A4%A7.jpg',NULL,NULL,NULL,53,1),(2958,53,'image','https://storage.googleapis.com/sisiwaka-touen-medias/053/053_09%E5%8F%96%E3%81%A3%E6%89%8B%E6%8B%A1%E5%A4%A7.jpg',NULL,NULL,NULL,53,1),(2959,53,'image','https://storage.googleapis.com/sisiwaka-touen-medias/053/053_10%E8%A6%8B%E8%BE%BC%E3%81%BF.jpg',NULL,NULL,NULL,53,1),(2960,53,'image','https://storage.googleapis.com/sisiwaka-touen-medias/053/053_11%E5%8F%A3%E7%B8%81.jpg',NULL,NULL,NULL,53,1),(2961,53,'image','https://storage.googleapis.com/sisiwaka-touen-medias/053/053_12%E8%A3%8F.jpg',NULL,NULL,NULL,53,1),(2962,53,'image','https://storage.googleapis.com/sisiwaka-touen-medias/053/053_13%E8%B6%B3.jpg',NULL,NULL,NULL,53,1),(2963,53,'video','https://storage.googleapis.com/sisiwaka-touen-medias/053/053_%E3%81%97%E3%81%A3%E3%81%8B%E3%82%8A%E3%83%92%E3%83%A7%E3%82%A6%E3%83%A2%E3%83%B3%E3%83%80%E3%82%B3.jpg','https://storage.googleapis.com/sisiwaka-touen-medias/053/053_%E3%81%97%E3%81%A3%E3%81%8B%E3%82%8A%E3%83%92%E3%83%A7%E3%82%A6%E3%83%A2%E3%83%B3%E3%83%80%E3%82%B3.mp4',NULL,NULL,53,1),(2964,54,'image','https://storage.googleapis.com/sisiwaka-touen-medias/054/054_01%E6%89%8B%E6%8C%81%E3%81%A1.jpg',NULL,NULL,NULL,54,1),(2965,54,'image','https://storage.googleapis.com/sisiwaka-touen-medias/054/054_02%E5%8F%B3.jpg',NULL,NULL,NULL,54,1),(2966,54,'image','https://storage.googleapis.com/sisiwaka-touen-medias/054/054_03%E6%AD%A3%E9%9D%A2.jpg',NULL,NULL,NULL,54,1),(2967,54,'image','https://storage.googleapis.com/sisiwaka-touen-medias/054/054_04%E5%B7%A6.jpg',NULL,NULL,NULL,54,1),(2968,54,'image','https://storage.googleapis.com/sisiwaka-touen-medias/054/054_05%E5%8F%96%E3%81%A3%E6%89%8B.jpg',NULL,NULL,NULL,54,1),(2969,54,'image','https://storage.googleapis.com/sisiwaka-touen-medias/054/054_06%E5%8F%B3%E6%8B%A1%E5%A4%A7.jpg',NULL,NULL,NULL,54,1),(2970,54,'image','https://storage.googleapis.com/sisiwaka-touen-medias/054/054_07%E6%AD%A3%E9%9D%A2%E6%8B%A1%E5%A4%A7.jpg',NULL,NULL,NULL,54,1),(2971,54,'image','https://storage.googleapis.com/sisiwaka-touen-medias/054/054_08%E5%B7%A6%E6%8B%A1%E5%A4%A7.jpg',NULL,NULL,NULL,54,1),(2972,54,'image','https://storage.googleapis.com/sisiwaka-touen-medias/054/054_09%E5%8F%96%E3%81%A3%E6%89%8B%E6%8B%A1%E5%A4%A7.jpg',NULL,NULL,NULL,54,1),(2973,54,'image','https://storage.googleapis.com/sisiwaka-touen-medias/054/054_10%E5%8F%96%E3%81%A3%E6%89%8B%E8%A3%8F.jpg',NULL,NULL,NULL,54,1),(2974,54,'image','https://storage.googleapis.com/sisiwaka-touen-medias/054/054_11%E8%A6%8B%E8%BE%BC%E3%81%BF.jpg',NULL,NULL,NULL,54,1),(2975,54,'image','https://storage.googleapis.com/sisiwaka-touen-medias/054/054_12%E7%B8%81.jpg',NULL,NULL,NULL,54,1),(2976,54,'image','https://storage.googleapis.com/sisiwaka-touen-medias/054/054_13%E8%A3%8F.jpg',NULL,NULL,NULL,54,1),(2977,54,'image','https://storage.googleapis.com/sisiwaka-touen-medias/054/054_14%E8%B6%B3.jpg',NULL,NULL,NULL,54,1),(2978,54,'image','https://storage.googleapis.com/sisiwaka-touen-medias/054/054_15%E8%B6%B3%E6%8B%A1%E5%A4%A7.jpg',NULL,NULL,NULL,54,1),(2979,54,'video','https://storage.googleapis.com/sisiwaka-touen-medias/054/054_%E5%86%AC%E3%81%AE%E6%B1%A0%E3%80%81%E6%B0%B7%E3%81%AE%E6%B3%A1.jpg','https://storage.googleapis.com/sisiwaka-touen-medias/054/054_%E5%86%AC%E3%81%AE%E6%B1%A0%E3%80%81%E6%B0%B7%E3%81%AE%E6%B3%A1.mp4',NULL,NULL,54,1),(2980,55,'image','https://storage.googleapis.com/sisiwaka-touen-medias/055/055_01%E6%89%8B%E6%8C%81%E3%81%A1.jpg',NULL,NULL,NULL,55,1),(2981,55,'image','https://storage.googleapis.com/sisiwaka-touen-medias/055/055_02%E5%8F%B3.jpg',NULL,NULL,NULL,55,1),(2982,55,'image','https://storage.googleapis.com/sisiwaka-touen-medias/055/055_03%E6%AD%A3%E9%9D%A2.jpg',NULL,NULL,NULL,55,1),(2983,55,'image','https://storage.googleapis.com/sisiwaka-touen-medias/055/055_04%E5%B7%A6.jpg',NULL,NULL,NULL,55,1),(2984,55,'image','https://storage.googleapis.com/sisiwaka-touen-medias/055/055_05%E5%8F%96%E3%81%A3%E6%89%8B.jpg',NULL,NULL,NULL,55,1),(2985,55,'image','https://storage.googleapis.com/sisiwaka-touen-medias/055/055_06%E5%8F%B3%E6%8B%A1%E5%A4%A7.jpg',NULL,NULL,NULL,55,1),(2986,55,'image','https://storage.googleapis.com/sisiwaka-touen-medias/055/055_07%E6%AD%A3%E9%9D%A2%E6%8B%A1%E5%A4%A7.jpg',NULL,NULL,NULL,55,1),(2987,55,'image','https://storage.googleapis.com/sisiwaka-touen-medias/055/055_08%E5%B7%A6%E6%8B%A1%E5%A4%A7.jpg',NULL,NULL,NULL,55,1),(2988,55,'image','https://storage.googleapis.com/sisiwaka-touen-medias/055/055_10%E8%A6%8B%E8%BE%BC%E3%81%BF.jpg',NULL,NULL,NULL,55,1),(2989,55,'image','https://storage.googleapis.com/sisiwaka-touen-medias/055/055_11%E8%A3%8F.jpg',NULL,NULL,NULL,55,1),(2990,55,'image','https://storage.googleapis.com/sisiwaka-touen-medias/055/055_12%E8%B6%B3.jpg',NULL,NULL,NULL,55,1),(2991,55,'image','https://storage.googleapis.com/sisiwaka-touen-medias/055/055_9%E5%8F%96%E3%81%A3%E6%89%8B%E5%86%85%E5%81%B4.jpg',NULL,NULL,NULL,55,1),(2992,55,'video','https://storage.googleapis.com/sisiwaka-touen-medias/055/055_%E9%9B%AA%E5%89%B2%E3%82%8A%E3%81%AE%E5%A5%94%E6%B5%81.jpg','https://storage.googleapis.com/sisiwaka-touen-medias/055/055_%E9%9B%AA%E5%89%B2%E3%82%8A%E3%81%AE%E5%A5%94%E6%B5%81.mp4',NULL,NULL,55,1);
/*!40000 ALTER TABLE `artwork_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artwork_techniques`
--

DROP TABLE IF EXISTS `artwork_techniques`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `artwork_techniques` (
  `artwork_id` int(11) NOT NULL,
  `techniques_slug` varchar(50) NOT NULL,
  `valid` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`artwork_id`,`techniques_slug`),
  KEY `fk_artwork_techniques_technique` (`techniques_slug`),
  CONSTRAINT `fk_artwork_techniques_artwork` FOREIGN KEY (`artwork_id`) REFERENCES `artworks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_artwork_techniques_technique` FOREIGN KEY (`techniques_slug`) REFERENCES `techniques` (`slug`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artwork_techniques`
--

LOCK TABLES `artwork_techniques` WRITE;
/*!40000 ALTER TABLE `artwork_techniques` DISABLE KEYS */;
INSERT INTO `artwork_techniques` VALUES (33,'nerikomi',1),(33,'shinogi',1),(36,'nerikomi',1),(36,'shinogi',1),(37,'nerikomi',1),(37,'shinogi',1),(38,'nerikomi',1),(38,'shinogi',1),(38,'tebinari',1),(39,'nerikomi',1),(39,'shinogi',1),(40,'nerikomi',1),(40,'shinogi',1),(42,'nerikomi',1),(42,'shinogi',1),(42,'tebinari',1),(43,'nerikomi',1),(43,'shinogi',1),(44,'nerikomi',1),(44,'shinogi',1),(45,'nerikomi',1),(45,'shinogi',1),(45,'tebinari',1),(50,'nerikomi',1),(50,'shinogi',1),(51,'nerikomi',1),(51,'shinogi',1),(52,'nerikomi',1),(52,'shinogi',1),(53,'nerikomi',1),(53,'shinogi',1),(54,'nerikomi',1),(54,'shinogi',1),(55,'nerikomi',1),(55,'shinogi',1);
/*!40000 ALTER TABLE `artwork_techniques` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artworks`
--

DROP TABLE IF EXISTS `artworks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `artworks` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description_title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `category` varchar(50) NOT NULL,
  `spec` text DEFAULT NULL,
  `width` decimal(5,1) DEFAULT NULL,
  `max_width` decimal(5,1) DEFAULT NULL,
  `height` decimal(5,1) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `capacity` int(11) DEFAULT NULL,
  `clay` text DEFAULT NULL,
  `glaze` text DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `in_stock` tinyint(1) NOT NULL DEFAULT 1,
  `coloring` varchar(50) DEFAULT NULL,
  `shop_url` varchar(500) DEFAULT NULL,
  `instagram_url` varchar(500) DEFAULT NULL,
  `completion_date` date DEFAULT NULL,
  `update_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `valid` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `fk_artworks_color` (`coloring`),
  KEY `fk_artworks_category` (`category`),
  CONSTRAINT `fk_artworks_category` FOREIGN KEY (`category`) REFERENCES `categories` (`slug`) ON UPDATE CASCADE,
  CONSTRAINT `fk_artworks_color` FOREIGN KEY (`coloring`) REFERENCES `colorings` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artworks`
--

LOCK TABLES `artworks` WRITE;
/*!40000 ALTER TABLE `artworks` DISABLE KEYS */;
INSERT INTO `artworks` VALUES (33,'風洞実験','ハウォルチア様練り込みコーヒーカップ「風洞実験」','　白土と黒土を練り込んで生まれた縞模様の素地に、ハオルチアの葉を思わせる上向きの三角形模様を彫り込んだコーヒーカップです。\r\n　彫りの部分では縞模様が不連続になり、模様の中にゆらぎや乱れが生まれています。とくにカップ上部では、その線がまるで風洞実験の気流が乱れる瞬間のように見えます。\r\n　この様から、銘を「風洞実験」としました。\r\n　静と動が共存するような、不思議な景色となっています。','coffee_cup','直径：約9.0cm (取っ手を除く)、約11.5cm (取っ手を含む)\r\n高さ：約8.0cm\r\n容量：約170cc (8割注水時)\r\n重さ：245g',9.0,11.5,8.0,245,170,'白土、黒土','外側：透明釉\r\n内側：黒天目','',1,'monotone','','','2024-12-21','2025-10-17 06:05:25',1),(36,'大地の鼓動','玉サボテン様練り込みコーヒーカップ「大地の鼓動」','　白土をベースに、赤土と黒土を練り込んだ独特の模様が特徴のカップです。玉サボテンからインスピレーションを得て、側面にはゆるやかに膨らんだ六角形の模様を彫り込み、高台は6本の足で支えるデザインに仕上げました。触れるたびに手に馴染む、心地よい質感を楽しめます。\r\n　内側には、艶やかな「黒天目」釉を施し、外側は透明釉で仕上げました。カップの口縁部分では、「黒天目」と透明釉が交じり合い、豹のような模様が生まれています。\r\n　練り込みによる地層のような同心円状の模様がぐるりとカップを一周する姿を、大地が静かに鼓動する様に見立て、「大地の鼓動」と名付けました。\r\n　大地の息吹を掌に収めたようなこのカップで、心落ち着くコーヒータイムをお楽しみください。','coffee_cup','直径：約9.0cm (取っ手を除く)、11cm (取っ手込み)\r\n高さ：約6.2cm\r\n容量：約150cc (8割注水時)\r\n重さ：194\r\n',9.0,11.0,6.2,194,150,'白土、赤土、黒土','外側：透明釉\r\n内側：黒天目','',1,'monotone','https://minne.com/items/42299435','https://www.instagram.com/p/DF5br47Tkg3/','2024-12-22','2025-10-16 03:54:26',1),(37,'ホワイトタイガー','玉サボテン様練り込みコーヒーカップ「ホワイトタイガー」','　白土と黒土を練り込み、玉サボテンからインスピレーションを得た模様を彫り込んだコーヒーカップです。\r\n　側面にはゆるやかに膨らんだ六角形の模様を施し、6本の足で支える高台が個性的なデザインを引き立てます。六角形の膨らみは、手にしっくりと馴染み、心地よい質感を楽しめます。\r\n　内側には「うのふ」という真っ白い釉薬を使用し、外側には「亀甲貫入」という、貫入（亀裂模様）が現れる釉薬を掛けています。この亀裂は、一点一点異なる表情を見せ、世界にひとつだけの個性的なカップに仕上がっています。\r\n透明釉の場合は白と黒のコントラストが強く出ますが、この「亀甲貫入」は、素地の色を柔らかく包み込み、白いフィルタを通したような、やわらかい色合いを生み出します。\r\n　その独特の色合いと模様から、「ホワイトタイガー」と名付けました。','coffee_cup','直径：約8.0cm (取っ手を除く)、10.5cm (取っ手込み)\r\n高さ：約8.4cm\r\n容量：約160cc (8割注水時)\r\n重さ：236g\r\n',8.0,10.5,8.4,236,160,'白土、黒土','外側：亀甲貫入\r\n内側：うのふ','',0,'monotone',NULL,'https://www.instagram.com/p/DGnhjBXTaRX/','2025-01-05','2025-09-24 15:38:10',1),(38,'鶉帯','部分練り込み小鉢「鶉帯」','　白土と黒土を練り込んだ模様を、帯状にめぐらせた小鉢です。\r\n　その帯模様を中心に、しのぎの技法で六角形の文様を彫り込み、リズムと立体感を加えました。模様を器全体に施すのではなく、あえて帯の部分に集中させることで、洗練された佇まいを意識しています。\r\n　器は4本足でしっかりと自立します。\r\n　本作は電動ろくろではなく、手びねりによって成形しています。そのため、形にわずかな歪みがあり、それがかえって温かみのある有機的な感触を生み出しています。\r\n　鶉の羽を思わせる模様を帯のように器がまとう姿から、「鶉帯（うずらおび）」と名付けました。\r\n　副菜を少し添えたり、お菓子や小物入れとしても楽しめるサイズ感です。','small_bowl','直径：約11.0cm\r\n高さ：約7.5cm\r\n容量：約180cc (8割注水時)\r\n重さ：257g\r\n',11.0,11.0,7.5,257,180,'白土、黒土','外側：乳濁\r\n内側：黒天目','',0,'monotone',NULL,'https://www.instagram.com/p/DIWgqjkz3lD/','2025-01-26','2025-09-24 16:20:54',1),(39,'凪の時間','玉サボテン様練り込みコーヒーカップ「凪の時間」','　穏やかな水面を思わせる、白と黒の静かなボーダー模様が印象的なコーヒーカップです。\r\n　白土と黒土の二色の粘土を練り合わせ、さらに側面をしのいで、六角形の模様を削り出しました。この模様は玉サボテンの陵を思わせるように、柔らかくふくらんでいます。\r\n　練り込みでは複雑な模様が現れることも多いのですが、このカップは穏やかな水平線になりました。\r\n　その落ち着いた佇まいから、『凪の時間』と名付けました。\r\n　コーヒーを飲みながら、静かに流れる自分だけの時間を楽しんでみませんか？','coffee_cup','直径：約9.5cm (取っ手を除く)、約12.5cm (取っ手を含む)\r\n高さ：約7.0cm\r\n容量：約160cc (8割注水時)\r\n重さ：232g',9.5,12.5,7.0,232,160,'白土、黒土','外側：透明釉\r\n内側：黒天目','',1,'monotone','https://minne.com/items/43768529','https://www.instagram.com/p/DN6_gUEk4iB/','2025-01-26','2025-10-16 03:55:33',1),(40,'墨流し','玉サボテン様練り込みコーヒーカップ「墨流し」','　白土と黒土を練り込んで成形し、玉サボテンをモチーフに六角形のふくらみを彫り込んだ、力強さとやわらかさを併せ持つコーヒーカップです。\r\n　外側には、細やかな貫入が入る貫入性志野釉を施しました。白土と黒土のコントラストは、釉薬の効果により、白はややクリーム色に、黒はグレーがかった柔らかな色調へと変化し、全体に穏やかな表情をもたらしています。\r\n　本体は短い円柱形で、6本の低い力強い脚でカップを支えています。安定感と同時に、独自の存在感を演出します。\r\n　内側には黒天目釉を使用しました。縁の部分では2種類の釉薬が重なり合って泡状の模様が生まれています。流れるような練り込み模様と、しのぎによって生まれた有機的な歪みの線。\r\n　その見た目が、日本の伝統的な染色技法「墨流し」を思わせることから、この作品に「墨流し」という銘をつけました。','coffee_cup','直径：約9.0cm (取っ手を除く)、約11.5cm (取っ手を含む)\r\n高さ：約7.0cm\r\n容量：約180cc (8割注水時)\r\n重さ：241g',9.0,11.5,7.0,241,180,'白土、黒土','外側：貫入性志乃\r\n内側：黒天目','',1,'monotone','https://minne.com/items/42866956','https://www.instagram.com/p/DIyqnpJzqjd/','2025-02-16','2025-09-24 15:38:52',1),(42,'冬のモモンガ','部分練り込みコーヒーカップ「冬のモモンガ」','　このカップでは、練り込みとしのぎの技法を部分的に取り入れています。\r\n　白土と黒土を組み合わせた練り込みは、側面の中央付近にとどめ、その部分を中心に、六角形を描くように、しのぎを加えました。あえて装飾を一部にとどめることで、控えめな印象となっています。\r\n　その上からは、厚みのある「亀甲貫入」の釉薬を掛けています。この釉薬により、白黒の練り込み模様は乳白色のヴェールに包まれるように柔らかくぼやけ、しのぎの稜線も滲むようにやさしく変化します。\r\n　高台の代わりに3本の小さな足をつけており、まるで小動物がちょこんと身をかがめているよう。その姿が、冬毛にくるまり木のうろで静かに休むモモンガを思わせることから、「冬のモモンガ」と名付けました。\r\n　日常のひとときに、森の中の小さな物語をそっと添えてくれるような、やさしい一品です。','coffee_cup','直径：約8.0cm (取っ手を除く)、約11.0cm (取っ手を含む)\r\n高さ：約8.0cm\r\n容量：約150cc (8割注水時)\r\n重さ：245g',8.0,11.0,8.0,245,150,'白土＋黒土','外側：亀甲貫入\r\n内側：黒天目','',1,'monotone','https://minne.com/items/43197758','https://www.instagram.com/p/DKpPIkQzhj4/','2025-02-16','2025-10-14 02:33:19',1),(43,'単調作業','サボテン金剛丸様練り込み中鉢「単調作業」','　白土と黒土を練り込み成形し、サボテン「金剛丸」のいぼをモチーフに、ピラミッド状の模様を側面全体に彫り込んだ中鉢です。\r\n　練り込みの縞模様を削ることで、それぞれのピラミッドに等高線のような文様が浮かび上がりました。しかし、このピラミッド、実に360個。  ひたすら彫るという、まさに「単調作業」……眠気に誘われながらも、一つひとつ丁寧に刻みました。\r\n　その甲斐あってか、この中鉢には独特のリズムと表情が生まれたように思います。銘は、制作過程からそのまま「単調作業」と名付けました。','medium_bowl','直径：約17.0cm\r\n高さ：9.5cm\r\n容量：約1,000cc (8割注水時)\r\n重さ：850g',17.0,17.5,9.5,850,1,'白土、黒土','外側：3号透明\r\n内側：黒天目','',0,'monotone',NULL,'https://www.instagram.com/p/DJMrjMJzm_P/','2025-03-22','2025-09-23 15:56:36',1),(44,'イソギンチャク','玉サボテン様練り込み中鉢「イソギンチャク」','　たっぷり900cc入る中鉢。\r\n　どっしりとした安定感があり、食卓の主役として存在感を放ちます。\r\n　白土と黒土を練り込んだ後、しのぎの技法で表面を削っています。この削りにより、模様はさらに複雑にゆがみ、有機的な表情に仕上がりました。削りのモチーフは玉サボテン。六角形のパターンは、それぞれが緩やかに盛り上がり、独特の手触りと立体感を生み出しています。\r\n　外側は、貫入性志野という釉薬を掛けています。わずかに不透明なこの釉薬は、白土と黒土のコントラストをやわらげ、全体を落ち着いた印象にまとめています。釉薬の特長でもある細かい貫入やピンホールが入ることで、どこか時間を重ねた器のような、静かな趣も感じさせます。また、内側の黒天目釉は、その深い黒が料理を引き立てます。\r\n　高台は9本の足で構成されており、器を裏返すと、まるでイソギンチャクのような姿に。銘はそのまま「イソギンチャク」としました。','medium_bowl','直径：約16.0cm\r\n高さ：約9.7cm\r\n容量：約900cc (8割注水時)\r\n重さ：936g',16.0,16.0,9.7,936,900,'白土、黒土','外側：貫入性志野\r\n内側：黒天目','',0,'monotone',NULL,'https://www.instagram.com/p/DJRtW5szHrx/','2025-04-13','2025-09-23 15:38:12',1),(45,'炎芯雪うずら','部分練り込みデミタスカップ「炎芯雪うずら」','　練り込みとしのぎの技法を組み合わせたコーヒーカップです。\r\n　白土と黒土を練り合わせていますが、その模様をカップの半分ほどに抑えました。模様のある部分と素地の白土部分が大きく二分され、ひとつの器に異なるふたつの表情が共存しています。\r\n　さらに、カップの側面全体には、サボテンの金剛丸をモチーフにしたピラミッド状の模様を彫り込んでおり、独特な立体感を楽しめます。\r\n　外側には「貫入性志野」という釉薬を使用。貫入と、黒土の上に浮かぶ小さな凹凸が、まるで永く風雪に晒されてきたかのような風合いを生み出しています。内側には「赤結晶」という釉薬を施しました。ゆらめく深紅の色彩は、雪の中に灯る「炎の芯」を思わせます。 \r\n　外側の練り込み模様が、雪景色にたたずむうずらの姿を連想させることと合わせ、銘を「炎芯雪うずら」としました。','demitasse_cup','直径：約8.0cm (取っ手を除く)、約10.5cm (取っ手を含む)\r\n高さ：約5.5cm\r\n容量：約125cc (8割注水時)\r\n重さ：167g',8.0,10.5,5.5,167,125,'白土、黒土','外側：貫入性志野\r\n内側：赤結晶','',0,'multicolour',NULL,'','2025-03-09','2025-10-14 15:35:06',1),(50,'うっかりヒョウモンダコ','玉サボテン様練り込みコーヒーカップ「うっかりヒョウモンダコ」','　深海に棲む猛毒のヒョウモンダコをモチーフにした作品です。\r\n　ヒョウモンダコは猛毒をもち、危険を知らせるために体表に鮮やかな青い輪紋を浮かび上がらせます。その姿を表現するために鮮やかなトルコブルーの粘土を使いましたが、少し落ち着いた雰囲気を出そうと貫入性志野を掛けたところ、警告色がぼんやりとした印象になりました。貫入性志野の特性をよく考えていれば、この釉薬を選ばなかったのに・・・ということで、銘は「うっかりヒョウモンダコ」にしました。\r\n　トルコブルー、ライトブラウン、ダークブラウンの3色の粘土を練り込み、カップの側面全体に六角形の模様を彫り込んでいます。高台は6本の足で表現しました。\r\n　こんな「うっかり」したコーヒーカップですが、毒はないので安心して毎日のコーヒーのお供にしてあげてください。','coffee_cup','直径：約8.5cm (取っ手を除く)、約11.0cm (取っ手を含む)\r\n高さ：約7.0cm\r\n容量：約150cc (8割注水時)\r\n重さ：202g',8.5,11.0,7.0,202,150,'カラー粘土：トルコブルー、ライトブラウン、ダークブラウン','外側：貫入性志野\r\n内側：黒天目','',1,'multicolour','https://minne.com/items/43841419','https://www.instagram.com/p/DOV3SO9kVUV/','2025-06-01','2025-09-23 15:57:47',1),(51,'島の精霊','玉サボテン様練り込みデミタスカップカップ「島の精霊」','　練り込みとしのぎの技法を組み合わせた、デミタスサイズのコーヒーカップです。\r\n　黒土と、比率を抑えた白土の練り込みにより、黒い背景に白の流線が浮かび上がります。\r\n　カップの側面には玉サボテンをイメージしてゆるやかに膨らんだ六角形を彫り込んでいます。このしのぎによって、器の表面に細かな凹凸が生まれます。\r\n白の流線は、しのぎの影響を受けて変化します。凹凸を避けるように曲がったり、途中で切り離されたり、時に中洲のように浮かんで見える箇所もあります。\r\n　高台は6本の脚で構成しました。やや内側に湾曲した脚は、大地を鷲掴みにしているような印象を与えます。\r\n　側面の模様が一見すると顔のようにも見えることがあります。その表情と器全体の雰囲気から、「島の精霊」と銘を付けました。','demitasse_cup','直径：約7.5cm (取っ手を除く)、約10.0cm (取っ手を含む)\r\n高さ：約7.5cm\r\n容量：約125cc (8割注水時)\r\n重さ：192g',7.5,10.0,7.5,192,125,'カラー粘土白25%＋黒75%','外側：3号透明\r\n内側：黒天目','',1,'monotone','https://minne.com/items/43197854','https://www.instagram.com/p/DL2b9keTIVn/','2025-06-01','2025-09-22 03:48:13',1),(52,'雪仔虎','玉サボテン様練り込みコーヒーカップ「雪仔虎」','　白土と黒土を練り込んで成形したコーヒーカップです。\r\n　側面には玉サボテンから着想を得た六角形の文様を彫り込みました。六角形はゆるやかに膨らみ、手に心地よく馴染みます。高台は6本の足になっています。ちょっと太めに作ってあるので、安定してカップを支えてくれます。\r\n　内側には真っ黒い「黒天目」を、外側には貫入が現れる「貫入性志野」を釉掛けしました。「貫入性志野」により練り込みの白土と黒土のコントラストが和らぎ、落ち着いた風合いになっています。\r\n　白と黒の模様がホワイトタイガーを思わせ、さらに太めの足は大きな動物の子供時代を想起させたので、銘を「雪仔虎」としました。','coffee_cup','直径：約9.0cm (取っ手を除く)、12.0cm (取っ手込み)\r\n高さ：約7.5cm\r\n容量：約150cc (8割注水時)\r\n重さ：222g',9.0,12.0,7.5,222,150,'カラー粘土の白75%＋黒25%','外側：貫入性志野\r\n内側：黒天目','',1,'monotone','https://minne.com/items/44109057','https://www.instagram.com/p/DNlXNHnTvkM/','2025-06-01','2025-10-16 03:56:44',1),(53,'しっかりヒョウモンダコ','玉サボテン様練り込みコーヒーカップ「しっかりヒョウモンダコ」','　深海に棲む猛毒のヒョウモンダコをモチーフにした作品です。\r\n　ヒョウモンダコは猛毒をもち、危険を知らせるために体表に鮮やかな青い輪紋を浮かび上がらせます。このカップでは、その警告色を表現するため、鮮やかなトルコブルーの粘土を使いました。そして、その青がしっかり見えるよう、透明釉を掛けました。しっかりトルコブルーが発色したので、銘は「しっかりヒョウモンダコ」です。\r\n(実は、以前、うっかり貫入性志野という釉薬を掛けてしまい、ぼんやりしたヒョウモンダコができたことがありました)\r\n　見た目は毒々しいかもしれませんが、もちろん毒はありません。安心して毎日のコーヒーのお供にしてあげてください。\r\n','coffee_cup','直径：約7.0cm (取っ手を除く)、約9.5cm (取っ手を含む)\r\n高さ：約7.0cm\r\n容量：約135cc (8割注水時)\r\n重さ：184g',7.0,9.5,7.0,184,135,'カラー粘土：トルコブルー、ライトブラウン、ダークブラウン','外側：3号透明\r\n内側：黒天目','',1,'multicolour','https://minne.com/items/43841520','https://www.instagram.com/albrecht1999/p/DOV40uREVVw/','2025-07-27','2025-09-23 15:26:20',1),(54,'冬の池、氷の泡','玉サボテン様練り込みコーヒーカップ「冬の池、氷の泡」','　寒い冬の池。氷の下をのぞき込むと、大きな泡の塊が氷に閉じ込められているのが見えます。急に気温が下がって、はじける前に凍ったのか、氷が厚く成長するのと一緒に泡も育ったのか・・・　本来すぐに消える泡が、氷に包まれ冬の間だけ姿をとどめている。その不思議な光景を思い浮かべ、このカップに「冬の池、氷の泡」と銘を付けました。\r\n　白土と黒土を練り込み、カップの側面には六角形の模様をしのぎました。\r\n　外側には亀甲貫入釉を掛けました。透明感のある釉の下から練り込み模様が透け、小さな気泡や貫入が自然の中の氷を思わせます。白と黒のコントラストは釉薬によって和らぎ、穏やかな表情を見せます。手に取れば、柔らかく、やさしい手触りです。\r\n　静かな氷の池を思わせるカップですが、温かいコーヒーのお供にいかがでしょうか？','coffee_cup','直径：約8.0cm (取っ手を除く)、約10.5cm (取っ手を含む)\r\n高さ：約7.0cm\r\n容量：約140cc (8割注水時)\r\n重さ：204g',8.0,10.5,7.0,204,140,'白土、黒土','外側：亀甲貫入\r\n内側：うのふ','',1,'monotone','https://minne.com/items/43925588','https://www.instagram.com/p/DO8ous2kbgM/','2025-08-03','2025-10-16 04:03:23',1),(55,'雪割りの奔流','玉サボテン様練り込みコーヒーカップ「雪割りの奔流」','　練り込みとしのぎの技法を組み合わせてつくったコーヒーカップです。植物の生命力をイメージし、グリーン・ピンク・イエローのカラー粘土を練り込み、さらにそれを白土で包みました。\r\n　当初、しのぎを入れることで、白土のあいだから花畑のような色彩がつつましく顔を出す姿を思い描いていたのですが、実際に削ってみると、白土が思いのほか残らず、内側の練り込み模様が勢いよくあふれ出してしまいました。結果として、雪割りの植物の息吹がほとばしるような、生命の奔流を感じさせるカップに仕上がりました。\r\n　しのぎのモチーフは玉サボテン。側面には6角形の模様を、膨らみを持たせながらていねいに彫り出しています。それに呼応するように、高台も6本の足で支える形としました。\r\n　残雪にも見える白土を押しのけ、内側からあふれる色。エネルギッシュな春の芽吹きを思わせる姿から、「雪割りの奔流」と名付けました。','coffee_cup','直径：約8.0cm (取っ手を除く)、約12.0cm (取っ手を含む)\r\n高さ：約7.0cm\r\n容量：約230cc (8割注水時)\r\n重さ：248g',8.0,12.0,7.0,248,230,'白土、カラー粘土(緑、ピンク、黄色)','外側：透明\r\n内側：黒天目','',1,'multicolour','https://minne.com/items/44109057','https://www.instagram.com/p/DP1VHX4klCE/','2025-08-03','2025-10-15 18:18:29',1);
/*!40000 ALTER TABLE `artworks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artworks_import_raw`
--

DROP TABLE IF EXISTS `artworks_import_raw`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `artworks_import_raw` (
  `id` int(11) DEFAULT NULL,
  `description_title` varchar(255) DEFAULT NULL,
  `categories` varchar(100) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `spec` longtext DEFAULT NULL,
  `width` decimal(5,1) DEFAULT NULL,
  `maxWidth` decimal(5,1) DEFAULT NULL,
  `height` decimal(5,1) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `capacity` int(11) DEFAULT NULL,
  `technique0` varchar(100) DEFAULT NULL,
  `technique1` varchar(100) DEFAULT NULL,
  `technique2` varchar(100) DEFAULT NULL,
  `clay` longtext DEFAULT NULL,
  `glaze` longtext DEFAULT NULL,
  `notes` longtext DEFAULT NULL,
  `in_stock` varchar(10) DEFAULT NULL,
  `url` varchar(500) DEFAULT NULL,
  `instagramUrl` varchar(500) DEFAULT NULL,
  `completionDate` varchar(20) DEFAULT NULL,
  `updateDate` varchar(20) DEFAULT NULL,
  `valid` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artworks_import_raw`
--

LOCK TABLES `artworks_import_raw` WRITE;
/*!40000 ALTER TABLE `artworks_import_raw` DISABLE KEYS */;
INSERT INTO `artworks_import_raw` VALUES (52,'玉サボテン様練り込みコーヒーカップ「雪仔虎」','coffee_cup','白土と黒土を練り込んで成形したコーヒーカップです。\r\n側面には玉サボテンから着想を得た六角形の文様を彫り込みました。\r\n六角形はゆるやかに膨らみ、手に心地よく馴染みます。\r\n高台は6本の足になっています。ちょっと太めに作ってあるので、安定してカップを支えてくれます。\r\n内側には真っ黒い「黒天目」を、外側には貫入が現れる「貫入性志野」を釉掛けしました。\r\n「貫入性志野」により練り込みの白土と黒土のコントラストが和らぎ、落ち着いた風合いになっています。\r\n白と黒の模様がホワイトタイガーを思わせ、さらに太めの足は大きな動物の子供時代を想起させたので、銘を「雪仔虎」としました。','雪仔虎','直径：約9.0cm (取っ手を除く)、12.0cm (取っ手込み)\r\n高さ：約7.5cm\r\n容量：約150cc (8割注水時)\r\n重さ：222g',9.0,12.0,7.5,222,150,'練り込み','しのぎ','','カラー粘土の白75%＋黒25%','外側：貫入性志野\n内側：黒天目','','1','https://minne.com/items/44109057','https://www.instagram.com/p/DNlXNHnTvkM/','2025/6/1','','1'),(39,'玉サボテン様練り込みコーヒーカップ「凪の時間」','coffee_cup','穏やかな水面を思わせる、白と黒の静かなボーダー模様が印象的なコーヒーカップです。\r\n白土と黒土の二色の粘土を練り合わせ、さらに側面をしのいで、六角形の模様を削り出しました。\r\nこの模様は玉サボテンの陵を思わせるように、柔らかくふくらんでいます。\r\n練り込みでは複雑な模様が現れることも多いのですが、このカップは穏やかな水平線になりました。\r\nその落ち着いた佇まいから、『凪の時間』と名付けました。\r\nコーヒーを飲みながら、静かに流れる自分だけの時間を楽しんでみませんか\r\n','凪の時間','直径：約9.5cm (取っ手を除く)、約12.5cm (取っ手を含む)\r\n高さ：約7.0cm\r\n容量：約160cc (8割注水時)\r\n重さ：232\r\n',9.5,12.5,7.0,232,160,'','','','','外側：3号透明\n内側：黒天目','','1','https://minne.com/items/43768529','https://www.instagram.com/p/DN6_gUEk4iB/','2025/1/26','','1'),(36,'玉サボテン様練り込みコーヒーカップ「大地の鼓動」','coffee_cup','白土をベースに、赤土と黒土を練り込んだ独特の模様が特徴のカップです。玉サボテンからインスピレーションを得て、側面にはゆるやかに膨らんだ六角形の模様を彫り込み、高台は6本の足で支えるデザインに仕上げました。触れるたびに手に馴染む、心地よい質感を楽しめます。\r\n内側には、艶やかな「黒天目」釉を施し、外側は透明釉で仕上げました。カップの口縁部分では、「黒天目」と透明釉が交じり合い、豹のような模様が生まれています。\r\n練り込みによる地層のような同心円状の模様がぐるりとカップを一周する姿を、大地が静かに鼓動する様に見立て、「大地の鼓動」と名付けました。\r\n大地の息吹を掌に収めたようなこのカップで、心落ち着くコーヒータイムをお楽しみください。','大地の鼓動','直径：約9.0cm (取っ手を除く)、11cm (取っ手込み)\r\n高さ：約6.2cm\r\n容量：約150cc (8割注水時)\r\n重さ：194\r\n',9.0,11.0,6.2,194,150,'','','','','外側：3号透明\n内側：黒天目','','1','https://minne.com/items/42299435','https://www.instagram.com/p/DF5br47Tkg3/','2024/12/22','','1');
/*!40000 ALTER TABLE `artworks_import_raw` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `slug` varchar(50) NOT NULL,
  `label_ja` varchar(100) NOT NULL,
  `label_en` varchar(100) NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `valid` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES ('coffee_cup','コーヒーカップ','Coffee Cup',1,1),('demitasse_cup','デミタスカップ','Demitasse Cup',2,1),('donburi','どんぶり','Donburi Bowl',11,1),('large_bowl','大鉢','Large Bowl',8,1),('large_plate','大皿','Large Plate',4,1),('medium_bowl','中鉢','Medium Bowl',9,1),('medium_plate','中皿','Medium Plate',5,1),('mosquito_coil_holder','蚊取り線香入れ','Mosquito Coil Holder',12,1),('pasta_plate','パスタ皿','Pasta Plate',7,1),('small_bowl','小鉢','Small Bowl',10,1),('small_plate','小皿','Small Plate',6,1),('soup_cup','スープカップ','Soup Cup',3,1);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coloring`
--

DROP TABLE IF EXISTS `coloring`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coloring` (
  `slug` varchar(50) NOT NULL,
  `label_ja` varchar(100) NOT NULL,
  `label_en` varchar(100) NOT NULL,
  `valid` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coloring`
--

LOCK TABLES `coloring` WRITE;
/*!40000 ALTER TABLE `coloring` DISABLE KEYS */;
INSERT INTO `coloring` VALUES ('monotone','モノトーン','Monotone',1),('multicolour','マルチカラー','Multicolour',1);
/*!40000 ALTER TABLE `coloring` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `colorings`
--

DROP TABLE IF EXISTS `colorings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `colorings` (
  `slug` varchar(50) NOT NULL,
  `label_ja` varchar(100) NOT NULL,
  `label_en` varchar(100) NOT NULL,
  `valid` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colorings`
--

LOCK TABLES `colorings` WRITE;
/*!40000 ALTER TABLE `colorings` DISABLE KEYS */;
INSERT INTO `colorings` VALUES ('monotone','モノトーン','Monotone',1),('multicolour','マルチカラー','Multicolour',1);
/*!40000 ALTER TABLE `colorings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `techniques`
--

DROP TABLE IF EXISTS `techniques`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `techniques` (
  `slug` varchar(50) NOT NULL,
  `label_ja` varchar(100) NOT NULL,
  `label_en` varchar(100) NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `valid` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `techniques`
--

LOCK TABLES `techniques` WRITE;
/*!40000 ALTER TABLE `techniques` DISABLE KEYS */;
INSERT INTO `techniques` VALUES ('nerikomi','練り込み','Nerikomi',1,1),('shinogi','しのぎ','Shinogi',2,1),('tebinari','手びねり','Handbuilding',3,1);
/*!40000 ALTER TABLE `techniques` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `updates`
--

DROP TABLE IF EXISTS `updates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `updates` (
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `article` text NOT NULL,
  `valid` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `updates`
--

LOCK TABLES `updates` WRITE;
/*!40000 ALTER TABLE `updates` DISABLE KEYS */;
INSERT INTO `updates` VALUES ('2025-09-24 22:33:35','サイトを作成しました。',1),('2025-09-24 22:34:42','更新情報機能を追加しました。',1),('2025-09-24 22:34:56','見た目を調整しました。',1),('2025-10-15 15:15:32','お問い合わせフォームを追加しました。',1),('2025-10-16 03:19:50','玉サボテン様練り込みコーヒーカップ「雪割りの奔流」を追加しました。',1);
/*!40000 ALTER TABLE `updates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` varchar(100) NOT NULL,
  `pw` varchar(100) NOT NULL,
  `role` varchar(100) DEFAULT NULL,
  `valid` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('sisiwaka_editor','$2y$10$SoyaepnRTbLupMp5.04T1OXYW6FGBSvAyOPhnBMxcqTUMWZhsTEYq',NULL,1);
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

-- Dump completed on 2025-10-17 15:18:28
