-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- ホスト: 127.0.0.1
-- 生成日時: 2025-10-15 08:16:07
-- サーバのバージョン： 10.4.32-MariaDB
-- PHP のバージョン: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- データベース: `sisiwaka_touen`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `updates`
--

CREATE TABLE `updates` (
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `article` text NOT NULL,
  `valid` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `updates`
--

INSERT INTO `updates` (`created_at`, `article`, `valid`) VALUES
('2025-09-24 22:33:35', 'サイトを作成しました。', 1),
('2025-09-24 22:34:42', '更新情報機能を追加しました。', 1),
('2025-09-24 22:34:56', '見た目を調整しました。', 1),
('2025-10-15 15:15:32', 'お問い合わせフォームを追加しました。', 1);

--
-- ダンプしたテーブルのインデックス
--

--
-- テーブルのインデックス `updates`
--
ALTER TABLE `updates`
  ADD PRIMARY KEY (`created_at`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
