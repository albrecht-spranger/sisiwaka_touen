<?php
// 作品詳細

declare(strict_types=1);
require_once __DIR__ . '/../includes/db_connect.php';
require_once __DIR__ . '/../includes/common_func.php';

// id バリデーション
$id = filter_input(INPUT_GET, 'id', FILTER_VALIDATE_INT);
if ($id === false || $id === null) {
	error_log("[edit.php] IDが指定されていません。");
	echo 'エラーが発生しました。';
	exit;
}

// DBから情報取得
try {
	$pdo = get_db_connection();

	// ====== 作品本体 ======
	$sql_artwork = "SELECT * FROM artworks WHERE id = :id AND valid = 1;";
	$stmt_artwork = $pdo->prepare($sql_artwork);
	$stmt_artwork->execute([':id' => $id]);
	$artwork = $stmt_artwork->fetch();
	if (!$artwork) {
		throw new RuntimeException('Artwork not found (ID=' . $id . ').');
	}

	// ====== 画像・動画（media） ======
	$sql_media = "SELECT id, image_url, video_url, valid FROM artwork_media
        WHERE artwork_id = :id
        ORDER BY sort_order ASC, id ASC
    ";
	$stmt_media = $pdo->prepare($sql_media);
	$stmt_media->execute([':id' => $id]);
	$media_list = $stmt_media->fetchAll();

	// ===== 使われている技法一覧 =====
	$sql_used_techniques = "SELECT techniques_slug FROM artwork_techniques WHERE artwork_id = :id AND valid = 1";
	$stmt_used_techniques = $pdo->prepare($sql_used_techniques);
	$stmt_used_techniques->execute([':id' => $id]);
	$used_techniques = $stmt_used_techniques->fetchAll(PDO::FETCH_COLUMN);
	// ⇒FETCH_COLUMN：このSQLだけ連想記憶ではなく、一列の値を返す

	// ===== 技法の種類一覧 =====
	$sql_technique_labels = "SELECT slug, label_ja FROM techniques WHERE valid = 1";
	$stmt_technique_labels = $pdo->query($sql_technique_labels);
	$techniques_list = $stmt_technique_labels->fetchAll();

	// ===== カテゴリ一覧 =====
	$sql_categories = "SELECT slug, label_ja FROM categories WHERE valid = 1 ORDER BY sort_order ASC";
	$stmt_categories = $pdo->query($sql_categories);
	$category_list = $stmt_categories->fetchAll();

	// ===== 色合い一覧 =====
	$sql_colorings = "SELECT slug, label_ja FROM colorings WHERE valid = 1";
	$stmt_colorings = $pdo->query($sql_colorings);
	$coloring_list = $stmt_colorings->fetchAll();
} catch (Throwable $e) {
	error_log("[DB Error] " . $e->getMessage());
	echo 'エラーが発生しました。';
	exit;
}
?>

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>シシワカ陶苑：【編集】<?= h($artwork['description_title']) ?></title>
	<link rel="stylesheet" href="../css/reset.css">
	<link rel="stylesheet" href="../css/style.css">
	<link rel="stylesheet" href="../css/detail.css">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link
		href="https://fonts.googleapis.com/css2?family=Hina+Mincho&family=Kaisei+Tokumin&family=M+PLUS+2:wght@100..900&family=Zen+Antique&display=swap"
		rel="stylesheet">
</head>

