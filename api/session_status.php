<?php
// 厳密な型指定モードを有効
declare(strict_types=1);

header('Content-Type: application/json; charset=utf-8');

if (session_status() === PHP_SESSION_NONE) {
	session_set_cookie_params([
		'lifetime' => 0,
		'path'     => '/',
		'httponly' => true,
		'samesite' => 'Lax',
		'secure' => isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on'
		// ⇒本番ではtrueにする
	]);
	session_start();
}

if (!empty($_SESSION['user_id'])) {
	echo json_encode(['logged_in' => true, 'user_id' => $_SESSION['user_id']]);
} else {
	echo json_encode(['logged_in' => false]);
}
