function KeyboardWindow() {
	throw new Error('This is a static class');
}

KeyboardWindow.create = function () {
	this._window = open('keyboard', 'Typhm keyboard', 'left=1024px,innerWidth=625,innerHeight=320');
	this._window.blur();
	focus();
};

KeyboardWindow.exists = function () {
	if (!this._window)
		return false
	else if (this._window.closed) {
		this._window = null;
		return false;
	} else return true;
};

KeyboardWindow.createHitEffect = function (key, color) {
	if (this.exists()) this._window.createHitEffect(key, color);
};

KeyboardWindow.destroy = function () {
	this._window.close();
	this._window = null;
};

KeyboardWindow.set = function (shouldOpen) {
	const exists = this.exists();
	if (exists && !shouldOpen)
		this.destroy();
	if (!exists && shouldOpen)
		this.create();
};
