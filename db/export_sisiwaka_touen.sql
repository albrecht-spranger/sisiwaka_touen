-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- ホスト: 127.0.0.1
-- 生成日時: 2025-10-15 18:23:24
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
  `valid` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `artworks`
--

INSERT INTO `artworks` (`id`, `name`, `description_title`, `description`, `category`, `spec`, `width`, `max_width`, `height`, `weight`, `capacity`, `clay`, `glaze`, `notes`, `in_stock`, `coloring`, `shop_url`, `instagram_url`, `completion_date`, `update_date`, `valid`) VALUES
(37, 'ホワイトタイガー', '玉サボテン様練り込みコーヒーカップ「ホワイトタイガー」', '　白土と黒土を練り込み、玉サボテンからインスピレーションを得た模様を彫り込んだコーヒーカップです。\r\n　側面にはゆるやかに膨らんだ六角形の模様を施し、6本の足で支える高台が個性的なデザインを引き立てます。六角形の膨らみは、手にしっくりと馴染み、心地よい質感を楽しめます。\r\n　内側には「うのふ」という真っ白い釉薬を使用し、外側には「亀甲貫入」という、貫入（亀裂模様）が現れる釉薬を掛けています。この亀裂は、一点一点異なる表情を見せ、世界にひとつだけの個性的なカップに仕上がっています。\r\n透明釉の場合は白と黒のコントラストが強く出ますが、この「亀甲貫入」は、素地の色を柔らかく包み込み、白いフィルタを通したような、やわらかい色合いを生み出します。\r\n　その独特の色合いと模様から、「ホワイトタイガー」と名付けました。', 'coffee_cup', '直径：約8.0cm (取っ手を除く)、10.5cm (取っ手込み)\r\n高さ：約8.4cm\r\n容量：約160cc (8割注水時)\r\n重さ：236g\r\n', 8.0, 10.5, 8.4, 236, 160, '白土、黒土', '外側：亀甲貫入\r\n内側：うのふ', '', 0, 'monotone', NULL, 'https://www.instagram.com/p/DGnhjBXTaRX/', '2025-01-05', '2025-09-24 15:38:10', 1),
(38, '鶉帯', '部分練り込み小鉢「鶉帯」', '　白土と黒土を練り込んだ模様を、帯状にめぐらせた小鉢です。\r\n　その帯模様を中心に、しのぎの技法で六角形の文様を彫り込み、リズムと立体感を加えました。模様を器全体に施すのではなく、あえて帯の部分に集中させることで、洗練された佇まいを意識しています。\r\n　器は4本足でしっかりと自立します。\r\n　本作は電動ろくろではなく、手びねりによって成形しています。そのため、形にわずかな歪みがあり、それがかえって温かみのある有機的な感触を生み出しています。\r\n　鶉の羽を思わせる模様を帯のように器がまとう姿から、「鶉帯（うずらおび）」と名付けました。\r\n　副菜を少し添えたり、お菓子や小物入れとしても楽しめるサイズ感です。', 'small_bowl', '直径：約11.0cm\r\n高さ：約7.5cm\r\n容量：約180cc (8割注水時)\r\n重さ：257g\r\n', 11.0, 11.0, 7.5, 257, 180, '白土、黒土', '外側：乳濁\r\n内側：黒天目', '', 0, 'monotone', NULL, 'https://www.instagram.com/p/DIWgqjkz3lD/', '2025-01-26', '2025-09-24 16:20:54', 1),
(40, '墨流し', '玉サボテン様練り込みコーヒーカップ「墨流し」', '　白土と黒土を練り込んで成形し、玉サボテンをモチーフに六角形のふくらみを彫り込んだ、力強さとやわらかさを併せ持つコーヒーカップです。\r\n　外側には、細やかな貫入が入る貫入性志野釉を施しました。白土と黒土のコントラストは、釉薬の効果により、白はややクリーム色に、黒はグレーがかった柔らかな色調へと変化し、全体に穏やかな表情をもたらしています。\r\n　本体は短い円柱形で、6本の低い力強い脚でカップを支えています。安定感と同時に、独自の存在感を演出します。\r\n　内側には黒天目釉を使用しました。縁の部分では2種類の釉薬が重なり合って泡状の模様が生まれています。流れるような練り込み模様と、しのぎによって生まれた有機的な歪みの線。\r\n　その見た目が、日本の伝統的な染色技法「墨流し」を思わせることから、この作品に「墨流し」という銘をつけました。', 'coffee_cup', '直径：約9.0cm (取っ手を除く)、約11.5cm (取っ手を含む)\r\n高さ：約7.0cm\r\n容量：約180cc (8割注水時)\r\n重さ：241g', 9.0, 11.5, 7.0, 241, 180, '白土、黒土', '外側：貫入性志乃\r\n内側：黒天目', '', 1, 'monotone', 'https://minne.com/items/42866956', 'https://www.instagram.com/p/DIyqnpJzqjd/', '2025-02-16', '2025-09-24 15:38:52', 1),
(42, '冬のモモンガ', '部分練り込みコーヒーカップ「冬のモモンガ」', '　このカップでは、練り込みとしのぎの技法を部分的に取り入れています。\r\n　白土と黒土を組み合わせた練り込みは、側面の中央付近にとどめ、その部分を中心に、六角形を描くように、しのぎを加えました。あえて装飾を一部にとどめることで、控えめな印象となっています。\r\n　その上からは、厚みのある「亀甲貫入」の釉薬を掛けています。この釉薬により、白黒の練り込み模様は乳白色のヴェールに包まれるように柔らかくぼやけ、しのぎの稜線も滲むようにやさしく変化します。\r\n　高台の代わりに3本の小さな足をつけており、まるで小動物がちょこんと身をかがめているよう。その姿が、冬毛にくるまり木のうろで静かに休むモモンガを思わせることから、「冬のモモンガ」と名付けました。\r\n　日常のひとときに、森の中の小さな物語をそっと添えてくれるような、やさしい一品です。', 'coffee_cup', '直径：約8.0cm (取っ手を除く)、約11.0cm (取っ手を含む)\r\n高さ：約8.0cm\r\n容量：約150cc (8割注水時)\r\n重さ：245g', 8.0, 11.0, 8.0, 245, 150, '白土＋黒土', '外側：亀甲貫入\r\n内側：黒天目', '', 1, 'monotone', 'https://minne.com/items/43197758', 'https://www.instagram.com/p/DKpPIkQzhj4/', '2025-02-16', '2025-10-14 02:33:19', 1),
(43, '単調作業', 'サボテン金剛丸様練り込み中鉢「単調作業」', '　白土と黒土を練り込み成形し、サボテン「金剛丸」のいぼをモチーフに、ピラミッド状の模様を側面全体に彫り込んだ中鉢です。\r\n　練り込みの縞模様を削ることで、それぞれのピラミッドに等高線のような文様が浮かび上がりました。しかし、このピラミッド、実に360個。  ひたすら彫るという、まさに「単調作業」……眠気に誘われながらも、一つひとつ丁寧に刻みました。\r\n　その甲斐あってか、この中鉢には独特のリズムと表情が生まれたように思います。銘は、制作過程からそのまま「単調作業」と名付けました。', 'medium_bowl', '直径：約17.0cm\r\n高さ：9.5cm\r\n容量：約1,000cc (8割注水時)\r\n重さ：850g', 17.0, 17.5, 9.5, 850, 1, '白土、黒土', '外側：3号透明\r\n内側：黒天目', '', 0, 'monotone', NULL, 'https://www.instagram.com/p/DJMrjMJzm_P/', '2025-03-22', '2025-09-23 15:56:36', 1),
(44, 'イソギンチャク', '玉サボテン様練り込み中鉢「イソギンチャク」', '　たっぷり900cc入る中鉢。\r\n　どっしりとした安定感があり、食卓の主役として存在感を放ちます。\r\n　白土と黒土を練り込んだ後、しのぎの技法で表面を削っています。この削りにより、模様はさらに複雑にゆがみ、有機的な表情に仕上がりました。削りのモチーフは玉サボテン。六角形のパターンは、それぞれが緩やかに盛り上がり、独特の手触りと立体感を生み出しています。\r\n　外側は、貫入性志野という釉薬を掛けています。わずかに不透明なこの釉薬は、白土と黒土のコントラストをやわらげ、全体を落ち着いた印象にまとめています。釉薬の特長でもある細かい貫入やピンホールが入ることで、どこか時間を重ねた器のような、静かな趣も感じさせます。また、内側の黒天目釉は、その深い黒が料理を引き立てます。\r\n　高台は9本の足で構成されており、器を裏返すと、まるでイソギンチャクのような姿に。銘はそのまま「イソギンチャク」としました。', 'medium_bowl', '直径：約16.0cm\r\n高さ：約9.7cm\r\n容量：約900cc (8割注水時)\r\n重さ：936g', 16.0, 16.0, 9.7, 936, 900, '白土、黒土', '外側：貫入性志野\r\n内側：黒天目', '', 0, 'monotone', NULL, 'https://www.instagram.com/p/DJRtW5szHrx/', '2025-04-13', '2025-09-23 15:38:12', 1),
(45, '炎芯雪うずら', '部分練り込みデミタスカップ「炎芯雪うずら」', '　練り込みとしのぎの技法を組み合わせたコーヒーカップです。\r\n　白土と黒土を練り合わせていますが、その模様をカップの半分ほどに抑えました。模様のある部分と素地の白土部分が大きく二分され、ひとつの器に異なるふたつの表情が共存しています。\r\n　さらに、カップの側面全体には、サボテンの金剛丸をモチーフにしたピラミッド状の模様を彫り込んでおり、独特な立体感を楽しめます。\r\n　外側には「貫入性志野」という釉薬を使用。貫入と、黒土の上に浮かぶ小さな凹凸が、まるで永く風雪に晒されてきたかのような風合いを生み出しています。内側には「赤結晶」という釉薬を施しました。ゆらめく深紅の色彩は、雪の中に灯る「炎の芯」を思わせます。 \r\n　外側の練り込み模様が、雪景色にたたずむうずらの姿を連想させることと合わせ、銘を「炎芯雪うずら」としました。', 'demitasse_cup', '直径：約8.0cm (取っ手を除く)、約10.5cm (取っ手を含む)\r\n高さ：約5.5cm\r\n容量：約125cc (8割注水時)\r\n重さ：167g', 8.0, 10.5, 5.5, 167, 125, '白土、黒土', '外側：貫入性志野\r\n内側：赤結晶', '', 0, 'multicolour', NULL, '', '2025-03-09', '2025-10-14 15:35:06', 1),
(50, 'うっかりヒョウモンダコ', '玉サボテン様練り込みコーヒーカップ「うっかりヒョウモンダコ」', '　深海に棲む猛毒のヒョウモンダコをモチーフにした作品です。\r\n　ヒョウモンダコは猛毒をもち、危険を知らせるために体表に鮮やかな青い輪紋を浮かび上がらせます。その姿を表現するために鮮やかなトルコブルーの粘土を使いましたが、少し落ち着いた雰囲気を出そうと貫入性志野を掛けたところ、警告色がぼんやりとした印象になりました。貫入性志野の特性をよく考えていれば、この釉薬を選ばなかったのに・・・ということで、銘は「うっかりヒョウモンダコ」にしました。\r\n　トルコブルー、ライトブラウン、ダークブラウンの3色の粘土を練り込み、カップの側面全体に六角形の模様を彫り込んでいます。高台は6本の足で表現しました。\r\n　こんな「うっかり」したコーヒーカップですが、毒はないので安心して毎日のコーヒーのお供にしてあげてください。', 'coffee_cup', '直径：約8.5cm (取っ手を除く)、約11.0cm (取っ手を含む)\r\n高さ：約7.0cm\r\n容量：約150cc (8割注水時)\r\n重さ：202g', 8.5, 11.0, 7.0, 202, 150, 'カラー粘土：トルコブルー、ライトブラウン、ダークブラウン', '外側：貫入性志野\r\n内側：黒天目', '', 1, 'multicolour', 'https://minne.com/items/43841419', 'https://www.instagram.com/p/DOV3SO9kVUV/', '2025-06-01', '2025-09-23 15:57:47', 1),
(51, '島の精霊', '玉サボテン様練り込みデミタスカップカップ「島の精霊」', '　練り込みとしのぎの技法を組み合わせた、デミタスサイズのコーヒーカップです。\r\n　黒土と、比率を抑えた白土の練り込みにより、黒い背景に白の流線が浮かび上がります。\r\n　カップの側面には玉サボテンをイメージしてゆるやかに膨らんだ六角形を彫り込んでいます。このしのぎによって、器の表面に細かな凹凸が生まれます。\r\n白の流線は、しのぎの影響を受けて変化します。凹凸を避けるように曲がったり、途中で切り離されたり、時に中洲のように浮かんで見える箇所もあります。\r\n　高台は6本の脚で構成しました。やや内側に湾曲した脚は、大地を鷲掴みにしているような印象を与えます。\r\n　側面の模様が一見すると顔のようにも見えることがあります。その表情と器全体の雰囲気から、「島の精霊」と銘を付けました。', 'demitasse_cup', '直径：約7.5cm (取っ手を除く)、約10.0cm (取っ手を含む)\r\n高さ：約7.5cm\r\n容量：約125cc (8割注水時)\r\n重さ：192g', 7.5, 10.0, 7.5, 192, 125, 'カラー粘土白25%＋黒75%', '外側：3号透明\r\n内側：黒天目', '', 1, 'monotone', 'https://minne.com/items/43197854', 'https://www.instagram.com/p/DL2b9keTIVn/', '2025-06-01', '2025-09-22 03:48:13', 1),
(53, 'しっかりヒョウモンダコ', '玉サボテン様練り込みコーヒーカップ「しっかりヒョウモンダコ」', '　深海に棲む猛毒のヒョウモンダコをモチーフにした作品です。\r\n　ヒョウモンダコは猛毒をもち、危険を知らせるために体表に鮮やかな青い輪紋を浮かび上がらせます。このカップでは、その警告色を表現するため、鮮やかなトルコブルーの粘土を使いました。そして、その青がしっかり見えるよう、透明釉を掛けました。しっかりトルコブルーが発色したので、銘は「しっかりヒョウモンダコ」です。\r\n(実は、以前、うっかり貫入性志野という釉薬を掛けてしまい、ぼんやりしたヒョウモンダコができたことがありました)\r\n　見た目は毒々しいかもしれませんが、もちろん毒はありません。安心して毎日のコーヒーのお供にしてあげてください。\r\n', 'coffee_cup', '直径：約7.0cm (取っ手を除く)、約9.5cm (取っ手を含む)\r\n高さ：約7.0cm\r\n容量：約135cc (8割注水時)\r\n重さ：184g', 7.0, 9.5, 7.0, 184, 135, 'カラー粘土：トルコブルー、ライトブラウン、ダークブラウン', '外側：3号透明\r\n内側：黒天目', '', 1, 'multicolour', 'https://minne.com/items/43841520', 'https://www.instagram.com/albrecht1999/p/DOV40uREVVw/', '2025-07-27', '2025-09-23 15:26:20', 1),
(54, '冬の池、氷の泡', '玉サボテン様練り込みコーヒーカップ「冬の池、氷の泡」', '寒い冬の池。\r\n氷の下をのぞき込むと、大きな泡の塊が氷に閉じ込められているのが見えます。\r\n急に気温が下がって、はじける前に凍ったのか、氷が厚く成長するのと一緒に泡も育ったのか・・・\r\n本来すぐに消える泡が、氷に包まれ冬の間だけ姿をとどめている。その不思議な光景を思い浮かべ、「冬の池、氷の泡」と名付けました。\r\n白土と黒土を練り込み、カップの側面には六角形の模様をしのぎました。\r\n外側には亀甲貫入釉を掛けました。透明感のある釉の下から練り込み模様が透け、小さな気泡や貫入が自然の中の氷を思わせます。白と黒のコントラストは釉薬によって和らぎ、穏やかな表情を見せます。手に取れば、柔らかく、やさしい手触りです。\r\n静かな氷の池を思わせるカップですが、温かいコーヒーのお供にいかがでしょうか？', 'coffee_cup', '直径：約8.0cm (取っ手を除く)、約10.5cm (取っ手を含む)\r\n高さ：約7.0cm\r\n容量：約140cc (8割注水時)\r\n重さ：204g', 8.0, 10.5, 7.0, 204, 140, '白土150g、黒土100g、白土250gをハンバーガー', '外側：亀甲貫入\r\n内側：うのふ', '', 1, 'monotone', 'https://minne.com/items/43925588', 'https://www.instagram.com/p/DO8ous2kbgM/', '2025-08-03', '2025-09-28 12:36:29', 1);

