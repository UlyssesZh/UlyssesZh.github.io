//=============================================================================
// main.js
//=============================================================================

function update() {}

window.onload = () => {
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
};
