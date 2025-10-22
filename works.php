<?php
// 作品一覧 w/Isotope
declare(strict_types=1);
require_once __DIR__ . '/db_connect.php';

// DBから情報取得
try {
	$pdo = get_db_connection();

	// 作品一覧取得
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

	// ====== カテゴリ取得 ======
	$stmt = $pdo->query(
		"SELECT slug, label_ja
              FROM categories
             WHERE valid = 1
          ORDER BY sort_order ASC"
	);
	$categories = $stmt->fetchAll();

	// ====== 技法取得 ======
	$stmt = $pdo->query("SELECT slug, label_ja FROM techniques WHERE valid = 1 ORDER BY sort_order ASC");
	$techniques = $stmt->fetchAll();

	// ====== 色合い取得 ======
	$stmt = $pdo->query(
		"SELECT slug, label_ja
              FROM colorings
             WHERE valid = 1"
	);
	$colorings = $stmt->fetchAll();
} catch (Throwable $e) {
	error_log("[DB Error] " . $e->getMessage());
	echo 'エラーが発生しました。';
	exit;
}

// ⇓$productには&を付けて参照渡しにする。値を更新するため。
foreach ($all_products as &$product) {
    $product['techniques'] = $product['technique_slugs']
        ? explode(',', $product['technique_slugs'])
        : [];
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
	<script src="https://unpkg.com/isotope-layout@3/dist/isotope.pkgd.min.js" defer></script>
	<script src="https://unpkg.com/imagesloaded@5/imagesloaded.pkgd.min.js" defer></script>
	<script src="scripts/works.js" defer></script>
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
		<!-- トップに戻る -->
		<div class="main_container">
			<p class="back_to_index"><a href="index.html" class="link_style">トップに戻る</a></p>
		</div>

		<!-- タイトルと検索パネル開閉ボタン -->
		<div class="title_and_button">
			<h2 class="nav_font">作品一覧</h2>
			<button id="search_toggle_btn" type="button">
				検索条件（開く）
			</button>
		</div>

		<!-- 検索パネル -->
		<div id="search_panel">
			<form id="search_form">
				<!-- 用途 -->
				<fieldset class="field_group">
					<legend>
						<span>用途</span>
						<button type="button" id="clear_category" class="btn_in_search_panel">用途をクリア</button>
					</legend>
					<div class="checkbox_container" id="checkbox_category">
						<?php foreach ($categories as $cat): ?>
							<label>
								<input type="checkbox" name="category[]" value="<?= $cat['slug'] ?>">
								<?= $cat['label_ja'] ?>
							</label>
						<?php endforeach; ?>
					</div>
				</fieldset>

				<!-- 技法 -->
				<fieldset class="field_group">
					<legend>
						技法
						<button type="button" id="clear_techniques" class="btn_in_search_panel">技法をクリア</button>
					</legend>
					<div class="checkbox_container" id="checkbox_techniques">
						<?php foreach ($techniques as $tech): ?>
							<label>
								<input type="checkbox" name="technique[]" value="<?= $tech['slug'] ?>">
								<?= $tech['label_ja'] ?>
							</label>
						<?php endforeach; ?>
					</div>
				</fieldset>

				<!-- 色合い -->
				<fieldset class="field_group">
					<legend>
						色合い
						<button type="button" id="clear_coloring" class="btn_in_search_panel">色合いをクリア</button>
					</legend>
					<div class="checkbox_container" id="checkbox_coloring">
						<?php foreach ($colorings as $col): ?>
							<label>
								<input type="checkbox" name="coloring[]" value="<?= $col['slug'] ?>">
								<?= $col['label_ja'] ?>
							</label>
						<?php endforeach; ?>
					</div>
				</fieldset>

				<!-- 在庫有無 -->
				<fieldset class="field_group">
					<legend>
						在庫
					</legend>
					<div class="checkbox_container" id="checkbox_is_stock">
						<label>
							<input type="checkbox" name="is_stock" value="is_stock">
							在庫ありのみ表示
						</label>
					</div>
				</fieldset>
			</form>

			<div>
				<p id="debug" style="display: none;"></p>
			</div>
		</div>

		<!-- ローディングスピナー -->
		<div id="loading_spinner"></div>

		<!-- isotope.jsによる作品一覧 -->
		<div id="artworks_gallery" class="artworks_grid is_loading">
			<?php foreach ($all_products as $product): ?>
				<?php
				// Isotopeのクラスに使うslug（半角小文字、空白なし推奨）
				$cat  = htmlspecialchars($product['category'] ?? '', ENT_QUOTES, 'UTF-8');
				$col  = htmlspecialchars($product['coloring'] ?? '', ENT_QUOTES, 'UTF-8');
				$tech = implode(' ', array_map('htmlspecialchars', $product['techniques']));
				if ($product['in_stock']) {
					$in_stock = 'in_stock';
				} else {
					$in_stock = '';
				}
				?>
				<a href="detail.php?id=<?= htmlspecialchars((string) $product['id']) ?>"
					class="grid-item <?= $cat ?> <?= $tech ?> <?= $col ?> <?= $in_stock ?>">
					<figure class="card">
						<div class="thumb">
							<img src="<?= htmlspecialchars($product['thumbnail_url']) ?>" alt="<?= htmlspecialchars($product['name']) ?>">
						</div>
						<figcaption class="caption"><?= htmlspecialchars($product['name']) ?></figcaption>
					</figure>
				</a>
			<?php endforeach; ?>
		</div>
	</main>

	<footer>
		<p>&copy; 2025 シシワカ陶苑</p>
	</footer>
</body>

</html>