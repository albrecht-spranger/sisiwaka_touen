<?php
// app/db_connect.php
declare(strict_types=1);

function get_db_connection(bool $is_editor = false): PDO
{
	// pdoを使いまわす。既に存在すれば、そのまま返す
	static $pdo = null;
	if ($pdo instanceof PDO) {
		return $pdo;
	}

	// .envファイルの読み込み
	$envPath = __DIR__ . '/.env';
	if (!is_readable($envPath)) {
		throw new RuntimeException('.env file not found: ' . $envPath);
	}

	$env = parse_ini_file($envPath, false, INI_SCANNER_TYPED);
	if ($env === false) {
		throw new RuntimeException('Failed to parse .env file');
	}

	// 必要な値を取得（存在チェックも兼ねる）
	$host = $env['DB_HOST'] ?? 'localhost';
	$name = $env['DB_NAME'] ?? '';
	if ($is_editor) {
		$user = $env['DB_EDITOR'] ?? '';
		$pass = $env['DB_EDITOR_PW'] ?? '';
	} else {
		$user = $env['DB_READER'] ?? '';
		$pass = $env['DB_READER_PW'] ?? '';
	}

	// passは設定されていないケースもあるのでチェックしない
	if ($name === '' || $user === '') {
		throw new RuntimeException('Database configuration is incomplete');
	}

	$dsn = sprintf('mysql:host=%s;dbname=%s;charset=utf8mb4', $host, $name);
	$options = [
		PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
		PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
		PDO::ATTR_EMULATE_PREPARES => false,
		// ↑DBの詳細エラーが出る
	];

	try {
		$pdo = new PDO($dsn, $user, $pass, $options);
	} catch (PDOException $e) {
		error_log('[DB Connection Error] ' . $e->getMessage());
		throw $e;
	}

	return $pdo;
}
