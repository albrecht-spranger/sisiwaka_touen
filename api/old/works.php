<?php
// /api/works.php
declare(strict_types=1);

// ====== DB環境変数設定 ======
$env = parse_ini_file(__DIR__ . '/.env');
if ($env === false) {
	http_response_code(500);
	echo json_encode([
		'error' => 'Internal Server Error',
		'message' => 'Database configuration is missing',
	], JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
	exit;
}
$DB_NAME = $env['DB_NAME'];
$DB_USER = $env['DB_READER'];
$DB_HOST = $env['DB_HOST'];
$DB_PASS = $env['DB_READER_PW'];
$dsn = "mysql:host={$DB_HOST};dbname={$DB_NAME};charset=utf8mb4";

// ====== ヘッダ ======
header('Content-Type: application/json; charset=utf-8');

try {
	// ====== 入力の取得 ======
	$category = $_GET['category'] ?? [];
	$techniques = $_GET['techniques'] ?? [];
	$coloring = $_GET['coloring'] ?? [];
	$is_stock = $_GET['is_stock'] ?? null;

	// ====== DB接続 ======
	$pdo = new PDO($dsn, $DB_USER, $DB_PASS, [
		PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
		PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
	]);

	// ====== SQL組み立て ======
	$sql = "SELECT a.id, a.name,
        (
            SELECT am.image_url
            FROM artwork_media am
            WHERE am.artwork_id = a.id
            AND am.kind = 'image'
            AND am.valid = 1
            ORDER BY am.sort_order ASC, am.id ASC
            LIMIT 1
        ) AS thumbnail
        FROM artworks a
        WHERE a.valid = 1
	";

	$params = [];

	// 用途 (category) の IN 条件
	if (count($category) > 0) {
		$placeholders = implode(',', array_fill(0, count($category), '?'));
		$sql .= " AND a.category IN ($placeholders)";
		$params = array_merge($params, $category);
	}

	// カラー coloring -> coloring の IN 条件
	if (count($coloring) > 0) {
		$placeholders = implode(',', array_fill(0, count($coloring), '?'));
		$sql .= " AND a.coloring IN ($placeholders)";
		$params = array_merge($params, $coloring);
	}

	// 技法 techniques -> artwork_techniques の存在確認で絞り込み（OR 検索）
	// ⇒artwork_techniquesの中に、当該IDとtechnique列があるかどうかで当該行が有効か判定
	if (count($techniques) > 0) {
		$placeholders = implode(',', array_fill(0, count($techniques), '?'));
		$sql .= "AND EXISTS (
				SELECT 1
				FROM artwork_techniques atc
				WHERE atc.artwork_id = a.id
				  AND atc.valid = 1
				  AND atc.techniques_slug IN ($placeholders)
			)
		";
		$params = array_merge($params, $techniques);
	}

	// 在庫あり
	if ($is_stock) {
		$sql .= "AND a.in_stock = 1";
	} 

	$sql .= " ORDER BY a.id DESC";

	// ====== 実行 ======
	$stmt = $pdo->prepare($sql);
	$stmt->execute($params);
	$rows = $stmt->fetchAll(PDO::FETCH_ASSOC);

	// ====== 出力 ======
	echo json_encode($rows, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
} catch (Throwable $e) {
	http_response_code(500);
	echo json_encode(['error' => 'Internal Server Error'], JSON_UNESCAPED_UNICODE);
	// error_log($e->getMessage());
	exit;
}
