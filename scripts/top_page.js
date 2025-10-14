// /assets/js/updates.js
document.addEventListener('DOMContentLoaded', load_updates);


// 文字数カウントはコードポイント（全角OK）
function count_chars(text) {
	return Array.from(text).length;
}

function truncate_by_chars(text, limit = 40) {
	const chars = Array.from(text);
	if (chars.length <= limit) return text;
	return chars.slice(0, limit).join('') + '…';
}

// 初期表示テキストを決める（要件ルール）
function get_initial_display_text(article_text) {
	const lines = article_text.split(/\r?\n/);
	const has_multiple_lines = lines.length >= 2;
	const first_line = lines[0] ?? '';
	const first_line_len = count_chars(first_line);
	const total_len = count_chars(article_text);

	if (has_multiple_lines && first_line_len < 40) {
		return first_line + '…';
	}
	if (total_len > 40) {
		return truncate_by_chars(article_text, 40);
	}
	return article_text;
}

// アップデート1件のDOM生成
function create_update_item(item) {
	const container = document.createElement('div');
	container.className = 'update_item';
	container.setAttribute('data-full', 'collapsed');

	const date = document.createElement('div');
	date.className = 'update_date';
	date.textContent = item.date_ymd; // 表示は年月日

	const button = document.createElement('button');
	button.type = 'button';
	button.className = 'update_article';
	button.setAttribute('aria-expanded', 'false');
	button.setAttribute('title', '全文を表示/非表示');

	// data-* はプロパティ名がキャメルケース化されるため、属性で保持して getAttribute/ setAttribute を使う
	button.setAttribute('data-full_text', item.article);
	const initial_text = get_initial_display_text(item.article);
	button.setAttribute('data-initial_text', initial_text);
	button.textContent = initial_text;

	// クリックで全文トグル（改行表示）
	button.addEventListener('click', () => {
		const is_expanded = button.getAttribute('aria-expanded') === 'true';
		if (is_expanded) {
			// 初期表示へ戻す（1行表示 or 40文字トリム）
			button.textContent = button.getAttribute('data-initial_text') || '';
			button.setAttribute('aria-expanded', 'false');
			button.classList.remove('is-expanded');
			container.setAttribute('data-full', 'collapsed');
		} else {
			// 全文表示（改行含む）
			button.textContent = button.getAttribute('data-full_text') || '';
			button.setAttribute('aria-expanded', 'true');
			button.classList.add('is-expanded');
			container.setAttribute('data-full', 'expanded');
		}
	});

	container.appendChild(date);
	container.appendChild(button);
	return container;
}

// 読み込み＆描画
async function load_updates() {
	const root = document.getElementById('updates');
	if (!root) return;

	root.classList.add('updates_loading');
	root.innerHTML = '<div class="updates_spinner" role="status" aria-live="polite">読み込み中…</div>';

	try {
		const res = await fetch('../api/updates.php', { headers: { 'Accept': 'application/json' } });
		if (!res.ok) throw new Error('network');
		const json = await res.json();
		if (json.status !== 'ok' || !Array.isArray(json.data)) throw new Error('bad_format');

		// 念のため再ソート＆5件に限定
		const sorted = [...json.data]
			.sort((a, b) => new Date(b.created_at_iso) - new Date(a.created_at_iso))
			.slice(0, 5);

		root.classList.remove('updates_loading');
		root.innerHTML = '';

		if (sorted.length === 0) {
			root.innerHTML = '<div class="updates_empty">更新情報はまだありません。</div>';
			return;
		}

		const list = document.createElement('div');
		list.className = 'updates_list';

		sorted.forEach(item => list.appendChild(create_update_item(item)));
		root.appendChild(list);
	} catch (e) {
		root.classList.remove('updates_loading');
		root.innerHTML = '<div class="updates_error">読み込みに失敗しました。時間をおいて再度お試しください。</div>';
	}
}
