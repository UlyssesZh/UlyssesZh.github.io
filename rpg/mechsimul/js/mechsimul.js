Bitmap.prototype.drawLine = function (x1, y1, x2, y2, color) {
	var t;
	var steep = Math.abs(y2 - y1) > Math.abs(x2 - x1);
	if (steep) {
		t = x1; x1 = y1; y1 = t;
		t = x2; x2 = y2; y2 = t;
	}
	if (x1 > x2) {
		t = x1; x1 = x2; x2 = t;
		t = y1; y1 = y2; y2 = t;
	}
	var dx = x2 - x1;
	var dy = Math.abs(y2 - y1);
	var e = 0;
	var de = dy / dx;
	var yStep = y1 < y2 ? 1 : -1;
	var y = y1;
	for (var x = x1; x <= x2; x++) {
		if (steep) {
			this.fillRect(y, x, 1, 1, color);
		} else {
			this.fillRect(x, y, 1, 1, color);
		}
		e += de;
		if (e >= 0.5) {
			y += yStep;
			e -= 1;
		}
	}
}

function Button() {
	this.initialize.apply(this, arguments);
}
Button.prototype = Object.create(Sprite.prototype);
Button.prototype.constructor = Button;
Button.prototype.initialize = function (x, y, width, height, text, color) {
	Sprite.prototype.initialize.apply(this);
	this.x = x;
	this.y = y;
	this.bitmap = new Bitmap(width, height);
	this.bitmap.textColor = color;
	this.bitmap.drawText(text, 0, 0, width, height);
}
Button.prototype.update = function () {
	Sprite.prototype.update.apply(this);
	if (this.onclick && TouchInput.isTriggered() &&
	this.x <= TouchInput.x && TouchInput.x < this.x + this.width &&
	this.y <= TouchInput.y && TouchInput.y < this.y + this.width)
		this.onclick();
}

function div(x0, dx, f) {
	var result = [];
	for (var i = 0; i < x0.length; i++) {
		var x1 = Object.create(x0);
		x1[i] += dx;
		var x2 = Object.create(x0);
		x2[i] -= dx;
		result[i] = (f(x1) - f(x2)) / (2 * dx)
	}
	return result;
}

function Panel() {
	this.initialize.apply(this, arguments);
}
Panel.prototype = Object.create(Sprite.prototype);
Panel.prototype.constructor = Button;
Panel.prototype.initialize = function (mappingY, curveColor) {
	Sprite.prototype.initialize.apply(this);
	this.curveColor = curveColor;
	this.mappingY = mappingY;
	this.bitmap = new Bitmap(Graphics.width, Graphics.height);
}
Panel.prototype.drawDiscrete = function (data) {
	this.bitmap.fontSize = 12;
	var lastX = 0;
	var lastY = this.mappingY(data[0]);
	for (var i = 2; i < data.length; i += 2) {
		var x = Graphics.width * i / data.length;
		var y = this.mappingY(data[i]);
		this.bitmap.drawLine(lastX, lastY, x, y, this.curveColor);
		if (i % 10 === 2)
			this.bitmap.drawText(String(i/2 - 1), lastX, 500, 30, 15)
		lastX = x;
		lastY = y;
	}
	lastX = 0;
	lastY = this.mappingY(data[1]);
	for (var i = 3; i < data.length; i += 2) {
		var x = Graphics.width * (i - 1) / data.length;
		var y = this.mappingY(data[i]);
		this.bitmap.drawLine(lastX, lastY, x, y, 'gray');
		lastX = x;
		lastY = y;
	}
}
Panel.prototype.drawCurve = function (data) {
	for (var i = 0; i < data.length; i++) {
		var x = Graphics.width * i / data.length;
		var y = this.mappingY(data[i]);
		this.bitmap.fillRect(x, y, 1, 1, this.curveColor);
	}
}