<body>
	<header>
		<a href="../index.html" class="header_left_block">
			<img class="sisiwaka_touen_icon" src="../images/sisiwaka_touen_logo.jpg" alt="シシワカ陶苑ロゴ">
			<h1>
				シシワカ陶苑
			</h1>
		</a>
		<div class="header_right_block">
			<div class="minne_icon">
				<a href="https://minne.com/@sisiwaka10en" target="_blank">
					<img src="../images/minne_logo_vertical.png" alt="minne logo">
				</a>
			</div>
			<div class="instagram_icon">
				<a href="https://www.instagram.com/albrecht1999/" target="_blank">
					<img src="../images/Instagram_Glyph_Gradient.png" alt="Instagram Icon">
				</a>
			</div>
		</div>
	</header>

	<main>
		<section>
			<!-- flashメッセージ表示 -->
			<?php
			$error = get_flash('error');
			$success = get_flash('success');
			if ($error) {
				echo '<div class="flash_message">' . h($error) . '</div>';
			}
			if ($success) {
				echo '<div class="flash_message">' . h($success) . '</div>';
			}
			?>

			<!-- タイトル -->
			<div class="works_name_container">
				<h1 id="works_name">編集</h1>
			</div>

			<form id="edit_form" action="edit_process.php" method="post">
				<!-- 画像一覧 -->
				<div id="media_gallery">
					<?php foreach ($media_list as $media): ?>
						<div class="media_gallery_card">
							<?php
							$video_attr = '';
							if (!empty($media['video_url'])) {
								$video_attr = ' data-type="video" data-video_src="' . h($media['video_url']) . '"';
							}
							?>
							<img loading="lazy" src="<?= h($media['image_url']) ?>" alt=""
								<?= $video_attr ?> />
							<label>
								<input type="hidden" name="media[<?= h((string) $media['id']) ?>]" value="0" />
								<input type="checkbox" name="media[<?= h((string) $media['id']) ?>]" value="1" <?= $media['valid'] ? 'checked' : '' ?> />
								有効
							</label>
						</div>
					<?php endforeach; ?>
				</div>

				<!-- 作品説明 -->
				<dl class="works_spec_container">
					<dt>ID</dt>
					<dd id="spec_id"><?= h((string) $artwork['id'], '(ID)') ?></dd>
					<input type="hidden" name="id" id="spec_hidden_id" value="<?= h((string) $artwork['id']) ?>" />
					<dt>作品タイトル</dt>
					<dd>
						<input type="text" name="description_title" id="spec_description_title"
							value="<?= h($artwork['description_title'], '(タイトル)') ?>" required>
					</dd>
					<dt>銘</dt>
					<dd>
						<input type="text" name="name" id="spec_name" value="<?= h($artwork['name'], '(銘)') ?>">
					</dd>
					<dt>用途</dt>
					<dd id="spec_category">
						<?php foreach ($category_list as $cat): ?>
							<label>
								<?php
								if ($cat['slug'] === $artwork['category']) {
									$checked = 'checked';
								} else {
									$checked = '';
								}
								?>
								<input type="radio" name="category" value="<?= h($cat['slug']) ?>" <?= $checked ?> />
								<?= h($cat['label_ja']) ?>
							</label>
						<?php endforeach; ?>
					</dd>
					<dt>説明</dt>
					<dd>
						<textarea name="description" id="spec_description" rows="12" class="pre_line"><?= h($artwork['description']) ?>
						</textarea>
					</dd>
					<dt>サイズ</dt>
					<dd>
						<textarea name="spec" id="spec_spec" rows="4" class="pre_line"><?= h($artwork['spec']) ?>
						</textarea>
					</dd>
					<dt>技法</dt>
					<dd id="spec_techniques">
						<?php foreach ($techniques_list as $tech): ?>
							<?php
							$checked = in_array($tech['slug'], $used_techniques, true) ? 'checked' : '';
							?>
							<label>
								<input type="checkbox" name="techniques[]" value="<?= $tech['slug'] ?>" <?= $checked ?> />
								<?= $tech['label_ja'] ?>
							</label>
						<?php endforeach; ?>
					</dd>
					<dt>色合い</dt>
					<dd id="spec_coloring">
						<?php foreach ($coloring_list as $coloring): ?>
							<label>
								<?php
								if ($coloring['slug'] === $artwork['coloring']) {
									$checked = 'checked';
								} else {
									$checked = '';
								}
								?>
								<input type="radio" name="coloring" value="<?= $coloring['slug'] ?>" <?= $checked ?> />
								<?= $coloring['label_ja'] ?>
							</label>
						<?php endforeach; ?>
					</dd>
					<dt>粘土</dt>
					<dd>
						<textarea name="clay" id="spec_clay" class="pre_line"><?= h($artwork['clay']) ?>
						</textarea>
					</dd>
					<dt>釉薬</dt>
					<dd>
						<textarea name="glaze" id="spec_glaze" class="pre_line"><?= h($artwork['glaze']) ?>
						</textarea>
					</dd>
					<dt>補足</dt>
					<dd>
						<textarea name="notes" id="spec_notes" class="pre_line"><?= h($artwork['notes']) ?>
						</textarea>
					</dd>
					<dt>完成日</dt>
					<dd>
						<?php
						$completion_date = $artwork['completion_date'] ?? null;
						if ($completion_date) {
							$formatted_date = (new DateTime($completion_date))->format('Y-m-d');
						} else {
							$formatted_date = '';
						}
						?>
						<input type="date" id="spec_completion_date" name="completion_date" value="<?= $formatted_date ?>">
					</dd>
					<dt>Instagram</dt>
					<dd>
						<input type="url" name="instagram_url" id="spec_instagram_url" value="<?= h($artwork['instagram_url']) ?>">
					</dd>
					<dt>在庫</dt>
					<dd>
						<label>
							<?php
							if ($artwork['in_stock']) {
								$checked = 'checked';
							} else {
								$checked = '';
							}
							?>
							<input type="hidden" name="in_stock" value="0">
							<input type="checkbox" name="in_stock" id="spec_in_stock" value="1" <?= $checked ?> />
							あり
						</label>
					</dd>
					<dt>ショップURL</dt>
					<dd>
						<input type="url" name="shop_url" id="spec_shop_url" value="<?= h($artwork['shop_url']) ?>" />
					</dd>
					<dt>valid</dt>
					<dd>
						<label>
							<?php
							if ($artwork['valid']) {
								$checked = 'checked';
							} else {
								$checked = '';
							}
							?>
							<input type="hidden" name="valid" value="0">
							<input type="checkbox" name="valid" id="spec_valid" value="1" <?= $checked ?> />
							本作品を有効とする
						</label>
					</dd>
					<dt></dt>
					<dd class="spec_update_date_style">
						<?php
						$update_date = $artwork['update_date'] ?? null;
						if ($update_date) {
							$formatted_date = (new DateTime($update_date))->format('Y/n/j');
						} else {
							$formatted_date = '―';
						}
						?>
						(記事更新　<?= $formatted_date ?>)
					</dd>
				</dl>

				<!-- ボタン -->
				<div class="forms_buttons">
					<button type="button" id="cancel_btn"><span>キャンセル</span></button>
					<button type="submit" id="submit_btn"><span>登録する</span></button>
				</div>
			</form>
		</section>
	</main>

	<footer>
		<p>&copy; 2025 シシワカ陶苑</p>
	</footer>

	<!-- lightbox -->
	<!-- <div id="lightbox" aria-hidden="true"> -->
	<div id="lightbox">
		<div id="lightboxInner">
			<img id="lightboxImage" class="lightbox-media" src="../images/noimage.svg" alt="拡大画像">
			<video id="lightboxVideo" class="lightbox-media" preload="metadata" playsinline controls></video>
		</div>
	</div>

	<!-- script -->
	<script src="edit.js"></script>
</body>

</html>