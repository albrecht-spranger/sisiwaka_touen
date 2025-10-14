<?php

declare(strict_types=1);

header('Content-Type: application/json; charset=utf-8');

// IDとパスワードはリクエストボディに入れてPOSTされるはず。なので、POSTかどうかチェック
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
	http_response_code(405);
	echo json_encode(['ok' => false, 'error' => 'Method Not Allowed']);
	exit;
}

// セッション利用開始
if (session_status() === PHP_SESSION_NONE) {
    session_set_cookie_params([
        'lifetime' => 0,
        'path'     => '/',
        'httponly' => true,
        'samesite' => 'Lax',
        'secure'   => isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on'
    ]);
    session_start();
}

// bodyからデータを取り出す。
$raw = file_get_contents('php://input');
$data = json_decode($raw, true);
$id = trim($data['id'] ?? '');
$pw = (string)($data['password'] ?? '');
if ($id === '' || $pw === '') {
	http_response_code(400);
	echo json_encode(['ok' => false, 'error' => 'IDとパスワードは必須です。']);
	exit;
}

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
$dsn = "mysql:host={$DB_HOST};dbname={$DB_NAME};charset=utf8mb4";

try {
	// ====== DB接続 ======
	$pdo = new PDO($dsn, $DB_USER, $DB_PASS, [
		PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
		PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
	]);
} catch (Throwable $e) {
	http_response_code(500);
	echo json_encode(['ok' => false, 'error' => 'DB connection failed']);
	exit;
}

$sql = 'SELECT id, pw FROM users WHERE id = :id LIMIT 1';
$stmt = $pdo->prepare($sql);
$stmt->execute([':id' => $id]);
$user = $stmt->fetch();
if (!$user || !password_verify($pw, $user['pw'])) {
	http_response_code(401);
	echo json_encode(['ok' => false, 'error' => 'IDまたはパスワードが違います。']);
	exit;
}

// 成功 → セッション記憶
$_SESSION['user_id'] = $user['id'];

echo json_encode(['ok' => true]);
