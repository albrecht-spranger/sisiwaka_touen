-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- ホスト: 127.0.0.1
-- 生成日時: 2025-10-19 17:57:35
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
-- テーブルの構造 `artworks`
--

DROP TABLE IF EXISTS `artworks`;
CREATE TABLE IF NOT EXISTS `artworks` (
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
  KEY `fk_artworks_category` (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `artworks`
--

INSERT INTO `artworks` (`id`, `name`, `description_title`, `description`, `category`, `spec`, `width`, `max_width`, `height`, `weight`, `capacity`, `clay`, `glaze`, `notes`, `in_stock`, `coloring`, `shop_url`, `instagram_url`, `completion_date`, `update_date`, `valid`) VALUES
(1, '黒亀', '玉サボテン様コーヒーカップ「黒亀」', '玉サボテンの亀甲模様からインスピレーションを得たコーヒーカップです。\r\n6角形の模様がゆるやかに膨らんだ立体感のある仕上がりで、触れるたびにその繊細な質感を楽しむことができます。\r\nさらに、高台部分を6本の足のようにデザインし、遊び心をプラスしました。\r\n上に張り出した取っ手は、持ちやすさを考慮しつつ、デザインのアクセントにもなっています。\r\n艶やかな黒い地に、無数の油滴模様が広がり、見ていて飽きることのない魅力を放っています。\r\nこの独特なフォルムから「黒亀」と名付けました。', 'coffee_cup', '直径：約10cm (取っ手を除く)、12.5cm (取っ手込み)\r\n高さ：約8.5cm\r\n容量：約160cc (8割注水時)\r\n重さ：190g', NULL, NULL, NULL, NULL, NULL, '赤土', '油滴天目', '', 0, 'monotone', NULL, '', NULL, '2025-10-18 16:54:03', 1),
(3, '十二刻', '柱サボテン様コーヒーカップ「十二刻」', '柱サボテンをモチーフにしたコーヒーカップです。\r\nカップの側面全体に、柱サボテンの陵を思わせる立体模様を彫り込みました。\r\n外側は黒マット釉を施し、しっとりとした手触りと深みのある表情に。\r\n内側には白萩釉を掛けており、口縁では白萩と黒マットの釉薬が溶け合い、滴り落ちるような独特の模様が生まれました。\r\nこのカップの最大の特長は、円周に沿って並ぶ 12本の足。\r\nその姿がまるで時計の文字盤のように見えることから、「十二刻」と名付けました。\r\nあなたのコーヒーブレークが、ゆったりとした穏やかなひとときになりますように。\r\n「十二刻」とともに、心落ち着く時間をお楽しみください。', 'coffee_cup', '直径：約10cm (取っ手を除く)、12.5cm (取っ手込み)\r\n高さ：約6.5cm\r\n容量：約200cc (8割注水時)\r\n重さ：200g', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2023-10-20', '2025-10-18 16:27:00', 1),
(7, '玄武皿', '玉サボテン様12足黒マットパスタ皿「玄武皿」', '全体に6角形の模様が施され、それぞれの6角形が膨らむように彫刻されています。これはまるでサボテンの葉が太陽の光を浴びて膨らむ様子を再現したもの。高台の形も工夫され、12本の足で立つような形に仕上げられています。これはまるでサボテンが土地から根を張っているかのような迫力があります。\r\n\r\nそして、黒マットという釉薬で仕上げられたこのパスタ皿は、艶のない黒い器となっています。1つ1つの模様や足を削りだすのにはとても時間がかかり大変でしたが、その努力が実り、美しい仕上がりとなりました。\r\n\r\nこのパスタ皿を使えば、パスタを盛り付けるだけで、まるでサボテンの上に乗っているような気分になれます。サボテンの魔法が詰まったこのパスタ皿で、美味しいパスタを楽しんでください。', 'coffee_cup', '', NULL, NULL, NULL, NULL, NULL, '赤土', '黒マット', '', 0, 'monotone', NULL, '', '2023-10-06', '2025-10-18 16:54:55', 1),
(8, 'アルマジロ', 'サボテン菊水様コーヒーカップ「アルマジロ」', '　「菊水」というサボテンをモチーフに、しのぎの技法をで作ったコーヒーカップです。\r\n　カップの側面全体に、上向きのうろこ状の模様をレリーフ状に彫り込みました。彫り込んだ模様は滑らかに仕上げているため、指先でなぞると心地よい手触りです。\r\n　釉薬には「蕎麦」を使用しており、薄くかかった部分は深い茶色に、厚くかかった部分は明るい茶色の斑点模様が浮かび上がります。これにより、レリーフの形に沿って複雑な色の濃淡が生まれ、奥行きのある表情を楽しめます。\r\n　取っ手は幅広に作り、指をしっかり通せるため、安定感のある持ちやすさも魅力のひとつ。\r\n　サボテンをイメージして作りましたが、焼き上がるとその姿はまるでアルマジロの鎧のよう。そこで、このカップには「アルマジロ」という銘を付けました。', 'coffee_cup', '直径：約9.5cm (取っ手を除く)、11.5cm (取っ手込み)\r\n高さ：約7cm\r\n容量：約130cc (8割注水時)\r\n重さ：195g', NULL, NULL, NULL, NULL, NULL, '赤土', '蕎麦', '', 0, 'monotone', NULL, '', '2023-10-06', '2025-10-18 16:38:25', 1),
(20, '赫耀の秘光', '玉サボテン様しのぎマグカップ「赫耀の秘光」', '玉サボテンを模した六角形の彫り模様を施したマグカップです。\r\n外側には光沢を抑えた黒マット釉を使用し、落ち着いた佇まいを演出。\r\n対照的に、内側の赤結晶釉は周囲の光を反射し、まるで燃え立つ炎のような輝きを放ちます。\r\nカップを手に、外側から中を覗くと、暗闇の奥から鋭い赤の光が目に飛び込んできます。\r\n静寂の黒に秘められた鮮烈な輝きの美しさを映し、「赫耀の秘光」と名付けました。\r\n光と影が織りなす表情を、ぜひ手に取ってご堪能ください。', 'coffee_cup', '直径：約10.5cm (取っ手を除く)、約13.0cm (取っ手を含む)\r\n高さ：約8.5cm\r\n容量：約260cc (8割注水時)\r\n重さ：234g', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, '2024-09-22', '2025-10-18 16:27:00', 1),
(21, 'モアレ', '玉サボテン様練り込みコーヒーカップ「モアレ」', 'これも玉サボテンをモチーフにしたコーヒーカップです。\r\n普段は白土や赤土など1種類の土で作っていますが、今回は「練り込み」の技法でカップの形を作ってから、サボテンの形に削ってみました。\r\n赤土と黒土の2つの粘土を使っています。練り込みなので、カップの表面に2つの粘土の縞模様ができますが、これを削ると、削った深さに応じて、さらに別の模様が出てきます。これがとても面白い模様になりました。\r\nモアレ模様に見えるので、作品名を「モアレ」としました。\r\n全体に「12番石灰」という透明釉をかけています。', 'coffee_cup', '直径：約9.0cm (取っ手を除く)、約11.0cm (取っ手を含む)\r\n高さ：約6.5cm\r\n容量：約150cc (8割注水時)\r\n重さ：189g', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2024-09-29', '2025-10-18 16:27:00', 1),
(22, '雲海のピラミッド', 'サボテン金剛丸様練り込みコーヒーカップ「雲海のピラミッド」', '玉サボテンをモチーフにしたコーヒーカップです。\r\nでも、出来上がった印象は、小さなパイナップルです(笑)。\r\n赤土と黒土で「練り込み」の技法でカップの形を作ってから、小さなピラミッド状の模様をカップ側面全体につけました。削ることにより、等高線、あるいは、地層のような縞模様が表面に浮かびました。\r\n全体に「12番石灰」という透明釉をかけています。\r\n透明釉ですが、厚くかかると白い膜のようになります。このカップでは、削ったピラミッドとピラミッドの間の溝に厚くかかりました。その見た目の印象から、銘を「雲海のピラミッド」としました。', 'coffee_cup', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2024-10-06', '2025-10-18 16:27:00', 1),
(25, '翠紅碗', '玉サボテン様乳濁赤結晶どんぶり「翠紅碗」', 'サボテンをモチーフにしたどんぶりです。\r\n外側には、サボテンを模した6角形の模様を彫り込んでいます。\r\nその模様に合わせ、高台を6本の足にしました。6本足で立つ様が少しだけかわいいです。\r\n外側は乳濁という、どちらかというと地味に見える緑色の釉薬を、内側は赤結晶という派手な紅色の釉薬をかけています。\r\n風雪に耐えるサボテンの、外皮は地味で目立たないのに、内部はみずみずしい感じを表現し、銘を「翠紅碗」としました。', 'coffee_cup', '直径：約15.0cm\r\n高さ：約8.0cm\r\n容量：約400cc (8割注水時)\r\n重さ：350g', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '2025-10-18 16:27:00', 1),
(26, '目覚めのフクロウ', '玉サボテン様練り込みコーヒーカップ「目覚めのフクロウ」', '赤土と黒土を練り込み、玉サボテンからインスピレーションを得た六角形の模様を彫り込んだコーヒーカップです。\r\n高台は6本のスリムな足で支えられ、個性的なフォルムが際立ちます。\r\n土の自然な色彩と練り込みの美しい模様を引き立てるため、釉薬には透明釉を使用しました。\r\n銘は 「目覚めのフクロウ」。\r\nしのぎによって変化した練り込みの模様が、まるで寝ぼけまなこのフクロウのよう。\r\n手に取るたびに、眠たげな表情のフクロウと目が合い、やさしく穏やかなコーヒーの時間を演出してくれます。', 'coffee_cup', '直径：約8.5cm (取っ手を除く)、約10.5cm (取っ手を含む)\r\n高さ：約8.3cm\r\n容量：約180cc (8割注水時)\r\n重さ：192g', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2024-10-20', '2025-10-18 16:27:00', 1),
(27, '瑪瑙環', 'サボテン様練り込みコーヒーカップ「瑪瑙環」', '白土と黒土を練り込み成形し、全体に細かいピラミッド型の模様を彫り込んだコーヒーカップです。練り込みによって生まれる独特の縞模様を削ることでさらに表情豊かな模様の妙が生まれます。\r\nデザインのモチーフは、サボテンの金剛丸。側面全体に深く刻み込んだピラミッド状のしのぎ模様が、形にメリハリを与え、手に取ったときの感触も楽しめます。\r\n仕上げには透明釉を施し、練り込み模様の美しさを引き立てました。カップ全体に広がる同心円状の模様が、瑪瑙の層を思わせることから「瑪瑙環」と名付けました。', 'coffee_cup', '直径：約8.5cm (取っ手を除く)、11cm (取っ手込み)\r\n高さ：約6.8cm\r\n容量：約160cc (8割注水時)\r\n重さ：199g', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, '2024-10-27', '2025-10-18 16:27:00', 1),
(28, '瑪瑙晶', '玉サボテン様練り込みコーヒーカップ「瑪瑙晶」', 'No.027「瑪瑙環」と同じく、白土と黒土を練り込んで成形したコーヒーカップです。\r\nただし本作では、カップの外側に玉サボテンをモチーフとした六角形のふくらみを彫り込みました。\r\n削ったことで、思いがけない模様が現れました。\r\nまるで「日」という字を重ねたような模様です。\r\n漢字にすると「晶」でしょうか？\r\nそこで、このカップに「瑪瑙晶（めのうしょう）」という銘を付けました。', 'coffee_cup', '直径：約8.0cm (取っ手を除く)、約11.0cm (取っ手を含む)\r\n高さ：約7.5cm\r\n容量：約140cc (8割注水時)\r\n重さ：205g', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2024-11-03', '2025-10-18 16:27:00', 1),
(29, '瑪瑙墨', '玉サボテン様練り込みコーヒーカップ「瑪瑙墨」', '練り込みとしのぎの技法を組み合わせたコーヒーカップです。\r\n白土と黒土を重ねて成形した素地に、六角形の模様を一つひとつ彫り込んでいます。\r\nそれぞれの六角形はゆるやかに膨らんでおり、削りの深さによって模様に揺らぎが生まれています。\r\nカップの内側には「黒天目」という艶やかな黒の釉薬を掛けました。\r\nこの黒が外側の模様を際立たせ、カップ全体の印象を引き締めています。\r\n練り込みによって現れた縞模様が瑪瑙石を思わせ、内側の黒が墨のように見えることから「瑪瑙墨」という銘にしました。', 'coffee_cup', '直径：約7.5cm (取っ手を除く)、約10.5cm (取っ手を含む)\r\n高さ：約8.0cm\r\n容量：約140cc (8割注水時)\r\n重さ：208g', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2024-11-10', '2025-10-18 16:27:00', 1),
(30, '雪墨嶺', 'サボテン金剛丸様練り込み中鉢「雪墨嶺」', '　玉サボテンをモチーフに、側面いっぱいにピラミッド型の模様を彫り込みました。\r\n　白と黒の粘土の練り込みにより生み出された等高線のような縞模様が特長の中鉢です。\r\n　ひと山ひと山、手作業で彫り込んだ模様が山並みのように連なります。\r\n　その姿から、「雪墨嶺（せつぼくれい）」という銘を付けました。', 'medium_bowl', '直径：約13.0cm\r\n高さ：約7.4cm\r\n容量：約400cc (8割注水時)\r\n重さ：378g', NULL, NULL, NULL, NULL, NULL, '白土、黒土', '透明釉', '', 1, 'monotone', '', '', '2024-11-17', '2025-10-18 16:45:30', 1),
(33, '風洞実験', 'ハウォルチア様練り込みコーヒーカップ「風洞実験」', '　白土と黒土を練り込んで生まれた縞模様の素地に、ハオルチアの葉を思わせる上向きの三角形模様を彫り込んだコーヒーカップです。\r\n　彫りの部分では縞模様が不連続になり、模様の中にゆらぎや乱れが生まれています。とくにカップ上部では、その線がまるで風洞実験の気流が乱れる瞬間のように見えます。\r\n　この様から、銘を「風洞実験」としました。\r\n　静と動が共存するような、不思議な景色となっています。', 'coffee_cup', '直径：約9.0cm (取っ手を除く)、約11.5cm (取っ手を含む)\r\n高さ：約8.0cm\r\n容量：約170cc (8割注水時)\r\n重さ：245g', 9.0, 11.5, 8.0, 245, 170, '白土、黒土', '外側：透明釉\r\n内側：黒天目', '', 1, 'monotone', '', '', '2024-12-21', '2025-10-17 06:05:25', 1),
(34, '牡蠣の群生', 'ねじり金剛丸様練り込みコーヒーカップ「牡蠣の群生」', '練り込みとしのぎの技法を組み合わせたデミタスカップです。\r\n白土と黒土を使った練り込みの素地に、ピラミッド型の模様を削りだしたのですが、正方形ではなく、長方形を傾けた形で削ってみました。\r\nピラミッドの高さにより等高線のように白と黒の縞模様があらわれ、おもしろい見た目になりましたが、1つ1つの模様が牡蠣が並んでいるように見えたので、銘は「牡蠣の群生」としました。\r\nサイズはやや小さめです。', 'coffee_cup', '直径：約7.0cm (取っ手を除く)、約10.0cm (取っ手を含む)\r\n高さ：約7.4cm\r\n容量：約100cc (8割注水時)\r\n重さ：176g', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2024-12-08', '2025-10-18 16:27:00', 1),
(35, '土のリズム', '柱サボテン様練り込みコーヒーカップ「土のリズム」', '柱サボテンの縦に並ぶ陵（りょう）からインスピレーションを得たコーヒーカップです。\r\n白土と赤土を使った「練り込み」の技法で独特の模様を生み出し、さらに「しのぎ」の技法で柱サボテンのような立体感を表現しました。\r\n内側には「うのふ」という白い釉薬、外側は透明釉を掛けています。カップの口縁には2つの釉薬が混ざり合い、波紋のような模様が生まれています。\r\n側面の模様が地層のように見え、それが等間隔に柱状に並ぶので「土のリズム」と名付けました。\r\n大地を掌に収めたようなこのカップで、心落ち着くコーヒータイムをお過ごしください。', 'coffee_cup', '直径：約9.5cm (取っ手を除く)、12cm (取っ手込み)\r\n高さ：約5.3cm\r\n容量：約140cc (8割注水時)\r\n重さ：205g', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, '2024-12-15', '2025-10-18 16:27:00', 1),
(36, '大地の鼓動', '玉サボテン様練り込みコーヒーカップ「大地の鼓動」', '　白土をベースに、赤土と黒土を練り込んだ独特の模様が特徴のカップです。玉サボテンからインスピレーションを得て、側面にはゆるやかに膨らんだ六角形の模様を彫り込み、高台は6本の足で支えるデザインに仕上げました。触れるたびに手に馴染む、心地よい質感を楽しめます。\r\n　内側には、艶やかな「黒天目」釉を施し、外側は透明釉で仕上げました。カップの口縁部分では、「黒天目」と透明釉が交じり合い、豹のような模様が生まれています。\r\n　練り込みによる地層のような同心円状の模様がぐるりとカップを一周する姿を、大地が静かに鼓動する様に見立て、「大地の鼓動」と名付けました。\r\n　大地の息吹を掌に収めたようなこのカップで、心落ち着くコーヒータイムをお楽しみください。', 'coffee_cup', '直径：約9.0cm (取っ手を除く)、11cm (取っ手込み)\r\n高さ：約6.2cm\r\n容量：約150cc (8割注水時)\r\n重さ：194\r\n', 9.0, 11.0, 6.2, 194, 150, '白土、赤土、黒土', '外側：透明釉\r\n内側：黒天目', '', 1, 'monotone', 'https://minne.com/items/42299435', 'https://www.instagram.com/p/DF5br47Tkg3/', '2024-12-22', '2025-10-16 03:54:26', 1),
(37, 'ホワイトタイガー', '玉サボテン様練り込みコーヒーカップ「ホワイトタイガー」', '　白土と黒土を練り込み、玉サボテンからインスピレーションを得た模様を彫り込んだコーヒーカップです。\r\n　側面にはゆるやかに膨らんだ六角形の模様を施し、6本の足で支える高台が個性的なデザインを引き立てます。六角形の膨らみは、手にしっくりと馴染み、心地よい質感を楽しめます。\r\n　内側には「うのふ」という真っ白い釉薬を使用し、外側には「亀甲貫入」という、貫入（亀裂模様）が現れる釉薬を掛けています。この亀裂は、一点一点異なる表情を見せ、世界にひとつだけの個性的なカップに仕上がっています。\r\n透明釉の場合は白と黒のコントラストが強く出ますが、この「亀甲貫入」は、素地の色を柔らかく包み込み、白いフィルタを通したような、やわらかい色合いを生み出します。\r\n　その独特の色合いと模様から、「ホワイトタイガー」と名付けました。', 'coffee_cup', '直径：約8.0cm (取っ手を除く)、10.5cm (取っ手込み)\r\n高さ：約8.4cm\r\n容量：約160cc (8割注水時)\r\n重さ：236g\r\n', 8.0, 10.5, 8.4, 236, 160, '白土、黒土', '外側：亀甲貫入\r\n内側：うのふ', '', 0, 'monotone', NULL, 'https://www.instagram.com/p/DGnhjBXTaRX/', '2025-01-05', '2025-09-24 15:38:10', 1),
(38, '鶉帯', '部分練り込み小鉢「鶉帯」', '　白土と黒土を練り込んだ模様を、帯状にめぐらせた小鉢です。\r\n　その帯模様を中心に、しのぎの技法で六角形の文様を彫り込み、リズムと立体感を加えました。模様を器全体に施すのではなく、あえて帯の部分に集中させることで、洗練された佇まいを意識しています。\r\n　器は4本足でしっかりと自立します。\r\n　本作は電動ろくろではなく、手びねりによって成形しています。そのため、形にわずかな歪みがあり、それがかえって温かみのある有機的な感触を生み出しています。\r\n　鶉の羽を思わせる模様を帯のように器がまとう姿から、「鶉帯（うずらおび）」と名付けました。\r\n　副菜を少し添えたり、お菓子や小物入れとしても楽しめるサイズ感です。', 'small_bowl', '直径：約11.0cm\r\n高さ：約7.5cm\r\n容量：約180cc (8割注水時)\r\n重さ：257g\r\n', 11.0, 11.0, 7.5, 257, 180, '白土、黒土', '外側：乳濁\r\n内側：黒天目', '', 0, 'monotone', NULL, 'https://www.instagram.com/p/DIWgqjkz3lD/', '2025-01-26', '2025-09-24 16:20:54', 1),
(39, '凪の時間', '玉サボテン様練り込みコーヒーカップ「凪の時間」', '　穏やかな水面を思わせる、白と黒の静かなボーダー模様が印象的なコーヒーカップです。\r\n　白土と黒土の二色の粘土を練り合わせ、さらに側面をしのいで、六角形の模様を削り出しました。この模様は玉サボテンの陵を思わせるように、柔らかくふくらんでいます。\r\n　練り込みでは複雑な模様が現れることも多いのですが、このカップは穏やかな水平線になりました。\r\n　その落ち着いた佇まいから、『凪の時間』と名付けました。\r\n　コーヒーを飲みながら、静かに流れる自分だけの時間を楽しんでみませんか？', 'coffee_cup', '直径：約9.5cm (取っ手を除く)、約12.5cm (取っ手を含む)\r\n高さ：約7.0cm\r\n容量：約160cc (8割注水時)\r\n重さ：232g', 9.5, 12.5, 7.0, 232, 160, '白土、黒土', '外側：透明釉\r\n内側：黒天目', '', 1, 'monotone', 'https://minne.com/items/43768529', 'https://www.instagram.com/p/DN6_gUEk4iB/', '2025-01-26', '2025-10-16 03:55:33', 1),
(40, '墨流し', '玉サボテン様練り込みコーヒーカップ「墨流し」', '　白土と黒土を練り込んで成形し、玉サボテンをモチーフに六角形のふくらみを彫り込んだ、力強さとやわらかさを併せ持つコーヒーカップです。\r\n　外側には、細やかな貫入が入る貫入性志野釉を施しました。白土と黒土のコントラストは、釉薬の効果により、白はややクリーム色に、黒はグレーがかった柔らかな色調へと変化し、全体に穏やかな表情をもたらしています。\r\n　本体は短い円柱形で、6本の低い力強い脚でカップを支えています。安定感と同時に、独自の存在感を演出します。\r\n　内側には黒天目釉を使用しました。縁の部分では2種類の釉薬が重なり合って泡状の模様が生まれています。流れるような練り込み模様と、しのぎによって生まれた有機的な歪みの線。\r\n　その見た目が、日本の伝統的な染色技法「墨流し」を思わせることから、この作品に「墨流し」という銘をつけました。', 'coffee_cup', '直径：約9.0cm (取っ手を除く)、約11.5cm (取っ手を含む)\r\n高さ：約7.0cm\r\n容量：約180cc (8割注水時)\r\n重さ：241g', 9.0, 11.5, 7.0, 241, 180, '白土、黒土', '外側：貫入性志乃\r\n内側：黒天目', '', 1, 'monotone', 'https://minne.com/items/42866956', 'https://www.instagram.com/p/DIyqnpJzqjd/', '2025-02-16', '2025-09-24 15:38:52', 1),
(42, '冬のモモンガ', '部分練り込みコーヒーカップ「冬のモモンガ」', '　このカップでは、練り込みとしのぎの技法を部分的に取り入れています。\r\n　白土と黒土を組み合わせた練り込みは、側面の中央付近にとどめ、その部分を中心に、六角形を描くように、しのぎを加えました。あえて装飾を一部にとどめることで、控えめな印象となっています。\r\n　その上からは、厚みのある「亀甲貫入」の釉薬を掛けています。この釉薬により、白黒の練り込み模様は乳白色のヴェールに包まれるように柔らかくぼやけ、しのぎの稜線も滲むようにやさしく変化します。\r\n　高台の代わりに3本の小さな足をつけており、まるで小動物がちょこんと身をかがめているよう。その姿が、冬毛にくるまり木のうろで静かに休むモモンガを思わせることから、「冬のモモンガ」と名付けました。\r\n　日常のひとときに、森の中の小さな物語をそっと添えてくれるような、やさしい一品です。', 'coffee_cup', '直径：約8.0cm (取っ手を除く)、約11.0cm (取っ手を含む)\r\n高さ：約8.0cm\r\n容量：約150cc (8割注水時)\r\n重さ：245g', 8.0, 11.0, 8.0, 245, 150, '白土＋黒土', '外側：亀甲貫入\r\n内側：黒天目', '', 1, 'monotone', 'https://minne.com/items/43197758', 'https://www.instagram.com/p/DKpPIkQzhj4/', '2025-02-16', '2025-10-14 02:33:19', 1),
(43, '単調作業', 'サボテン金剛丸様練り込み中鉢「単調作業」', '　白土と黒土を練り込み成形し、サボテン「金剛丸」のいぼをモチーフに、ピラミッド状の模様を側面全体に彫り込んだ中鉢です。\r\n　練り込みの縞模様を削ることで、それぞれのピラミッドに等高線のような文様が浮かび上がりました。しかし、このピラミッド、実に360個。  ひたすら彫るという、まさに「単調作業」……眠気に誘われながらも、一つひとつ丁寧に刻みました。\r\n　その甲斐あってか、この中鉢には独特のリズムと表情が生まれたように思います。銘は、制作過程からそのまま「単調作業」と名付けました。', 'medium_bowl', '直径：約17.0cm\r\n高さ：9.5cm\r\n容量：約1,000cc (8割注水時)\r\n重さ：850g', 17.0, 17.5, 9.5, 850, 1, '白土、黒土', '外側：3号透明\r\n内側：黒天目', '', 0, 'monotone', NULL, 'https://www.instagram.com/p/DJMrjMJzm_P/', '2025-03-22', '2025-09-23 15:56:36', 1),
(44, 'イソギンチャク', '玉サボテン様練り込み中鉢「イソギンチャク」', '　たっぷり900cc入る中鉢。\r\n　どっしりとした安定感があり、食卓の主役として存在感を放ちます。\r\n　白土と黒土を練り込んだ後、しのぎの技法で表面を削っています。この削りにより、模様はさらに複雑にゆがみ、有機的な表情に仕上がりました。削りのモチーフは玉サボテン。六角形のパターンは、それぞれが緩やかに盛り上がり、独特の手触りと立体感を生み出しています。\r\n　外側は、貫入性志野という釉薬を掛けています。わずかに不透明なこの釉薬は、白土と黒土のコントラストをやわらげ、全体を落ち着いた印象にまとめています。釉薬の特長でもある細かい貫入やピンホールが入ることで、どこか時間を重ねた器のような、静かな趣も感じさせます。また、内側の黒天目釉は、その深い黒が料理を引き立てます。\r\n　高台は9本の足で構成されており、器を裏返すと、まるでイソギンチャクのような姿に。銘はそのまま「イソギンチャク」としました。', 'medium_bowl', '直径：約16.0cm\r\n高さ：約9.7cm\r\n容量：約900cc (8割注水時)\r\n重さ：936g', 16.0, 16.0, 9.7, 936, 900, '白土、黒土', '外側：貫入性志野\r\n内側：黒天目', '', 0, 'monotone', NULL, 'https://www.instagram.com/p/DJRtW5szHrx/', '2025-04-13', '2025-09-23 15:38:12', 1),
(45, '炎芯雪うずら', '部分練り込みデミタスカップ「炎芯雪うずら」', '　練り込みとしのぎの技法を組み合わせたコーヒーカップです。\r\n　白土と黒土を練り合わせていますが、その模様をカップの半分ほどに抑えました。模様のある部分と素地の白土部分が大きく二分され、ひとつの器に異なるふたつの表情が共存しています。\r\n　さらに、カップの側面全体には、サボテンの金剛丸をモチーフにしたピラミッド状の模様を彫り込んでおり、独特な立体感を楽しめます。\r\n　外側には「貫入性志野」という釉薬を使用。貫入と、黒土の上に浮かぶ小さな凹凸が、まるで永く風雪に晒されてきたかのような風合いを生み出しています。内側には「赤結晶」という釉薬を施しました。ゆらめく深紅の色彩は、雪の中に灯る「炎の芯」を思わせます。 \r\n　外側の練り込み模様が、雪景色にたたずむうずらの姿を連想させることと合わせ、銘を「炎芯雪うずら」としました。', 'demitasse_cup', '直径：約8.0cm (取っ手を除く)、約10.5cm (取っ手を含む)\r\n高さ：約5.5cm\r\n容量：約125cc (8割注水時)\r\n重さ：167g', 8.0, 10.5, 5.5, 167, 125, '白土、黒土', '外側：貫入性志野\r\n内側：赤結晶', '', 0, 'multicolour', NULL, '', '2025-03-09', '2025-10-14 15:35:06', 1),
(50, 'うっかりヒョウモンダコ', '玉サボテン様練り込みコーヒーカップ「うっかりヒョウモンダコ」', '　深海に棲む猛毒のヒョウモンダコをモチーフにした作品です。\r\n　ヒョウモンダコは猛毒をもち、危険を知らせるために体表に鮮やかな青い輪紋を浮かび上がらせます。その姿を表現するために鮮やかなトルコブルーの粘土を使いましたが、少し落ち着いた雰囲気を出そうと貫入性志野を掛けたところ、警告色がぼんやりとした印象になりました。貫入性志野の特性をよく考えていれば、この釉薬を選ばなかったのに・・・ということで、銘は「うっかりヒョウモンダコ」にしました。\r\n　トルコブルー、ライトブラウン、ダークブラウンの3色の粘土を練り込み、カップの側面全体に六角形の模様を彫り込んでいます。高台は6本の足で表現しました。\r\n　こんな「うっかり」したコーヒーカップですが、毒はないので安心して毎日のコーヒーのお供にしてあげてください。', 'coffee_cup', '直径：約8.5cm (取っ手を除く)、約11.0cm (取っ手を含む)\r\n高さ：約7.0cm\r\n容量：約150cc (8割注水時)\r\n重さ：202g', 8.5, 11.0, 7.0, 202, 150, 'カラー粘土：トルコブルー、ライトブラウン、ダークブラウン', '外側：貫入性志野\r\n内側：黒天目', '', 1, 'multicolour', 'https://minne.com/items/43841419', 'https://www.instagram.com/p/DOV3SO9kVUV/', '2025-06-01', '2025-09-23 15:57:47', 1),
(51, '島の精霊', '玉サボテン様練り込みデミタスカップカップ「島の精霊」', '　練り込みとしのぎの技法を組み合わせた、デミタスサイズのコーヒーカップです。\r\n　黒土と、比率を抑えた白土の練り込みにより、黒い背景に白の流線が浮かび上がります。\r\n　カップの側面には玉サボテンをイメージしてゆるやかに膨らんだ六角形を彫り込んでいます。このしのぎによって、器の表面に細かな凹凸が生まれます。\r\n白の流線は、しのぎの影響を受けて変化します。凹凸を避けるように曲がったり、途中で切り離されたり、時に中洲のように浮かんで見える箇所もあります。\r\n　高台は6本の脚で構成しました。やや内側に湾曲した脚は、大地を鷲掴みにしているような印象を与えます。\r\n　側面の模様が一見すると顔のようにも見えることがあります。その表情と器全体の雰囲気から、「島の精霊」と銘を付けました。', 'demitasse_cup', '直径：約7.5cm (取っ手を除く)、約10.0cm (取っ手を含む)\r\n高さ：約7.5cm\r\n容量：約125cc (8割注水時)\r\n重さ：192g', 7.5, 10.0, 7.5, 192, 125, 'カラー粘土白25%＋黒75%', '外側：3号透明\r\n内側：黒天目', '', 1, 'monotone', 'https://minne.com/items/43197854', 'https://www.instagram.com/p/DL2b9keTIVn/', '2025-06-01', '2025-09-22 03:48:13', 1),
(52, '雪仔虎', '玉サボテン様練り込みコーヒーカップ「雪仔虎」', '　白土と黒土を練り込んで成形したコーヒーカップです。\r\n　側面には玉サボテンから着想を得た六角形の文様を彫り込みました。六角形はゆるやかに膨らみ、手に心地よく馴染みます。高台は6本の足になっています。ちょっと太めに作ってあるので、安定してカップを支えてくれます。\r\n　内側には真っ黒い「黒天目」を、外側には貫入が現れる「貫入性志野」を釉掛けしました。「貫入性志野」により練り込みの白土と黒土のコントラストが和らぎ、落ち着いた風合いになっています。\r\n　白と黒の模様がホワイトタイガーを思わせ、さらに太めの足は大きな動物の子供時代を想起させたので、銘を「雪仔虎」としました。', 'coffee_cup', '直径：約9.0cm (取っ手を除く)、12.0cm (取っ手込み)\r\n高さ：約7.5cm\r\n容量：約150cc (8割注水時)\r\n重さ：222g', 9.0, 12.0, 7.5, 222, 150, 'カラー粘土の白75%＋黒25%', '外側：貫入性志野\r\n内側：黒天目', '', 1, 'monotone', 'https://minne.com/items/44109057', 'https://www.instagram.com/p/DNlXNHnTvkM/', '2025-06-01', '2025-10-16 03:56:44', 1),
(53, 'しっかりヒョウモンダコ', '玉サボテン様練り込みコーヒーカップ「しっかりヒョウモンダコ」', '　深海に棲む猛毒のヒョウモンダコをモチーフにした作品です。\r\n　ヒョウモンダコは猛毒をもち、危険を知らせるために体表に鮮やかな青い輪紋を浮かび上がらせます。このカップでは、その警告色を表現するため、鮮やかなトルコブルーの粘土を使いました。そして、その青がしっかり見えるよう、透明釉を掛けました。しっかりトルコブルーが発色したので、銘は「しっかりヒョウモンダコ」です。\r\n(実は、以前、うっかり貫入性志野という釉薬を掛けてしまい、ぼんやりしたヒョウモンダコができたことがありました)\r\n　見た目は毒々しいかもしれませんが、もちろん毒はありません。安心して毎日のコーヒーのお供にしてあげてください。\r\n', 'coffee_cup', '直径：約7.0cm (取っ手を除く)、約9.5cm (取っ手を含む)\r\n高さ：約7.0cm\r\n容量：約135cc (8割注水時)\r\n重さ：184g', 7.0, 9.5, 7.0, 184, 135, 'カラー粘土：トルコブルー、ライトブラウン、ダークブラウン', '外側：3号透明\r\n内側：黒天目', '', 1, 'multicolour', 'https://minne.com/items/43841520', 'https://www.instagram.com/albrecht1999/p/DOV40uREVVw/', '2025-07-27', '2025-09-23 15:26:20', 1),
(54, '冬の池、氷の泡', '玉サボテン様練り込みコーヒーカップ「冬の池、氷の泡」', '　寒い冬の池。氷の下をのぞき込むと、大きな泡の塊が氷に閉じ込められているのが見えます。急に気温が下がって、はじける前に凍ったのか、氷が厚く成長するのと一緒に泡も育ったのか・・・　本来すぐに消える泡が、氷に包まれ冬の間だけ姿をとどめている。その不思議な光景を思い浮かべ、このカップに「冬の池、氷の泡」と銘を付けました。\r\n　白土と黒土を練り込み、カップの側面には六角形の模様をしのぎました。\r\n　外側には亀甲貫入釉を掛けました。透明感のある釉の下から練り込み模様が透け、小さな気泡や貫入が自然の中の氷を思わせます。白と黒のコントラストは釉薬によって和らぎ、穏やかな表情を見せます。手に取れば、柔らかく、やさしい手触りです。\r\n　静かな氷の池を思わせるカップですが、温かいコーヒーのお供にいかがでしょうか？', 'coffee_cup', '直径：約8.0cm (取っ手を除く)、約10.5cm (取っ手を含む)\r\n高さ：約7.0cm\r\n容量：約140cc (8割注水時)\r\n重さ：204g', 8.0, 10.5, 7.0, 204, 140, '白土、黒土', '外側：亀甲貫入\r\n内側：うのふ', '', 1, 'monotone', 'https://minne.com/items/43925588', 'https://www.instagram.com/p/DO8ous2kbgM/', '2025-08-03', '2025-10-16 04:03:23', 1),
(55, '雪割りの奔流', '玉サボテン様練り込みコーヒーカップ「雪割りの奔流」', '　練り込みとしのぎの技法を組み合わせてつくったコーヒーカップです。植物の生命力をイメージし、グリーン・ピンク・イエローのカラー粘土を練り込み、さらにそれを白土で包みました。\r\n　当初、しのぎを入れることで、白土のあいだから花畑のような色彩がつつましく顔を出す姿を思い描いていたのですが、実際に削ってみると、白土が思いのほか残らず、内側の練り込み模様が勢いよくあふれ出してしまいました。結果として、雪割りの植物の息吹がほとばしるような、生命の奔流を感じさせるカップに仕上がりました。\r\n　しのぎのモチーフは玉サボテン。側面には6角形の模様を、膨らみを持たせながらていねいに彫り出しています。それに呼応するように、高台も6本の足で支える形としました。\r\n　残雪にも見える白土を押しのけ、内側からあふれる色。エネルギッシュな春の芽吹きを思わせる姿から、「雪割りの奔流」と名付けました。', 'coffee_cup', '直径：約8.0cm (取っ手を除く)、約12.0cm (取っ手を含む)\r\n高さ：約7.0cm\r\n容量：約230cc (8割注水時)\r\n重さ：248g', 8.0, 12.0, 7.0, 248, 230, '白土、カラー粘土(緑、ピンク、黄色)', '外側：透明\r\n内側：黒天目', '', 1, 'multicolour', 'https://minne.com/items/44109057', 'https://www.instagram.com/p/DP1VHX4klCE/', '2025-08-03', '2025-10-15 18:18:29', 1);

-- --------------------------------------------------------

--
-- テーブルの構造 `artworks_import_raw`
--

DROP TABLE IF EXISTS `artworks_import_raw`;
CREATE TABLE IF NOT EXISTS `artworks_import_raw` (
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
  `valid` varchar(10) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `artworks_import_raw`
--

INSERT INTO `artworks_import_raw` (`id`, `description_title`, `categories`, `description`, `name`, `spec`, `width`, `maxWidth`, `height`, `weight`, `capacity`, `technique0`, `technique1`, `technique2`, `clay`, `glaze`, `notes`, `in_stock`, `url`, `instagramUrl`, `completionDate`, `updateDate`, `valid`) VALUES
(1, '玉サボテン様コーヒーカップ「黒亀」', 'coffee_cup', '玉サボテンの亀甲模様からインスピレーションを得たコーヒーカップです。\r\n6角形の模様がゆるやかに膨らんだ立体感のある仕上がりで、触れるたびにその繊細な質感を楽しむことができます。\r\nさらに、高台部分を6本の足のようにデザインし、遊び心をプラスしました。\r\n上に張り出した取っ手は、持ちやすさを考慮しつつ、デザインのアクセントにもなっています。\r\n艶やかな黒い地に、無数の油滴模様が広がり、見ていて飽きることのない魅力を放っています。\r\nこの独特なフォルムから「黒亀」と名付けました。', '黒亀', '直径：約10cm (取っ手を除く)、12.5cm (取っ手込み)\r\n高さ：約8.5cm\r\n容量：約160cc (8割注水時)\r\n重さ：190g\r\n', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, '1'),
(3, '柱サボテン様コーヒーカップ「十二刻」', 'coffee_cup', '柱サボテンをモチーフにしたコーヒーカップです。\r\nカップの側面全体に、柱サボテンの陵を思わせる立体模様を彫り込みました。\r\n外側は黒マット釉を施し、しっとりとした手触りと深みのある表情に。\r\n内側には白萩釉を掛けており、口縁では白萩と黒マットの釉薬が溶け合い、滴り落ちるような独特の模様が生まれました。\r\nこのカップの最大の特長は、円周に沿って並ぶ 12本の足。\r\nその姿がまるで時計の文字盤のように見えることから、「十二刻」と名付けました。\r\nあなたのコーヒーブレークが、ゆったりとした穏やかなひとときになりますように。\r\n「十二刻」とともに、心落ち着く時間をお楽しみください。', '十二刻', '直径：約10cm (取っ手を除く)、12.5cm (取っ手込み)\r\n高さ：約6.5cm\r\n容量：約200cc (8割注水時)\r\n重さ：200g', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, '2023/10/20', NULL, '1'),
(7, '玉サボテン様12足黒マットパスタ皿「玄武皿」', 'coffee_cup', '全体に6角形の模様が施され、それぞれの6角形が膨らむように彫刻されています。これはまるでサボテンの葉が太陽の光を浴びて膨らむ様子を再現したもの。高台の形も工夫され、12本の足で立つような形に仕上げられています。これはまるでサボテンが土地から根を張っているかのような迫力があります。\r\n\r\nそして、黒マットという釉薬で仕上げられたこのパスタ皿は、艶のない黒い器となっています。1つ1つの模様や足を削りだすのにはとても時間がかかり大変でしたが、その努力が実り、美しい仕上がりとなりました。\r\n\r\nこのパスタ皿を使えば、パスタを盛り付けるだけで、まるでサボテンの上に乗っているような気分になれます。サボテンの魔法が詰まったこのパスタ皿で、美味しいパスタを楽しんでください。', '玄武皿', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, '2023/10/6', NULL, '1'),
(8, 'サボテン菊水様コーヒーカップ「アルマジロ」', 'coffee_cup', '「菊水」というサボテンをモチーフに、しのぎの技法をで作ったコーヒーカップです。\r\nカップの側面全体に、上向きのうろこ状の模様をレリーフ状に彫り込みました。\r\n釉薬には「蕎麦」を使用しており、薄くかかった部分は深い茶色に、厚くかかった部分は明るい茶色の斑点模様が浮かび上がります。これにより、レリーフの形に沿って複雑な色の濃淡が生まれ、奥行きのある表情を楽しめます。\r\n彫り込んだ模様は滑らかに仕上げているため、指先でなぞると心地よい手触りです。\r\n取っ手は幅広に作り、指をしっかり通せるため、安定感のある持ちやすさも魅力のひとつ。\r\nサボテンをイメージして作りましたが、焼き上がるとその姿はまるでアルマジロの鎧のよう。そこで、このカップには「アルマジロ」という銘を付けました。', 'アルマジロ', '直径：約9.5cm (取っ手を除く)、11.5cm (取っ手込み)\r\n高さ：約7cm\r\n容量：約130cc (8割注水時)\r\n重さ：195g', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, '2023/10/6', NULL, '1'),
(20, '玉サボテン様しのぎマグカップ「赫耀の秘光」', 'coffee_cup', '玉サボテンを模した六角形の彫り模様を施したマグカップです。\r\n外側には光沢を抑えた黒マット釉を使用し、落ち着いた佇まいを演出。\r\n対照的に、内側の赤結晶釉は周囲の光を反射し、まるで燃え立つ炎のような輝きを放ちます。\r\nカップを手に、外側から中を覗くと、暗闇の奥から鋭い赤の光が目に飛び込んできます。\r\n静寂の黒に秘められた鮮烈な輝きの美しさを映し、「赫耀の秘光」と名付けました。\r\n光と影が織りなす表情を、ぜひ手に取ってご堪能ください。', '赫耀の秘光', '直径：約10.5cm (取っ手を除く)、約13.0cm (取っ手を含む)\r\n高さ：約8.5cm\r\n容量：約260cc (8割注水時)\r\n重さ：234g', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, '2024/9/22', NULL, '1'),
(21, '玉サボテン様練り込みコーヒーカップ「モアレ」', 'coffee_cup', 'これも玉サボテンをモチーフにしたコーヒーカップです。\r\n普段は白土や赤土など1種類の土で作っていますが、今回は「練り込み」の技法でカップの形を作ってから、サボテンの形に削ってみました。\r\n赤土と黒土の2つの粘土を使っています。練り込みなので、カップの表面に2つの粘土の縞模様ができますが、これを削ると、削った深さに応じて、さらに別の模様が出てきます。これがとても面白い模様になりました。\r\nモアレ模様に見えるので、作品名を「モアレ」としました。\r\n全体に「12番石灰」という透明釉をかけています。', 'モアレ', '直径：約9.0cm (取っ手を除く)、約11.0cm (取っ手を含む)\r\n高さ：約6.5cm\r\n容量：約150cc (8割注水時)\r\n重さ：189g', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, '2024/9/29', NULL, '1'),
(22, 'サボテン金剛丸様練り込みコーヒーカップ「雲海のピラミッド」', 'coffee_cup', '玉サボテンをモチーフにしたコーヒーカップです。\r\nでも、出来上がった印象は、小さなパイナップルです(笑)。\r\n赤土と黒土で「練り込み」の技法でカップの形を作ってから、小さなピラミッド状の模様をカップ側面全体につけました。削ることにより、等高線、あるいは、地層のような縞模様が表面に浮かびました。\r\n全体に「12番石灰」という透明釉をかけています。\r\n透明釉ですが、厚くかかると白い膜のようになります。このカップでは、削ったピラミッドとピラミッドの間の溝に厚くかかりました。その見た目の印象から、銘を「雲海のピラミッド」としました。', '雲海のピラミッド', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, '2024/10/6', NULL, '1'),
(25, '玉サボテン様乳濁赤結晶どんぶり「翠紅碗」', 'coffee_cup', 'サボテンをモチーフにしたどんぶりです。\r\n外側には、サボテンを模した6角形の模様を彫り込んでいます。\r\nその模様に合わせ、高台を6本の足にしました。6本足で立つ様が少しだけかわいいです。\r\n外側は乳濁という、どちらかというと地味に見える緑色の釉薬を、内側は赤結晶という派手な紅色の釉薬をかけています。\r\n風雪に耐えるサボテンの、外皮は地味で目立たないのに、内部はみずみずしい感じを表現し、銘を「翠紅碗」としました。', '翠紅碗', '直径：約15.0cm\r\n高さ：約8.0cm\r\n容量：約400cc (8割注水時)\r\n重さ：350g', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, '1'),
(26, '玉サボテン様練り込みコーヒーカップ「目覚めのフクロウ」', 'coffee_cup', '赤土と黒土を練り込み、玉サボテンからインスピレーションを得た六角形の模様を彫り込んだコーヒーカップです。\r\n高台は6本のスリムな足で支えられ、個性的なフォルムが際立ちます。\r\n土の自然な色彩と練り込みの美しい模様を引き立てるため、釉薬には透明釉を使用しました。\r\n銘は 「目覚めのフクロウ」。\r\nしのぎによって変化した練り込みの模様が、まるで寝ぼけまなこのフクロウのよう。\r\n手に取るたびに、眠たげな表情のフクロウと目が合い、やさしく穏やかなコーヒーの時間を演出してくれます。', '目覚めのフクロウ', '直径：約8.5cm (取っ手を除く)、約10.5cm (取っ手を含む)\r\n高さ：約8.3cm\r\n容量：約180cc (8割注水時)\r\n重さ：192g', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, '2024/10/20', NULL, '1'),
(27, 'サボテン様練り込みコーヒーカップ「瑪瑙環」', 'coffee_cup', '白土と黒土を練り込み成形し、全体に細かいピラミッド型の模様を彫り込んだコーヒーカップです。練り込みによって生まれる独特の縞模様を削ることでさらに表情豊かな模様の妙が生まれます。\r\nデザインのモチーフは、サボテンの金剛丸。側面全体に深く刻み込んだピラミッド状のしのぎ模様が、形にメリハリを与え、手に取ったときの感触も楽しめます。\r\n仕上げには透明釉を施し、練り込み模様の美しさを引き立てました。カップ全体に広がる同心円状の模様が、瑪瑙の層を思わせることから「瑪瑙環」と名付けました。', '瑪瑙環', '直径：約8.5cm (取っ手を除く)、11cm (取っ手込み)\r\n高さ：約6.8cm\r\n容量：約160cc (8割注水時)\r\n重さ：199g', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, '2024/10/27', NULL, '1'),
(28, '玉サボテン様練り込みコーヒーカップ「瑪瑙晶」', 'coffee_cup', 'No.027「瑪瑙環」と同じく、白土と黒土を練り込んで成形したコーヒーカップです。\r\nただし本作では、カップの外側に玉サボテンをモチーフとした六角形のふくらみを彫り込みました。\r\n削ったことで、思いがけない模様が現れました。\r\nまるで「日」という字を重ねたような模様です。\r\n漢字にすると「晶」でしょうか？\r\nそこで、このカップに「瑪瑙晶（めのうしょう）」という銘を付けました。', '瑪瑙晶', '直径：約8.0cm (取っ手を除く)、約11.0cm (取っ手を含む)\r\n高さ：約7.5cm\r\n容量：約140cc (8割注水時)\r\n重さ：205g', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, '2024/11/3', NULL, '1'),
(29, '玉サボテン様練り込みコーヒーカップ「瑪瑙墨」', 'coffee_cup', '練り込みとしのぎの技法を組み合わせたコーヒーカップです。\r\n白土と黒土を重ねて成形した素地に、六角形の模様を一つひとつ彫り込んでいます。\r\nそれぞれの六角形はゆるやかに膨らんでおり、削りの深さによって模様に揺らぎが生まれています。\r\nカップの内側には「黒天目」という艶やかな黒の釉薬を掛けました。\r\nこの黒が外側の模様を際立たせ、カップ全体の印象を引き締めています。\r\n練り込みによって現れた縞模様が瑪瑙石を思わせ、内側の黒が墨のように見えることから「瑪瑙墨」という銘にしました。', '瑪瑙墨', '直径：約7.5cm (取っ手を除く)、約10.5cm (取っ手を含む)\r\n高さ：約8.0cm\r\n容量：約140cc (8割注水時)\r\n重さ：208g', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, '2024/11/10', NULL, '1'),
(30, 'サボテン金剛丸様練り込み中鉢「雪墨嶺」', 'coffee_cup', '玉サボテンをモチーフに、側面いっぱいにピラミッド型の模様を彫り込みました。\r\n白と黒の粘土の練り込みにより生み出された等高線のような縞模様が特長の中鉢です。\r\nひと山ひと山、手作業で彫り込んだ模様が山並みのように連なります。\r\nその姿から、「雪墨嶺（せつぼくれい）」という銘を付けました。', '雪墨嶺', '直径：約13.0cm\r\n高さ：約7.4cm\r\n容量：約400cc (8割注水時)\r\n重さ：378g', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, '2024/11/17', NULL, '1'),
(34, 'ねじり金剛丸様練り込みコーヒーカップ「牡蠣の群生」', 'coffee_cup', '練り込みとしのぎの技法を組み合わせたデミタスカップです。\r\n白土と黒土を使った練り込みの素地に、ピラミッド型の模様を削りだしたのですが、正方形ではなく、長方形を傾けた形で削ってみました。\r\nピラミッドの高さにより等高線のように白と黒の縞模様があらわれ、おもしろい見た目になりましたが、1つ1つの模様が牡蠣が並んでいるように見えたので、銘は「牡蠣の群生」としました。\r\nサイズはやや小さめです。', '牡蠣の群生', '直径：約7.0cm (取っ手を除く)、約10.0cm (取っ手を含む)\r\n高さ：約7.4cm\r\n容量：約100cc (8割注水時)\r\n重さ：176g', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, '2024/12/8', NULL, '1'),
(35, '柱サボテン様練り込みコーヒーカップ「土のリズム」', 'coffee_cup', '柱サボテンの縦に並ぶ陵（りょう）からインスピレーションを得たコーヒーカップです。\r\n白土と赤土を使った「練り込み」の技法で独特の模様を生み出し、さらに「しのぎ」の技法で柱サボテンのような立体感を表現しました。\r\n内側には「うのふ」という白い釉薬、外側は透明釉を掛けています。カップの口縁には2つの釉薬が混ざり合い、波紋のような模様が生まれています。\r\n側面の模様が地層のように見え、それが等間隔に柱状に並ぶので「土のリズム」と名付けました。\r\n大地を掌に収めたようなこのカップで、心落ち着くコーヒータイムをお過ごしください。', '土のリズム', '直径：約9.5cm (取っ手を除く)、12cm (取っ手込み)\r\n高さ：約5.3cm\r\n容量：約140cc (8割注水時)\r\n重さ：205g', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, '2024/12/15', NULL, '1');

-- --------------------------------------------------------

--
-- テーブルの構造 `artwork_media`
--

DROP TABLE IF EXISTS `artwork_media`;
CREATE TABLE IF NOT EXISTS `artwork_media` (
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
) ENGINE=InnoDB AUTO_INCREMENT=5423 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `artwork_media`
--

INSERT INTO `artwork_media` (`id`, `artwork_id`, `kind`, `image_url`, `video_url`, `alt_ja`, `alt_en`, `sort_order`, `valid`) VALUES
(3795, 32, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/032/032_01%E6%89%8B%E6%8C%81%E3%81%A1.jpg', NULL, NULL, NULL, 32, 1),
(3796, 32, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/032/032_02%E5%B7%A6.jpg', NULL, NULL, NULL, 32, 1),
(3797, 32, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/032/032_03%E6%AD%A3%E9%9D%A2.jpg', NULL, NULL, NULL, 32, 1),
(3798, 32, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/032/032_04%E5%8F%B3.jpg', NULL, NULL, NULL, 32, 1),
(3799, 32, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/032/032_05%E5%8F%96%E3%81%A3%E6%89%8B.jpg', NULL, NULL, NULL, 32, 1),
(3800, 32, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/032/032_06%E8%A6%8B%E8%BE%BC%E3%81%BF.jpg', NULL, NULL, NULL, 32, 1),
(3801, 32, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/032/032_07%E5%BA%95.jpg', NULL, NULL, NULL, 32, 1),
(3802, 32, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/032/032_08%E6%8E%A5%E5%86%99.jpg', NULL, NULL, NULL, 32, 1),
(3803, 32, 'video', 'https://storage.googleapis.com/sisiwaka-touen-medias/032/032_%E8%9C%86%E3%81%AE%E7%BE%A4%E7%94%9F.jpg', 'https://storage.googleapis.com/sisiwaka-touen-medias/032/032_%E8%9C%86%E3%81%AE%E7%BE%A4%E7%94%9F.mp4', NULL, NULL, 32, 1),
(5068, 1, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/001/001_01%E6%89%8B%E6%8C%81%E3%81%A1.jpg', NULL, NULL, NULL, 1, 1),
(5069, 1, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/001/001_02%E5%8F%B3.jpg', NULL, NULL, NULL, 1, 1),
(5070, 1, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/001/001_03%E6%AD%A3%E9%9D%A2.jpg', NULL, NULL, NULL, 1, 1),
(5071, 1, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/001/001_04%E5%B7%A6.jpg', NULL, NULL, NULL, 1, 1),
(5072, 1, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/001/001_05%E5%8F%96%E3%81%A3%E6%89%8B.jpg', NULL, NULL, NULL, 1, 1),
(5073, 1, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/001/001_06%E8%A6%8B%E8%BE%BC%E3%81%BF.jpg', NULL, NULL, NULL, 1, 1),
(5074, 1, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/001/001_07%E8%A3%8F.jpg', NULL, NULL, NULL, 1, 1),
(5075, 1, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/001/001_08%E5%A4%96%E5%81%B4%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 1, 1),
(5076, 1, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/001/001_09%E5%86%85%E5%81%B4%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 1, 1),
(5077, 1, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/001/001_10%E9%AB%98%E5%8F%B0%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 1, 1),
(5078, 1, 'video', 'https://storage.googleapis.com/sisiwaka-touen-medias/001/001_%E9%BB%92%E4%BA%80.jpg', 'https://storage.googleapis.com/sisiwaka-touen-medias/001/001_%E9%BB%92%E4%BA%80.mp4', NULL, NULL, 1, 1),
(5079, 3, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/003/003_01%E6%89%8B%E6%8C%81%E3%81%A1.jpg', NULL, NULL, NULL, 3, 1),
(5080, 3, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/003/003_02%E5%B7%A6.jpg', NULL, NULL, NULL, 3, 1),
(5081, 3, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/003/003_03%E6%AD%A3%E9%9D%A2.jpg', NULL, NULL, NULL, 3, 1),
(5082, 3, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/003/003_04%E5%8F%B3.jpg', NULL, NULL, NULL, 3, 1),
(5083, 3, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/003/003_05%E5%8F%96%E3%81%A3%E6%89%8B.jpg', NULL, NULL, NULL, 3, 1),
(5084, 3, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/003/003_06%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 3, 1),
(5085, 3, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/003/003_07%E5%8F%96%E3%81%A3%E6%89%8B%E5%81%B4%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 3, 1),
(5086, 3, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/003/003_08%E8%A6%8B%E8%BE%BC%E3%81%BF.jpg', NULL, NULL, NULL, 3, 1),
(5087, 3, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/003/003_09%E8%A6%8B%E8%BE%BC%E3%81%BF%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 3, 1),
(5088, 3, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/003/003_10%E8%A3%8F.jpg', NULL, NULL, NULL, 3, 1),
(5089, 3, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/003/003_11%E8%B6%B3.jpg', NULL, NULL, NULL, 3, 1),
(5090, 3, 'video', 'https://storage.googleapis.com/sisiwaka-touen-medias/003/003_%E5%8D%81%E4%BA%8C%E5%88%BB.jpg', 'https://storage.googleapis.com/sisiwaka-touen-medias/003/003_%E5%8D%81%E4%BA%8C%E5%88%BB.mp4', NULL, NULL, 3, 1),
(5091, 7, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/007/007_01%E6%89%8B%E6%8C%81%E3%81%A1.jpg', NULL, NULL, NULL, 7, 1),
(5092, 7, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/007/007_02%E6%89%8B%E6%8C%81%E3%81%A12.jpg', NULL, NULL, NULL, 7, 1),
(5093, 7, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/007/007_03%E5%85%A8%E4%BD%93.jpg', NULL, NULL, NULL, 7, 1),
(5094, 7, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/007/007_04%E6%96%9C%E3%82%81%E4%B8%8A.jpg', NULL, NULL, NULL, 7, 1),
(5095, 7, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/007/007_05%E3%81%82%E3%81%8A%E3%82%8A.jpg', NULL, NULL, NULL, 7, 1),
(5096, 7, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/007/007_06%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 7, 1),
(5097, 7, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/007/007_07%E8%A6%8B%E8%BE%BC%E3%81%BF.jpg', NULL, NULL, NULL, 7, 1),
(5098, 7, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/007/007_08%E8%A3%8F.jpg', NULL, NULL, NULL, 7, 1),
(5099, 7, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/007/007_09%E8%B6%B3.jpg', NULL, NULL, NULL, 7, 1),
(5100, 7, 'video', 'https://storage.googleapis.com/sisiwaka-touen-medias/007/007_%E7%8E%84%E6%AD%A6%E7%9A%BF.jpg', 'https://storage.googleapis.com/sisiwaka-touen-medias/007/007_%E7%8E%84%E6%AD%A6%E7%9A%BF.mp4', NULL, NULL, 7, 1),
(5101, 8, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/008/008_01%E6%89%8B%E6%8C%81%E3%81%A1.jpg', NULL, NULL, NULL, 8, 1),
(5102, 8, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/008/008_02%E5%8F%B3.jpg', NULL, NULL, NULL, 8, 1),
(5103, 8, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/008/008_03%E6%AD%A3%E9%9D%A2.jpg', NULL, NULL, NULL, 8, 1),
(5104, 8, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/008/008_04%E5%B7%A6.jpg', NULL, NULL, NULL, 8, 1),
(5105, 8, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/008/008_05%E5%8F%96%E3%81%A3%E6%89%8B.jpg', NULL, NULL, NULL, 8, 1),
(5106, 8, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/008/008_06%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 8, 1),
(5107, 8, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/008/008_07%E5%8F%96%E3%81%A3%E6%89%8B%E8%A3%8F.jpg', NULL, NULL, NULL, 8, 1),
(5108, 8, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/008/008_08%E5%8F%96%E3%81%A3%E6%89%8B%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 8, 1),
(5109, 8, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/008/008_09%E8%A6%8B%E8%BE%BC%E3%81%BF.jpg', NULL, NULL, NULL, 8, 1),
(5110, 8, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/008/008_10%E8%A6%8B%E8%BE%BC%E3%81%BF%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 8, 1),
(5111, 8, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/008/008_11%E8%A3%8F.jpg', NULL, NULL, NULL, 8, 1),
(5112, 8, 'video', 'https://storage.googleapis.com/sisiwaka-touen-medias/008/008_%E3%82%A2%E3%83%AB%E3%83%9E%E3%82%B8%E3%83%AD.jpg', 'https://storage.googleapis.com/sisiwaka-touen-medias/008/008_%E3%82%A2%E3%83%AB%E3%83%9E%E3%82%B8%E3%83%AD.mp4', NULL, NULL, 8, 1),
(5113, 20, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/020/020_01%E6%89%8B%E6%8C%81%E3%81%A1.jpg', NULL, NULL, NULL, 20, 1),
(5114, 20, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/020/020_02%E5%8F%B3.jpg', NULL, NULL, NULL, 20, 1),
(5115, 20, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/020/020_02%E6%AD%A3%E9%9D%A2.jpg', NULL, NULL, NULL, 20, 1),
(5116, 20, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/020/020_03%E5%B7%A6.jpg', NULL, NULL, NULL, 20, 1),
(5117, 20, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/020/020_04%E5%8F%96%E3%81%A3%E6%89%8B.jpg', NULL, NULL, NULL, 20, 1),
(5118, 20, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/020/020_05%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 20, 1),
(5119, 20, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/020/020_06%E8%A6%8B%E8%BE%BC%E3%81%BF.jpg', NULL, NULL, NULL, 20, 1),
(5120, 20, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/020/020_07%E8%A6%8B%E8%BE%BC%E3%81%BF%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 20, 1),
(5121, 20, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/020/020_08%E8%A3%8F.jpg', NULL, NULL, NULL, 20, 1),
(5122, 20, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/020/020_09%E8%B6%B3%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 20, 1),
(5123, 20, 'video', 'https://storage.googleapis.com/sisiwaka-touen-medias/020/020_%E8%B5%AB%E8%80%80%E3%81%AE%E7%A7%98%E5%85%89.jpg', 'https://storage.googleapis.com/sisiwaka-touen-medias/020/020_%E8%B5%AB%E8%80%80%E3%81%AE%E7%A7%98%E5%85%89.mp4', NULL, NULL, 20, 1),
(5124, 21, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/021/021_01%E6%89%8B%E6%8C%81%E3%81%A1.jpg', NULL, NULL, NULL, 21, 1),
(5125, 21, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/021/021_02%E5%B7%A6.jpg', NULL, NULL, NULL, 21, 1),
(5126, 21, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/021/021_03%E6%AD%A3%E9%9D%A2.jpg', NULL, NULL, NULL, 21, 1),
(5127, 21, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/021/021_04%E5%8F%B3.jpg', NULL, NULL, NULL, 21, 1),
(5128, 21, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/021/021_05%E5%8F%96%E3%81%A3%E6%89%8B.jpg', NULL, NULL, NULL, 21, 1),
(5129, 21, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/021/021_06%E6%8B%A1%E5%A4%A7%E6%AD%A3%E9%9D%A2.jpg', NULL, NULL, NULL, 21, 1),
(5130, 21, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/021/021_07%E6%8B%A1%E5%A4%A7%E5%8F%96%E3%81%A3%E6%89%8B.jpg', NULL, NULL, NULL, 21, 1),
(5131, 21, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/021/021_08%E8%A6%8B%E8%BE%BC%E3%81%BF.jpg', NULL, NULL, NULL, 21, 1),
(5132, 21, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/021/021_09%E5%BA%95.jpg', NULL, NULL, NULL, 21, 1),
(5133, 21, 'video', 'https://storage.googleapis.com/sisiwaka-touen-medias/021/021_%E3%83%A2%E3%82%A2%E3%83%AC.jpg', 'https://storage.googleapis.com/sisiwaka-touen-medias/021/021_%E3%83%A2%E3%82%A2%E3%83%AC.mp4', NULL, NULL, 21, 1),
(5134, 22, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/022/022_01%E6%89%8B%E6%8C%81%E3%81%A1.jpg', NULL, NULL, NULL, 22, 1),
(5135, 22, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/022/022_02%E5%8F%B3.jpg', NULL, NULL, NULL, 22, 1),
(5136, 22, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/022/022_03%E6%AD%A3%E9%9D%A2.jpg', NULL, NULL, NULL, 22, 1),
(5137, 22, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/022/022_04%E5%8F%96%E3%81%A3%E6%89%8B%E5%81%B4.jpg', NULL, NULL, NULL, 22, 1),
(5138, 22, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/022/022_05%E8%A6%8B%E8%BE%BC%E3%81%BF.jpg', NULL, NULL, NULL, 22, 1),
(5139, 22, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/022/022_06%E5%BA%95.jpg', NULL, NULL, NULL, 22, 1),
(5140, 22, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/022/022_07%E6%8B%A1%E5%A4%A71.jpg', NULL, NULL, NULL, 22, 1),
(5141, 22, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/022/022_08%E6%8B%A1%E5%A4%A72.jpg', NULL, NULL, NULL, 22, 1),
(5142, 22, 'video', 'https://storage.googleapis.com/sisiwaka-touen-medias/022/022_%E9%9B%B2%E6%B5%B7%E3%81%AE%E3%83%94%E3%83%A9%E3%83%9F%E3%83%83%E3%83%89.jpg', 'https://storage.googleapis.com/sisiwaka-touen-medias/022/022_%E9%9B%B2%E6%B5%B7%E3%81%AE%E3%83%94%E3%83%A9%E3%83%9F%E3%83%83%E3%83%89.mp4', NULL, NULL, 22, 1),
(5143, 25, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/025/025_01%E6%89%8B%E6%8C%81%E3%81%A1.jpg', NULL, NULL, NULL, 25, 1),
(5144, 25, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/025/025_02%E6%AD%A3%E9%9D%A21.jpg', NULL, NULL, NULL, 25, 1),
(5145, 25, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/025/025_03%E6%AD%A3%E9%9D%A22.jpg', NULL, NULL, NULL, 25, 1),
(5146, 25, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/025/025_04%E8%A6%8B%E8%BE%BC%E3%81%BF.jpg', NULL, NULL, NULL, 25, 1),
(5147, 25, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/025/025_05%E8%A6%8B%E8%BE%BC%E3%81%BF%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 25, 1),
(5148, 25, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/025/025_06%E5%BA%95%E9%9D%A2.jpg', NULL, NULL, NULL, 25, 1),
(5149, 25, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/025/025_07%E5%BA%95%E9%9D%A2%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 25, 1),
(5150, 25, 'video', 'https://storage.googleapis.com/sisiwaka-touen-medias/025/025_%E7%BF%A0%E7%B4%85%E7%A2%97.jpg', 'https://storage.googleapis.com/sisiwaka-touen-medias/025/025_%E7%BF%A0%E7%B4%85%E7%A2%97.mp4', NULL, NULL, 25, 1),
(5151, 26, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/026/026_01%E6%89%8B%E6%8C%81%E3%81%A1.jpg', NULL, NULL, NULL, 26, 1),
(5152, 26, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/026/026_02%E5%8F%B3.jpg', NULL, NULL, NULL, 26, 1),
(5153, 26, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/026/026_03%E6%AD%A3%E9%9D%A2.jpg', NULL, NULL, NULL, 26, 1),
(5154, 26, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/026/026_04%E5%B7%A6.jpg', NULL, NULL, NULL, 26, 1),
(5155, 26, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/026/026_05%E5%8F%96%E3%81%A3%E6%89%8B.jpg', NULL, NULL, NULL, 26, 1),
(5156, 26, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/026/026_06%E8%A6%8B%E8%BE%BC%E3%81%BF.jpg', NULL, NULL, NULL, 26, 1),
(5157, 26, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/026/026_07%E5%BA%95.jpg', NULL, NULL, NULL, 26, 1),
(5158, 26, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/026/026_08%E8%B6%B3.jpg', NULL, NULL, NULL, 26, 1),
(5159, 26, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/026/026_09%E7%AB%8B%E3%81%A1%E5%A7%BF.jpg', NULL, NULL, NULL, 26, 1),
(5160, 26, 'video', 'https://storage.googleapis.com/sisiwaka-touen-medias/026/026_%E7%9B%AE%E8%A6%9A%E3%82%81%E3%81%AE%E3%83%95%E3%82%AF%E3%83%AD%E3%82%A6.jpg', 'https://storage.googleapis.com/sisiwaka-touen-medias/026/026_%E7%9B%AE%E8%A6%9A%E3%82%81%E3%81%AE%E3%83%95%E3%82%AF%E3%83%AD%E3%82%A6.mp4', NULL, NULL, 26, 1),
(5161, 27, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/027/027_01%E6%89%8B%E6%8C%81%E3%81%A1.jpg', NULL, NULL, NULL, 27, 1),
(5162, 27, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/027/027_02%E5%8F%B3.jpg', NULL, NULL, NULL, 27, 1),
(5163, 27, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/027/027_03%E6%AD%A3%E9%9D%A2.jpg', NULL, NULL, NULL, 27, 1),
(5164, 27, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/027/027_04%E5%B7%A6.jpg', NULL, NULL, NULL, 27, 1),
(5165, 27, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/027/027_05%E8%A6%8B%E8%BE%BC%E3%81%BF.jpg', NULL, NULL, NULL, 27, 1),
(5166, 27, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/027/027_06%E5%BA%95.jpg', NULL, NULL, NULL, 27, 1),
(5167, 27, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/027/027_07%E7%AB%8B%E3%81%A1%E5%A7%BF.jpg', NULL, NULL, NULL, 27, 1),
(5168, 27, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/027/027_08%E6%8E%A5%E5%86%99.jpg', NULL, NULL, NULL, 27, 1),
(5169, 27, 'video', 'https://storage.googleapis.com/sisiwaka-touen-medias/027/027_%E7%91%AA%E7%91%99%E7%92%B0.jpg', 'https://storage.googleapis.com/sisiwaka-touen-medias/027/027_%E7%91%AA%E7%91%99%E7%92%B0.mp4', NULL, NULL, 27, 1),
(5170, 28, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/028/028_01%E6%89%8B%E6%8C%81%E3%81%A1.jpg', NULL, NULL, NULL, 28, 1),
(5171, 28, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/028/028_02%E5%B7%A6.jpg', NULL, NULL, NULL, 28, 1),
(5172, 28, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/028/028_03%E6%AD%A3%E9%9D%A2.jpg', NULL, NULL, NULL, 28, 1),
(5173, 28, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/028/028_04%E5%8F%B3.jpg', NULL, NULL, NULL, 28, 1),
(5174, 28, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/028/028_05%E5%8F%96%E3%81%A3%E6%89%8B.jpg', NULL, NULL, NULL, 28, 1),
(5175, 28, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/028/028_06%E8%A6%8B%E8%BE%BC%E3%81%BF.jpg', NULL, NULL, NULL, 28, 1),
(5176, 28, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/028/028_07%E5%BA%95.jpg', NULL, NULL, NULL, 28, 1),
(5177, 28, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/028/028_08%E7%AB%8B%E3%81%A1%E5%A7%BF.jpg', NULL, NULL, NULL, 28, 1),
(5178, 28, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/028/028_09%E8%B6%B3.jpg', NULL, NULL, NULL, 28, 1),
(5179, 28, 'video', 'https://storage.googleapis.com/sisiwaka-touen-medias/028/028_%E7%91%AA%E7%91%99%E6%99%B6.jpg', 'https://storage.googleapis.com/sisiwaka-touen-medias/028/028_%E7%91%AA%E7%91%99%E6%99%B6.mp4', NULL, NULL, 28, 1),
(5180, 29, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/029/029_01%E6%89%8B%E6%8C%81%E3%81%A1.jpg', NULL, NULL, NULL, 29, 1),
(5181, 29, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/029/029_02%E5%B7%A6.jpg', NULL, NULL, NULL, 29, 1),
(5182, 29, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/029/029_03%E6%AD%A3%E9%9D%A2.jpg', NULL, NULL, NULL, 29, 1),
(5183, 29, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/029/029_04%E5%8F%B3.jpg', NULL, NULL, NULL, 29, 1),
(5184, 29, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/029/029_05%E5%8F%96%E3%81%A3%E6%89%8B.jpg', NULL, NULL, NULL, 29, 1),
(5185, 29, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/029/029_06%E8%A6%8B%E8%BE%BC%E3%81%BF.jpg', NULL, NULL, NULL, 29, 1),
(5186, 29, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/029/029_07%E5%BA%95.jpg', NULL, NULL, NULL, 29, 1),
(5187, 29, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/029/029_08%E8%84%9A.jpg', NULL, NULL, NULL, 29, 1),
(5188, 29, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/029/029_09%E7%AB%8B%E3%81%A1%E5%A7%BF.jpg', NULL, NULL, NULL, 29, 1),
(5189, 29, 'video', 'https://storage.googleapis.com/sisiwaka-touen-medias/029/029_%E7%91%AA%E7%91%99%E5%A2%A8.jpg', 'https://storage.googleapis.com/sisiwaka-touen-medias/029/029_%E7%91%AA%E7%91%99%E5%A2%A8.mp4', NULL, NULL, 29, 1),
(5190, 30, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/030/030_01%E6%AD%A3%E9%9D%A21.jpg', NULL, NULL, NULL, 30, 1),
(5191, 30, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/030/030_03%E6%AD%A3%E9%9D%A23.jpg', NULL, NULL, NULL, 30, 1),
(5192, 30, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/030/030_04%E8%A6%8B%E8%BE%BC%E3%81%BF.jpg', NULL, NULL, NULL, 30, 1),
(5193, 30, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/030/030_05%E6%8E%A5%E5%86%99.jpg', NULL, NULL, NULL, 30, 1),
(5194, 30, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/030/030_06%E6%AD%A3%E9%9D%A24.jpg', NULL, NULL, NULL, 30, 1),
(5195, 30, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/030/030_07%E8%A3%8F.jpg', NULL, NULL, NULL, 30, 1),
(5196, 30, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/030/030_08%E6%89%8B%E6%8C%81%E3%81%A1.jpg', NULL, NULL, NULL, 30, 1),
(5197, 30, 'video', 'https://storage.googleapis.com/sisiwaka-touen-medias/030/030_%E9%9B%AA%E5%A2%A8%E5%B3%B0.jpg', 'https://storage.googleapis.com/sisiwaka-touen-medias/030/030_%E9%9B%AA%E5%A2%A8%E5%B3%B0.mp4', NULL, NULL, 30, 1),
(5198, 33, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/033/033_01%E6%89%8B%E6%8C%81%E3%81%A1.jpg', NULL, NULL, NULL, 33, 1),
(5199, 33, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/033/033_02%E5%B7%A6.jpg', NULL, NULL, NULL, 33, 1),
(5200, 33, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/033/033_03%E6%AD%A3%E9%9D%A2.jpg', NULL, NULL, NULL, 33, 1),
(5201, 33, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/033/033_04%E5%8F%B3.jpg', NULL, NULL, NULL, 33, 1),
(5202, 33, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/033/033_05%E5%8F%96%E3%81%A3%E6%89%8B.jpg', NULL, NULL, NULL, 33, 1),
(5203, 33, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/033/033_06%E8%A6%8B%E8%BE%BC%E3%81%BF.jpg', NULL, NULL, NULL, 33, 1),
(5204, 33, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/033/033_07%E5%BA%95.jpg', NULL, NULL, NULL, 33, 1),
(5205, 33, 'video', 'https://storage.googleapis.com/sisiwaka-touen-medias/033/033_%E9%A2%A8%E6%B4%9E%E5%AE%9F%E9%A8%93.jpg', 'https://storage.googleapis.com/sisiwaka-touen-medias/033/033_%E9%A2%A8%E6%B4%9E%E5%AE%9F%E9%A8%93.mp4', NULL, NULL, 33, 1),
(5206, 34, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/034/034_01%E6%89%8B%E6%8C%81%E3%81%A1.jpg', NULL, NULL, NULL, 34, 1),
(5207, 34, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/034/034_02%E5%B7%A6.jpg', NULL, NULL, NULL, 34, 1),
(5208, 34, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/034/034_03%E6%AD%A3%E9%9D%A2.jpg', NULL, NULL, NULL, 34, 1),
(5209, 34, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/034/034_04%E5%8F%B3.jpg', NULL, NULL, NULL, 34, 1),
(5210, 34, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/034/034_05%E5%8F%96%E3%81%A3%E6%89%8B.jpg', NULL, NULL, NULL, 34, 1),
(5211, 34, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/034/034_06%E8%A6%8B%E8%BE%BC%E3%81%BF.jpg', NULL, NULL, NULL, 34, 1),
(5212, 34, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/034/034_07%E5%BA%95.jpg', NULL, NULL, NULL, 34, 1),
(5213, 34, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/034/034_08%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 34, 1),
(5214, 34, 'video', 'https://storage.googleapis.com/sisiwaka-touen-medias/034/034_%E7%89%A1%E8%A0%A3%E3%81%AE%E7%BE%A4%E7%94%9F.jpg', 'https://storage.googleapis.com/sisiwaka-touen-medias/034/034_%E7%89%A1%E8%A0%A3%E3%81%AE%E7%BE%A4%E7%94%9F.mp4', NULL, NULL, 34, 1),
(5215, 35, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/035/035_01%E6%89%8B%E6%8C%81%E3%81%A1.jpg', NULL, NULL, NULL, 35, 1),
(5216, 35, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/035/035_02%E5%B7%A6.jpg', NULL, NULL, NULL, 35, 1),
(5217, 35, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/035/035_03%E6%AD%A3%E9%9D%A2.jpg', NULL, NULL, NULL, 35, 1),
(5218, 35, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/035/035_04%E5%8F%B3.jpg', NULL, NULL, NULL, 35, 1),
(5219, 35, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/035/035_05%E5%8F%96%E3%81%A3%E6%89%8B.jpg', NULL, NULL, NULL, 35, 1),
(5220, 35, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/035/035_06%E8%A6%8B%E8%BE%BC%E3%81%BF.jpg', NULL, NULL, NULL, 35, 1),
(5221, 35, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/035/035_07%E5%BA%95.jpg', NULL, NULL, NULL, 35, 1),
(5222, 35, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/035/035_08%E5%81%B4%E9%9D%A2%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 35, 1),
(5223, 35, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/035/035_09%E5%81%B4%E9%9D%A2%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 35, 1),
(5224, 35, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/035/035_10%E5%8F%96%E3%81%A3%E6%89%8B%E8%A3%8F.jpg', NULL, NULL, NULL, 35, 1),
(5225, 35, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/035/035_11%E5%8F%A3%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 35, 1),
(5226, 35, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/035/035_12%E9%AB%98%E5%8F%B0%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 35, 1),
(5227, 35, 'video', 'https://storage.googleapis.com/sisiwaka-touen-medias/035/035_%E5%9C%9F%E3%81%AE%E3%83%AA%E3%82%BA%E3%83%A0.jpg', 'https://storage.googleapis.com/sisiwaka-touen-medias/035/035_%E5%9C%9F%E3%81%AE%E3%83%AA%E3%82%BA%E3%83%A0.mp4', NULL, NULL, 35, 1),
(5228, 36, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/036/036_01%E6%89%8B%E6%8C%81%E3%81%A1.jpg', NULL, NULL, NULL, 36, 1),
(5229, 36, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/036/036_02%E5%B7%A6.jpg', NULL, NULL, NULL, 36, 1),
(5230, 36, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/036/036_03%E5%B7%A6%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 36, 1),
(5231, 36, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/036/036_04%E6%AD%A3%E9%9D%A2.jpg', NULL, NULL, NULL, 36, 1),
(5232, 36, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/036/036_05%E6%AD%A3%E9%9D%A2%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 36, 1),
(5233, 36, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/036/036_06%E5%8F%B3.jpg', NULL, NULL, NULL, 36, 1),
(5234, 36, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/036/036_07%E5%8F%B3%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 36, 1),
(5235, 36, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/036/036_08%E5%8F%96%E3%81%A3%E6%89%8B.jpg', NULL, NULL, NULL, 36, 1),
(5236, 36, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/036/036_09%E5%8F%96%E3%81%A3%E6%89%8B%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 36, 1),
(5237, 36, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/036/036_10%E8%A6%8B%E8%BE%BC%E3%81%BF.jpg', NULL, NULL, NULL, 36, 1),
(5238, 36, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/036/036_11%E8%A6%8B%E8%BE%BC%E3%81%BF%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 36, 1),
(5239, 36, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/036/036_12%E8%A3%8F.jpg', NULL, NULL, NULL, 36, 1),
(5240, 36, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/036/036_13%E8%B6%B3%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 36, 1),
(5241, 36, 'video', 'https://storage.googleapis.com/sisiwaka-touen-medias/036/036_%E5%A4%A7%E5%9C%B0%E3%81%AE%E9%BC%93%E5%8B%95.jpg', 'https://storage.googleapis.com/sisiwaka-touen-medias/036/036_%E5%A4%A7%E5%9C%B0%E3%81%AE%E9%BC%93%E5%8B%95.mp4', NULL, NULL, 36, 1),
(5242, 37, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/037/037_01%E6%89%8B%E6%8C%81%E3%81%A1.jpg', NULL, NULL, NULL, 37, 1),
(5243, 37, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/037/037_02%E5%8F%B3.jpg', NULL, NULL, NULL, 37, 1),
(5244, 37, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/037/037_03%E6%AD%A3%E9%9D%A2.jpg', NULL, NULL, NULL, 37, 1),
(5245, 37, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/037/037_04%E5%B7%A6.jpg', NULL, NULL, NULL, 37, 1),
(5246, 37, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/037/037_05%E5%8F%96%E3%81%A3%E6%89%8B.jpg', NULL, NULL, NULL, 37, 1),
(5247, 37, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/037/037_06%E5%B7%A6%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 37, 1),
(5248, 37, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/037/037_07%E6%AD%A3%E9%9D%A2%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 37, 1),
(5249, 37, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/037/037_08%E5%8F%96%E3%81%A3%E6%89%8B%E3%81%AE%E8%A3%8F.jpg', NULL, NULL, NULL, 37, 1),
(5250, 37, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/037/037_09%E8%A6%8B%E8%BE%BC%E3%81%BF.jpg', NULL, NULL, NULL, 37, 1),
(5251, 37, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/037/037_10%E8%A6%8B%E8%BE%BC%E3%81%BF%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 37, 1),
(5252, 37, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/037/037_11%E5%BA%95.jpg', NULL, NULL, NULL, 37, 1),
(5253, 37, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/037/037_12%E8%B6%B3%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 37, 1),
(5254, 37, 'video', 'https://storage.googleapis.com/sisiwaka-touen-medias/037/037_%E3%83%9B%E3%83%AF%E3%82%A4%E3%83%88%E3%82%BF%E3%82%A4%E3%82%AC%E3%83%BC.jpg', 'https://storage.googleapis.com/sisiwaka-touen-medias/037/037_%E3%83%9B%E3%83%AF%E3%82%A4%E3%83%88%E3%82%BF%E3%82%A4%E3%82%AC%E3%83%BC.mp4', NULL, NULL, 37, 1),
(5255, 38, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/038/038_01%E6%89%8B%E6%8C%81%E3%81%A1.jpg', NULL, NULL, NULL, 38, 1),
(5256, 38, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/038/038_02%E5%81%B4%E9%9D%A21.jpg', NULL, NULL, NULL, 38, 1),
(5257, 38, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/038/038_03%E5%81%B4%E9%9D%A22.jpg', NULL, NULL, NULL, 38, 1),
(5258, 38, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/038/038_04%E5%81%B4%E9%9D%A23.jpg', NULL, NULL, NULL, 38, 1),
(5259, 38, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/038/038_05%E5%81%B4%E9%9D%A24.jpg', NULL, NULL, NULL, 38, 1),
(5260, 38, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/038/038_06%E5%AF%84%E3%82%8A1.jpg', NULL, NULL, NULL, 38, 1),
(5261, 38, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/038/038_07%E5%AF%84%E3%82%8A2.jpg', NULL, NULL, NULL, 38, 1),
(5262, 38, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/038/038_08%E5%AF%84%E3%82%8A3.jpg', NULL, NULL, NULL, 38, 1),
(5263, 38, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/038/038_09%E5%AF%84%E3%82%8A4.jpg', NULL, NULL, NULL, 38, 1),
(5264, 38, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/038/038_10%E8%A6%8B%E8%BE%BC%E3%81%BF.jpg', NULL, NULL, NULL, 38, 1),
(5265, 38, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/038/038_11%E8%A6%8B%E8%BE%BC%E3%81%BF%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 38, 1),
(5266, 38, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/038/038_12%E8%A3%8F.jpg', NULL, NULL, NULL, 38, 1),
(5267, 38, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/038/038_13%E8%B6%B3.jpg', NULL, NULL, NULL, 38, 1),
(5268, 38, 'video', 'https://storage.googleapis.com/sisiwaka-touen-medias/038/038_%E9%B6%89%E5%B8%AF.jpg', 'https://storage.googleapis.com/sisiwaka-touen-medias/038/038_%E9%B6%89%E5%B8%AF.mp4', NULL, NULL, 38, 1),
(5269, 39, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/039/039_01%E6%89%8B%E6%8C%81%E3%81%A1.jpg', NULL, NULL, NULL, 39, 1),
(5270, 39, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/039/039_02%E5%B7%A6.jpg', NULL, NULL, NULL, 39, 1),
(5271, 39, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/039/039_03%E6%AD%A3%E9%9D%A2.jpg', NULL, NULL, NULL, 39, 1),
(5272, 39, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/039/039_04%E5%8F%B3.jpg', NULL, NULL, NULL, 39, 1),
(5273, 39, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/039/039_05%E5%8F%96%E3%81%A3%E6%89%8B.jpg', NULL, NULL, NULL, 39, 1),
(5274, 39, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/039/039_06%E5%B7%A6%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 39, 1),
(5275, 39, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/039/039_07%E6%AD%A3%E9%9D%A2%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 39, 1),
(5276, 39, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/039/039_08%E5%8F%B3%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 39, 1),
(5277, 39, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/039/039_09%E5%8F%96%E3%81%A3%E6%89%8B%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 39, 1),
(5278, 39, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/039/039_10%E8%A6%8B%E8%BE%BC%E3%81%BF.jpg', NULL, NULL, NULL, 39, 1),
(5279, 39, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/039/039_11%E8%A3%8F.jpg', NULL, NULL, NULL, 39, 1),
(5280, 39, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/039/039_12%E8%84%9A.jpg', NULL, NULL, NULL, 39, 1),
(5281, 39, 'video', 'https://storage.googleapis.com/sisiwaka-touen-medias/039/039_%E5%87%AA%E3%81%AE%E6%99%82%E9%96%93.jpg', 'https://storage.googleapis.com/sisiwaka-touen-medias/039/039_%E5%87%AA%E3%81%AE%E6%99%82%E9%96%93.mp4', NULL, NULL, 39, 1),
(5282, 40, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/040/040_01%E6%89%8B%E6%8C%81%E3%81%A1.jpg', NULL, NULL, NULL, 40, 1),
(5283, 40, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/040/040_02_%E5%8F%B3.jpg', NULL, NULL, NULL, 40, 1),
(5284, 40, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/040/040_03%E6%AD%A3%E9%9D%A2.jpg', NULL, NULL, NULL, 40, 1),
(5285, 40, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/040/040_04%E5%B7%A6.jpg', NULL, NULL, NULL, 40, 1),
(5286, 40, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/040/040_05%E5%8F%96%E3%81%A3%E6%89%8B.jpg', NULL, NULL, NULL, 40, 1),
(5287, 40, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/040/040_06%E6%8B%A1%E5%A4%A701.jpg', NULL, NULL, NULL, 40, 1),
(5288, 40, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/040/040_07%E6%8B%A1%E5%A4%A702.jpg', NULL, NULL, NULL, 40, 1),
(5289, 40, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/040/040_08%E6%8B%A1%E5%A4%A703.jpg', NULL, NULL, NULL, 40, 1),
(5290, 40, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/040/040_09%E6%8B%A1%E5%A4%A704.jpg', NULL, NULL, NULL, 40, 1),
(5291, 40, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/040/040_10%E5%8F%96%E3%81%A3%E6%89%8B%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 40, 1),
(5292, 40, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/040/040_11%E8%A6%8B%E8%BE%BC%E3%81%BF.jpg', NULL, NULL, NULL, 40, 1),
(5293, 40, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/040/040_12%E8%A3%8F.jpg', NULL, NULL, NULL, 40, 1),
(5294, 40, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/040/040_13%E8%B6%B3.jpg', NULL, NULL, NULL, 40, 1),
(5295, 40, 'video', 'https://storage.googleapis.com/sisiwaka-touen-medias/040/040_%E5%A2%A8%E6%B5%81%E3%81%97.jpg', 'https://storage.googleapis.com/sisiwaka-touen-medias/040/040_%E5%A2%A8%E6%B5%81%E3%81%97.mp4', NULL, NULL, 40, 1),
(5296, 42, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/042/042_01%E6%89%8B%E6%8C%81%E3%81%A1.jpg', NULL, NULL, NULL, 42, 1),
(5297, 42, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/042/042_02%E5%8F%B3.jpg', NULL, NULL, NULL, 42, 1),
(5298, 42, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/042/042_03%E6%AD%A3%E9%9D%A2.jpg', NULL, NULL, NULL, 42, 1),
(5299, 42, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/042/042_04%E5%B7%A6.jpg', NULL, NULL, NULL, 42, 1),
(5300, 42, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/042/042_05%E6%8B%A1%E5%A4%A71.jpg', NULL, NULL, NULL, 42, 1),
(5301, 42, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/042/042_06%E6%8B%A1%E5%A4%A72.jpg', NULL, NULL, NULL, 42, 1),
(5302, 42, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/042/042_07%E6%8B%A1%E5%A4%A73.jpg', NULL, NULL, NULL, 42, 1),
(5303, 42, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/042/042_08%E8%A6%8B%E8%BE%BC%E3%81%BF.jpg', NULL, NULL, NULL, 42, 1),
(5304, 42, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/042/042_09%E8%A3%8F.jpg', NULL, NULL, NULL, 42, 1),
(5305, 42, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/042/042_10%E8%B6%B3.jpg', NULL, NULL, NULL, 42, 1),
(5306, 42, 'video', 'https://storage.googleapis.com/sisiwaka-touen-medias/042/042_%E5%86%AC%E3%81%AE%E3%83%A2%E3%83%A2%E3%83%B3%E3%82%AC.jpg', 'https://storage.googleapis.com/sisiwaka-touen-medias/042/042_%E5%86%AC%E3%81%AE%E3%83%A2%E3%83%A2%E3%83%B3%E3%82%AC.mp4', NULL, NULL, 42, 1),
(5307, 43, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/043/043_01%E6%89%8B%E6%8C%81%E3%81%A1.jpg', NULL, NULL, NULL, 43, 1),
(5308, 43, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/043/043_02%E6%AD%A3%E9%9D%A201.jpg', NULL, NULL, NULL, 43, 1),
(5309, 43, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/043/043_03%E6%AD%A3%E9%9D%A202.jpg', NULL, NULL, NULL, 43, 1),
(5310, 43, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/043/043_04%E6%AD%A3%E9%9D%A203.jpg', NULL, NULL, NULL, 43, 1),
(5311, 43, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/043/043_05%E6%AD%A3%E9%9D%A204.jpg', NULL, NULL, NULL, 43, 1),
(5312, 43, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/043/043_06%E6%8B%A1%E5%A4%A701.jpg', NULL, NULL, NULL, 43, 1),
(5313, 43, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/043/043_07%E6%8B%A1%E5%A4%A702.jpg', NULL, NULL, NULL, 43, 1),
(5314, 43, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/043/043_08%E6%8B%A1%E5%A4%A703.jpg', NULL, NULL, NULL, 43, 1),
(5315, 43, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/043/043_09%E6%8B%A1%E5%A4%A704.jpg', NULL, NULL, NULL, 43, 1),
(5316, 43, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/043/043_10%E6%8B%A1%E5%A4%A705.jpg', NULL, NULL, NULL, 43, 1),
(5317, 43, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/043/043_11%E8%A6%8B%E8%BE%BC%E3%81%BF01.jpg', NULL, NULL, NULL, 43, 1),
(5318, 43, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/043/043_12%E8%A6%8B%E8%BE%BC%E3%81%BF02.jpg', NULL, NULL, NULL, 43, 1),
(5319, 43, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/043/043_13%E8%A3%8F01.jpg', NULL, NULL, NULL, 43, 1),
(5320, 43, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/043/043_14%E8%A3%8F02.jpg', NULL, NULL, NULL, 43, 1),
(5321, 43, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/043/043_15%E8%A3%8F03.jpg', NULL, NULL, NULL, 43, 1),
(5322, 43, 'video', 'https://storage.googleapis.com/sisiwaka-touen-medias/043/043_%E5%8D%98%E8%AA%BF%E4%BD%9C%E6%A5%AD1.jpg', 'https://storage.googleapis.com/sisiwaka-touen-medias/043/043_%E5%8D%98%E8%AA%BF%E4%BD%9C%E6%A5%AD1.mp4', NULL, NULL, 43, 1),
(5323, 43, 'video', 'https://storage.googleapis.com/sisiwaka-touen-medias/043/043_%E5%8D%98%E8%AA%BF%E4%BD%9C%E6%A5%AD2.jpg', 'https://storage.googleapis.com/sisiwaka-touen-medias/043/043_%E5%8D%98%E8%AA%BF%E4%BD%9C%E6%A5%AD2.mp4', NULL, NULL, 43, 1),
(5324, 44, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/044/044_01%E6%89%8B%E6%8C%81%E3%81%A1.jpg', NULL, NULL, NULL, 44, 1),
(5325, 44, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/044/044_02%E6%AD%A3%E9%9D%A21.jpg', NULL, NULL, NULL, 44, 1),
(5326, 44, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/044/044_03%E6%AD%A3%E9%9D%A22.jpg', NULL, NULL, NULL, 44, 1),
(5327, 44, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/044/044_04%E6%AD%A3%E9%9D%A23.jpg', NULL, NULL, NULL, 44, 1),
(5328, 44, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/044/044_05%E6%8B%A1%E5%A4%A71.jpg', NULL, NULL, NULL, 44, 1),
(5329, 44, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/044/044_06%E6%8B%A1%E5%A4%A72.jpg', NULL, NULL, NULL, 44, 1),
(5330, 44, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/044/044_07%E8%A6%8B%E8%BE%BC%E3%81%BF.jpg', NULL, NULL, NULL, 44, 1),
(5331, 44, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/044/044_08%E8%A6%8B%E8%BE%BC%E3%81%BF2.jpg', NULL, NULL, NULL, 44, 1),
(5332, 44, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/044/044_09%E8%A3%8F%E6%AD%A3%E9%9D%A2.jpg', NULL, NULL, NULL, 44, 1),
(5333, 44, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/044/044_10%E8%A3%8F%E6%96%9C%E3%82%81.jpg', NULL, NULL, NULL, 44, 1),
(5334, 44, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/044/044_11%E8%B6%B3.jpg', NULL, NULL, NULL, 44, 1),
(5335, 44, 'video', 'https://storage.googleapis.com/sisiwaka-touen-medias/044/044_%E3%82%A4%E3%82%BD%E3%82%AE%E3%83%B3%E3%83%81%E3%83%A3%E3%82%AF.jpg', 'https://storage.googleapis.com/sisiwaka-touen-medias/044/044_%E3%82%A4%E3%82%BD%E3%82%AE%E3%83%B3%E3%83%81%E3%83%A3%E3%82%AF.mp4', NULL, NULL, 44, 1),
(5336, 45, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/045/045_01%E6%89%8B%E6%8C%81%E3%81%A1.jpg', NULL, NULL, NULL, 45, 1),
(5337, 45, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/045/045_02%E5%8F%B3.jpg', NULL, NULL, NULL, 45, 1),
(5338, 45, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/045/045_03%E6%AD%A3%E9%9D%A2.jpg', NULL, NULL, NULL, 45, 1),
(5339, 45, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/045/045_04%E5%B7%A6.jpg', NULL, NULL, NULL, 45, 1),
(5340, 45, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/045/045_05%E5%8F%96%E3%81%A3%E6%89%8B.jpg', NULL, NULL, NULL, 45, 1),
(5341, 45, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/045/045_06%E5%8F%B3%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 45, 1),
(5342, 45, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/045/045_07%E6%AD%A3%E9%9D%A2%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 45, 1),
(5343, 45, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/045/045_08%E5%B7%A6%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 45, 1),
(5344, 45, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/045/045_09%E5%8F%96%E3%81%A3%E6%89%8B%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 45, 1),
(5345, 45, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/045/045_10%E8%A6%8B%E8%BE%BC%E3%81%BF.jpg', NULL, NULL, NULL, 45, 1),
(5346, 45, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/045/045_11%E8%A6%8B%E8%BE%BC%E3%81%BF%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 45, 1),
(5347, 45, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/045/045_12%E5%BA%95.jpg', NULL, NULL, NULL, 45, 1),
(5348, 45, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/045/045_13%E3%81%A9%E3%81%93%E3%81%8B%E3%81%AE%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 45, 1),
(5349, 45, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/045/045_14%E5%8F%96%E3%81%A3%E6%89%8B%E8%A3%8F.jpg', NULL, NULL, NULL, 45, 1),
(5350, 45, 'video', 'https://storage.googleapis.com/sisiwaka-touen-medias/045/045_%E7%82%8E%E8%8A%AF%E9%9B%AA%E3%81%86%E3%81%9A%E3%82%89.jpg', 'https://storage.googleapis.com/sisiwaka-touen-medias/045/045_%E7%82%8E%E8%8A%AF%E9%9B%AA%E3%81%86%E3%81%9A%E3%82%89.mp4', NULL, NULL, 45, 1),
(5351, 50, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/050/050_01%E6%89%8B%E6%8C%81%E3%81%A1.jpg', NULL, NULL, NULL, 50, 1),
(5352, 50, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/050/050_02%E5%8F%B3.jpg', NULL, NULL, NULL, 50, 1),
(5353, 50, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/050/050_03%E6%AD%A3%E9%9D%A2.jpg', NULL, NULL, NULL, 50, 1),
(5354, 50, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/050/050_04%E5%B7%A6.jpg', NULL, NULL, NULL, 50, 1),
(5355, 50, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/050/050_05%E5%8F%96%E3%81%A3%E6%89%8B.jpg', NULL, NULL, NULL, 50, 1),
(5356, 50, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/050/050_06%E5%8F%B3%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 50, 1),
(5357, 50, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/050/050_07%E6%AD%A3%E9%9D%A2%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 50, 1),
(5358, 50, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/050/050_08%E5%8F%96%E3%81%A3%E6%89%8B%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 50, 1),
(5359, 50, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/050/050_09%E8%A6%8B%E8%BE%BC%E3%81%BF.jpg', NULL, NULL, NULL, 50, 1),
(5360, 50, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/050/050_10%E8%A6%8B%E8%BE%BC%E3%81%BF%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 50, 1),
(5361, 50, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/050/050_11%E5%8F%96%E3%81%A3%E6%89%8B%E8%A3%8F.jpg', NULL, NULL, NULL, 50, 1),
(5362, 50, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/050/050_12%E5%BA%95.jpg', NULL, NULL, NULL, 50, 1),
(5363, 50, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/050/050_13%E8%B6%B3.jpg', NULL, NULL, NULL, 50, 1),
(5364, 50, 'video', 'https://storage.googleapis.com/sisiwaka-touen-medias/050/050_%E3%81%86%E3%81%A3%E3%81%8B%E3%82%8A%E3%83%92%E3%83%A7%E3%82%A6%E3%83%A2%E3%83%B3%E3%83%80%E3%82%B3.jpg', 'https://storage.googleapis.com/sisiwaka-touen-medias/050/050_%E3%81%86%E3%81%A3%E3%81%8B%E3%82%8A%E3%83%92%E3%83%A7%E3%82%A6%E3%83%A2%E3%83%B3%E3%83%80%E3%82%B3.mp4', NULL, NULL, 50, 1),
(5365, 51, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/051/051_01%E6%89%8B%E6%8C%81%E3%81%A1.jpg', NULL, NULL, NULL, 51, 1),
(5366, 51, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/051/051_02%E5%8F%B3.jpg', NULL, NULL, NULL, 51, 1),
(5367, 51, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/051/051_03%E6%AD%A3%E9%9D%A2.jpg', NULL, NULL, NULL, 51, 1),
(5368, 51, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/051/051_04%E5%B7%A6.jpg', NULL, NULL, NULL, 51, 1),
(5369, 51, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/051/051_05%E5%8F%96%E3%81%A3%E6%89%8B.jpg', NULL, NULL, NULL, 51, 1),
(5370, 51, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/051/051_06%E5%8F%B3%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 51, 1),
(5371, 51, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/051/051_07%E6%AD%A3%E9%9D%A2%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 51, 1),
(5372, 51, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/051/051_08%E5%B7%A6%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 51, 1),
(5373, 51, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/051/051_09%E5%8F%96%E3%81%A3%E6%89%8B%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 51, 1),
(5374, 51, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/051/051_10%E5%8F%96%E3%81%A3%E6%89%8B%E8%A3%8F.jpg', NULL, NULL, NULL, 51, 1),
(5375, 51, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/051/051_11%E8%A3%8F.jpg', NULL, NULL, NULL, 51, 1),
(5376, 51, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/051/051_12%E8%B6%B3.jpg', NULL, NULL, NULL, 51, 1),
(5377, 51, 'video', 'https://storage.googleapis.com/sisiwaka-touen-medias/051/051_%E5%B3%B6%E3%81%AE%E7%B2%BE%E9%9C%8A.jpg', 'https://storage.googleapis.com/sisiwaka-touen-medias/051/051_%E5%B3%B6%E3%81%AE%E7%B2%BE%E9%9C%8A.mp4', NULL, NULL, 51, 1),
(5378, 52, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/052/052_01%E6%89%8B%E6%8C%81%E3%81%A1.jpg', NULL, NULL, NULL, 52, 1),
(5379, 52, 'video', 'https://storage.googleapis.com/sisiwaka-touen-medias/052/052_%E9%9B%AA%E4%BB%94%E8%99%8E.jpg', 'https://storage.googleapis.com/sisiwaka-touen-medias/052/052_%E9%9B%AA%E4%BB%94%E8%99%8E.mp4', NULL, NULL, 52, 1),
(5380, 53, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/053/053_01%E6%89%8B%E6%8C%81%E3%81%A1.jpg', NULL, NULL, NULL, 53, 1),
(5381, 53, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/053/053_02%E5%8F%B3.jpg', NULL, NULL, NULL, 53, 1),
(5382, 53, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/053/053_03%E6%AD%A3%E9%9D%A2.jpg', NULL, NULL, NULL, 53, 1),
(5383, 53, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/053/053_04%E5%B7%A6.jpg', NULL, NULL, NULL, 53, 1),
(5384, 53, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/053/053_05%E5%8F%96%E3%81%A3%E6%89%8B.jpg', NULL, NULL, NULL, 53, 1),
(5385, 53, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/053/053_06%E5%8F%B3%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 53, 1),
(5386, 53, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/053/053_07%E6%AD%A3%E9%9D%A2%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 53, 1),
(5387, 53, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/053/053_08%E5%B7%A6%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 53, 1),
(5388, 53, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/053/053_09%E5%8F%96%E3%81%A3%E6%89%8B%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 53, 1),
(5389, 53, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/053/053_10%E8%A6%8B%E8%BE%BC%E3%81%BF.jpg', NULL, NULL, NULL, 53, 1),
(5390, 53, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/053/053_11%E5%8F%A3%E7%B8%81.jpg', NULL, NULL, NULL, 53, 1),
(5391, 53, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/053/053_12%E8%A3%8F.jpg', NULL, NULL, NULL, 53, 1),
(5392, 53, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/053/053_13%E8%B6%B3.jpg', NULL, NULL, NULL, 53, 1),
(5393, 53, 'video', 'https://storage.googleapis.com/sisiwaka-touen-medias/053/053_%E3%81%97%E3%81%A3%E3%81%8B%E3%82%8A%E3%83%92%E3%83%A7%E3%82%A6%E3%83%A2%E3%83%B3%E3%83%80%E3%82%B3.jpg', 'https://storage.googleapis.com/sisiwaka-touen-medias/053/053_%E3%81%97%E3%81%A3%E3%81%8B%E3%82%8A%E3%83%92%E3%83%A7%E3%82%A6%E3%83%A2%E3%83%B3%E3%83%80%E3%82%B3.mp4', NULL, NULL, 53, 1),
(5394, 54, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/054/054_01%E6%89%8B%E6%8C%81%E3%81%A1.jpg', NULL, NULL, NULL, 54, 1);
INSERT INTO `artwork_media` (`id`, `artwork_id`, `kind`, `image_url`, `video_url`, `alt_ja`, `alt_en`, `sort_order`, `valid`) VALUES
(5395, 54, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/054/054_02%E5%8F%B3.jpg', NULL, NULL, NULL, 54, 1),
(5396, 54, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/054/054_03%E6%AD%A3%E9%9D%A2.jpg', NULL, NULL, NULL, 54, 1),
(5397, 54, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/054/054_04%E5%B7%A6.jpg', NULL, NULL, NULL, 54, 1),
(5398, 54, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/054/054_05%E5%8F%96%E3%81%A3%E6%89%8B.jpg', NULL, NULL, NULL, 54, 1),
(5399, 54, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/054/054_06%E5%8F%B3%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 54, 1),
(5400, 54, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/054/054_07%E6%AD%A3%E9%9D%A2%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 54, 1),
(5401, 54, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/054/054_08%E5%B7%A6%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 54, 1),
(5402, 54, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/054/054_09%E5%8F%96%E3%81%A3%E6%89%8B%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 54, 1),
(5403, 54, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/054/054_10%E5%8F%96%E3%81%A3%E6%89%8B%E8%A3%8F.jpg', NULL, NULL, NULL, 54, 1),
(5404, 54, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/054/054_11%E8%A6%8B%E8%BE%BC%E3%81%BF.jpg', NULL, NULL, NULL, 54, 1),
(5405, 54, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/054/054_12%E7%B8%81.jpg', NULL, NULL, NULL, 54, 1),
(5406, 54, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/054/054_13%E8%A3%8F.jpg', NULL, NULL, NULL, 54, 1),
(5407, 54, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/054/054_14%E8%B6%B3.jpg', NULL, NULL, NULL, 54, 1),
(5408, 54, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/054/054_15%E8%B6%B3%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 54, 1),
(5409, 54, 'video', 'https://storage.googleapis.com/sisiwaka-touen-medias/054/054_%E5%86%AC%E3%81%AE%E6%B1%A0%E3%80%81%E6%B0%B7%E3%81%AE%E6%B3%A1.jpg', 'https://storage.googleapis.com/sisiwaka-touen-medias/054/054_%E5%86%AC%E3%81%AE%E6%B1%A0%E3%80%81%E6%B0%B7%E3%81%AE%E6%B3%A1.mp4', NULL, NULL, 54, 1),
(5410, 55, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/055/055_01%E6%89%8B%E6%8C%81%E3%81%A1.jpg', NULL, NULL, NULL, 55, 1),
(5411, 55, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/055/055_02%E5%8F%B3.jpg', NULL, NULL, NULL, 55, 1),
(5412, 55, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/055/055_03%E6%AD%A3%E9%9D%A2.jpg', NULL, NULL, NULL, 55, 1),
(5413, 55, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/055/055_04%E5%B7%A6.jpg', NULL, NULL, NULL, 55, 1),
(5414, 55, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/055/055_05%E5%8F%96%E3%81%A3%E6%89%8B.jpg', NULL, NULL, NULL, 55, 1),
(5415, 55, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/055/055_06%E5%8F%B3%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 55, 1),
(5416, 55, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/055/055_07%E6%AD%A3%E9%9D%A2%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 55, 1),
(5417, 55, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/055/055_08%E5%B7%A6%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 55, 1),
(5418, 55, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/055/055_10%E8%A6%8B%E8%BE%BC%E3%81%BF.jpg', NULL, NULL, NULL, 55, 1),
(5419, 55, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/055/055_11%E8%A3%8F.jpg', NULL, NULL, NULL, 55, 1),
(5420, 55, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/055/055_12%E8%B6%B3.jpg', NULL, NULL, NULL, 55, 1),
(5421, 55, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/055/055_9%E5%8F%96%E3%81%A3%E6%89%8B%E5%86%85%E5%81%B4.jpg', NULL, NULL, NULL, 55, 1),
(5422, 55, 'video', 'https://storage.googleapis.com/sisiwaka-touen-medias/055/055_%E9%9B%AA%E5%89%B2%E3%82%8A%E3%81%AE%E5%A5%94%E6%B5%81.jpg', 'https://storage.googleapis.com/sisiwaka-touen-medias/055/055_%E9%9B%AA%E5%89%B2%E3%82%8A%E3%81%AE%E5%A5%94%E6%B5%81.mp4', NULL, NULL, 55, 1);

-- --------------------------------------------------------

--
-- テーブルの構造 `artwork_techniques`
--

DROP TABLE IF EXISTS `artwork_techniques`;
CREATE TABLE IF NOT EXISTS `artwork_techniques` (
  `artwork_id` int(11) NOT NULL,
  `techniques_slug` varchar(50) NOT NULL,
  `valid` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`artwork_id`,`techniques_slug`),
  KEY `fk_artwork_techniques_technique` (`techniques_slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `artwork_techniques`
--

INSERT INTO `artwork_techniques` (`artwork_id`, `techniques_slug`, `valid`) VALUES
(1, 'shinogi', 1),
(7, 'shinogi', 1),
(8, 'shinogi', 1),
(30, 'nerikomi', 1),
(30, 'shinogi', 1),
(33, 'nerikomi', 1),
(33, 'shinogi', 1),
(36, 'nerikomi', 1),
(36, 'shinogi', 1),
(37, 'nerikomi', 1),
(37, 'shinogi', 1),
(38, 'nerikomi', 1),
(38, 'shinogi', 1),
(38, 'tebinari', 1),
(39, 'nerikomi', 1),
(39, 'shinogi', 1),
(40, 'nerikomi', 1),
(40, 'shinogi', 1),
(42, 'nerikomi', 1),
(42, 'shinogi', 1),
(42, 'tebinari', 1),
(43, 'nerikomi', 1),
(43, 'shinogi', 1),
(44, 'nerikomi', 1),
(44, 'shinogi', 1),
(45, 'nerikomi', 1),
(45, 'shinogi', 1),
(45, 'tebinari', 1),
(50, 'nerikomi', 1),
(50, 'shinogi', 1),
(51, 'nerikomi', 1),
(51, 'shinogi', 1),
(52, 'nerikomi', 1),
(52, 'shinogi', 1),
(53, 'nerikomi', 1),
(53, 'shinogi', 1),
(54, 'nerikomi', 1),
(54, 'shinogi', 1),
(55, 'nerikomi', 1),
(55, 'shinogi', 1);

-- --------------------------------------------------------

--
-- テーブルの構造 `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `slug` varchar(50) NOT NULL,
  `label_ja` varchar(100) NOT NULL,
  `label_en` varchar(100) NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `valid` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `categories`
--

INSERT INTO `categories` (`slug`, `label_ja`, `label_en`, `sort_order`, `valid`) VALUES
('coffee_cup', 'コーヒーカップ', 'Coffee Cup', 1, 1),
('demitasse_cup', 'デミタスカップ', 'Demitasse Cup', 2, 1),
('donburi', 'どんぶり', 'Donburi Bowl', 11, 1),
('large_bowl', '大鉢', 'Large Bowl', 8, 1),
('large_plate', '大皿', 'Large Plate', 4, 1),
('medium_bowl', '中鉢', 'Medium Bowl', 9, 1),
('medium_plate', '中皿', 'Medium Plate', 5, 1),
('mosquito_coil_holder', '蚊取り線香入れ', 'Mosquito Coil Holder', 12, 1),
('pasta_plate', 'パスタ皿', 'Pasta Plate', 7, 1),
('small_bowl', '小鉢', 'Small Bowl', 10, 1),
('small_plate', '小皿', 'Small Plate', 6, 1),
('soup_cup', 'スープカップ', 'Soup Cup', 3, 1);

-- --------------------------------------------------------

--
-- テーブルの構造 `coloring`
--

DROP TABLE IF EXISTS `coloring`;
CREATE TABLE IF NOT EXISTS `coloring` (
  `slug` varchar(50) NOT NULL,
  `label_ja` varchar(100) NOT NULL,
  `label_en` varchar(100) NOT NULL,
  `valid` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `coloring`
--

INSERT INTO `coloring` (`slug`, `label_ja`, `label_en`, `valid`) VALUES
('monotone', 'モノトーン', 'Monotone', 1),
('multicolour', 'マルチカラー', 'Multicolour', 1);

-- --------------------------------------------------------

--
-- テーブルの構造 `colorings`
--

DROP TABLE IF EXISTS `colorings`;
CREATE TABLE IF NOT EXISTS `colorings` (
  `slug` varchar(50) NOT NULL,
  `label_ja` varchar(100) NOT NULL,
  `label_en` varchar(100) NOT NULL,
  `valid` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `colorings`
--

INSERT INTO `colorings` (`slug`, `label_ja`, `label_en`, `valid`) VALUES
('monotone', 'モノトーン', 'Monotone', 1),
('multicolour', 'マルチカラー', 'Multicolour', 1);

-- --------------------------------------------------------

--
-- テーブルの構造 `techniques`
--

DROP TABLE IF EXISTS `techniques`;
CREATE TABLE IF NOT EXISTS `techniques` (
  `slug` varchar(50) NOT NULL,
  `label_ja` varchar(100) NOT NULL,
  `label_en` varchar(100) NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `valid` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `techniques`
--

INSERT INTO `techniques` (`slug`, `label_ja`, `label_en`, `sort_order`, `valid`) VALUES
('nerikomi', '練り込み', 'Nerikomi', 1, 1),
('shinogi', 'しのぎ', 'Shinogi', 2, 1),
('tebinari', '手びねり', 'Handbuilding', 3, 1);

-- --------------------------------------------------------

--
-- テーブルの構造 `updates`
--

DROP TABLE IF EXISTS `updates`;
CREATE TABLE IF NOT EXISTS `updates` (
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `article` text NOT NULL,
  `valid` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `updates`
--

INSERT INTO `updates` (`created_at`, `article`, `valid`) VALUES
('2025-09-24 22:33:35', 'サイトを作成しました。', 1),
('2025-09-24 22:34:42', '更新情報機能を追加しました。', 1),
('2025-09-24 22:34:56', '見た目を調整しました。', 1),
('2025-10-15 15:15:32', 'お問い合わせフォームを追加しました。', 1),
('2025-10-16 03:19:50', '玉サボテン様練り込みコーヒーカップ「雪割りの奔流」を追加しました。', 1);

-- --------------------------------------------------------

--
-- テーブルの構造 `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` varchar(100) NOT NULL,
  `pw` varchar(100) NOT NULL,
  `role` varchar(100) DEFAULT NULL,
  `valid` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `users`
--

INSERT INTO `users` (`id`, `pw`, `role`, `valid`) VALUES
('sisiwaka_editor', '$2y$10$SoyaepnRTbLupMp5.04T1OXYW6FGBSvAyOPhnBMxcqTUMWZhsTEYq', NULL, 1);

--
-- ダンプしたテーブルの制約
--

--
-- テーブルの制約 `artworks`
--
ALTER TABLE `artworks`
  ADD CONSTRAINT `fk_artworks_category` FOREIGN KEY (`category`) REFERENCES `categories` (`slug`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_artworks_color` FOREIGN KEY (`coloring`) REFERENCES `colorings` (`slug`);

--
-- テーブルの制約 `artwork_techniques`
--
ALTER TABLE `artwork_techniques`
  ADD CONSTRAINT `fk_artwork_techniques_artwork` FOREIGN KEY (`artwork_id`) REFERENCES `artworks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_artwork_techniques_technique` FOREIGN KEY (`techniques_slug`) REFERENCES `techniques` (`slug`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
