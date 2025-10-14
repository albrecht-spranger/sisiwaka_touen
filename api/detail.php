<?php
// /api/detail.php
declare(strict_types=1);

// ====== 環境設定（必要に応じて .env やサーバ環境変数に置き換えてOK） ======
$DB_HOST = 'localhost';
$DB_NAME = 'sisiwaka_touen';
$DB_USER = 'sisiwaka_reader';
$env = parse_ini_file(__DIR__ . '/.env');
if ($env === false || !isset($env['DB_READER_PW'])) {
	http_response_code(500);
	echo json_encode([
		'error' => 'Internal Server Error',
		'message' => 'Database configuration is missing',
	], JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
	exit;
}
$DB_PASS = $env['DB_READER_PW'];

// ===== レスポンス形式 =====
header('Content-Type: application/json; charset=utf-8');

// id バリデーション
$id = filter_input(INPUT_GET, 'id', FILTER_VALIDATE_INT);
if ($id === false || $id === null) {
	http_response_code(400);
	echo json_encode([
		'error' => 'Bad Request',
		'message' => 'id parameter is required and must be an integer.',
	], JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
	exit;
}

try {
	// ====== DB接続 ======
	$dsn = "mysql:host={$DB_HOST};dbname={$DB_NAME};charset=utf8mb4";
	$pdo = new PDO($dsn, $DB_USER, $DB_PASS, [
		PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
		PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
	]);

	// ====== 作品本体 ======
	$sqlArtwork = "SELECT 
			a.*, 
			c.label_ja AS category, 
			clr.label_ja AS coloring
		FROM artworks a
			LEFT JOIN categories c ON a.category = c.slug
			LEFT JOIN colorings clr ON a.coloring = clr.slug
		WHERE a.id = :id 
		AND a.valid = 1;
	";
	$stmt = $pdo->prepare($sqlArtwork);
	$stmt->execute([':id' => $id]);
	$artwork = $stmt->fetch();

	if (!$artwork) {
		http_response_code(404);
		echo json_encode([
			'error' => 'Not Found',
			'message' => 'Artwork not found.',
		], JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
		exit;
	}

	// ====== 画像・動画（media） ======
	$sqlMedia = "SELECT image_url, video_url, alt_ja
        FROM artwork_media
        WHERE artwork_id = :id AND valid = 1
        ORDER BY sort_order ASC, id ASC
    ";
	$stmtMedia = $pdo->prepare($sqlMedia);
	$stmtMedia->execute([':id' => $id]);
	$mediaRows = $stmtMedia->fetchAll();

	// ====== 出力オブジェクト組み立て ======
	$artwork['media'] = $mediaRows;

	// ===== 使われている技法一覧 =====
	$sql_techniques = "SELECT t.label_ja FROM artwork_techniques at JOIN techniques t
		ON at.techniques_slug = t.slug WHERE at.artwork_id = :id AND at.valid = 1 AND t.valid = 1
    ";
	try {
		$stmt_techniques = $pdo->prepare($sql_techniques);
		$stmt_techniques->execute([':id' => $id]);
	} catch (PDOException $e) {
		error_log("SQLエラー: " . $e->getMessage());
		error_log("SQL文: " . $sql);
		error_log("パラメータ: " . json_encode($params, JSON_UNESCAPED_UNICODE));
		throw $e; // そのまま上に投げるか、共通ハンドラで処理
	}
	$techniques_rows = $stmt_techniques->fetchAll(PDO::FETCH_COLUMN);
	// ⇒FETCH_COLUMN：このSQLだけ連想記憶ではなく、一列の値を返す

	// ====== 出力オブジェクト組み立て ======
	$artwork['techniques'] = $techniques_rows;

	echo json_encode($artwork, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
} catch (Throwable $e) {
	http_response_code(500);
	echo json_encode(['error' => 'Internal Server Error'], JSON_UNESCAPED_UNICODE);
	exit;
}
