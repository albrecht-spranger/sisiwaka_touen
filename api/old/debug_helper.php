<?php
// debug_helper.php
if (!function_exists('serveDebugJson')) {
    /**
     * APP_ENV=local のとき debug用JSONを返して終了する。
     * APP_ENV!=local のときは何もしない（関数を抜ける）。
     *
     * @param string $filePath 返すJSONファイルの絶対パス（__DIR__ を使って呼び出し側で組み立て推奨）
     * @return void
     */
    function serveDebugJson(string $filePath): void
    {
        // ====== 環境判定。ローカルの場合、デバッグ用詳細jsonを返す ======
        $appEnv = getenv('APP_ENV') ?: 'production';
        if ($appEnv !== 'local') {
            return;
        }
        // ---- local: デバッグ用 JSON をそのまま返す ----
        header('Content-Type: application/json; charset=utf-8');
        header('Cache-Control: no-store');
        header('X-App-Env: ' . $appEnv);

        if (!is_readable($filePath)) {
            http_response_code(500);
            echo json_encode(['error' => basename($filePath).'が見つかりません。'], JSON_UNESCAPED_UNICODE);
            exit;
        }

        $json = file_get_contents($filePath);
        if ($json === false) {
            http_response_code(500);
            echo json_encode(['error' => basename($filePath).'の読み込みに失敗しました。'], JSON_UNESCAPED_UNICODE);
            exit;
        }

        // JSONとして最低限のバリデーション（壊れていたら 500）
        json_decode($json);
        if (json_last_error() !== JSON_ERROR_NONE) {
            http_response_code(500);
            echo json_encode(['error' => basename($filePath).'が不正なJSONです: ' . json_last_error_msg()], JSON_UNESCAPED_UNICODE);
            exit;
        }

        echo $json; // 形（配列/オブジェクト）はファイルのまま返す
        exit;
    }
}
