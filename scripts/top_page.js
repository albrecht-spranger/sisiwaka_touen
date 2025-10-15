// /assets/js/updates.js
document.addEventListener('DOMContentLoaded', load_updates);

// アップデート1件のDOM生成
function create_update_item(item) {
	const container = document.createElement('article');
	container.className = 'update_item';
	// container.setAttribute('data-full', 'collapsed');

	const date = document.createElement('time');
	date.className = 'update_date';
	date.textContent = item.date_ymd; // 表示は年月日

	const text = document.createElement('p');
	text.textContent = item.article;
	text.className = 'update_article';
	text.setAttribute('aria-expanded', 'false');
	text.classList.add('is_collapsed');

	// クリックで全文トグル（改行表示）
	text.addEventListener('click', () => {
		if (text.getAttribute('aria-expanded') === 'true') {
			text.setAttribute('aria-expanded', 'false');
			text.classList.add('is_collapsed');
			text.classList.remove('is_expanded');
		} else {
			text.setAttribute('aria-expanded', 'true');
			text.classList.remove('is_collapsed');
			text.classList.add('is_expanded');
		}
	});

	container.appendChild(date);
	container.appendChild(text);
	return container;
}

// 読み込み＆描画
async function load_updates() {
	const root = document.getElementById('updates');
	if (!root) return;

	root.classList.add('updates_loading');
	root.innerHTML = '<div class="updates_spinner" role="status" aria-live="polite">読み込み中…</div>';

	try {
		const res = await fetch('/sisiwaka_touen/api/updates.php', { headers: { 'Accept': 'application/json' } });
		if (!res.ok) throw new Error('network');
		const json = await res.json();
		if (json.status !== 'ok' || !Array.isArray(json.data)) throw new Error('bad_format');

		root.classList.remove('updates_loading');
		root.innerHTML = '';

		if (json.data.length === 0) {
			root.innerHTML = '<div class="updates_empty">更新情報がありません。</div>';
			return;
		}

		const list = document.createElement('div');
		list.className = 'updates_list';

		json.data.forEach(item => list.appendChild(create_update_item(item)));
		root.appendChild(list);
	} catch (e) {
		root.classList.remove('updates_loading');
		root.innerHTML = '<div class="updates_error">読み込みに失敗しました。時間をおいて再度お試しください。</div>';
	}
}
