function Scene_Title() {
	this.initialize.apply(this, arguments);
}

Scene_Title.prototype = Object.create(Scene_Base.prototype);
Scene_Title.prototype.constructor = Scene_Title;

Scene_Title.prototype.start = function () {
	this._title = new Sprite(new Bitmap(150, 54));
	this._center(this._title, 200);
	this._title.bitmap.fontSize = 50;
	this._title.bitmap.drawText('Typhm', 0, 0, 150, 54, 'center');
	this.addChild(this._title);

	this._files = new Button(new Bitmap(200, 32), this._gotoFiles);
	this._center(this._files, 400);
	this._files.bitmap.drawText('Browse files', 0, 0, 200, 32, 'center');
	this.addChild(this._files);

	this._store = new Button(new Bitmap(200, 32), this._gotoStore);
	this._center(this._store, 440);
	this._store.bitmap.drawText('Browse store', 0, 0, 200, 32, 'center');
	this.addChild(this._store);

	this._history = new Button(new Bitmap(200, 32), this._gotoHistory);
	this._center(this._history, 480);
	this._history.bitmap.drawText('Browse history', 0, 0, 200, 32, 'center');
	this.addChild(this._history);
};

Scene_Title.prototype._gotoFiles = function () {
	window.scene = new Scene_BrowseFiles();
};

Scene_Title.prototype._gotoStore = function () {
	// TODO
}

Scene_Title.prototype._gotoHistory = function () {
	// TODO
}
