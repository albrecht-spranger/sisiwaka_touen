<?php
// /api/coloring.php

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

header('Content-Type: application/json; charset=utf-8');

try {
	// ====== DB接続 ======
	$pdo = new PDO($dsn, $DB_USER, $DB_PASS, [
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
