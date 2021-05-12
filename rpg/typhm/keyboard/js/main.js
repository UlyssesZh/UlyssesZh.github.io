//=============================================================================
// main.js
//=============================================================================

function start() {
	const keyboardSprite = new Sprite(new Bitmap(464, 288));
	for (const key in TyphmConstants.KEYBOARD_LAYOUT) {
		const [x, y] = TyphmConstants.KEYBOARD_LAYOUT[key];
		keyboardSprite.bitmap.drawText(key, x*32, y*32, 32, 32, 'center');
	}
	window.scene.addChild(keyboardSprite);
	document.addEventListener('keydown', event => createHitEffect(event.key, 'white'));
}

function createHitEffect(key, color) {
	key = TyphmUtils.parseKey(key);
	if (!key) return;
	const hitEffect = new Sprite(new Bitmap(32, 32));
	[hitEffect.x, hitEffect.y] = TyphmConstants.KEYBOARD_LAYOUT[key];
	hitEffect.x *= 32;
	hitEffect.y *= 32;
	hitEffect.bitmap.fillAll(color);
	window.scene.addChild(hitEffect);
	hitEffect.update = () => {
		hitEffect.opacity *= 0.9**(60/Graphics._fpsMeter.fps);
		if (hitEffect.opacity <= 5)
			window.scene.removeChild(hitEffect);
	};
}

function update() {
	window.scene.children.forEach(child => { if (child.update) child.update(); });
}


window.onload = () => {
	Graphics.initialize(464, 288, 'webgl');
	Graphics.boxWidth = 464;
	Graphics.boxHeight = 288;
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
			update();
			accumulator -= deltaTime;
		}
		Graphics.render(window.scene);
		requestAnimationFrame(performUpdate);
		Graphics.tickEnd();
	}
	
	performUpdate();
};
