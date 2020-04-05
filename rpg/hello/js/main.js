//=============================================================================
// main.js
//=============================================================================

var sprite = new Sprite();
var background = new Sprite();
var right = true;
var down = true;

function start() {
	sprite.bitmap = new Bitmap(256, 48);
	sprite.x = (Graphics.width - sprite.width) / 2;
	sprite.y = (Graphics.height - sprite.height) / 2;
	sprite.kz = 1;
	sprite.bitmap.fillRect(0, 0, sprite.width, 1, 'white');
	sprite.bitmap.fillRect(0, 0, 1, sprite.height, 'white');
	sprite.bitmap.fillRect(sprite.width - 1, 0, 1, sprite.height, 'white');
	sprite.bitmap.fillRect(0, sprite.height - 1, sprite.width, 1, 'white');
	sprite.bitmap.drawText('Hello, world!',
		0, 0, sprite.width, sprite.height, 'center');
	
	background.bitmap = new Bitmap(Graphics.width, Graphics.height);
	background.bitmap.fillAll('white');
	background.bitmap.fillRect(1, 1,
		Graphics.width - 2, Graphics.height - 2, 'black');
	background.kz = 0;
	
	window.scene.addChild(background);
	window.scene.addChild(sprite);
	window.scene.children.sort((a, b) => a.kz - b.kz);
}

function update() {
	background.bitmap.fillRect(sprite.x + sprite.width / 2,
		sprite.y + sprite.height / 2, 1, 1, 'white');
	sprite.x += right ? 1 : -1;
	sprite.y += down ? 1 : -1;
	if (sprite.x + sprite.width >= Graphics.width) {
		right = false;
	} else if (sprite.x <= 0) {
		right = true;
	}
	if (sprite.y + sprite.height >= Graphics.height) {
		down = false;
	} else if (sprite.y <= 0) {
		down = true;
	}
}

Graphics.initialize(640, 480, 'webgl');
Graphics.boxWidth = 640;
Graphics.boxHeight = 480;
Input.initialize();
TouchInput.initialize();
function requestUpdate() {
	requestAnimationFrame(performUpdate);
}
var deltaTime = 1.0 / 60.0;
var accumulator = 0.0, currentTime;
var meter = new FPSMeter();
window.scene = new Stage();
start();
function performUpdate() {
	meter.tickStart();
	var newTime = performance.now();
	if (currentTime === undefined) currentTime = newTime;
	var fTime = (newTime - currentTime) / 1000;
	if (fTime > 0.25) fTime = 0.25;
	currentTime = newTime;
	accumulator += fTime;
	while (accumulator >= deltaTime) {
		Input.update();
		TouchInput.update();
		accumulator -= deltaTime;
	}
	update();
	Graphics.render(window.scene);
	meter.tick();
	requestUpdate();
}
performUpdate();
