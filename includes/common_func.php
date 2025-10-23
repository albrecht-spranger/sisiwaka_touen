<?php
// app/common_func.php
declare(strict_types=1);

// セッション利用準備
if (session_status() !== PHP_SESSION_ACTIVE) {
	session_start();
}

function h(?string $str, string $default = ''): string
{
    return htmlspecialchars($str ?? $default, ENT_QUOTES, 'UTF-8');
}

// Simple flash messages
function set_flash(string $key, string $value): void
{
	$_SESSION['flash'][$key] = $value;
}

function get_flash(string $key): ?string
{
	if (!empty($_SESSION['flash'][$key])) {
		$v = $_SESSION['flash'][$key];
		unset($_SESSION['flash'][$key]);
		return $v;
	}
	return null;
}

// 次のページに遷移
function redirect(string $path, int $statusCode = 303): void
{
    header('Location: ' . $path, true, $statusCode);
    exit;
}
