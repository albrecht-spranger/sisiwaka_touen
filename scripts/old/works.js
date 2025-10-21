document.addEventListener('DOMContentLoaded', async () => {
	// 検索条件の開閉ボタンのリスナー登録
	const toggleBtn = document.getElementById("search_toggle_btn");
	const controls = document.getElementById("search_panel");
	toggleBtn.addEventListener("click", () => {
		// 状態を反転
		const is_open = controls.classList.toggle("search_panel_open");
		// ボタンのラベルも変更
		toggleBtn.textContent = is_open ? "検索条件（閉じる）" : "検索条件（開く）";
	});

	// 用途をクリアボタンのイベント登録
	document.getElementById("clear_category").addEventListener("click", clear_category);
	// 技法をクリアボタンのイベント登録
	document.getElementById("clear_techniques").addEventListener("click", clear_techniques);
	// 色合いをクリアボタンのイベント登録
	document.getElementById("clear_coloring").addEventListener("click", clear_coloring);

	// チェックボックス群を作成
	try {
		await Promise.all([
			make_category_checkbox(),
			make_techniques_checkbox(),
			make_coloring_checkbox()
		]);
	} catch (err) {
		console.error('チェックボックス群の作成に失敗しました:', err);
		return;
	}

	// 在庫ありのクリックイベント登録
	const cb_stock = document.querySelector('input[name="is_stock"]').addEventListener('change', fetchWithCurrentForm);

	// セッションストレージから検索条件を取得
	const conditions = load_conditions();
	// 検索フォームに反映
	update_conditions(conditions);
	// 検索フォームをもとに検索
	fetchWithCurrentForm();
});

//
// 用途のチェックボックス群を作成
//
async function make_category_checkbox() {
	const res = await fetch('/sisiwaka_touen/api/categories.php');
	if (!res.ok) {
		throw new Error(`HTTP ERROR ${res.status} ${res.statusText}`);
	}

	const categories = await res.json();

	const el_category = document.getElementById('checkbox_category');
	// 既存の子要素ごとリセット（古いリスナもまとめて除去）
	el_category.replaceChildren();

	// APIの一覧からチェックボックスを生成
	categories.forEach(cat => {
		const label = document.createElement('label');
		const checkbox = document.createElement('input');
		checkbox.type = 'checkbox';
		checkbox.name = 'category[]';
		checkbox.value = cat.slug;
		checkbox.addEventListener('change', () => {
			fetchWithCurrentForm();
		});
		label.appendChild(checkbox);
		label.append(`${cat.label_ja}`);
		el_category.appendChild(label);
	});
}

//
// 技法のチェックボックス群を作成
//
async function make_techniques_checkbox() {
	const res = await fetch('/sisiwaka_touen/api/techniques.php');
	if (!res.ok) {
		throw new Error(`HTTP ERROR ${res.status} ${res.statusText}`);
	}

	const techniques = await res.json();

	const el_techniques = document.getElementById('checkbox_techniques');
	// 既存の子要素ごとリセット（古いリスナもまとめて除去）
	el_techniques.replaceChildren();

	// APIの一覧からチェックボックスを生成
	techniques.forEach(tech => {
		const label = document.createElement('label');
		const checkbox = document.createElement('input');
		checkbox.type = 'checkbox';
		checkbox.name = 'techniques[]';
		checkbox.value = tech.slug;
		checkbox.addEventListener('change', () => {
			fetchWithCurrentForm('replace');
		});
		label.appendChild(checkbox);
		label.append(`${tech.label_ja}`);
		el_techniques.appendChild(label);
	});
}

//
// 色合いのチェックボックス群を作成
//
async function make_coloring_checkbox() {
	const res = await fetch('/sisiwaka_touen/api/colorings.php');
	if (!res.ok) {
		throw new Error(`HTTP ERROR ${res.status} ${res.statusText}`);
	}
	const coloring = await res.json();
	const el_coloring = document.getElementById('checkbox_coloring');
	// 既存の子要素ごとリセット（古いリスナもまとめて除去）
	el_coloring.replaceChildren();

	// APIの一覧からチェックボックスを生成
	coloring.forEach(coloring_item => {
		const label = document.createElement('label');
		const checkbox = document.createElement('input');
		checkbox.type = 'checkbox';
		checkbox.name = 'coloring[]';
		checkbox.value = coloring_item.slug;
		checkbox.addEventListener('change', () => {
			fetchWithCurrentForm();
		});
		label.appendChild(checkbox);
		label.append(`${coloring_item.label_ja}`);
		el_coloring.appendChild(label);
	});
}

// セッションストレージから検索条件を復元
function load_conditions() {
	const category = JSON.parse(sessionStorage.getItem("search_category") || "[]");
	const techniques = JSON.parse(sessionStorage.getItem("search_techniques") || "[]");
	const coloring = JSON.parse(sessionStorage.getItem("search_coloring") || "[]");
	const is_stock = JSON.parse(sessionStorage.getItem("search_is_stock") || false);
	return { category, techniques, coloring, is_stock };
}

// セッションストレージに検索条件を保存
function save_conditions(conditions) {
	sessionStorage.setItem("search_category", JSON.stringify(conditions.category));
	sessionStorage.setItem("search_techniques", JSON.stringify(conditions.techniques));
	sessionStorage.setItem("search_coloring", JSON.stringify(conditions.coloring));
	sessionStorage.setItem("search_is_stock", JSON.stringify(conditions.is_stock));
}

