<?php
require __DIR__ . '/../../vendor/autoload.php';
use Google\Cloud\Firestore\FirestoreClient;

function p($m){ echo $m, PHP_EOL; }

$projectId = getenv('FIRESTORE_PROJECT_ID') ?: 'test-pj-20250522';
$key = getenv('GOOGLE_APPLICATION_CREDENTIALS') ?: null;

$cfg = [
  'projectId'   => $projectId,
  'keyFilePath' => $key,
  'transport'   => 'rest',   // ★ RESTを明示
];

p("START: REST transport mode");
$db = new FirestoreClient($cfg);
p("FirestoreClient init OK (REST)");

$it = $db->collection('artworks')->limit(1)->documents();
p("documents() returned iterator");

foreach ($it as $doc) { p("First doc id = ".$doc->id()); break; }
p("DONE");
