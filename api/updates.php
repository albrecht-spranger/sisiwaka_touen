<?php
// 
// /api/updates.php
// 更新情報最大5件を返す
// 
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
    $pdo = new PDO($dsn, $DB_USER, $DB_PASS, [
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
        ]
    );

    // valid=1 の最新5件。時間まで持つので created_at DESC で正確にソート
    $sql = "SELECT created_at, article
        FROM updates
        WHERE valid = 1
        ORDER BY created_at DESC
        LIMIT 5
    ";
    $stmt = $pdo->query($sql);
    $rows = $stmt->fetchAll();
    $result = [];  // 空の配列を用意
    foreach ($rows as $row) {
        $dt = new DateTime($row['created_at']);
        $result[] = [
            'date_ymd' => $dt->format('Y/n/j'),
            'article' => $row['article'],
        ];
    }

    echo json_encode([
        'status' => 'ok',
        'data' => $result,
    ], JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
} catch (Throwable $e) {
    http_response_code(500);
    echo json_encode([
        'status' => 'error',
        'message' => 'server_error',
    ], JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
}
