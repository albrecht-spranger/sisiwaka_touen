<?php
require __DIR__ . '/../../vendor/autoload.php';

use Google\Auth\Credentials\ServiceAccountCredentials;
use Google\Auth\HttpHandler\HttpHandlerFactory;
use GuzzleHttp\Client;

function p($m){ echo $m, PHP_EOL; }

$projectId = getenv('FIRESTORE_PROJECT_ID') ?: 'test-pj-20250522';
$keyPath   = getenv('GOOGLE_APPLICATION_CREDENTIALS') ?: '';
if ($keyPath === '' || !file_exists($keyPath)) {
  die("Key not found: $keyPath\n");
}

$scopes = ['https://www.googleapis.com/auth/datastore'];
$creds  = new ServiceAccountCredentials($scopes, $keyPath);
$httpHandler = HttpHandlerFactory::build();

// アクセストークン取得（10秒以内に返る想定）
p("Fetching token...");
$token = $creds->fetchAuthToken($httpHandler);
if (empty($token['access_token'])) {
  die("Failed to fetch access token\n");
}
$accessToken = $token['access_token'];
p("Token OK");

// REST: GET projects/{project}/databases/(default)/documents/artworks?pageSize=1
$client = new Client(['timeout' => 10]);
$url = "https://firestore.googleapis.com/v1/projects/{$projectId}/databases/(default)/documents/artworks?pageSize=1";

p("Calling REST list...");
$res = $client->get($url, [
  'headers' => [
    'Authorization' => "Bearer {$accessToken}",
    'Accept'        => 'application/json',
  ],
]);

$body = (string)$res->getBody();
$data = json_decode($body, true);

if (!empty($data['documents'][0]['name'])) {
  p("First document name: ".$data['documents'][0]['name']);
} else {
  p("No documents or unexpected response:");
  echo $body, PHP_EOL;
}
p("DONE");
