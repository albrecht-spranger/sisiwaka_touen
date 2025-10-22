<?php
// app/common_func.php
declare(strict_types=1);

function h(?string $str, string $default = ''): string
{
    return htmlspecialchars($str ?? $default, ENT_QUOTES, 'UTF-8');
}