// 引数をもとにフォームに反映
function update_conditions(conditions) {
	document.querySelectorAll('input[name="category[]"]').forEach(el => {
		el.checked = conditions.category.includes(el.value);
	});
	document.querySelectorAll('input[name="techniques[]"]').forEach(el => {
		el.checked = conditions.techniques.includes(el.value);
	});
	document.querySelectorAll('input[name="coloring[]"]').forEach(el => {
		el.checked = conditions.coloring.includes(el.value);
	});
	document.querySelector('input[name="is_stock"]').checked = !!conditions.is_stock;
}

// フォームの現在値をconditions = { category[], techniques[], coloring[], is_stock } で取得
function get_conditions() {
	const category = Array.from(document.querySelectorAll('input[name="category[]"]:checked'))
		.map(el => el.value);
	const techniques = Array.from(document.querySelectorAll('input[name="techniques[]"]:checked'))
		.map(el => el.value);
	const coloring = Array.from(document.querySelectorAll('input[name="coloring[]"]:checked'))
		.map(el => el.value);
	const cb_stock = document.querySelector('input[name="is_stock"]');
	const is_stock = !!(cb_stock && cb_stock.checked);
	return { category, techniques, coloring, is_stock };
}

// conditions → URLSearchParams へ
function buildParams(conditions) {
	const p = new URLSearchParams();
	conditions.category.forEach(v => p.append("category[]", v));
	conditions.techniques.forEach(v => p.append("techniques[]", v));
	conditions.coloring.forEach(v => p.append("coloring[]", v));
	if (conditions.is_stock) {
		p.append("is_stock", 1);
	}
	return p;
}

function debounce(fn, wait = 400) {
	let t;
	return (...args) => { clearTimeout(t); t = setTimeout(() => fn.apply(null, args), wait); };
}

let lastData = [];
window.addEventListener('resize', debounce(() => renderGallery(lastData), 200));

// 現在のフォーム条件で fetch → 描画
function fetchWithCurrentForm() {
	// フォームから検索条件を取得
	const conditions = get_conditions();
	const params = buildParams(conditions);
	const url = `/sisiwaka_touen/api/works.php${params.toString() ? "?" + params.toString() : ""}`;

	// 検索条件をセッションストレージに保存
	save_conditions(conditions);

	fetch(url)
		.then(res => {
			if (!res.ok) throw new Error(`HTTP ${res.status}`);
			return res.json();
		})
		.then(data => {
			lastData = data;
			renderGallery(data);
		})
		.catch(err => console.error('データ取得エラー:', err));
}

// 用途をクリアボタンの処理
function clear_category() {
	const checkboxes = document.querySelectorAll('input[name="category[]"]');
	checkboxes.forEach(function (checkbox) {
		checkbox.checked = false;
	});
	fetchWithCurrentForm('replace'); // 即時反映＆URL上書き
}

// 技法をクリアボタンの処理
function clear_techniques() {
	const checkboxes = document.querySelectorAll('input[name="techniques[]"]');
	checkboxes.forEach(function (checkbox) {
		checkbox.checked = false;
	});
	fetchWithCurrentForm('replace'); // 即時反映＆URL上書き
}

// 色合いをクリアボタンの処理
function clear_coloring() {
	const checkboxes = document.querySelectorAll('input[name="coloring[]"]');
	checkboxes.forEach(function (checkbox) {
		checkbox.checked = false;
	});
	fetchWithCurrentForm('replace'); // 即時反映＆URL上書き
}

function renderGallery(items) {
	const container = document.getElementById('gallery');
	container.innerHTML = '';

	const cols = getColumnsCount();
	const rows = Math.ceil(items.length / cols);
	const delay = 250; // ミリ秒

	// ② まずはID順で全要素を作り、hiddenクラスで隠しておく
	const elements = items.map(item => {
		const div = document.createElement('div');
		div.classList.add('grid-item', 'hidden');

		if (item.thumbnail) {
			const fig = document.createElement('figure');

			const imgWrapper = document.createElement('div');
			imgWrapper.classList.add('works_img_wrapper');

			const img = document.createElement('img');
			img.src = item.thumbnail;
			img.alt = `作品 ${item.id}`;
			img.loading = 'lazy';

			fig.appendChild(imgWrapper);
			imgWrapper.appendChild(img);

			const figcaption = document.createElement('figcaption');
			figcaption.textContent = item.name;
			figcaption.classList.add('caption_style');

			fig.appendChild(figcaption);
			div.appendChild(fig);
			div.addEventListener('click', () => {
				window.location.href = `./detail.html?id=${item.id}`;
			});
		} else {
			div.textContent = `No Image (${item.id})`;
		}

		return div;
	});

	// ID順でDOMに追加 → CSS Gridが横方向ID順に配置
	elements.forEach(elm => container.appendChild(elm));

	// ③ 斜めステージごとに遅延をつけて hidden を外す
	for (let diag = 0; diag < rows + cols - 1; diag++) {
		setTimeout(() => {
			for (let c = 0; c < cols; c++) {
				const r = diag - c;
				if (r < 0 || r >= rows) continue;
				const idx = r * cols + c;
				if (idx < elements.length) {
					elements[idx].classList.remove('hidden');
				}
			}
		}, diag * delay + 1000);
	}
}

function getColumnsCount() {
	return window.innerWidth >= 768 ? 5 : 3;
}
