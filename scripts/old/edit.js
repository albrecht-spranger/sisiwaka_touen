document.addEventListener('DOMContentLoaded', async () => {
	// ─── URL パラメータから id を取得 ───
	const params = new URLSearchParams(window.location.search);
	const id = params.get('id');
	if (!id) {
		console.error('作品IDが指定されていません');
		return;
	}

	// IDの作品情報を読み込む
	let data = {};
	try {
		const res = await fetch(`/sisiwaka_touen/api/edit_read.php?id=${encodeURIComponent(id)}`);
		data = await res.json();
	} catch (err) {
		console.error('データ取得エラー:', err);
	}

	// 作品情報を作る
	set_detail(data);

	// 画像一覧作成
	renderMedia(data);

	//
	// 画像一覧のライトボックス処理を追加
	//
	make_lightbox();

	// submitボタン
	const el_edit_form = document.getElementById('edit_form');
	el_edit_form.addEventListener('submit', async (e) => {
		e.preventDefault();

		// ブラウザの制約チェック（HTML属性で定義したrequired等）
		// ⇒preventDefault()のためブラウザの制約チェックが働かない
		if (!el_edit_form.reportValidity()) return;

		const data = Object.fromEntries(new FormData(el_edit_form));

		// submitボタンを非活性化
		const el_submit_btn = document.getElementById('submit_btn');
		el_submit_btn.disabled = true;

		try {
			const form_data = new FormData(el_edit_form);
			const res = await fetch(el_edit_form.action, {
				method: 'POST',
				body: form_data,
				credentials: 'same-origin' // 同一オリジンならCookieも送る
			});
			if (!res.ok) throw new Error('Network/Server error');

			const result = await res.json();
			if (result.ok) {
				alert('登録しました');
				window.location.assign(`detail.html?id=${id}`);
			} else {
				alert(result.message || '通信に失敗しました');
			}
		} catch (err) {
			alert('通信に失敗しました');
		} finally {
			el_submit_btn.disabled = false;
		}
	});

	// キャンセルボタン
	const el_cancel_btn = document.getElementById('cancel_btn');
	el_cancel_btn.addEventListener('click', () => {
		const ok = window.confirm('書き込まずに元の画面に戻ります。よろしいですか？');
		if (!ok) return;
		window.location.assign(`detail.html?id=${id}`);
	});
});

//
// 作品情報を作る
//
function set_detail(data) {
	// ID
	document.getElementById('spec_id').textContent = data.id ?? 'ID不明';
	document.getElementById('spec_hidden_id').value = data.id ?? 0;

	// 作品タイトル
	document.getElementById('spec_description_title').value = data.description_title ?? "";

	// 銘
	document.getElementById('spec_name').value = data.name ?? "";

	// 説明
	const el_spec_description = document.getElementById('spec_description');
	el_spec_description.value = data.description ?? "";
	el_spec_description.style.height = "auto";         // いったんリセット
	el_spec_description.style.height = `${el_spec_description.scrollHeight + 4}px`; // 中身に合わせる

	// 用途
	make_category(data.category);

	// サイズ
	const el_spec = document.getElementById('spec_spec');
	el_spec.value = data.spec;
	el_spec.style.height = "auto";         // いったんリセット
	el_spec.style.height = `${el_spec.scrollHeight + 4}px`; // 中身に合わせる

	// 技法
	make_techniques(data.techniques_slug);

	// 粘土
	const hd_clay = document.getElementById('spec_clay');
	hd_clay.value = data.clay ?? "";
	hd_clay.style.height = "auto";         // いったんリセット
	hd_clay.style.height = `${hd_clay.scrollHeight + 4}px`; // 中身に合わせる

	// 釉薬
	const hd_glaze = document.getElementById('spec_glaze');
	hd_glaze.value = data.glaze ?? "";
	hd_glaze.style.height = "auto";         // いったんリセット
	hd_glaze.style.height = `${hd_glaze.scrollHeight + 4}px`; // 中身に合わせる

	// 色合い
	make_coloring(data.coloring);

	// 補足
	const hd_notes = document.getElementById('spec_notes');
	hd_notes.value = data.note ?? "";
	hd_notes.style.height = "auto";         // いったんリセット
	hd_notes.style.height = `${hd_notes.scrollHeight + 4}px`; // 中身に合わせる

	// Instagram
	document.getElementById('spec_instagram_url').value = data.instagram_url ?? "";

	// 完成日
	document.getElementById('spec_completion_date').value = data.completion_date;

	// 更新日
	document.getElementById('spec_update_date').textContent = timestamp2YYYYMD(data.update_date);

	// 在庫
	const el_in_stock = document.getElementById('spec_in_stock');
	el_in_stock.checked = !!Number(data?.in_stock);
	// !でbooleanに型変換。二重!!で0のみをfalseに
	// data?.in_stockは、dataにin_stockがなければundefinedを返す。

	// オンラインショップURL
	const el_shop_url = document.getElementById('spec_shop_url');
	el_shop_url.disabled = !Number(data?.in_stock);
	el_shop_url.value = data.shop_url ?? "";

	// 在庫のチェック状態に合わせてオンラインショップURLの入力可否を制御
	el_in_stock.addEventListener("change", () => {
		el_shop_url.disabled = !el_in_stock.checked;
	});

	// valid
	document.getElementById('spec_valid').checked = !!Number(data?.valid);
}

