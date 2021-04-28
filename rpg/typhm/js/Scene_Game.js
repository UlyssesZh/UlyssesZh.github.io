const keys = new Set();
const keysArray = [...'`1234567890-=qwertyuiop[]\\asdfghjkl;\'zxcvbnm,./~!@#$%^&*()_+QWERTYUIOP{}|ASDFGHJKL:"ZXCVBNM<>?'.split(''), '\\b', '\\n', '\\s'];
for (let i = 0; i < keysArray.length; i++)
	keys.add(keysArray[i]);
const escapes = {Backspace: '\\b', Enter: '\\n', ' ': '\\s'};

function Scene_Game() {
	this.initialize.apply(this, arguments);
}

Scene_Game.prototype = Object.create(Scene_Base.prototype);
Scene_Game.prototype.constructor = Scene_Game;

Scene_Game.prototype.initialize = function (musicUrl, scoreUrl) {
	Scene_Base.prototype.initialize.call(this);
	this._musicUrl = musicUrl;
	this._scoreUrl = scoreUrl;
}

Scene_Game.prototype.start = function () {
	console.log(this._musicUrl, this._scoreUrl);

	this._loading = new Sprite(new Bitmap(120, 32));
	this._center(this._loading, 300);
	this._loading.bitmap.drawText('Loading...', 0, 0, 120, 32, 'white');
	this.addChild(this._loading);

	this._pauseButton = new Button(new Bitmap(30, 32), () => { this._pause(); });
	this._pauseButton.bitmap.fillRect(6, 4, 6, 24, 'white');
	this._pauseButton.bitmap.fillRect(18, 4, 6, 24, 'white');
	this._pauseButton.visible = false;
	this.addChild(this._pauseButton);

	this._back = new Button(new Bitmap(30, 32), () => { window.scene = new Scene_Title(); });
	for (let x = 6; x < 24; x++)
		this._back.bitmap.fillRect(x, 20-x*2/3, 1, x*4/3-8, 'white');
	this._back.x = 36
	this._back.visible = false;
	this.addChild(this._back);

	this._paused = true;
	this._lastPos = 0.0;
	this._ended = false;
	this._activeEnding = false;
	this._starting = performance.now();

	this._line1 = new Sprite();
	this._line1.width = 1024;
	this._line1.anchor.y = 0.5;
	this._center(this._line1, Graphics.height / 4);
	this.addChild(this._line1);

	this._line2 = new Sprite();
	this._line2.width = 1024;
	this._line2.anchor.y = 0.5;
	this._center(this._line2, Graphics.height * 3/4);
	this.addChild(this._line2);

	this._lines = [new Bitmap(1024, 512)];
	this._line1.bitmap = this._lines[0];

	this._judgingLine = new Sprite(new Bitmap(1, 256));
	this._judgingLine.bitmap.fillAll('gray');
	this._judgingLine.anchor.y = 0.5;
	this._judgingLine.visible = false;
	this.addChild(this._judgingLine);

	this._scoreSprite = new Sprite(new Bitmap(256, 40));
	this._scoreSprite.anchor.x = 1;
	this._scoreSprite.x = Graphics.width;
	this.addChild(this._scoreSprite);

	this._comboSprite = new Sprite(new Bitmap(128, 40));
	this._comboSprite.anchor.y = 1;
	this._comboSprite.y = Graphics.height;
	this.addChild(this._comboSprite);

	this._inaccuracyBar = new Sprite(new Bitmap(512, 10));
	this._inaccuracyBar.anchor.y = 0.5;
	this._center(this._inaccuracyBar, 740);
	for (let x = 0; x < 512; x++)
		this._inaccuracyBar.bitmap.fillRect(x, 0, 1, 10, TyphmUtils.getRgbFromHue(2*Math.PI*(x-256)/256));
	this.addChild(this._inaccuracyBar);

	this._inaccuracyBitmap = new Bitmap(3, 16);
	this._inaccuracyBitmap.fillAll('white');

	this._inaccuracyBoundaryLeft = new Sprite(new Bitmap(128, 40));
	this._inaccuracyBoundaryLeft.anchor.x = 1;
	this._inaccuracyBoundaryLeft.anchor.y = 0.5;
	this._inaccuracyBoundaryLeft.x = this._inaccuracyBar.x - this._inaccuracyBar.width/2 - 10;
	this._inaccuracyBoundaryLeft.y = this._inaccuracyBar.y;
	this.addChild(this._inaccuracyBoundaryLeft);

	this._inaccuracyBoundaryRight = new Sprite(new Bitmap(128, 40));
	this._inaccuracyBoundaryRight.anchor.y = 0.5;
	this._inaccuracyBoundaryRight.x = this._inaccuracyBar.x + this._inaccuracyBar.width/2 + 10;
	this._inaccuracyBoundaryRight.y = this._inaccuracyBar.y;
	this.addChild(this._inaccuracyBoundaryRight);

	this._beatmap = [];

	this._hasMusic = !!this._musicUrl;
	this._ended = false;

	this._millisecondsPerPixel = 10.0;
	this._setInaccuracyTolerance(200.0);

	this._score = 0;
	this._combo = 0;

	this._lastX = 16;
	this._lastTime = 0.0;

	this._line1Index = 0;
	this._line2Index = 1;

	this._keydownEventListener = this._onKeydown.bind(this);
	document.addEventListener('keydown', this._keydownEventListener);

	if (this._hasMusic) {
		this._audioPlayer = new WebAudio(this._musicUrl);
		this._audioPlayer.addLoadListener(this._onLoad.bind(this));
		this._audioPlayer.addStopListener(this._onStop.bind(this));
	} else
		this._onLoad();
}

