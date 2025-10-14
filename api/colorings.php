<?php
// /api/coloring.php

declare(strict_types=1);

// ====== 設定（環境変数を使う想定：.env等で定義） ======
$env = parse_ini_file(__DIR__ . '/.env');
$DB_PASS = $env['DB_READER_PW'];
if ($DB_PASS === false) {
	http_response_code(500);
	header('Content-Type: application/json; charset=utf-8');
	echo json_encode([
		'error' => 'Internal Server Error',
		'message' => 'Database configuration is missing'
	]);
	exit;
}

header('Content-Type: application/json; charset=utf-8');

try {
	// ====== DB接続 ======
	$dsn = "mysql:host=localhost;dbname=sisiwaka_touen;charset=utf8mb4";
	$pdo = new PDO($dsn, 'sisiwaka_reader', $DB_PASS, [
		PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
		PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
		PDO::ATTR_EMULATE_PREPARES => false,
	]);

	// ====== データ取得 ======
	$sql = "SELECT slug, label_ja
              FROM colorings
             WHERE valid = 1";
	$stmt = $pdo->query($sql);
	$rows = $stmt->fetchAll();

	echo json_encode($rows, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
} catch (Throwable $e) {
	http_response_code(500);
	echo json_encode(['error' => 'Internal Server Error']);
}