//
// 用途一覧を作り、選択
//
async function make_category(selected_slug = null) {
	let categories = {};
	try {
		const res = await fetch('/sisiwaka_touen/api/categories.php');
		categories = await res.json();
	} catch {
		console.error("用途一覧の取得エラー");
		return;
	}

	const el_category = document.getElementById('spec_category');
	// 一旦中身をクリア（再描画対応）
	el_category.innerHTML = '';
	categories.forEach((cat, index) => {
		const el_label = document.createElement('label');
		const el_radio = document.createElement('input');
		el_radio.type = 'radio';
		el_radio.name = 'category';
		el_radio.value = cat.slug;

		// required は同じ name の最初の要素だけに付与すればOK
		if (index === 0) {
			el_radio.required = true;
		}

		// 引数と一致したらチェックを入れる
		if (selected_slug && cat.slug === selected_slug) {
			el_radio.checked = true;
		}

		el_label.appendChild(el_radio);
		el_label.append(` ${cat.label_ja}`);
		el_category.appendChild(el_label);
	});
}

//
// 技法一覧を作り、選択
//
async function make_techniques(selected_slugs = []) {
	// 引数を Set に正規化（配列/単体/未指定に対応）
	const selected_set = new Set(
		Array.isArray(selected_slugs) ? selected_slugs : (selected_slugs ? [selected_slugs] : [])
	);

	let techniques;
	try {
		const res = await fetch('/sisiwaka_touen/api/techniques.php');
		techniques = await res.json();
	} catch (e) {
		console.error("技法一覧の取得エラー", e);
		return;
	}
	if (!Array.isArray(techniques)) {
		console.error('技法一覧の形式が不正です（配列を期待）:', techniques);
		return;
	}

	const el_techniques = document.getElementById('spec_techniques');
	// 一旦中身をクリア（再描画対応）
	el_techniques.innerHTML = '';
	techniques.forEach((tech) => {
		const el_label = document.createElement('label');
		const el_check = document.createElement('input');
		el_check.type = 'checkbox';
		el_check.name = 'techniques[]';
		el_check.value = tech.slug;

		// 引数と一致したらチェックを入れる
		if (selected_set.has(tech.slug)) {
			el_check.checked = true;
		}

		el_label.appendChild(el_check);
		el_label.append(` ${tech.label_ja}`);
		el_techniques.appendChild(el_label);
	});
}

//
// 色合い一覧を作り選択
//
async function make_coloring(selected_slug = null) {
	let colorings = {};
	try {
		const res = await fetch('/sisiwaka_touen/api/colorings.php');
		colorings = await res.json();
	} catch {
		console.error("色合い一覧の取得エラー");
		return;
	}

	const el_coloring = document.getElementById('spec_coloring');
	// 一旦中身をクリア（再描画対応）
	el_coloring.innerHTML = '';
	colorings.forEach((coloring_item, index) => {
		const el_label = document.createElement('label');
		const el_radio = document.createElement('input');
		el_radio.type = 'radio';
		el_radio.name = 'coloring';
		el_radio.value = coloring_item.slug;

		// required は同じ name の最初の要素だけに付与すればOK
		if (index === 0) {
			el_radio.required = true;
		}

		// 引数と一致したらチェックを入れる
		if (selected_slug && coloring_item.slug === selected_slug) {
			el_radio.checked = true;
		}

		el_label.appendChild(el_radio);
		el_label.append(` ${coloring_item.label_ja}`);
		el_coloring.appendChild(el_label);
	});
}

//
// 画像一覧を作る
//
function renderMedia(data) {
	const el_media_gallery = document.getElementById("media_gallery");
	data.media.forEach((item) => {
		const el_media_gallery_card = document.createElement("div");
		el_media_gallery_card.classList.add("media_gallery_card");
		// 画像
		const el_media = document.createElement("img");
		el_media.loading = "lazy";  // 画像多めでも安心
		el_media.src = item.image_url;
		el_media.alt = item.alt_ja;
		if (item.video_url != null) {
			el_media.dataset.type = "video";
			el_media.dataset.video_src = item.video_url;
		}
		el_media_gallery_card.appendChild(el_media);
		// hidden
		const el_hidden = document.createElement("input");
		el_hidden.type = "hidden";
		el_hidden.name = `media[${item.id}]`;
		el_hidden.value = "0";
		el_media_gallery_card.appendChild(el_hidden);
		// チェックボックス
		const el_checkbox = document.createElement("input");
		el_checkbox.type = "checkbox";
		el_checkbox.name = `media[${item.id}]`;
		el_checkbox.value = "1";
		el_checkbox.checked = !!item.valid;
		// チェックボックスのラベル
		const el_label = document.createElement('label');
		el_label.appendChild(el_checkbox);
		el_label.append("有効");
		el_media_gallery_card.appendChild(el_label);
		el_media_gallery.appendChild(el_media_gallery_card);
	});
}

