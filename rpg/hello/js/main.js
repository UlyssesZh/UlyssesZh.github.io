//=============================================================================
// main.js
//=============================================================================

Sprite.prototype.isClicked = function() {
	return TouchInput.isTriggered() &&
		this.x <= TouchInput.x && TouchInput.x <= this.x + this.width &&
		this.y <= TouchInput.y && TouchInput.y <= this.y + this.height;
};

var sprite = new Sprite();
var background = new Sprite();
var upButton = new Sprite();
var downButton = new Sprite();
var leftButton = new Sprite();
var rightButton = new Sprite();
var clearButton = new Sprite();
var right = true;
var down = true;

function clearBackground() {
	background.bitmap.clearRect(1, 1,
		Graphics.width - 2, Graphics.height - 2);
}

var size = 50;
function setButton(button, text, x, y) {
	button.bitmap = new Bitmap(size, size);
	button.bitmap.fontSize = size;
	button.bitmap.drawText(text, 0, 0, size, size, 'center');
	button.move(x(size), y(size));
}

function start() {
	sprite.bitmap = new Bitmap(200, 48);
	sprite.move((Graphics.width - sprite.width) / 2,
		(Graphics.height - sprite.height) / 2);
	sprite.bitmap.fillAll('blue');
	sprite.bitmap.clearRect(1, 1,
		sprite.width - 2, sprite.height - 2);
	sprite.bitmap.textColor = 'pink';
	sprite.bitmap.drawText('Hello, world!',
		0, 0, sprite.width, sprite.height, 'center');
	
	background.bitmap = new Bitmap(Graphics.width, Graphics.height);
	background.bitmap.fillAll('red');
	clearBackground();
	
	setButton(upButton, 'U', s => s, s => Graphics.height - s * 3);
	setButton(downButton, 'D', s => s, s => Graphics.height - s);
	setButton(leftButton, 'L', s => 0, s => Graphics.height - s * 2);
	setButton(rightButton, 'R', s => s * 2, s => Graphics.height - s * 2);
	setButton(clearButton, 'C', s => Graphics.width - s * 2,
			s => Graphics.height - s * 2);
	
	window.scene.addChild(background);
	window.scene.addChild(sprite);
	window.scene.addChild(upButton);
	window.scene.addChild(downButton);
	window.scene.addChild(leftButton);
	window.scene.addChild(rightButton);
	window.scene.addChild(clearButton);
}

function update() {
	background.bitmap.fillRect(sprite.x + sprite.width / 2,
		sprite.y + sprite.height / 2, 1, 1, 'green');
	sprite.x += right ? 1 : -1;
	sprite.y += down ? 1 : -1;
	if (sprite.x + sprite.width >= Graphics.width)
		right = false;
	else if (sprite.x <= 0)
		right = true;
	if (sprite.y + sprite.height >= Graphics.height)
		down = false;
	else if (sprite.y <= 0)
		down = true;
	if (Input.isTriggered('up') || upButton.isClicked())
		down = false;
	if (Input.isTriggered('down') || downButton.isClicked())
		down = true;
	if (Input.isTriggered('left') || leftButton.isClicked())
		right = false;
	if (Input.isTriggered('right') || rightButton.isClicked())
		right = true;
	if (Input.isTriggered('menu') || clearButton.isClicked())
		clearBackground();
}

Graphics.initialize(816, 624, 'webgl');
Graphics.boxWidth = 816;
Graphics.boxHeight = 624;
WebAudio.initialize(false);
Input.initialize();
TouchInput.initialize();
var deltaTime = 1.0 / 60.0;
var accumulator = 0.0;
var currentTime;
window.scene = new Stage();
start();
function performUpdate() {
	Graphics.tickStart();
	var newTime = performance.now();
	if (currentTime === undefined) currentTime = newTime;
	var fTime = ((newTime - currentTime) / 1000).clamp(0, 0.25);
	currentTime = newTime;
	accumulator += fTime;
	while (accumulator >= deltaTime) {
		Input.update();
		TouchInput.update();
		update();
		accumulator -= deltaTime;
	}
	Graphics.render(window.scene);
	requestAnimationFrame(performUpdate);
	Graphics.tickEnd();
}
performUpdate();