-- --------------------------------------------------------

--
-- テーブルの構造 `artworks_import_raw`
--

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

--
-- テーブルのデータのダンプ `artworks_import_raw`
--

INSERT INTO `artworks_import_raw` (`id`, `description_title`, `categories`, `description`, `name`, `spec`, `width`, `maxWidth`, `height`, `weight`, `capacity`, `technique0`, `technique1`, `technique2`, `clay`, `glaze`, `notes`, `in_stock`, `url`, `instagramUrl`, `completionDate`, `updateDate`, `valid`) VALUES
(54, '玉サボテン様練り込みコーヒーカップ「冬の池、氷の泡」', 'coffee_cup', '寒い冬の池。\r\n氷の下をのぞき込むと、大きな泡の塊が氷に閉じ込められているのが見えます。\r\n急に気温が下がって、はじける前に凍ったのか、氷が厚く成長するのと一緒に泡も育ったのか・・・\r\n本来すぐに消える泡が、氷に包まれ冬の間だけ姿をとどめている。その不思議な光景を思い浮かべ、「冬の池、氷の泡」と名付けました。\r\n白土と黒土を練り込み、カップの側面には六角形の模様をしのぎました。\r\n外側には亀甲貫入釉を掛けました。透明感のある釉の下から練り込み模様が透け、小さな気泡や貫入が自然の中の氷を思わせます。白と黒のコントラストは釉薬によって和らぎ、穏やかな表情を見せます。手に取れば、柔らかく、やさしい手触りです。\r\n静かな氷の池を思わせるカップですが、温かいコーヒーのお供にいかがでしょうか？', '冬の池、氷の泡', '直径：約8.0cm (取っ手を除く)、約10.5cm (取っ手を含む)\r\n高さ：約7.0cm\r\n容量：約140cc (8割注水時)\r\n重さ：204g', 8.0, 10.5, 7.0, 204, 140, '練り込み', 'しのぎ', '', '白土400g、黒土100g', '外側：亀甲貫入\r\n内側：うのふ', '', '1', 'https://minne.com/items/43925588', 'https://www.instagram.com/p/DO8ous2kbgM/', '2025/8/3', '', 'yes'),
(53, '玉サボテン様練り込みコーヒーカップ「しっかりヒョウモンダコ」', 'coffee_cup', '深海に棲む猛毒のヒョウモンダコをモチーフにした作品です。\r\nヒョウモンダコは猛毒をもち、危険を知らせるために体表に鮮やかな青い輪紋を浮かび上がらせます。\r\nこのカップでは、その警告色を表現するため、鮮やかなトルコブルーの粘土を使いました。\r\nそして、その青がしっかり見えるよう、透明釉を掛けました。\r\nしっかりトルコブルーが発色したので、銘は「しっかりヒョウモンダコ」です。\r\n(実は、以前、うっかり貫入性志野という釉薬を掛けてしまい、ぼんやりしたヒョウモンダコができたことがありました)\r\n見た目は毒々しいかもしれませんが、もちろん毒はありません。安心して毎日のコーヒーのお供にしてあげてください。\r\n', 'しっかりヒョウモンダコ', '直径：約7.0cm (取っ手を除く)、約9.5cm (取っ手を含む)\r\n高さ：約7.0cm\r\n容量：約135cc (8割注水時)\r\n重さ：184g', 7.0, 9.5, 7.0, 184, 135, '練り込み', 'しのぎ', '', 'カラー粘土：トルコブルー、ライトブラウン、ダークブラウン', '外側：3号透明\r\n内側：黒天目', '', '1', 'https://minne.com/items/43841520', 'https://www.instagram.com/albrecht1999/p/DOV40uREVVw/', '2025/7/27', '', ''),
(50, '玉サボテン様練り込みコーヒーカップ「うっかりヒョウモンダコ」', 'coffee_cup', '深海に棲む猛毒のヒョウモンダコをモチーフにした作品です。\r\nヒョウモンダコは猛毒をもち、危険を知らせるために体表に鮮やかな青い輪紋を浮かび上がらせます。\r\nその姿を表現するために鮮やかなトルコブルーの粘土を使いましたが、少し落ち着いた雰囲気を出そうと貫入性志野を掛けたところ、警告色がぼんやりとした印象になりました。\r\n貫入性志野の特性をよく考えていれば、この釉薬を選ばなかったのに・・・ということで、銘は「うっかりヒョウモンダコ」にしました。\r\nトルコブルー、ライトブラウン、ダークブラウンの3色の粘土を練り込み、カップの側面全体に六角形の模様を彫り込んでいます。高台は6本の足で表現しました。\r\nこんな「うっかり」したコーヒーカップですが、毒はないので安心して毎日のコーヒーのお供にしてあげてください。', 'うっかりヒョウモンダコ', '直径：約8.5cm (取っ手を除く)、約11.0cm (取っ手を含む)\r\n高さ：約7.0cm\r\n容量：約150cc (8割注水時)\r\n重さ：202g', 8.5, 11.0, 7.0, 202, 150, '練り込み', 'しのぎ', '', 'カラー粘土：トルコブルー、ライトブラウン、ダークブラウン', '外側：貫入性志野\r\n内側：黒天目', '', '1', 'https://minne.com/items/43841419', 'https://www.instagram.com/p/DOV3SO9kVUV/', '2025/6/1', '', '');

