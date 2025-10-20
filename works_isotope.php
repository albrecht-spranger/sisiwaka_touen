<?php
// 作品一覧 w/Isotope
declare(strict_types=1);
require_once __DIR__ . '/dbConnect.php';

// DB 取得
try {
	$pdo = getDbConnection();
	$stmt = $pdo->query("SELECT a.id, a.name, a.category, a.coloring, in_stock,
        GROUP_CONCAT(DISTINCT at.techniques_slug ORDER BY at.techniques_slug) AS technique_slugs,
        m.image_url AS thumbnail_url
        FROM artworks AS a
        LEFT JOIN artwork_techniques AS at ON at.artwork_id = a.id
        LEFT JOIN (SELECT m.artwork_id, MIN(m.id) AS min_id
            FROM artwork_media AS m
            WHERE m.valid = 1 AND m.kind  = 'image'
            GROUP BY m.artwork_id
            ) mm
            ON mm.artwork_id = a.id
        LEFT JOIN artwork_media AS m
            ON m.id = mm.min_id
        WHERE a.valid = 1
        GROUP BY a.id, a.name, a.category, a.coloring, m.image_url, m.alt_ja
        ORDER BY a.id DESC;
	");
	$all_products = $stmt->fetchAll();
} catch (Throwable $e) {
	error_log("[DB Error] " . $e->getMessage());
	echo 'エラーが発生しました。';
	exit;
}

// ⇓$productには&を付けて参照渡しにする。値を更新するため。
foreach ($all_products as &$product) {
	$product['techniques'] = explode(',', $product['technique_slugs']);
}
// 参照渡しにしたオブジェクトを切り離す
unset($product);
?>

<!DOCTYPE html>
<html lang="ja">

<head>
	<meta charset="UTF-8">
	<title>シシワカ陶苑 - 作品一覧</title>
	<link rel="stylesheet" href="css/reset.css">
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/works.css">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link
		href="https://fonts.googleapis.com/css2?family=Hina+Mincho&family=Kaisei+Tokumin&family=M+PLUS+2:wght@100..900&family=Zen+Antique&display=swap"
		rel="stylesheet">

	<!-- isotope.js -->
	<script src="https://unpkg.com/isotope-layout@3/dist/isotope.pkgd.min.js"></script>
	<script src="https://unpkg.com/imagesloaded@5/imagesloaded.pkgd.min.js"></script>
</head>

<body>
	<header>
		<a href="index.html" class="header_left_block">
			<img class="sisiwaka_touen_icon" src="images/sisiwaka_touen_logo.jpg" alt="シシワカ陶苑ロゴ">
			<h1>
				シシワカ陶苑
			</h1>
		</a>
		<div class="header_right_block">
			<div class="minne_icon">
				<a href="https://minne.com/@sisiwaka10en" target="_blank">
					<img src="images/minne_logo_vertical.png" alt="minne logo">
				</a>
			</div>
			<div class="instagram_icon">
				<a href="https://www.instagram.com/albrecht1999/" target="_blank">
					<img src="images/Instagram_Glyph_Gradient.png" alt="Instagram Icon">
				</a>
			</div>
		</div>
	</header>

	<main>
		<div class="main_container">
			<p class="back_to_index"><a href="index.html" class="link_style">トップに戻る</a></p>
		</div>

		<div id="works_gallery" class="works_grid">
			<?php foreach ($all_products as $product): ?>
				<?php
				// Isotopeのクラスに使うslug（半角小文字、空白なし推奨）
				$cat  = htmlspecialchars($product['category']);
				$col  = htmlspecialchars($product['coloring']);
				$tech = '';
				foreach ($product['techniques'] as $technique_slug) {
					$tech .= htmlspecialchars($technique_slug);
				}
				if ($product['in_stock']) {
					$in_stock = 'in_stock';
				} else {
					$in_stock = '';
				}
				?>
				<div class="grid-item <?= $cat ?> <?= $tech ?> <?= $col ?> <?= $in_stock ?>">
					<figure class="card">
						<div class="thumb">
							<img src="<?= htmlspecialchars($product['thumbnail_url']) ?>" alt="<?= htmlspecialchars($product['name']) ?>">
						</div>
						<figcaption class="caption"><?= htmlspecialchars($product['name']) ?></figcaption>
					</figure>
				</div>
			<?php endforeach; ?>
		</div>
	</main>

	<footer>
		<p>&copy; 2025 シシワカ陶苑</p>
	</footer>
</body>

</html>