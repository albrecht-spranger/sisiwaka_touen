// 編集画面へのログインのための変数
const el_login_modal_wrapper = document.getElementById('login_modal_wrapper');
const el_login_form = document.getElementById('login_form');
const el_login_cancel_btn = document.getElementById('login_cancel_btn');

// 作品IDはグローバル変数に
var id;

//
// メイン
//
document.addEventListener('DOMContentLoaded', async () => {
	// ─── URL パラメータから id を取得 ───
	const params = new URLSearchParams(window.location.search);
	id = params.get('id');
	if (!id) {
		console.error('作品IDが指定されていません');
		return;
	}

	// 編集画面へのリンクのイベント
	const el_edit_link = document.getElementById('edit_link');
	el_edit_link.addEventListener('click', async (e) => {
		e.preventDefault();
		// ログインチェック（サーバAPI）
		const res = await fetch('../api/session_status.php');
		const data = await res.json();
		if (data.logged_in) {
			window.location.href = `edit.html?id=${encodeURIComponent(id)}`;
		} else {
			show_modal();
		}
	});

	// ログインダイアログのキャンセルボタンにイベント登録
	el_login_cancel_btn.addEventListener('click', hide_modal);

	// ログインダイアログのログインボタンのイベント
	el_login_form.addEventListener('submit', async (e) => {
		e.preventDefault();
		const form = new FormData(el_login_form);
		const payload = { id: form.get('id'), password: form.get('password') };

		try {
			const res = await fetch('../api/login.php', {
				method: 'POST',
				headers: { 'Content-Type': 'application/json' },
				body: JSON.stringify(payload)
			});
			const data = await res.json();
			if (res.ok && data.ok) {
				hide_modal();
				window.location.href = `edit.html?id=${encodeURIComponent(id)}`;
			} else {
				alert(data.error || 'ログインに失敗しました');
				hide_modal();
			}
		} catch (err) {
			// fetch失敗や通信エラー時
			console.error(err);
			alert('サーバに接続できませんでした。ネットワーク状態を確認してください。');
			hide_modal();
		}
	});

	// 作品詳細を項目ごとに充てていく
	await make_details();
	// ⇒make_detailsは非同期。画像が出そろってからswiper初期化に進むようawait

	//
	// swiper作成
	//
	const swiper = new Swiper(".swiper", {
		centeredSlides: true,         // スライドを常に中央に
		loop: true,
		speed: 500,
		// スライドの表示枚数
		slidesPerView: 1,
		breakpoints: {
			// PC表示では画像を3枚に
			768: {
				slidesPerView: 3,
			},
		},
		spaceBetween: 0,     // ← ここで空白をゼロに
		autoplay: {
			delay: 3000,
			disableOnInteraction: false,
		},
		pagination: {
			el: ".swiper-pagination",
			clickable: true,
		},
		navigation: {
			nextEl: ".swiper-button-next",
			prevEl: ".swiper-button-prev",
		},
	});
});

