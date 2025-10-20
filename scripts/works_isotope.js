document.addEventListener('DOMContentLoaded', () => {
	const grid = document.querySelector('#artworks_gallery');
	const iso = new Isotope(grid, {
		itemSelector: '.grid-item',
		layoutMode: 'masonry',
		percentPosition: true,  // CSSで%幅を使うなら
		transitionDuration: '0.3s'
	});

	// 画像が読み終わってから最終レイアウト
	imagesLoaded(grid, () => iso.layout());

	// ===== フィルタUIの例（用途OR × 技法OR × 色合いOR × 在庫AND）=====
	const form = document.getElementById('search_form');

	function buildSelectorFromChecks(name) {
		const vals = [...form.querySelectorAll(`input[name="${name}[]"]:checked`)].map(el => `.${el.value}`);
		return vals.length ? vals : ['*']; // 空ならワイルドカード
	}

	function applyFilter() {
		const cats = buildSelectorFromChecks('category');   // 例: ['.cup', '.bowl']
		const techs = buildSelectorFromChecks('techniques'); // 例: ['.nerikomi']
		const cols = buildSelectorFromChecks('coloring');   // 例: ['.black', '.white']

		// グループ間はAND → 直積を作ってカンマでOR
		let combos = [];
		cats.forEach(c =>
			techs.forEach(t =>
				cols.forEach(col =>
					combos.push(`${c === '*' ? '' : c}${t === '*' ? '' : t}${col === '*' ? '' : col}` || '*')
				)
			)
		);

		// 在庫チェックONなら AND [data-stock="1"]
		const stockEl = form.querySelector('input[name="is_stock"]');
		if (stockEl && stockEl.checked) {
			combos = combos.map(sel => (sel === '*' ? '[data-stock="1"]' : `${sel}[data-stock="1"]`));
		}

		const filter = combos.join(', ');
		iso.arrange({ filter });
		// ここで sessionStorage / URL に保存するなら書く
	}

	// 何かが変わったら即反映
	form?.addEventListener('change', applyFilter);

	// 初回適用（保存復元するならここで読む）
	applyFilter();
});
