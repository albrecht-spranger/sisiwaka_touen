<?php

declare(strict_types=1);
require_once __DIR__ . '/../includes/db_connect.php';
require_once __DIR__ . '/../includes/common_func.php';

// フォームからIDを取得
$id = $_POST['id'] ?? null;
if (!$id) {
	error_log("[edit_process.php] IDが指定されていません。");
	echo 'エラーが発生しました。';
	exit;
}

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
	error_log("[edit_process.php] メソッドがPOST以外");
	echo 'error', '不正なリクエストです。もう一度お試しください。';
	exit;
}

try {
	$pdo = get_db_connection(true);

	// フォームから取得
	$name = $_POST['name'] ?? '';
	$description_title = $_POST['description_title'] ?? null;
	$description = $_POST['description'] ?? null;
	$category = $_POST['category'] ?? 'other';
	$spec = $_POST['spec'] ?? null;
	$coloring = $_POST['coloring'] ?? null;
	$clay = $_POST['clay'] ?? null;
	$glaze = $_POST['glaze'] ?? null;
	$notes = $_POST['notes'] ?? null;
	$in_stock = isset($_POST['in_stock']) ? (int) $_POST['in_stock'] : 0;
	$shop_url = $_POST['shop_url'] ?? null;
	$instagram_url = $_POST['instagram_url'] ?? null;
	$completion_date = $_POST['completion_date'] !== '' ? $_POST['completion_date'] : null;
	$valid = isset($_POST['valid']) ? (int) $_POST['valid'] : 1;

	// トランザクション開始（両テーブルを一貫して更新）
	$pdo->beginTransaction();

	// UPDATE文
	$sql = "UPDATE artworks SET
                name = :name,
                description_title = :description_title,
                description = :description,
                category = :category,
                spec = :spec,
				coloring = :coloring,
                clay = :clay,
                glaze = :glaze,
                notes = :notes,
                in_stock = :in_stock,
                shop_url = :shop_url,
                instagram_url = :instagram_url,
                completion_date = :completion_date,
                valid = :valid
            WHERE id = :id";

	$stmt = $pdo->prepare($sql);

	$stmt->bindValue(':id', $id, PDO::PARAM_INT);
	$stmt->bindValue(':name', $name, PDO::PARAM_STR);
	$stmt->bindValue(':description_title', $description_title, PDO::PARAM_STR);
	$stmt->bindValue(':description', $description, PDO::PARAM_STR);
	$stmt->bindValue(':category', $category, PDO::PARAM_STR);
	$stmt->bindValue(':spec', $spec, PDO::PARAM_STR);
	// 制約エラーを避けるため、coloringが送信されなかった場合は明示的にNULLを入れる
	if ($coloring === null) {
		$stmt->bindValue(':coloring', null, PDO::PARAM_NULL);
	} else {
		$stmt->bindValue(':coloring', $coloring, PDO::PARAM_STR);
	}
	$stmt->bindValue(':clay', $clay, PDO::PARAM_STR);
	$stmt->bindValue(':glaze', $glaze, PDO::PARAM_STR);
	$stmt->bindValue(':notes', $notes, PDO::PARAM_STR);
	$stmt->bindValue(':in_stock', $in_stock, PDO::PARAM_INT);
	$stmt->bindValue(':shop_url', $shop_url, PDO::PARAM_STR);
	$stmt->bindValue(':instagram_url', $instagram_url, PDO::PARAM_STR);
	$stmt->bindValue(':completion_date', $completion_date);
	$stmt->bindValue(':valid', $valid, PDO::PARAM_INT);

	$stmt->execute();

	// メディアの有効/無効を書き込む
	if (isset($_POST['media']) && is_array($_POST['media'])) {
		$media_flags = $_POST['media'];
		$media_stmt = $pdo->prepare("UPDATE artwork_media SET valid = :valid WHERE id = :media_id AND artwork_id = :artwork_id");
		foreach ($media_flags as $media_id => $flag) {
			$media_id_int = (int) $media_id;
			if ($media_id_int <= 0) {
				continue;
			}
			$media_stmt->bindValue(':valid', (int) $flag, PDO::PARAM_INT);
			$media_stmt->bindValue(':media_id', $media_id_int, PDO::PARAM_INT);
			$media_stmt->bindValue(':artwork_id', (int) $id, PDO::PARAM_INT);
			$media_stmt->execute();
		}
	}

	// 技巧を書き込む
	// まずこの作品の技巧を全削除
	$techniques_delete_stmt = $pdo->prepare("DELETE FROM artwork_techniques WHERE artwork_id = :artwork_id");
	$techniques_delete_stmt->bindValue(':artwork_id', (int) $id, PDO::PARAM_INT);
	$techniques_delete_stmt->execute();
	// 1件ずつ挿入
	// 挿入対象（未送信・非配列なら空配列）
	$techniques_list = (isset($_POST['techniques']) && is_array($_POST['techniques']))
		? $_POST['techniques']
		: [];
	$techniques_insert_stmt = $pdo->prepare("INSERT INTO artwork_techniques (artwork_id, techniques_slug) VALUES (:artwork_id, :techniques_slug)");
	foreach ($techniques_list as $techniques_slug) {
		$techniques_insert_stmt->bindValue(':artwork_id', (int) $id, PDO::PARAM_INT);
		$techniques_insert_stmt->bindValue(':techniques_slug', $techniques_slug, PDO::PARAM_STR);
		$techniques_insert_stmt->execute();
	}

	$pdo->commit();

	if ($valid) {
		// 作品が有効ならば、詳細画面に遷移
		set_flash('success', '作品詳細を更新しました。');
		redirect('../detail.php?id=' . h($id), 303);
	} else {
		// 作品を無効化した場合は一覧画面に遷移
		set_flash('success', '作品を削除しました。');
		redirect('../works.php', 303);
	}
} catch (Exception $e) {
	if (isset($pdo) && $pdo->inTransaction()) {
		$pdo->rollBack();
	}
	error_log('[edit_process.php] ' . $e->getCode() . ' ' . $e->getMessage());
	set_flash('error', '作品詳細の書き込みでエラーが発生しました。');
	redirect('edit.php?id=' . h($id), 303);
}