//
// 作品詳細を項目ごとに充てていく
//
async function make_details() {
	// 詳細と画像一覧をDBから取得
	let data = {};
	try {
		const res = await fetch(`../api/detail.php?id=${encodeURIComponent(id)}`)
		data = await res.json();
	} catch (error) {
		console.error("作品情報取得エラー:", error);
	}

	// 作品タイトル
	document.getElementById('works_name').textContent = data.description_title ?? 'タイトル未定';

	// 銘
	document.getElementById('spec_name').textContent = data.name ?? '(なし)';

	// 説明
	document.getElementById('spec_description').textContent = data.description ?? '(なし)';

	// 用途
	document.getElementById('spec_category').textContent = data.category ?? '(未定義)';

	// サイズ
	document.getElementById('spec_spec').textContent = data.spec ?? '(不明)';

	// 技法
	const el_techniques = document.getElementById('spec_techniques');
	if (Array.isArray(data.techniques) && data.techniques.length > 0) {
		el_techniques.textContent = data.techniques.join('、');
	} else {
		el_techniques.textContent = '(未定義)';
	}

	// 色合い
	document.getElementById('spec_coloring').textContent = data.coloring ?? '(未定義)';

	// 粘土
	document.getElementById('spec_clay').textContent = data.clay ?? '(不明)';

	// 釉薬
	document.getElementById('spec_glaze').textContent = data.glaze ?? '(不明)';

	// 補足
	const hdNote = document.getElementById('spec_notes');
	if (data.note) {
		hdNote.textContent = data.note;
	} else {
		const dt = hdNote.previousElementSibling;
		if (dt && dt.tagName.toLowerCase() === 'dt') {
			dt.remove();
		}
		hdNote.remove();
	}

	// Instagram
	const el_instagram_url = document.getElementById('spec_instagram_url');
	if (data.instagram_url) {
		const link = document.createElement('a');
		link.href = data.instagram_url;
		link.target = '_blank';
		link.rel = 'noopener noreferrer';     // セキュリティ対策

		const img = document.createElement('img');
		img.src = '../images/Instagram_Glyph_Gradient.png';
		img.alt = 'Instagramへ';
		img.loading = 'lazy';

		// 3. <a> の中に <img> を入れて、<dd> に追加
		el_instagram_url.textContent = '';
		link.appendChild(img);
		el_instagram_url.appendChild(link);
		el_instagram_url.classList.add('instagram_icon');
	}

	// 完成日
	document.getElementById('spec_completion_date').textContent = timestamp2YYYYMD(data.completion_date);

	// 更新日
	document.getElementById('spec_update_date').textContent = timestamp2YYYYMD(data.update_date);

	// オンラインショップURL
	const el_url = document.getElementById('spec_online_shop');
	if (data.in_stock === 0 || !data.shop_url) {
		el_url.textContent = '(sold out)';
	} else {
		const link = document.createElement('a');
		link.href = data.shop_url;
		link.target = '_blank';
		link.rel = 'noopener noreferrer';     // セキュリティ対策

		const img = document.createElement('img');
		img.src = '../images/minne_logo_vertical.png';
		img.alt = 'オンラインショップへ';
		img.loading = 'lazy';

		// 3. <a> の中に <img> を入れて、<dd> に追加
		el_url.textContent = '';
		link.appendChild(img);
		el_url.appendChild(link);
		el_url.classList.add('minne_icon');
	}

	// Swiperのための画像一覧作成
	renderMedia(data);

	//
	// lightbox：スライダー画像をクリックしたら大きな画像を開く
	//
	const thumbs = document.querySelectorAll('.swiper-slide img');
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
					poster: img.dataset.poster || img.src,
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
		document.body.style.overflow = 'hidden';
		// ⇒背景のスクロールを停止
		lightbox.tabIndex = -1;
		lightbox.focus();
	}

	function hideOverlay() {
		lightbox.style.display = 'none';
		document.body.style.overflow = '';
		// ⇒背景のスクロールを再開
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

//
// Swiperのための画像一覧を作る
//
function renderMedia(data) {
	const container = document.getElementById("swiper_slide_holder");
	data.media.forEach((item) => {
		const el_div = document.createElement("div");
		el_div.classList.add("swiper-slide");
		const el_media = document.createElement("img");
		el_media.loading = "lazy";  // 画像多めでも安心
		el_media.src = item.image_url;
		el_media.alt = item.alt_ja;
		if (item.video_url != null) {
			el_media.dataset.type = "video";
			el_media.dataset.video_src = item.video_url;
		}
		el_div.appendChild(el_media);
		container.appendChild(el_div);
	});
}

function timestamp2YYYYMD(date) {
	const d = new Date(date);
	const year = d.getFullYear();
	const month = d.getMonth() + 1;
	const day = d.getDate();
	const formatted = `${year}/${month}/${day}`;
	return formatted;
}

//
// 編集画面への遷移＝ログイン関連処理
//
function show_modal() {
	el_login_modal_wrapper.style.display = 'flex';
	el_login_form.id.focus();
}

function hide_modal() {
	el_login_modal_wrapper.style.display = 'none';
}