-- --------------------------------------------------------

--
-- テーブルの構造 `artwork_media`
--

CREATE TABLE `artwork_media` (
  `id` int(11) NOT NULL,
  `artwork_id` int(11) NOT NULL,
  `kind` enum('image','video') NOT NULL,
  `image_url` varchar(500) NOT NULL,
  `video_url` varchar(500) DEFAULT NULL,
  `alt_ja` varchar(255) DEFAULT NULL,
  `alt_en` varchar(255) DEFAULT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `valid` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `artwork_media`
--

INSERT INTO `artwork_media` (`id`, `artwork_id`, `kind`, `image_url`, `video_url`, `alt_ja`, `alt_en`, `sort_order`, `valid`) VALUES
(2493, 1, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/001/001_01%E6%89%8B%E6%8C%81%E3%81%A1.jpg', NULL, NULL, NULL, 1, 1),
(2494, 1, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/001/001_02%E5%8F%B3.jpg', NULL, NULL, NULL, 1, 1),
(2495, 1, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/001/001_03%E6%AD%A3%E9%9D%A2.jpg', NULL, NULL, NULL, 1, 1),
(2496, 1, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/001/001_04%E5%B7%A6.jpg', NULL, NULL, NULL, 1, 1),
(2497, 1, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/001/001_05%E5%8F%96%E3%81%A3%E6%89%8B.jpg', NULL, NULL, NULL, 1, 1),
(2498, 1, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/001/001_06%E8%A6%8B%E8%BE%BC%E3%81%BF.jpg', NULL, NULL, NULL, 1, 1),
(2499, 1, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/001/001_07%E8%A3%8F.jpg', NULL, NULL, NULL, 1, 1),
(2500, 1, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/001/001_08%E5%A4%96%E5%81%B4%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 1, 1),
(2501, 1, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/001/001_09%E5%86%85%E5%81%B4%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 1, 1),
(2502, 1, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/001/001_10%E9%AB%98%E5%8F%B0%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 1, 1),
(2503, 1, 'video', 'https://storage.googleapis.com/sisiwaka-touen-medias/001/001_%E9%BB%92%E4%BA%80.jpg', 'https://storage.googleapis.com/sisiwaka-touen-medias/001/001_%E9%BB%92%E4%BA%80.mp4', NULL, NULL, 1, 1),
(2504, 30, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/030/030_01%E6%AD%A3%E9%9D%A21.jpg', NULL, NULL, NULL, 30, 1),
(2505, 30, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/030/030_03%E6%AD%A3%E9%9D%A23.jpg', NULL, NULL, NULL, 30, 1),
(2506, 30, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/030/030_04%E8%A6%8B%E8%BE%BC%E3%81%BF.jpg', NULL, NULL, NULL, 30, 1),
(2507, 30, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/030/030_05%E6%8E%A5%E5%86%99.jpg', NULL, NULL, NULL, 30, 1),
(2508, 30, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/030/030_06%E6%AD%A3%E9%9D%A24.jpg', NULL, NULL, NULL, 30, 1),
(2509, 30, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/030/030_07%E8%A3%8F.jpg', NULL, NULL, NULL, 30, 1),
(2510, 30, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/030/030_08%E6%89%8B%E6%8C%81%E3%81%A1.jpg', NULL, NULL, NULL, 30, 1),
(2511, 30, 'video', 'https://storage.googleapis.com/sisiwaka-touen-medias/030/030_%E9%9B%AA%E5%A2%A8%E5%B3%B0.jpg', 'https://storage.googleapis.com/sisiwaka-touen-medias/030/030_%E9%9B%AA%E5%A2%A8%E5%B3%B0.mp4', NULL, NULL, 30, 1),
(2512, 32, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/032/032_01%E6%89%8B%E6%8C%81%E3%81%A1.jpg', NULL, NULL, NULL, 32, 1),
(2513, 32, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/032/032_02%E5%B7%A6.jpg', NULL, NULL, NULL, 32, 1),
(2514, 32, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/032/032_03%E6%AD%A3%E9%9D%A2.jpg', NULL, NULL, NULL, 32, 1),
(2515, 32, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/032/032_04%E5%8F%B3.jpg', NULL, NULL, NULL, 32, 1),
(2516, 32, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/032/032_05%E5%8F%96%E3%81%A3%E6%89%8B.jpg', NULL, NULL, NULL, 32, 1),
(2517, 32, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/032/032_06%E8%A6%8B%E8%BE%BC%E3%81%BF.jpg', NULL, NULL, NULL, 32, 1),
(2518, 32, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/032/032_07%E5%BA%95.jpg', NULL, NULL, NULL, 32, 1),
(2519, 32, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/032/032_08%E6%8E%A5%E5%86%99.jpg', NULL, NULL, NULL, 32, 1),
(2520, 32, 'video', 'https://storage.googleapis.com/sisiwaka-touen-medias/032/032_%E8%9C%86%E3%81%AE%E7%BE%A4%E7%94%9F.jpg', 'https://storage.googleapis.com/sisiwaka-touen-medias/032/032_%E8%9C%86%E3%81%AE%E7%BE%A4%E7%94%9F.mp4', NULL, NULL, 32, 1),
(2521, 33, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/033/033_01%E6%89%8B%E6%8C%81%E3%81%A1.jpg', NULL, NULL, NULL, 33, 1),
(2522, 33, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/033/033_02%E5%B7%A6.jpg', NULL, NULL, NULL, 33, 1),
(2523, 33, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/033/033_03%E6%AD%A3%E9%9D%A2.jpg', NULL, NULL, NULL, 33, 1),
(2524, 33, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/033/033_04%E5%8F%B3.jpg', NULL, NULL, NULL, 33, 1),
(2525, 33, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/033/033_05%E5%8F%96%E3%81%A3%E6%89%8B.jpg', NULL, NULL, NULL, 33, 1),
(2526, 33, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/033/033_06%E8%A6%8B%E8%BE%BC%E3%81%BF.jpg', NULL, NULL, NULL, 33, 1),
(2527, 33, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/033/033_07%E5%BA%95.jpg', NULL, NULL, NULL, 33, 1),
(2528, 33, 'video', 'https://storage.googleapis.com/sisiwaka-touen-medias/033/033_%E9%A2%A8%E6%B4%9E%E5%AE%9F%E9%A8%93.jpg', 'https://storage.googleapis.com/sisiwaka-touen-medias/033/033_%E9%A2%A8%E6%B4%9E%E5%AE%9F%E9%A8%93.mp4', NULL, NULL, 33, 1),
(2529, 34, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/034/034_01%E6%89%8B%E6%8C%81%E3%81%A1.jpg', NULL, NULL, NULL, 34, 1),
(2530, 34, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/034/034_02%E5%B7%A6.jpg', NULL, NULL, NULL, 34, 1),
(2531, 34, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/034/034_03%E6%AD%A3%E9%9D%A2.jpg', NULL, NULL, NULL, 34, 1),
(2532, 34, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/034/034_04%E5%8F%B3.jpg', NULL, NULL, NULL, 34, 1),
(2533, 34, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/034/034_05%E5%8F%96%E3%81%A3%E6%89%8B.jpg', NULL, NULL, NULL, 34, 1),
(2534, 34, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/034/034_06%E8%A6%8B%E8%BE%BC%E3%81%BF.jpg', NULL, NULL, NULL, 34, 1),
(2535, 34, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/034/034_07%E5%BA%95.jpg', NULL, NULL, NULL, 34, 1),
(2536, 34, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/034/034_08%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 34, 1),
(2537, 34, 'video', 'https://storage.googleapis.com/sisiwaka-touen-medias/034/034_%E7%89%A1%E8%A0%A3%E3%81%AE%E7%BE%A4%E7%94%9F.jpg', 'https://storage.googleapis.com/sisiwaka-touen-medias/034/034_%E7%89%A1%E8%A0%A3%E3%81%AE%E7%BE%A4%E7%94%9F.mp4', NULL, NULL, 34, 1),
(2538, 35, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/035/035_01%E6%89%8B%E6%8C%81%E3%81%A1.jpg', NULL, NULL, NULL, 35, 1),
(2539, 35, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/035/035_02%E5%B7%A6.jpg', NULL, NULL, NULL, 35, 1),
(2540, 35, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/035/035_03%E6%AD%A3%E9%9D%A2.jpg', NULL, NULL, NULL, 35, 1),
(2541, 35, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/035/035_04%E5%8F%B3.jpg', NULL, NULL, NULL, 35, 1),
(2542, 35, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/035/035_05%E5%8F%96%E3%81%A3%E6%89%8B.jpg', NULL, NULL, NULL, 35, 1),
(2543, 35, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/035/035_06%E8%A6%8B%E8%BE%BC%E3%81%BF.jpg', NULL, NULL, NULL, 35, 1),
(2544, 35, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/035/035_07%E5%BA%95.jpg', NULL, NULL, NULL, 35, 1),
(2545, 35, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/035/035_08%E5%81%B4%E9%9D%A2%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 35, 1),
(2546, 35, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/035/035_09%E5%81%B4%E9%9D%A2%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 35, 1),
(2547, 35, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/035/035_10%E5%8F%96%E3%81%A3%E6%89%8B%E8%A3%8F.jpg', NULL, NULL, NULL, 35, 1),
(2548, 35, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/035/035_11%E5%8F%A3%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 35, 1),
(2549, 35, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/035/035_12%E9%AB%98%E5%8F%B0%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 35, 1),
(2550, 35, 'video', 'https://storage.googleapis.com/sisiwaka-touen-medias/035/035_%E5%9C%9F%E3%81%AE%E3%83%AA%E3%82%BA%E3%83%A0.jpg', 'https://storage.googleapis.com/sisiwaka-touen-medias/035/035_%E5%9C%9F%E3%81%AE%E3%83%AA%E3%82%BA%E3%83%A0.mp4', NULL, NULL, 35, 1),
(2551, 36, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/036/036_01%E6%89%8B%E6%8C%81%E3%81%A1.jpg', NULL, NULL, NULL, 36, 1),
(2552, 36, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/036/036_02%E5%B7%A6.jpg', NULL, NULL, NULL, 36, 1),
(2553, 36, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/036/036_03%E5%B7%A6%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 36, 1),
(2554, 36, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/036/036_04%E6%AD%A3%E9%9D%A2.jpg', NULL, NULL, NULL, 36, 1),
(2555, 36, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/036/036_05%E6%AD%A3%E9%9D%A2%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 36, 1),
(2556, 36, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/036/036_06%E5%8F%B3.jpg', NULL, NULL, NULL, 36, 1),
(2557, 36, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/036/036_07%E5%8F%B3%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 36, 1),
(2558, 36, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/036/036_08%E5%8F%96%E3%81%A3%E6%89%8B.jpg', NULL, NULL, NULL, 36, 1),
(2559, 36, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/036/036_09%E5%8F%96%E3%81%A3%E6%89%8B%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 36, 1),
(2560, 36, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/036/036_10%E8%A6%8B%E8%BE%BC%E3%81%BF.jpg', NULL, NULL, NULL, 36, 1),
(2561, 36, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/036/036_11%E8%A6%8B%E8%BE%BC%E3%81%BF%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 36, 1),
(2562, 36, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/036/036_12%E8%A3%8F.jpg', NULL, NULL, NULL, 36, 1),
(2563, 36, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/036/036_13%E8%B6%B3%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 36, 1),
(2564, 36, 'video', 'https://storage.googleapis.com/sisiwaka-touen-medias/036/036_%E5%A4%A7%E5%9C%B0%E3%81%AE%E9%BC%93%E5%8B%95.jpg', 'https://storage.googleapis.com/sisiwaka-touen-medias/036/036_%E5%A4%A7%E5%9C%B0%E3%81%AE%E9%BC%93%E5%8B%95.mp4', NULL, NULL, 36, 1),
(2565, 37, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/037/037_01%E6%89%8B%E6%8C%81%E3%81%A1.jpg', NULL, NULL, NULL, 37, 1),
(2566, 37, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/037/037_02%E5%8F%B3.jpg', NULL, NULL, NULL, 37, 1),
(2567, 37, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/037/037_03%E6%AD%A3%E9%9D%A2.jpg', NULL, NULL, NULL, 37, 1),
(2568, 37, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/037/037_04%E5%B7%A6.jpg', NULL, NULL, NULL, 37, 1),
(2569, 37, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/037/037_05%E5%8F%96%E3%81%A3%E6%89%8B.jpg', NULL, NULL, NULL, 37, 1),
(2570, 37, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/037/037_06%E5%B7%A6%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 37, 1),
(2571, 37, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/037/037_07%E6%AD%A3%E9%9D%A2%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 37, 1),
(2572, 37, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/037/037_08%E5%8F%96%E3%81%A3%E6%89%8B%E3%81%AE%E8%A3%8F.jpg', NULL, NULL, NULL, 37, 1),
(2573, 37, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/037/037_09%E8%A6%8B%E8%BE%BC%E3%81%BF.jpg', NULL, NULL, NULL, 37, 1),
(2574, 37, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/037/037_10%E8%A6%8B%E8%BE%BC%E3%81%BF%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 37, 1),
(2575, 37, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/037/037_11%E5%BA%95.jpg', NULL, NULL, NULL, 37, 1),
(2576, 37, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/037/037_12%E8%B6%B3%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 37, 1),
(2577, 37, 'video', 'https://storage.googleapis.com/sisiwaka-touen-medias/037/037_%E3%83%9B%E3%83%AF%E3%82%A4%E3%83%88%E3%82%BF%E3%82%A4%E3%82%AC%E3%83%BC.jpg', 'https://storage.googleapis.com/sisiwaka-touen-medias/037/037_%E3%83%9B%E3%83%AF%E3%82%A4%E3%83%88%E3%82%BF%E3%82%A4%E3%82%AC%E3%83%BC.mp4', NULL, NULL, 37, 1),
(2578, 38, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/038/038_01%E6%89%8B%E6%8C%81%E3%81%A1.jpg', NULL, NULL, NULL, 38, 1),
(2579, 38, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/038/038_02%E5%81%B4%E9%9D%A21.jpg', NULL, NULL, NULL, 38, 1),
(2580, 38, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/038/038_03%E5%81%B4%E9%9D%A22.jpg', NULL, NULL, NULL, 38, 1),
(2581, 38, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/038/038_04%E5%81%B4%E9%9D%A23.jpg', NULL, NULL, NULL, 38, 1),
(2582, 38, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/038/038_05%E5%81%B4%E9%9D%A24.jpg', NULL, NULL, NULL, 38, 1),
(2583, 38, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/038/038_06%E5%AF%84%E3%82%8A1.jpg', NULL, NULL, NULL, 38, 1),
(2584, 38, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/038/038_07%E5%AF%84%E3%82%8A2.jpg', NULL, NULL, NULL, 38, 1),
(2585, 38, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/038/038_08%E5%AF%84%E3%82%8A3.jpg', NULL, NULL, NULL, 38, 1),
(2586, 38, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/038/038_09%E5%AF%84%E3%82%8A4.jpg', NULL, NULL, NULL, 38, 1),
(2587, 38, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/038/038_10%E8%A6%8B%E8%BE%BC%E3%81%BF.jpg', NULL, NULL, NULL, 38, 1),
(2588, 38, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/038/038_11%E8%A6%8B%E8%BE%BC%E3%81%BF%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 38, 1),
(2589, 38, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/038/038_12%E8%A3%8F.jpg', NULL, NULL, NULL, 38, 1),
(2590, 38, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/038/038_13%E8%B6%B3.jpg', NULL, NULL, NULL, 38, 1),
(2591, 38, 'video', 'https://storage.googleapis.com/sisiwaka-touen-medias/038/038_%E9%B6%89%E5%B8%AF.jpg', 'https://storage.googleapis.com/sisiwaka-touen-medias/038/038_%E9%B6%89%E5%B8%AF.mp4', NULL, NULL, 38, 1),
(2592, 39, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/039/039_01%E6%89%8B%E6%8C%81%E3%81%A1.jpg', NULL, NULL, NULL, 39, 1),
(2593, 39, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/039/039_02%E5%B7%A6.jpg', NULL, NULL, NULL, 39, 1),
(2594, 39, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/039/039_03%E6%AD%A3%E9%9D%A2.jpg', NULL, NULL, NULL, 39, 1),
(2595, 39, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/039/039_04%E5%8F%B3.jpg', NULL, NULL, NULL, 39, 1),
(2596, 39, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/039/039_05%E5%8F%96%E3%81%A3%E6%89%8B.jpg', NULL, NULL, NULL, 39, 1),
(2597, 39, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/039/039_06%E5%B7%A6%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 39, 1),
(2598, 39, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/039/039_07%E6%AD%A3%E9%9D%A2%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 39, 1),
(2599, 39, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/039/039_08%E5%8F%B3%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 39, 1),
(2600, 39, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/039/039_09%E5%8F%96%E3%81%A3%E6%89%8B%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 39, 1),
(2601, 39, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/039/039_10%E8%A6%8B%E8%BE%BC%E3%81%BF.jpg', NULL, NULL, NULL, 39, 1),
(2602, 39, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/039/039_11%E8%A3%8F.jpg', NULL, NULL, NULL, 39, 1),
(2603, 39, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/039/039_12%E8%84%9A.jpg', NULL, NULL, NULL, 39, 1),
(2604, 39, 'video', 'https://storage.googleapis.com/sisiwaka-touen-medias/039/039_%E5%87%AA%E3%81%AE%E6%99%82%E9%96%93.jpg', 'https://storage.googleapis.com/sisiwaka-touen-medias/039/039_%E5%87%AA%E3%81%AE%E6%99%82%E9%96%93.mp4', NULL, NULL, 39, 1),
(2605, 40, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/040/040_01%E6%89%8B%E6%8C%81%E3%81%A1.jpg', NULL, NULL, NULL, 40, 1),
(2606, 40, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/040/040_02_%E5%8F%B3.jpg', NULL, NULL, NULL, 40, 1),
(2607, 40, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/040/040_03%E6%AD%A3%E9%9D%A2.jpg', NULL, NULL, NULL, 40, 1),
(2608, 40, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/040/040_04%E5%B7%A6.jpg', NULL, NULL, NULL, 40, 1),
(2609, 40, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/040/040_05%E5%8F%96%E3%81%A3%E6%89%8B.jpg', NULL, NULL, NULL, 40, 1),
(2610, 40, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/040/040_06%E6%8B%A1%E5%A4%A701.jpg', NULL, NULL, NULL, 40, 1),
(2611, 40, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/040/040_07%E6%8B%A1%E5%A4%A702.jpg', NULL, NULL, NULL, 40, 1),
(2612, 40, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/040/040_08%E6%8B%A1%E5%A4%A703.jpg', NULL, NULL, NULL, 40, 1),
(2613, 40, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/040/040_09%E6%8B%A1%E5%A4%A704.jpg', NULL, NULL, NULL, 40, 1),
(2614, 40, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/040/040_10%E5%8F%96%E3%81%A3%E6%89%8B%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 40, 1),
(2615, 40, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/040/040_11%E8%A6%8B%E8%BE%BC%E3%81%BF.jpg', NULL, NULL, NULL, 40, 1),
(2616, 40, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/040/040_12%E8%A3%8F.jpg', NULL, NULL, NULL, 40, 1),
(2617, 40, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/040/040_13%E8%B6%B3.jpg', NULL, NULL, NULL, 40, 1),
(2618, 40, 'video', 'https://storage.googleapis.com/sisiwaka-touen-medias/040/040_%E5%A2%A8%E6%B5%81%E3%81%97.jpg', 'https://storage.googleapis.com/sisiwaka-touen-medias/040/040_%E5%A2%A8%E6%B5%81%E3%81%97.mp4', NULL, NULL, 40, 1),
(2619, 42, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/042/042_01%E6%89%8B%E6%8C%81%E3%81%A1.jpg', NULL, NULL, NULL, 42, 1),
(2620, 42, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/042/042_02%E5%8F%B3.jpg', NULL, NULL, NULL, 42, 1),
(2621, 42, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/042/042_03%E6%AD%A3%E9%9D%A2.jpg', NULL, NULL, NULL, 42, 1),
(2622, 42, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/042/042_04%E5%B7%A6.jpg', NULL, NULL, NULL, 42, 1),
(2623, 42, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/042/042_05%E6%8B%A1%E5%A4%A71.jpg', NULL, NULL, NULL, 42, 1),
(2624, 42, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/042/042_06%E6%8B%A1%E5%A4%A72.jpg', NULL, NULL, NULL, 42, 1),
(2625, 42, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/042/042_07%E6%8B%A1%E5%A4%A73.jpg', NULL, NULL, NULL, 42, 1),
(2626, 42, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/042/042_08%E8%A6%8B%E8%BE%BC%E3%81%BF.jpg', NULL, NULL, NULL, 42, 1),
(2627, 42, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/042/042_09%E8%A3%8F.jpg', NULL, NULL, NULL, 42, 1),
(2628, 42, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/042/042_10%E8%B6%B3.jpg', NULL, NULL, NULL, 42, 1),
(2629, 43, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/043/043_01%E6%89%8B%E6%8C%81%E3%81%A1.jpg', NULL, NULL, NULL, 43, 1),
(2630, 43, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/043/043_02%E6%AD%A3%E9%9D%A201.jpg', NULL, NULL, NULL, 43, 1),
(2631, 43, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/043/043_03%E6%AD%A3%E9%9D%A202.jpg', NULL, NULL, NULL, 43, 1),
(2632, 43, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/043/043_04%E6%AD%A3%E9%9D%A203.jpg', NULL, NULL, NULL, 43, 1),
(2633, 43, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/043/043_05%E6%AD%A3%E9%9D%A204.jpg', NULL, NULL, NULL, 43, 1),
(2634, 43, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/043/043_06%E6%8B%A1%E5%A4%A701.jpg', NULL, NULL, NULL, 43, 1),
(2635, 43, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/043/043_07%E6%8B%A1%E5%A4%A702.jpg', NULL, NULL, NULL, 43, 1),
(2636, 43, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/043/043_08%E6%8B%A1%E5%A4%A703.jpg', NULL, NULL, NULL, 43, 1),
(2637, 43, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/043/043_09%E6%8B%A1%E5%A4%A704.jpg', NULL, NULL, NULL, 43, 1),
(2638, 43, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/043/043_10%E6%8B%A1%E5%A4%A705.jpg', NULL, NULL, NULL, 43, 1),
(2639, 43, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/043/043_11%E8%A6%8B%E8%BE%BC%E3%81%BF01.jpg', NULL, NULL, NULL, 43, 1),
(2640, 43, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/043/043_12%E8%A6%8B%E8%BE%BC%E3%81%BF02.jpg', NULL, NULL, NULL, 43, 1),
(2641, 43, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/043/043_13%E8%A3%8F01.jpg', NULL, NULL, NULL, 43, 1),
(2642, 43, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/043/043_14%E8%A3%8F02.jpg', NULL, NULL, NULL, 43, 1),
(2643, 43, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/043/043_15%E8%A3%8F03.jpg', NULL, NULL, NULL, 43, 1),
(2644, 43, 'video', 'https://storage.googleapis.com/sisiwaka-touen-medias/043/043_%E5%8D%98%E8%AA%BF%E4%BD%9C%E6%A5%AD1.jpg', 'https://storage.googleapis.com/sisiwaka-touen-medias/043/043_%E5%8D%98%E8%AA%BF%E4%BD%9C%E6%A5%AD1.mp4', NULL, NULL, 43, 1),
(2645, 43, 'video', 'https://storage.googleapis.com/sisiwaka-touen-medias/043/043_%E5%8D%98%E8%AA%BF%E4%BD%9C%E6%A5%AD2.jpg', 'https://storage.googleapis.com/sisiwaka-touen-medias/043/043_%E5%8D%98%E8%AA%BF%E4%BD%9C%E6%A5%AD2.mp4', NULL, NULL, 43, 1),
(2646, 44, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/044/044_01%E6%89%8B%E6%8C%81%E3%81%A1.jpg', NULL, NULL, NULL, 44, 1),
(2647, 44, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/044/044_02%E6%AD%A3%E9%9D%A21.jpg', NULL, NULL, NULL, 44, 1),
(2648, 44, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/044/044_03%E6%AD%A3%E9%9D%A22.jpg', NULL, NULL, NULL, 44, 1),
(2649, 44, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/044/044_04%E6%AD%A3%E9%9D%A23.jpg', NULL, NULL, NULL, 44, 1),
(2650, 44, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/044/044_05%E6%8B%A1%E5%A4%A71.jpg', NULL, NULL, NULL, 44, 1),
(2651, 44, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/044/044_06%E6%8B%A1%E5%A4%A72.jpg', NULL, NULL, NULL, 44, 1),
(2652, 44, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/044/044_07%E8%A6%8B%E8%BE%BC%E3%81%BF.jpg', NULL, NULL, NULL, 44, 1),
(2653, 44, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/044/044_08%E8%A6%8B%E8%BE%BC%E3%81%BF2.jpg', NULL, NULL, NULL, 44, 1),
(2654, 44, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/044/044_09%E8%A3%8F%E6%AD%A3%E9%9D%A2.jpg', NULL, NULL, NULL, 44, 1),
(2655, 44, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/044/044_10%E8%A3%8F%E6%96%9C%E3%82%81.jpg', NULL, NULL, NULL, 44, 1),
(2656, 44, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/044/044_11%E8%B6%B3.jpg', NULL, NULL, NULL, 44, 1),
(2657, 44, 'video', 'https://storage.googleapis.com/sisiwaka-touen-medias/044/044_%E3%82%A4%E3%82%BD%E3%82%AE%E3%83%B3%E3%83%81%E3%83%A3%E3%82%AF.jpg', 'https://storage.googleapis.com/sisiwaka-touen-medias/044/044_%E3%82%A4%E3%82%BD%E3%82%AE%E3%83%B3%E3%83%81%E3%83%A3%E3%82%AF.mp4', NULL, NULL, 44, 1),
(2658, 45, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/045/045_01%E6%89%8B%E6%8C%81%E3%81%A1.jpg', NULL, NULL, NULL, 45, 1),
(2659, 45, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/045/045_02%E5%8F%B3.jpg', NULL, NULL, NULL, 45, 1),
(2660, 45, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/045/045_03%E6%AD%A3%E9%9D%A2.jpg', NULL, NULL, NULL, 45, 1),
(2661, 45, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/045/045_04%E5%B7%A6.jpg', NULL, NULL, NULL, 45, 1),
(2662, 45, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/045/045_05%E5%8F%96%E3%81%A3%E6%89%8B.jpg', NULL, NULL, NULL, 45, 1),
(2663, 45, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/045/045_06%E5%8F%B3%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 45, 1),
(2664, 45, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/045/045_07%E6%AD%A3%E9%9D%A2%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 45, 1),
(2665, 45, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/045/045_08%E5%B7%A6%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 45, 1),
(2666, 45, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/045/045_09%E5%8F%96%E3%81%A3%E6%89%8B%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 45, 1),
(2667, 45, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/045/045_10%E8%A6%8B%E8%BE%BC%E3%81%BF.jpg', NULL, NULL, NULL, 45, 1),
(2668, 45, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/045/045_11%E8%A6%8B%E8%BE%BC%E3%81%BF%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 45, 1),
(2669, 45, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/045/045_12%E5%BA%95.jpg', NULL, NULL, NULL, 45, 1),
(2670, 45, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/045/045_13%E3%81%A9%E3%81%93%E3%81%8B%E3%81%AE%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 45, 1),
(2671, 45, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/045/045_14%E5%8F%96%E3%81%A3%E6%89%8B%E8%A3%8F.jpg', NULL, NULL, NULL, 45, 1),
(2672, 50, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/050/050_01%E6%89%8B%E6%8C%81%E3%81%A1.jpg', NULL, NULL, NULL, 50, 1),
(2673, 50, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/050/050_02%E5%8F%B3.jpg', NULL, NULL, NULL, 50, 1),
(2674, 50, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/050/050_03%E6%AD%A3%E9%9D%A2.jpg', NULL, NULL, NULL, 50, 1),
(2675, 50, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/050/050_04%E5%B7%A6.jpg', NULL, NULL, NULL, 50, 1),
(2676, 50, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/050/050_05%E5%8F%96%E3%81%A3%E6%89%8B.jpg', NULL, NULL, NULL, 50, 1),
(2677, 50, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/050/050_06%E5%8F%B3%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 50, 1),
(2678, 50, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/050/050_07%E6%AD%A3%E9%9D%A2%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 50, 1),
(2679, 50, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/050/050_08%E5%8F%96%E3%81%A3%E6%89%8B%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 50, 1),
(2680, 50, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/050/050_09%E8%A6%8B%E8%BE%BC%E3%81%BF.jpg', NULL, NULL, NULL, 50, 1),
(2681, 50, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/050/050_10%E8%A6%8B%E8%BE%BC%E3%81%BF%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 50, 1),
(2682, 50, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/050/050_11%E5%8F%96%E3%81%A3%E6%89%8B%E8%A3%8F.jpg', NULL, NULL, NULL, 50, 1),
(2683, 50, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/050/050_12%E5%BA%95.jpg', NULL, NULL, NULL, 50, 1),
(2684, 50, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/050/050_13%E8%B6%B3.jpg', NULL, NULL, NULL, 50, 1),
(2685, 50, 'video', 'https://storage.googleapis.com/sisiwaka-touen-medias/050/050_%E3%81%86%E3%81%A3%E3%81%8B%E3%82%8A%E3%83%92%E3%83%A7%E3%82%A6%E3%83%A2%E3%83%B3%E3%83%80%E3%82%B3.jpg', 'https://storage.googleapis.com/sisiwaka-touen-medias/050/050_%E3%81%86%E3%81%A3%E3%81%8B%E3%82%8A%E3%83%92%E3%83%A7%E3%82%A6%E3%83%A2%E3%83%B3%E3%83%80%E3%82%B3.mp4', NULL, NULL, 50, 1),
(2686, 51, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/051/051_01%E6%89%8B%E6%8C%81%E3%81%A1.jpg', NULL, NULL, NULL, 51, 1),
(2687, 51, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/051/051_02%E5%8F%B3.jpg', NULL, NULL, NULL, 51, 1),
(2688, 51, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/051/051_03%E6%AD%A3%E9%9D%A2.jpg', NULL, NULL, NULL, 51, 1),
(2689, 51, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/051/051_04%E5%B7%A6.jpg', NULL, NULL, NULL, 51, 1),
(2690, 51, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/051/051_05%E5%8F%96%E3%81%A3%E6%89%8B.jpg', NULL, NULL, NULL, 51, 1),
(2691, 51, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/051/051_06%E5%8F%B3%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 51, 1),
(2692, 51, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/051/051_07%E6%AD%A3%E9%9D%A2%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 51, 1),
(2693, 51, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/051/051_08%E5%B7%A6%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 51, 1),
(2694, 51, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/051/051_09%E5%8F%96%E3%81%A3%E6%89%8B%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 51, 1),
(2695, 51, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/051/051_10%E5%8F%96%E3%81%A3%E6%89%8B%E8%A3%8F.jpg', NULL, NULL, NULL, 51, 1),
(2696, 51, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/051/051_11%E8%A3%8F.jpg', NULL, NULL, NULL, 51, 1),
(2697, 51, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/051/051_12%E8%B6%B3.jpg', NULL, NULL, NULL, 51, 1),
(2698, 51, 'video', 'https://storage.googleapis.com/sisiwaka-touen-medias/051/051_%E5%B3%B6%E3%81%AE%E7%B2%BE%E9%9C%8A.jpg', 'https://storage.googleapis.com/sisiwaka-touen-medias/051/051_%E5%B3%B6%E3%81%AE%E7%B2%BE%E9%9C%8A.mp4', NULL, NULL, 51, 1),
(2699, 52, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/052/052_01%E6%89%8B%E6%8C%81%E3%81%A1.jpg', NULL, NULL, NULL, 52, 1),
(2700, 53, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/053/053_01%E6%89%8B%E6%8C%81%E3%81%A1.jpg', NULL, NULL, NULL, 53, 1),
(2701, 53, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/053/053_02%E5%8F%B3.jpg', NULL, NULL, NULL, 53, 1),
(2702, 53, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/053/053_03%E6%AD%A3%E9%9D%A2.jpg', NULL, NULL, NULL, 53, 1),
(2703, 53, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/053/053_04%E5%B7%A6.jpg', NULL, NULL, NULL, 53, 1),
(2704, 53, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/053/053_05%E5%8F%96%E3%81%A3%E6%89%8B.jpg', NULL, NULL, NULL, 53, 1),
(2705, 53, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/053/053_06%E5%8F%B3%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 53, 1),
(2706, 53, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/053/053_07%E6%AD%A3%E9%9D%A2%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 53, 1),
(2707, 53, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/053/053_08%E5%B7%A6%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 53, 1),
(2708, 53, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/053/053_09%E5%8F%96%E3%81%A3%E6%89%8B%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 53, 1),
(2709, 53, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/053/053_10%E8%A6%8B%E8%BE%BC%E3%81%BF.jpg', NULL, NULL, NULL, 53, 1),
(2710, 53, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/053/053_11%E5%8F%A3%E7%B8%81.jpg', NULL, NULL, NULL, 53, 1),
(2711, 53, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/053/053_12%E8%A3%8F.jpg', NULL, NULL, NULL, 53, 1),
(2712, 53, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/053/053_13%E8%B6%B3.jpg', NULL, NULL, NULL, 53, 1),
(2713, 53, 'video', 'https://storage.googleapis.com/sisiwaka-touen-medias/053/053_%E3%81%97%E3%81%A3%E3%81%8B%E3%82%8A%E3%83%92%E3%83%A7%E3%82%A6%E3%83%A2%E3%83%B3%E3%83%80%E3%82%B3.jpg', 'https://storage.googleapis.com/sisiwaka-touen-medias/053/053_%E3%81%97%E3%81%A3%E3%81%8B%E3%82%8A%E3%83%92%E3%83%A7%E3%82%A6%E3%83%A2%E3%83%B3%E3%83%80%E3%82%B3.mp4', NULL, NULL, 53, 1),
(2714, 54, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/054/054_01%E6%89%8B%E6%8C%81%E3%81%A1.jpg', NULL, NULL, NULL, 54, 1),
(2715, 54, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/054/054_02%E5%8F%B3.jpg', NULL, NULL, NULL, 54, 1),
(2716, 54, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/054/054_03%E6%AD%A3%E9%9D%A2.jpg', NULL, NULL, NULL, 54, 1),
(2717, 54, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/054/054_04%E5%B7%A6.jpg', NULL, NULL, NULL, 54, 1),
(2718, 54, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/054/054_05%E5%8F%96%E3%81%A3%E6%89%8B.jpg', NULL, NULL, NULL, 54, 1),
(2719, 54, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/054/054_06%E5%8F%B3%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 54, 1),
(2720, 54, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/054/054_07%E6%AD%A3%E9%9D%A2%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 54, 1),
(2721, 54, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/054/054_08%E5%B7%A6%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 54, 1),
(2722, 54, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/054/054_09%E5%8F%96%E3%81%A3%E6%89%8B%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 54, 1),
(2723, 54, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/054/054_10%E5%8F%96%E3%81%A3%E6%89%8B%E8%A3%8F.jpg', NULL, NULL, NULL, 54, 1),
(2724, 54, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/054/054_11%E8%A6%8B%E8%BE%BC%E3%81%BF.jpg', NULL, NULL, NULL, 54, 1),
(2725, 54, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/054/054_12%E7%B8%81.jpg', NULL, NULL, NULL, 54, 1),
(2726, 54, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/054/054_13%E8%A3%8F.jpg', NULL, NULL, NULL, 54, 1),
(2727, 54, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/054/054_14%E8%B6%B3.jpg', NULL, NULL, NULL, 54, 1),
(2728, 54, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/054/054_15%E8%B6%B3%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 54, 1),
(2729, 54, 'video', 'https://storage.googleapis.com/sisiwaka-touen-medias/054/054_%E5%86%AC%E3%81%AE%E6%B1%A0%E3%80%81%E6%B0%B7%E3%81%AE%E6%B3%A1.jpg', 'https://storage.googleapis.com/sisiwaka-touen-medias/054/054_%E5%86%AC%E3%81%AE%E6%B1%A0%E3%80%81%E6%B0%B7%E3%81%AE%E6%B3%A1.mp4', NULL, NULL, 54, 1),
(2730, 55, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/055/055_01%E6%89%8B%E6%8C%81%E3%81%A1.jpg', NULL, NULL, NULL, 55, 1),
(2731, 55, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/055/055_02%E5%8F%B3.jpg', NULL, NULL, NULL, 55, 1),
(2732, 55, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/055/055_03%E6%AD%A3%E9%9D%A2.jpg', NULL, NULL, NULL, 55, 1),
(2733, 55, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/055/055_04%E5%B7%A6.jpg', NULL, NULL, NULL, 55, 1),
(2734, 55, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/055/055_05%E5%8F%96%E3%81%A3%E6%89%8B.jpg', NULL, NULL, NULL, 55, 1),
(2735, 55, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/055/055_06%E5%8F%B3%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 55, 1),
(2736, 55, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/055/055_07%E6%AD%A3%E9%9D%A2%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 55, 1),
(2737, 55, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/055/055_08%E5%B7%A6%E6%8B%A1%E5%A4%A7.jpg', NULL, NULL, NULL, 55, 1),
(2738, 55, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/055/055_10%E8%A6%8B%E8%BE%BC%E3%81%BF.jpg', NULL, NULL, NULL, 55, 1),
(2739, 55, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/055/055_11%E8%A3%8F.jpg', NULL, NULL, NULL, 55, 1),
(2740, 55, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/055/055_12%E8%B6%B3.jpg', NULL, NULL, NULL, 55, 1),
(2741, 55, 'image', 'https://storage.googleapis.com/sisiwaka-touen-medias/055/055_9%E5%8F%96%E3%81%A3%E6%89%8B%E5%86%85%E5%81%B4.jpg', NULL, NULL, NULL, 55, 1),
(2742, 55, 'video', 'https://storage.googleapis.com/sisiwaka-touen-medias/055/055_%E9%9B%AA%E3%82%92%E5%89%B2%E3%81%A3%E3%81%A6%E5%BD%A9.jpg', 'https://storage.googleapis.com/sisiwaka-touen-medias/055/055_%E9%9B%AA%E3%82%92%E5%89%B2%E3%81%A3%E3%81%A6%E5%BD%A9.mp4', NULL, NULL, 55, 1);

-- --------------------------------------------------------

--
-- テーブルの構造 `artwork_techniques`
--

CREATE TABLE `artwork_techniques` (
  `artwork_id` int(11) NOT NULL,
  `techniques_slug` varchar(50) NOT NULL,
  `valid` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `artwork_techniques`
--

INSERT INTO `artwork_techniques` (`artwork_id`, `techniques_slug`, `valid`) VALUES
(37, 'nerikomi', 1),
(37, 'shinogi', 1),
(38, 'nerikomi', 1),
(38, 'shinogi', 1),
(38, 'tebinari', 1),
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
(53, 'nerikomi', 1),
(53, 'shinogi', 1),
(54, 'nerikomi', 1),
(54, 'shinogi', 1);

-- --------------------------------------------------------

--
-- テーブルの構造 `categories`
--

CREATE TABLE `categories` (
  `slug` varchar(50) NOT NULL,
  `label_ja` varchar(100) NOT NULL,
  `label_en` varchar(100) NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `valid` tinyint(1) NOT NULL DEFAULT 1
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

CREATE TABLE `coloring` (
  `slug` varchar(50) NOT NULL,
  `label_ja` varchar(100) NOT NULL,
  `label_en` varchar(100) NOT NULL,
  `valid` tinyint(1) NOT NULL DEFAULT 1
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

CREATE TABLE `colorings` (
  `slug` varchar(50) NOT NULL,
  `label_ja` varchar(100) NOT NULL,
  `label_en` varchar(100) NOT NULL,
  `valid` tinyint(1) NOT NULL DEFAULT 1
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

CREATE TABLE `techniques` (
  `slug` varchar(50) NOT NULL,
  `label_ja` varchar(100) NOT NULL,
  `label_en` varchar(100) NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `valid` tinyint(1) NOT NULL DEFAULT 1
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

-- --------------------------------------------------------

--
-- テーブルの構造 `users`
--

CREATE TABLE `users` (
  `id` varchar(100) NOT NULL,
  `pw` varchar(100) NOT NULL,
  `role` varchar(100) DEFAULT NULL,
  `valid` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `users`
--

INSERT INTO `users` (`id`, `pw`, `role`, `valid`) VALUES
('sisiwaka_editor', '$2y$10$SoyaepnRTbLupMp5.04T1OXYW6FGBSvAyOPhnBMxcqTUMWZhsTEYq', NULL, 1);

--
-- ダンプしたテーブルのインデックス
--

--
-- テーブルのインデックス `artworks`
--
ALTER TABLE `artworks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_artworks_color` (`coloring`),
  ADD KEY `fk_artworks_category` (`category`);

--
-- テーブルのインデックス `artwork_media`
--
ALTER TABLE `artwork_media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_artwork_media_artwork` (`artwork_id`);

--
-- テーブルのインデックス `artwork_techniques`
--
ALTER TABLE `artwork_techniques`
  ADD PRIMARY KEY (`artwork_id`,`techniques_slug`),
  ADD KEY `fk_artwork_techniques_technique` (`techniques_slug`);

--
-- テーブルのインデックス `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`slug`);

--
-- テーブルのインデックス `coloring`
--
ALTER TABLE `coloring`
  ADD PRIMARY KEY (`slug`);

--
-- テーブルのインデックス `colorings`
--
ALTER TABLE `colorings`
  ADD PRIMARY KEY (`slug`);

--
-- テーブルのインデックス `techniques`
--
ALTER TABLE `techniques`
  ADD PRIMARY KEY (`slug`);

--
-- テーブルのインデックス `updates`
--
ALTER TABLE `updates`
  ADD PRIMARY KEY (`created_at`);

--
-- テーブルのインデックス `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- ダンプしたテーブルの AUTO_INCREMENT
--

--
-- テーブルの AUTO_INCREMENT `artwork_media`
--
ALTER TABLE `artwork_media`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2743;

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
