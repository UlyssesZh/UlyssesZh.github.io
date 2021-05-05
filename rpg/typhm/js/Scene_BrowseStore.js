function Scene_BrowseStore() {
	this.initialize.apply(this, arguments);
}

Scene_BrowseStore.prototype = Object.create(Scene_Base.prototype);
Scene_BrowseStore.prototype.constructor = Scene_BrowseStore;

Scene_BrowseStore.prototype.start = function () {
	this._storeAddress = 'https://github.com/UlyssesZh/typhm_store/';

	this._prompt = new Button(new Bitmap(768, TyphmConstants.TEXT_HEIGHT),
			() => open(this._storeAddress));
	this._center(this._prompt, TyphmConstants.TEXT_HEIGHT*6);
	this._prompt.bitmap.drawText(`Find your beatmap on ${this._storeAddress}`, 0, 0,
			768, TyphmConstants.TEXT_HEIGHT, 'center');
	this.addChild(this._prompt);

	this._input = document.createElement('input');
	this._input.type = 'text';
	this._input.placeholder = "Filename without extension";
	this._setupInputStyle();
	document.body.appendChild(this._input);
	this._input.focus();

	this._ok = new Button(new Bitmap(256, TyphmConstants.TEXT_HEIGHT),
			() => { this._shouldOk = true; });
	this._center(this._ok, TyphmConstants.TEXT_HEIGHT*9);
	this._ok.bitmap.drawText('OK (\\n)', 0, 0,
			256, TyphmConstants.TEXT_HEIGHT, 'center');
	this.addChild(this._ok);

	this._back = new Button(new Bitmap(256, TyphmConstants.TEXT_HEIGHT),
			() => { this._shouldBack = true; });
	this._center(this._back, TyphmConstants.TEXT_HEIGHT*10);
	this._back.bitmap.drawText('Back (Esc)', 0, 0,
			256, TyphmConstants.TEXT_HEIGHT, 'center');
	this.addChild(this._back);

	this._shouldOk = false;
	this._shouldBack = false;

	this._keydownEventListener = this._onKeydown.bind(this);
	document.addEventListener('keydown', this._keydownEventListener);
	this._resizeEventListener = this._setupInputStyle.bind(this);
	window.addEventListener('resize', this._resizeEventListener);
};

Scene_BrowseStore.prototype.update = function () {
	if (this._shouldOk) {
		window.scene = new Scene_Game(null,
				`https://cdn.jsdelivr.net/gh/UlyssesZh/typhm_store@master/${this._input.value}.typhm`);
	} else if (this._shouldBack) {
		window.scene = new Scene_Title();
	}
	Scene_Base.prototype.update.call(this);
};

Scene_BrowseStore.prototype.stop = function () {
	document.removeEventListener('keydown', this._keydownEventListener);
	window.removeEventListener('resize', this._resizeEventListener);
	document.body.removeChild(this._input);
};

Scene_BrowseStore.prototype._onKeydown = function (event) {
	if (event.key === 'Enter') {
		this._shouldOk = true;
	} else if (event.key === 'Escape') {
		this._shouldBack = true;
	}
};

Scene_BrowseStore.prototype._onResize = function (event) {
	this._setupInputStyle();
};

Scene_BrowseStore.prototype._setupInputStyle = function () {
	this._input.style = `
		background-color: rgba(0,0,0,0);
		border: none;
		outline: 0;
		box-shadow: none;
		font-size: 28px;
		position: absolute;
		top: ${Graphics._canvas.offsetTop + TyphmConstants.TEXT_HEIGHT*7}px;
		left: ${Graphics._canvas.offsetLeft}px;
		width: ${Graphics.width}px;
		height: ${TyphmConstants.TEXT_HEIGHT}px;
		font-family: GameFont;
		color: rgba(255,255,255,1);
		text-align: center;
		z-index: 10;
	`;
};