Scene_Game.prototype.update = function () {
	Scene_Base.prototype.update.call(this);
	if (!this._paused && !this._ended) {
		const now = this._now();
		this._judgingLine.x = this._getXFromTime(now);
		this._judgingLine.y = this._line1.y;
		let i = 0;
		while (true) {
			const event = this._unclearedEvents[i];
			if (!event)
				break;
			if (now < event.time)
				break;
			const key = this._parseKey(event.event);
			if (key) {
				if (now >= event.time + this._inaccuracyTolerance) {
					this._clearObject(event, 'gray');
					this._combo = 0;
					this._updateCombo();
					this._unclearedEvents.splice(i, 1);
				} else
					i++;
				continue;
			}
			const eventName = event.event.trim();
			if (eventName === 'millisecondsPerPixel') {
				this._lastX = this._getXFromTime(event.time);
				this._lastTime = event.time;
				this._millisecondsPerPixel = event.parameter;
			} else if (eventName === 'newLine') {
				let t = this._line1;
				this._line1 = this._line2;
				this._line2 = t;
				t = this._line1Index;
				this._line1Index = this._line2Index;
				this._line2Index = t;
				this._line2Index += 2;
				this._line2.bitmap = this._lines[this._line2Index];
				this._lastX = 16;
				this._lastTime = event.time;
			} else if (eventName === 'inaccuracyTolerance') {
				this._setInaccuracyTolerance(event.parameter);
			}
			this._unclearedEvents.splice(i, 1);
		}
		if (!this._hasMusic && this._unclearedEvents.length == 0)
			this._ended = true;
	}
}

Scene_Game.prototype.stop = function () {
	document.removeEventListener('keydown', this._keydownEventListener);
}

Scene_Game.prototype._onLoad = async function () {
	const data = (await fetch(this._scoreUrl).then(r => r.text()))
			.split('---')[1].split('\n').map(s => s.split(' '));
	const objects = data.length - 2;
	for (let i = 1; i <= objects; i++)
		this._beatmap.push({
			time: parseFloat(data[i][0]),
			event: data[i][1],
			parameter: parseFloat(data[i][2])
		});
	this._beatmap.sort((event1, event2) => event1.time - event2.time);
	let lineno = 0;
	let lastTime = 0.0;
	let lastX = 16;
	let now = 0.0;
	let millisecondsPerPixel = 10.0;
	for (let i = 0; i < objects; i++) {
		const event = this._beatmap[i].event.trim();
		now = this._beatmap[i].time;
		const key = this._parseKey(event);
		if (key) {
			const x = lastX + (now - lastTime) / millisecondsPerPixel;
			const y = this._beatmap[i].parameter;
			this._drawObject(key, x, y, this._lines[lineno]);
		} else if (event === 'millisecondsPerPixel') {
			lastX += (now - lastTime) / millisecondsPerPixel;
			lastTime = now;
			millisecondsPerPixel = this._beatmap[i].parameter;
		} else if (event === 'newLine') {
			lineno++;
			this._lines.push(new Bitmap(1024, 512));
			lastTime = now;
			lastX = 16;
		}
	}
	if (this._lines.length > 1)
		this._line2.bitmap = this._lines[1];
	this._updateScore();
	this._updateCombo();
	this._unclearedEvents = [...this._beatmap];
	this._pauseButton.visible = true;
	this._loading.visible = false;
	this._judgingLine.visible = true;
	this._resume();
}

