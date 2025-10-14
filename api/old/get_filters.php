<?php
// get_filters.php
require __DIR__ . '/../vendor/autoload.php';
use Google\Cloud\Firestore\FirestoreClient;

$db = new FirestoreClient([
    'projectId'   => 'test-pj-20250522',
    'keyFilePath' => '/var/www/config/test-pj-20250522-b6842fe43c67.json',
]);

$docs = $db->collection('artworks')->documents();

$techniquesSet = [];
$usesSet       = [];

foreach ($docs as $doc) {
    if (! $doc->exists()) continue;
    $data = $doc->data();
    // 技法
    if (! empty($data['techniques']) && is_array($data['techniques'])) {
        foreach ($data['techniques'] as $t) {
            $techniquesSet[$t] = true;
        }
    }
    // 用途
    if (! empty($data['use'])) {
        $usesSet[$data['use']] = true;
    }
}

echo json_encode([
    'techniques' => array_values(array_keys($techniquesSet)),
    'uses'       => array_values(array_keys($usesSet)),
], JSON_UNESCAPED_UNICODE);
