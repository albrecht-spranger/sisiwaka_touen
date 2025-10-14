<?php
error_reporting(E_ALL);
ini_set('display_errors', '1');

use Google\Cloud\Firestore\FirestoreClient;

require __DIR__ . '/../../vendor/autoload.php';

$projectId = getenv('FIRESTORE_PROJECT_ID') ?: 'test-pj-20250522';

// ★ gRPC 明示
$fs = new FirestoreClient([
    'projectId' => $projectId,
    'transport' => 'grpc',
    'keyFilePath' => 'C:\Users\PGcca\Documents\20250527_南柏\sisiwaka_touen\config\test-pj-20250522-b6842fe43c67.json',
]);

// できるだけ軽い呼び出し
$it = $fs->collection('artworks')->limit(1)->documents();
$count = 0;
foreach ($it as $doc) {
    $count++;
    break;
}
echo "OK gRPC. count=$count", PHP_EOL;