Scene_Game.prototype._onStop = function () {
	if (this._activeEnding) {
		this._activeEnding = false;
	} else
		this._ended = true;
}

Scene_Game.prototype._pause = function () {
	if (this._paused) {
		this._resume();
	} else {
		this._lastPos = this._now();
		this._paused = true;
		this._back.visible = true;
		this._activeEnding = true;
		if (this._hasMusic) {
			this._audioPlayer.stop();
			this._audioPlayer.addStopListener(this._onStop.bind(this));
		}
	}
}

Scene_Game.prototype._resume = function () {
	this._paused = false;
	this._back.visible = false;
	if (!this._ended && this._hasMusic) {
		this._starting = performance.now() - this._lastPos;
		this._audioPlayer.play(false, this._lastPos/1000);
	}
}

Scene_Game.prototype._drawObject = function (key, x, y, line) {
	line.drawText(key, x-16, -y+256-16, 32, 32, 'center');
}

Scene_Game.prototype._parseKey = function (event) {
	if (keys.has(event))
		return event;
	else if (escapes[event])
		return escapes[event];
}

Scene_Game.prototype._onKeydown = function (event) {
	if (event.key ==='Escape') {
		this._pause();
	} else if (!this._paused) {
		const key = this._parseKey(event.key);
		if (key && !this._ended) {
			let match = false;
			for (let i = 0; i < this._unclearedEvents.length; i++) {
				const now = this._now();
				const event = this._unclearedEvents[i];
				if (now <= event.time - this._inaccuracyTolerance)
					break;
				else if (key === event.event) {
					inaccuracy = 2*Math.PI*(now-event.time)/this._inaccuracyTolerance;
					this._clearObject(event, TyphmUtils.getRgbFromHue(inaccuracy));
					this._unclearedEvents.splice(i, 1);
					this._score += Math.round(1000*(Math.cos(inaccuracy)+1));
					this._updateScore();
					this._combo++;
					this._updateCombo();
					this._createInaccuracyIndicator(inaccuracy);
					match = true;
					break;
				}
			}
			if (!match) {
				this._combo = 0;
				this._updateCombo();
				this._score -= 500;
				this._updateScore();
			}
		}
	}
}

Scene_Game.prototype._updateScore = function () {
	this._scoreSprite.bitmap.clear();
	this._scoreSprite.bitmap.drawText(this._score, 0, 0, 256, 40, 'right');
}

Scene_Game.prototype._updateCombo = function () {
	this._comboSprite.bitmap.clear();
	this._comboSprite.bitmap.drawText(this._combo, 0, 0, 128, 40, 'left');
}

Scene_Game.prototype._now = function () {
	if (this._hasMusic) {
		return this._paused ? this._lastPos : this._audioPlayer.seek()*1000;
	} else {
		return performance.now() - this._starting;
	}
}

Scene_Game.prototype._createInaccuracyIndicator = function (inaccuracy) {
	const inaccuracyIndicator = new Sprite(this._inaccuracyBitmap);
	inaccuracyIndicator.anchor.x = 0.5;
	inaccuracyIndicator.anchor.y = 0.5;
	inaccuracyIndicator.x = this._inaccuracyBar.x + 
			this._inaccuracyBar.width/2 * inaccuracy/(2*Math.PI);
	inaccuracyIndicator.y = this._inaccuracyBar.y;
	inaccuracyIndicator.counter = 0;
	this.addChild(inaccuracyIndicator);
	inaccuracyIndicator.update = () => {
		inaccuracyIndicator.opacity -= 1;
		if (inaccuracyIndicator.opacity <= 0)
			this.removeChild(inaccuracyIndicator);
	};
}

Scene_Game.prototype._setInaccuracyTolerance = function (value) {
	this._inaccuracyTolerance = value;
	this._inaccuracyBoundaryLeft.bitmap.clear();
	this._inaccuracyBoundaryLeft.bitmap.drawText(-this._inaccuracyTolerance, 0, 0, 128, 40, 'right');
	this._inaccuracyBoundaryRight.bitmap.clear();
	this._inaccuracyBoundaryRight.bitmap.drawText(this._inaccuracyTolerance, 0, 0, 128, 40, 'left');
}

Scene_Game.prototype._clearObject = function (event, color) {
	this._line1.bitmap.textColor = color;
	const x = this._getXFromTime(event.time);
	const y = event.parameter;
	this._drawObject(this._parseKey(event.event), x, y, this._line1.bitmap);
}

Scene_Game.prototype._getXFromTime = function (time) {
	return this._lastX + (time - this._lastTime) / this._millisecondsPerPixel;
}
