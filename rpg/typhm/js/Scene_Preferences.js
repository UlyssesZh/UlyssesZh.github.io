window.preferences = {offset: 0.0, playRate: 1.0, autoPlay: false, countdown: true};

function Scene_Preferences() {
	this.initialize.apply(this, arguments);
}

Scene_Preferences.prototype = Object.create(Scene_Base.prototype);
Scene_Preferences.prototype.constructor = Scene_Preferences;

Scene_Preferences.prototype.start = function () {
	this._shouldBack = false;

	this._keydownEventListener = this._onKeydown.bind(this);
	document.addEventListener('keydown', this._keydownEventListener);
};

Scene_Preferences.prototype.update = function () {
	if (this._shouldBack) {
		window.scene = new Scene_Title();
	}
	Scene_Base.prototype.update.call(this);
}

Scene_Preferences.prototype.stop = function () {
	document.removeEventListener('keydown', this._keydownEventListener);
};

Scene_Preferences.prototype._onKeydown = function (event) {
	if (event.key ==='Escape') {
		this._shouldBack = true;
	}
};
