<?php
require __DIR__ . '/../../vendor/autoload.php';

use Google\Auth\Credentials\ServiceAccountCredentials;
use Google\Auth\HttpHandler\HttpHandlerFactory;

function println($m){ echo $m, PHP_EOL; }

$keyPath = getenv('GOOGLE_APPLICATION_CREDENTIALS') ?: '';
if ($keyPath === '' || !file_exists($keyPath)) {
  die("Key not found: $keyPath\n");
}

$scopes = ['https://www.googleapis.com/auth/datastore']; // Firestore 用スコープ
$creds  = new ServiceAccountCredentials($scopes, $keyPath);

// ★ ここがポイント：callable な HTTP ハンドラを作る
$httpHandler = HttpHandlerFactory::build();

println("Fetching token...");
$t0 = microtime(true);
$token = $creds->fetchAuthToken($httpHandler);
$dt = number_format(microtime(true) - $t0, 3);
println("Done in {$dt}s");

// 結果表示（access_token と expires_in が出ればOK）
var_dump($token);
