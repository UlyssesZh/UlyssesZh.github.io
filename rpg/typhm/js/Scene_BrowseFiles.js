function Scene_BrowseFiles() {
	this.initialize.apply(this, arguments);
}

Scene_BrowseFiles.prototype = Object.create(Scene_Base.prototype);
Scene_BrowseFiles.prototype.constructor = Scene_BrowseFiles;

Scene_BrowseFiles.prototype.start = function () {
	this._musicPrompt = new Button(new Bitmap(200, 32), () => { musicInput.click(); });
	this._musicPrompt.bitmap.drawText('Upload audio', 0, 0, 200, 32, 'center');
	this._center(this._musicPrompt, 200);
	this.addChild(this._musicPrompt);

	this._musicResult = new Sprite(new Bitmap(1024, 32));
	this._musicResult.bitmap.textColor = 'gray';
	this._center(this._musicResult, 240);
	this.addChild(this._musicResult);

	this._scorePrompt = new Button(new Bitmap(200, 32), () => { scoreInput.click(); });
	this._scorePrompt.bitmap.drawText('Upload beatmap', 0, 0, 200, 32, 'center');
	this._center(this._scorePrompt, 320);
	this.addChild(this._scorePrompt);

	this._scoreResult = new Sprite(new Bitmap(1024, 32));
	this._scoreResult.bitmap.textColor = 'gray';
	this._center(this._scoreResult, 360);
	this.addChild(this._scoreResult);

	this._ok = new Button(new Bitmap(150, 32), () => {
		const scoreFile = scoreInput.files[0];
		if (scoreFile) {
			const scoreUrl = URL.createObjectURL(scoreFile);
			const musicFile = musicInput.files[0];
			const musicUrl = musicFile ? URL.createObjectURL(musicFile) : '';
			window.scene = new Scene_Game(musicUrl, scoreUrl);
		} else {
			this._beatmapAlert.visible = true;
		}
	});
	this._center(this._ok, 440);
	this._ok.bitmap.drawText('OK', 0, 0, 150, 32, 'center');
	this.addChild(this._ok);

	this._back = new Button(new Bitmap(150, 32), () => {
		window.scene = new Scene_Title();
	});
	this._center(this._back, 480);
	this._back.bitmap.drawText('Back', 0, 0, 150, 32, 'center');
	this.addChild(this._back);

	this._beatmapAlert = new Sprite(new Bitmap(300, 32));
	this._beatmapAlert.bitmap.textColor = 'red';
	this._beatmapAlert.bitmap.drawText('Upload a beatmap first.', 0, 0, 300, 32, 'center');
	this._center(this._beatmapAlert, 560);
	this._beatmapAlert.visible = false;
	this.addChild(this._beatmapAlert);

	musicInput.oninput = (event) => {
		this._musicResult.bitmap.clear();
		const file = musicInput.files[0];
		if (file)
			this._musicResult.bitmap.drawText(file.name, 0, 0, 1024, 32, 'center');
	}
	scoreInput.oninput = (event) => {
		this._scoreResult.bitmap.clear();
		const file = scoreInput.files[0];
		if (file)
			this._scoreResult.bitmap.drawText(file.name, 0, 0, 1024, 32, 'center');
	}

	musicInput.oninput();
	scoreInput.oninput();
}