function ScrollingPanel() {
	this.initialize.apply(this, arguments);
}
ScrollingPanel.prototype = Object.create(Sprite.prototype);
ScrollingPanel.prototype.constructor = Button;
ScrollingPanel.prototype.initialize = function (n, mappingX, mappingY, colors, onTrace) {
	Sprite.prototype.initialize.apply(this);
	this.n = n;
	this.colors = colors;
	this.sprite = new Sprite();
	this.addChild(this.sprite);
	this.oldSprite = new Sprite();
	this.addChild(this.oldSprite);
	this.sprite.bitmap = new Bitmap(Graphics.width, Graphics.height);
	this.oldSprite.bitmap = new Bitmap(Graphics.width, Graphics.height);
	this.mappingX = mappingX;
	this.mappingY = mappingY;
	this.labels = [];
	for (var i = 0; i < n * 2; i++) {
		var sprite = new Sprite();
		this.labels[i] = sprite;
		sprite.bitmap = new Bitmap(30, 30);
		sprite.bitmap.textColor = this.colors[i];
		sprite.bitmap.drawText(
			this.getLabelString(i), 0, 0, 30, 30, 'right'
		);
		sprite.anchor.x = 1;
		sprite.anchor.y = 0.5;
		sprite.x = Graphics.width;
		this.addChild(sprite);
	}
	this.quo = 0;
	this.detectPeriod = false;
	this.onTrace = onTrace;
	this.history = [];
	for (var i = 0; i < n * 2; i++)
		this.history.push([]);
	this.eps = 1e-3;
}
ScrollingPanel.prototype.trace = function (t, data) {
	if (this.detectPeriod) {
		if (this.initial) {
			var r = 0;
			for (var i = 0; i < data.length; i++) {
				r += (data[i] - this.initial[i]) ** 2;
			}
			if (this.lastR === undefined)
				this.lastR = Number.POSITIVE_INFINITY;
			if (this.lastR < this.eps && this.lastR <= r && this.history[0].length > 1000) {
				console.log('Period found.');
				this.detectPeriod = false;
			}
		} else
			this.initial = data;
		for (var i = 0; i < this.n * 2; i++)
			this.history[i].push(data[i]);
		this.lastR = r;
	}
	var x = this.mappingX(t) - Graphics.width * this.quo;
	this.sprite.x = Graphics.width - x;
	this.oldSprite.x = -x;
	if (this.sprite.x < 0) {
		var tempSprite = this.oldSprite;
		this.oldSprite = this.sprite;
		this.sprite = tempSprite;
		x -= Graphics.width;
		this.sprite.x = Graphics.width - x;
		this.sprite.bitmap.clear();
		this.quo++;
	}
	for (var i = 0; i < data.length; i++) {
		var y = this.mappingY(data[i]);
		this.labels[i].y = y;
		this.sprite.bitmap.fillRect(x, y, 1, 1, this.colors[i]);
	}
	return this.onTrace(t, data);
}
var FFT;
require(['js/libs/fftw/main'], (FFTW) => {
	FFT = FFTW.FFT;
});
ScrollingPanel.prototype.outputHistoryFFT = function () {
	var fft = new FFT(this.history[0].length);
	for (var i = 0; i < this.n * 2; i++) {
		console.log(`frequencies of ${this.getLabelString(i)}:`);
		console.log(fft.forward(this.history[i]))
	}
	fft.dispose();
}
ScrollingPanel.prototype.getLabelString = function (i) {
	return i < this.n ? `q${i}` : `p${i - this.n}`;
}

var FORWARD_EULER = [[], [1]];
var EXPLICIT_MIDPOINT = [[], [1 / 2.0], [0, 1]];
var HEUN = [[], [1], [1 / 2.0, 1 / 2.0]];
var RALSTON = [[], [2 / 3.0], [1 / 4.0, 3 / 4.0]];
var KUTTA_3RD = [[], [1 / 2.0], [-1, 2], [1 / 6.0, 2 / 3.0, 1 / 6.0]];
var HEUN_3RD = [[], [1 / 3.0], [0, 2 / 3.0], [1 / 4.0, 0, 3 / 4.0]];
var RALSTON_3RD = [[], [1 / 2.0], [0, 3 / 4.0], [2 / 9.0, 1 / 3.0, 4 / 9.0]];
var SSPRK3 = [[], [1], [1 / 4.0, 1 / 4.0], [1 / 6.0, 1 / 6.0, 2 / 3.0]];
var CLASSIC_4TH = [[], [1 / 2.0], [0, 1 / 2.0], [0, 0, 1], [1 / 6.0, 1 / 3.0, 1 / 3.0, 1 / 6.0]];
var RALSTON_4TH = [[], [0.4], [0.29697761, 0.15875964], [0.21810040, -3.05096516, 3.83286476], [0.17476028, -0.55148066, 1.20553560, 0.17118478]];
var THREE_EIGHTH_4TH = [[], [1 / 3.0], [-1 / 3.0, 1], [1, -1, 1], [1 / 8.0, 3 / 8.0, 3 / 8.0, 1 / 8.0]];