//
// lightbox：画像をクリックしたら大きな画像を開く
//
function make_lightbox() {
	const thumbs = document.querySelectorAll('#media_gallery img');
	const lightbox = document.getElementById('lightbox');
	const imgEl = document.getElementById('lightboxImage');
	const videoEl = document.getElementById('lightboxVideo');

	// サムネイルクリックで開く
	thumbs.forEach(img => {
		img.addEventListener('click', () => {
			const isVideo = img.dataset.type === 'video' && img.dataset.video_src;
			if (isVideo) {
				openVideo({
					src: img.dataset.video_src,
					poster: img.src,
					alt: img.alt || ''
				});
			} else {
				openImage({
					src: img.src,
					alt: img.alt || ''
				});
			}
		});
	});

	function showOverlay() {
		lightbox.style.display = 'flex';
		// lightbox.setAttribute('aria-hidden', 'false');
		document.body.style.overflow = 'hidden';
		lightbox.tabIndex = -1;
		lightbox.focus();
	}

	function hideOverlay() {
		lightbox.style.display = 'none';
		// lightbox.setAttribute('aria-hidden', 'true');
		document.body.style.overflow = '';
		lightbox.removeAttribute('tabindex');
	}

	// 画像を開く
	function openImage({ src, alt }) {
		// まず動画を隠す／停止
		resetVideo();

		imgEl.src = src;
		imgEl.alt = alt;
		imgEl.style.display = 'block';
		videoEl.style.display = 'none';

		showOverlay();
		requestAnimationFrame(() => imgEl.classList.add('show'));
	}

	// 動画を開く
	function openVideo({ src, poster, alt }) {
		// まず画像を隠す
		imgEl.classList.remove('show', 'closing');
		imgEl.style.display = 'none';

		// 動画をセット
		// autoplayはブラウザ仕様で無音なら通ることが多いので muted を付与
		videoEl.style.display = 'block';
		videoEl.setAttribute('playsinline', '');
		videoEl.setAttribute('controls', '');
		videoEl.muted = true;     // 自動再生したい場合はtrue推奨
		videoEl.loop = false;     // ループしたければ true
		if (poster) videoEl.poster = poster;

		// src を入れ直して読み込み
		// （毎回確実に読み込み直し、前回の続き再生を避ける）
		videoEl.src = src;
		videoEl.load();

		showOverlay();

		// 少し待ってからアニメ＆再生開始
		requestAnimationFrame(() => {
			videoEl.classList.add('show');
			// 自動再生（音声はmutedなので多くの環境で開始可能）
			videoEl.play().catch(() => {
				/* ブラウザが拒否した場合は無視（コントロールから再生可能） */
			});
		});
	}

	// オーバーレイ（レイヤ or 中身のどこをクリックしても）で閉じる
	lightbox.addEventListener('click', (e) => {
		// 動画のコントロール操作やスクラブ時は閉じないように、
		// クリック元が video の内部コントロールっぽいときはスキップ
		const isInsideControls = e.target === videoEl || videoEl.contains(e.target);
		if (isInsideControls) return;

		closeLightbox();
	});

	// Esc キーで閉じる
	document.addEventListener('keydown', (e) => {
		const isOpen = lightbox.style.display === 'flex';
		if (isOpen && (e.key === 'Escape' || e.key === 'Esc')) {
			closeLightbox();
		}
	});

	// ====== 閉じる処理 ======
	function closeLightbox() {
		const opened = document.querySelector('#lightbox .lightbox-media.show');
		if (!opened) { hideOverlay(); return; }

		// 開いている要素（img or video）に閉じるアニメを適用
		opened.classList.remove('show');
		opened.classList.add('closing');
		opened.addEventListener('transitionend', handleCloseEnd, { once: true });
	}

	function handleCloseEnd() {
		// 両方のメディア要素の closing を外し、非表示に戻す
		imgEl.classList.remove('closing');
		videoEl.classList.remove('closing');

		// 動画は停止＆ソース解放（帯域節約）
		resetVideo();

		hideOverlay();
	}

	function resetVideo() {
		try {
			videoEl.pause();
		} catch { }
		videoEl.removeAttribute('poster');
		// ソースを空にして完全停止 → 次回クリックでロードし直す
		videoEl.removeAttribute('src');
		videoEl.load();
		videoEl.style.display = 'none';
		videoEl.classList.remove('show', 'closing');
	}
}

function timestamp2YYYYMD(date) {
	const d = new Date(date);
	const year = d.getFullYear();
	const month = d.getMonth() + 1;
	const day = d.getDate();
	const formatted = `${year}/${month}/${day}`;
	return formatted;
}
