function download(filename, object) {
  let element = document.createElement('a');
  let url = 'data:text/plain;charset=utf-8,' + encodeURIComponent(JSON.stringify(object));
  element.setAttribute('href', url);
  element.setAttribute('download', filename);
  element.style.display = 'none';
  document.body.appendChild(element);
  element.click();
  document.body.removeChild(element);
}

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
			this.setPixel(y, x, color);
		} else {
			this.setPixel(x, y, color);
		}
		e += de;
		if (e >= 0.5) {
			y += yStep;
			e -= 1;
		}
	}
}
Bitmap.prototype.setPixel = function (x, y, color) {
	this.fillRect(x, y, 1, 1, color);
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
Panel.prototype.constructor = Panel;
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
	var unit = Graphics.width / data.length;
	var groupSize = Math.floor(40 / unit);
	for (var i = 2; i < data.length; i += 2) {
		var x = unit * i;
		var y = this.mappingY(data[i]);
		this.bitmap.drawLine(lastX, lastY, x, y, this.curveColor);
		if (i % groupSize === 2)
			this.bitmap.drawText(String(i/2 - 1), lastX, 500, 30, 15);
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
	this.bitmap.drawText(`* ${1/(N*dt)}Hz`, 0, 520, 800, 15);
}
Panel.prototype.drawCurve = function (data) {
	for (var i = 0; i < data.length; i++) {
		var x = Graphics.width * i / data.length;
		var y = this.mappingY(data[i]);
		this.bitmap.setPixel(x, y, this.curveColor);
	}
}

function ScrollingPanel() {
	this.initialize.apply(this, arguments);
}
ScrollingPanel.prototype = Object.create(Sprite.prototype);
ScrollingPanel.prototype.constructor = ScrollingPanel;
ScrollingPanel.prototype.initialize = function (n, mappingX, mappingY, colors, onTrace, detectPeriod, window) {
	Sprite.prototype.initialize.apply(this);
	this.n = n;
	this.colors = colors;
	this.sprite = new Sprite();
	this.addChild(this.sprite);
	this.oldSprite = new Sprite();
	this.addChild(this.oldSprite);
	this.mappingX = mappingX;
	this.mappingY = mappingY;
	this.detectPeriod = detectPeriod;
	this.onTrace = onTrace;
	this.window = window;
	this.clear();
}
ScrollingPanel.prototype.clear = function () {
	this.periodDetected = false
	this.sprite.bitmap = new Bitmap(Graphics.width, Graphics.height);
	this.oldSprite.bitmap = new Bitmap(Graphics.width, Graphics.height);
	if (!this.labels)
		this.labels = [];
	for (var i = 0; i < this.n; i++) {
		var sprite = new Sprite();
		if (this.labels[i])
			this.labels[i].destroy();
		this.labels[i] = sprite;
		sprite.bitmap = new Bitmap(30, 30);
		sprite.bitmap.textColor = this.colors[i];
		sprite.bitmap.drawText(this.getLabelString(i), 0, 0, 30, 30, 'right');
		sprite.anchor.x = 1;
		sprite.anchor.y = 0.5;
		sprite.x = Graphics.width;
		this.addChild(sprite);
	}
	this.quo = 0;
	this.history = [];
	for (var i = 0; i < this.n; i++)
		this.history.push([]);
	if (buttons) {
		for (var i = buttons.children.length - 1; i >= 0; i--)
			if (buttons.children[i].panelFFT)
				buttons.children[i].panelFFT.destroy();
		buttons.destroy();
	}
}
ScrollingPanel.prototype.trace = function (t, data) {
	if (this.detectPeriod && !this.periodDetected) {
		for (var i = 0; i < this.n; i++)
			this.history[i].push(data[i] * this.window(this.history[0].length));
		if (this.history[0].length >= window.N) {
			this.periodDetected = true;
			window.createButtons(this);
		}
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
	for (var i = 0; i < this.n; i++) {
		var y = this.mappingY(data[i]);
		this.labels[i].y = y;
		this.sprite.bitmap.setPixel(x, y, this.colors[i]);
	}
	return this.onTrace(t, data);
}
var FFT;
require(['js/libs/fftw/main'], (FFTW) => {
	FFT = FFTW.FFT;
});
ScrollingPanel.prototype.outputHistoryFFT = function () {
	var fft = new FFT(this.history[0].length);
	for (var i = 0; i < this.n; i++) {
		console.log(`frequencies of ${this.getLabelString(i)}:`);
		console.log(fft.forward(this.history[i]))
	}
	fft.dispose();
}
ScrollingPanel.prototype.getLabelString = function (i) {
	return i < this.n/2 ? `q${i}` : `p${i - this.n/2}`;
}

var FORWARD_EULER = [[], [1]];
var EXPLICIT_MIDPOINT = [[], [1/2], [0, 1]];
var HEUN = [[], [1], [1/2, 1/2]];
var RALSTON = [[], [2/3], [1/4, 3/4]];
var KUTTA_3RD = [[], [1/2], [-1, 2], [1/6, 2/3, 1/6]];
var HEUN_3RD = [[], [1/3], [0, 2/3], [1/4, 0, 3/4]];
var RALSTON_3RD = [[], [1/2], [0, 3/4], [2/9, 1/3, 4/9]];
var SSPRK3 = [[], [1], [1/4, 1/4], [1/6, 1/6, 2/3]];
var CLASSIC_4TH = [[], [1/2], [0, 1/2], [0, 0, 1], [1/6, 1/3, 1/3, 1/6]];
var RALSTON_4TH = [[], [0.4], [0.29697761, 0.15875964], [0.21810040, -3.05096516, 3.83286476], [0.17476028, -0.55148066, 1.20553560, 0.17118478]];
var THREE_EIGHTH_4TH = [[], [1/3], [-1/3, 1], [1, -1, 1], [1/8, 3/8, 3/8, 1/8]];

var RECTANGULAR = n => 1;
var TRIANGULAR = n => 1 - 2 * Math.abs(n - N / 2) / N
var WELCH = n => 1 - (2 * n / N - 1) ** 2;
var SINE = n => Math.sin(Math.PI * n / N);
var HAMMING = n => 25/46 - (1 - 25/46) * Math.cos(2 * Math.PI * n / N);

function RungeKutta() {
	this.initialize.apply(this, arguments);
}
RungeKutta.prototype.initialize = function (initial, maxT, matrix, func, canvas) {
	this.initial = initial;
	this.maxT = maxT;
	this.coefs = matrix[matrix.length - 1];
	this.pyramid = matrix.slice(0, matrix.length - 1);
	this.func = func;
	this.canvas = canvas;
	this.recordHistory = false;
	this.clear();
}
RungeKutta.prototype.clear = function () {
	this.current = this.initial;
	this.t = 0;
	this.stopped = false;
	this.zeros = this.initial.map(() => 0);
	this.history = [];
}
RungeKutta.prototype.update = function () {
	if (Input.isTriggered('ok'))
		this.stopped = !this.stopped;
	var batchSize = window.xSpeed / (60 * dt);
	for (var _ = 0; _ < batchSize && this.t <= this.maxT && !this.stopped; _++) {
		if (this.canvas && !this.canvas.trace(this.t, this.current)) {
			this.stopped = true;
			break;
		}
		this.inc();
	}
}
RungeKutta.prototype.inc = function () {
	this.record();
	var ary = [];
	var sum = Object.create(this.zeros);
	for (var i = 0; i < this.coefs.length; i++) {
		var inner = Object.create(this.zeros);
		for (var j = 0; j < ary.length; j++)
			for (var k = 0; k < this.zeros.length; k++)
				inner[k] += ary[j][k] * this.pyramid[i][j];
		for (var k = 0; k < this.zeros.length; k++)
			inner[k] = inner[k] * dt + this.current[k];
		var sumPyramidRow = 0;
		for (var k = 0; k < this.pyramid[i].length; k++)
			sumPyramidRow += this.pyramid[i][k];
		var x = this.func(this.t + sumPyramidRow * dt, inner);
		for (var k = 0; k < this.zeros.length; k++)
			sum[k] += this.coefs[i] * x[k];
		ary.push(x);
	}
	var tempCurrent = this.current;
	this.current = [];
	for (var k = 0; k < this.zeros.length; k++)
		this.current[k] = tempCurrent[k] + sum[k] * dt;
	this.t += dt;
}
RungeKutta.prototype.record = function () {
	if (this.recordHistory)
		this.history.push({t: this.t, x: this.current});
}
RungeKutta.prototype.downloadHistory = function (minT=0, maxT=this.t) {
	if (this.recordHistory)
		download(
			'mechsimul-' + new Date().toISOString() + '.json',
			this.history.slice(minT / dt, maxT / dt)
		);
	else
		console.log('Please run `rungeKutta.recordHistory = true` beforehand');
}
RungeKutta.solveHamiltonian = function (n, qp0, maxT, canvas, hamiltonian, dqp=1e-6) {
	return new RungeKutta(qp0, maxT, THREE_EIGHTH_4TH, canonicalEquation(n, hamiltonian, dqp), canvas)
}
function canonicalEquation(n, hamiltonian, dqp=1e-6) {
	return (t, qp) => {
		var dqpdt = div(qp, dqp, (x) => hamiltonian(t, x));
		var result = [];
		for (var i = 0; i < n; i++) {
			result[i] = dqpdt[i + n];
			result[i + n] = -dqpdt[i];
		}
		return result;
	}
}

var buttons = undefined;

function createButtons() {
	buttons = new Sprite();
	window.scene.addChild(buttons);
	var canvas = window.rungeKutta.canvas;
	for (var i = 0; i < canvas.n; i++) {
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
						(y) => (canvas.mappingY(y) - 384) / length * 5 + 384,
						canvas.colors[this.i]);
					var fft = new FFT(length);
					var fftResult = fft.forward(canvas.history[this.i]);
					this.panelFFT.drawDiscrete(fftResult.slice(0, spectrumSize * 2));
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

var {E, PI, LN2, LN10, LOG2E, LOG10E, PI, SQRT1_2, SQRT2,
abs, acos, acosh, asin, asinh, atan, atanh, atan2, cbrt, ceil, clz32,
cos, cosh, exp, expm1, floor, fround, hypot, imul, log, log1p, log10, log2,
max, min, pow, random, round, sign, sin, sinh, sqrt, tan, tanh, trunc} = Math;

// How wide is the resulting frequency spectrum? No more than N.
var spectrumSize = 300;
// How many seconds does one increment have? No more than 1/60.
var dt = 5e-4;
// The FFT will be available after how many samples have been established?
// No less than spectrumSize.
var N = 1e5;
// How many times faster than reality should the simulator run?
var xSpeed = 1;

var canvas;
var rungeKutta;

var u = 0.3
var gamma = 21.7
var beta = 0.2
var kappa = 8
var omega = 10
var f = 20
// H = p^2/2 + omega^2 (1 + u cos(gamma t)) q^2/2 - f q cos(kappa t + beta)

function start() {
	canvas = new ScrollingPanel(
		2, t => t * 70, y => (10 * y + 384), ['white', 'yellow'],
		(t, qp) => true, true, HAMMING
	);
	rungeKutta = RungeKutta.solveHamiltonian(
		1, [2, 0], Number.POSITIVE_INFINITY, canvas,
		(t, qp) => {
			var [q, p] = qp;
			return p**2/2+omega**2*(1+u*cos(gamma*t))*q**2/2-f*q*cos(kappa*t+beta);
		}
	);
	window.scene.addChild(canvas);
	window.scene.showing = canvas;
}

function restart() {
	canvas.clear();
	rungeKutta.clear();
	canvas.visible = true;
	window.scene.showing = canvas;
}

function update() {
	if (rungeKutta) rungeKutta.update();
	if (buttons) buttons.update();
}