function RungeKutta() {
	this.initialize.apply(this, arguments);
}
RungeKutta.prototype.initialize = function (initial, maxT, dt, matrix, func, canvas) {
	this.current = initial;
	this.t = 0;
	this.maxT = maxT;
	this.dt = dt;
	this.coefs = matrix[matrix.length - 1];
	this.pyramid = matrix.slice(0, matrix.length - 1);
	this.func = func;
	this.canvas = canvas;
	this.zeros = initial.map(() => 0);
	this.stopped = false;
}
RungeKutta.prototype.update = function () {
	if (Input.isTriggered('ok'))
		this.stopped = !this.stopped;
	var batchSize = 1 / (60 * this.dt);
	for (var _ = 0; _ < batchSize && this.t <= this.maxT && !this.stopped; _++) {
		if (this.canvas && !this.canvas.trace(this.t, this.current)) {
			this.stopped = true;
			break;
		}
		this.inc();
	}
}
RungeKutta.prototype.inc = function () {
	var ary = [];
	var sum = Object.create(this.zeros);
	for (var i = 0; i < this.coefs.length; i++) {
		var inner = Object.create(this.zeros);
		for (var j = 0; j < ary.length; j++)
			for (var k = 0; k < this.zeros.length; k++)
				inner[k] += ary[j][k] * this.pyramid[i][j];
		for (var k = 0; k < this.zeros.length; k++)
			inner[k] = inner[k] * this.dt + this.current[k];
		var x = this.func(this.t, inner);
		for (var k = 0; k < this.zeros.length; k++)
			sum[k] += this.coefs[i] * x[k];
		ary.push(x);
	}
	var tempCurrent = this.current;
	this.current = [];
	for (var k = 0; k < this.zeros.length; k++)
		this.current[k] = tempCurrent[k] + sum[k] * this.dt;
	this.t += this.dt;
}
RungeKutta.solveHamiltonian = function (n, qp0, maxT, dt, hamiltonian, dqp, canvas) {
	return new RungeKutta(qp0, maxT, dt, THREE_EIGHTH_4TH, (t, qp) => {
		var dqpdt = div(qp, dqp, (x) => hamiltonian(t, x));
		var result = [];
		for (var i = 0; i < n; i++) {
			result[i] = dqpdt[i + n];
			result[i + n] = -dqpdt[i];
		}
		return result;
	}, canvas)
}

var rungeKutta = undefined;
var buttons = undefined;

function createButtons() {
	buttons = new Sprite();
	window.scene.addChild(buttons);
	var canvas = rungeKutta.canvas;
	for (var i = 0; i < canvas.n * 2; i++) {
		var button = new Button(
			0, 28 * i, 30, 28,
			canvas.getLabelString(i),
			canvas.colors[i]
		);
		button.i = i;
		button.onclick = function () {
			if (window.scene.showing === this.panelFFT) {
				this.panelFFT.visible = false;
				canvas.visible = true;
				window.scene.showing = canvas;
			} else if (window.scene.showing === this.panel) {
				if (!this.panelFFT) {
					var length = canvas.history[this.i].length;
					this.panelFFT = new Panel(
						(y) => (canvas.mappingY(y) - 384) / length + 384,
						canvas.colors[this.i]);
					var fft = new FFT(length);
					this.panelFFT.drawDiscrete(fft.forward(canvas.history[this.i]).slice(0, 100));
					fft.dispose();
					window.scene.addChild(this.panelFFT);
				}
				this.panelFFT.visible = true;
				this.panel.visible = false;
				window.scene.showing = this.panelFFT;
			} else {
				if (!this.panel) {
					this.panel = new Panel(canvas.mappingY, canvas.colors[this.i]);
					this.panel.drawCurve(canvas.history[this.i]);
					window.scene.addChild(this.panel);
				}
				this.panel.visible = true;
				window.scene.showing.visible = false;
				window.scene.showing = this.panel;
			}
		}
		buttons.addChild(button);
	}
}

var pole1, pole2;
function start() {
	pole1 = new Sprite();
	pole2 = new Sprite();
	pole1.bitmap = pole2.bitmap = new Bitmap(1, 250);
	pole1.bitmap.fillAll('gray');
	pole1.x = 512 - 200;
	pole2.x = 512 + 200;
	pole1.y = pole2.y = 384;
	var periodDetected = false;
	var canvas = new ScrollingPanel(
		2, (t) => t * 40, (y) => (100 * y + 384), ['white', 'yellow', 'orange', 'pink'],
		(t, qp) => {
			pole1.rotation = qp[0];
			pole2.rotation = qp[1];
			if (!canvas.detectPeriod && !periodDetected) {
				periodDetected = true;
				createButtons(canvas);
			}
			return true;
		}
	);
	canvas.detectPeriod = true;
	window.scene.addChild(canvas);
	rungeKutta = RungeKutta.solveHamiltonian(
		2, [2, 0, 0, 0], Number.POSITIVE_INFINITY, 1e-4,
		(t, qp) => qp[2]**2 + qp[3]**2 - Math.cos(qp[0]) - Math.cos(qp[1]) - Math.cos(qp[0] - qp[1]),
		1e-6, canvas
	);
	canvas.addChild(pole1);
	canvas.addChild(pole2);
	window.scene.showing = canvas;
}

function update() {
	rungeKutta.update();
	if (buttons) buttons.update();
}
