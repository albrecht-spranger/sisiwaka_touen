<?php
require __DIR__ . '/../../vendor/autoload.php';

use Google\Cloud\Firestore\FirestoreClient;

$cfg = ['projectId' => getenv('FIRESTORE_PROJECT_ID') ?: 'test-pj-20250522'];
if ((getenv('APP_ENV') ?: 'local') === 'local') {
    $key = getenv('GOOGLE_APPLICATION_CREDENTIALS') ?: '';
    if ($key === '' || !file_exists($key)) {
        die("Key not found: $key\n");
    }
    $cfg['keyFilePath'] = $key;
}
$db = new FirestoreClient($cfg);
echo "FirestoreClient init OK\n";
$it = $db->collection('artworks')->limit(1)->documents();
foreach ($it as $doc) {
    echo "first doc id = " . $doc->id() . "\n";
    break;
}
