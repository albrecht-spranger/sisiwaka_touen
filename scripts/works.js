let el_search_form;		// 検索パネル全体
let grid;				// 作品一覧
let iso;				// isotopeオブジェクト

// メイン処理
document.addEventListener('DOMContentLoaded', () => {
	// ==============================
	// 検索パネル
	// ==============================
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

	// ==============================
	// 作品一覧
	// ==============================
	grid = document.getElementById('artworks_gallery');
	iso = new Isotope(grid, {
		itemSelector: '.grid-item',
		layoutMode: 'masonry',
		percentPosition: false,
		transitionDuration: '0.3s',
		initLayout: false
	});

	// 画像が読み終わってから最終レイアウト
	// imagesLoaded(grid, () => iso.layout());
	imagesLoaded(grid, function () {
		// iso.layout();
		applyFilter();
		grid.classList.remove('is_loading');
		document.getElementById('loading_spinner')?.remove();
	});

	// ===== フィルタUIの例（用途OR × 技法OR × 色合いOR × 在庫AND）=====
	el_search_form = document.getElementById('search_form');

	// 何かが変わったら即反映するため、フォームにイベント登録
	el_search_form.addEventListener('change', applyFilter);

	// 初回適用（保存復元するならここで読む）
	// applyFilter();
});

// フィルタリング文字列を作り、Isotopeに渡す
function applyFilter() {
	const cats = build_selector_from_unique_checks('category');   // 例: ['.cup', '.bowl']
	const techs = build_selector_from_multi_checks('technique'); // 例: ['.nerikomi']
	const cols = build_selector_from_unique_checks('coloring');   // 例: ['.black', '.white']

	// グループ間はAND → 直積を作ってカンマでOR
	let combos = [];
	cats.forEach(c =>
		techs.forEach(t =>
			cols.forEach(col =>
				combos.push(`${c === '*' ? '' : c}${t === '*' ? '' : t}${col === '*' ? '' : col}` || '*')
			)
		)
	);

	// 在庫ありのみ表示
	const el_is_stock = el_search_form.querySelector('input[name="is_stock"]:checked');
	if (el_is_stock) {
		combos = combos.map(sel => (sel === '*' ? '.in_stock' : `${sel}.in_stock`));
	}

	const filter = combos.join(', ');
	iso.arrange({ filter });
	// ここで sessionStorage / URL に保存するなら書く

	// ★★★debug★★★
	document.getElementById('debug').textContent = filter;
}

// 単一選択要素(category、coloring)のフィルタリング文字配列を作る
function build_selector_from_unique_checks(name) {
	const val_array = Array.from(el_search_form.querySelectorAll(`input[name="${name}[]"]:checked`));
	const vals = val_array.map(el => `.${el.value}`);
	return vals.length ? vals : ['*']; // 空ならワイルドカード
}

// 複数選択要素(technique)のフィルタリング文字列を作る
function build_selector_from_multi_checks(name) {
	const allCheckboxes = Array.from(el_search_form.querySelectorAll(`input[name="${name}[]"]`));
	const checked = allCheckboxes.filter(el => el.checked).map(el => el.value);
	const unchecked = allCheckboxes.filter(el => !el.checked).map(el => el.value);

	// 1つもチェックされていない → ワイルドカード
	if (checked.length === 0) {
		return ['*'];
	}

	// チェックあり → 「.A.B:not(.C):not(.D)」の形式で1つのセレクタ文字列を返す
	const include = checked.map(v => `.${v}`).join('');
	const exclude = unchecked.map(v => `:not(.${v})`).join('');

	return [`${include}${exclude}`];
}

// 用途をクリアボタンの処理
function clear_category() {
	const checkboxes = document.querySelectorAll('input[name="category[]"]');
	checkboxes.forEach(function (checkbox) {
		checkbox.checked = false;
	});
	applyFilter(); // 即時反映
}

// 技法をクリアボタンの処理
function clear_techniques() {
	const checkboxes = document.querySelectorAll('input[name="technique[]"]');
	checkboxes.forEach(function (checkbox) {
		checkbox.checked = false;
	});
	applyFilter(); // 即時反映
}

// 色合いをクリアボタンの処理
function clear_coloring() {
	const checkboxes = document.querySelectorAll('input[name="coloring[]"]');
	checkboxes.forEach(function (checkbox) {
		checkbox.checked = false;
	});
	applyFilter(); // 即時反映
}
