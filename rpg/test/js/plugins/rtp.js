// author: Ulysses

(() => {
	function buildParent(structure) {
		for (var name in structure) {
			var child = structure[name];
			if (child !== 'f') buildParent(child);
			child.parent = structure;
		}
	}
	var xhr = new XMLHttpRequest();
	var url = 'map.json';
	var siteStructure;
	xhr.open('GET', url);
	xhr.overrideMimeType('application/json');
	xhr.onerror = () => {
		alert('Error loading map.json');
		siteStructure = null;
	};
	
	var oldSceneManagerRun = SceneManager.run;
	SceneManager.run = function(sceneClass) {
		xhr.onload = () => {
			if (xhr.status < 400) {
				siteStructure = JSON.parse(xhr.responseText);
				buildParent(siteStructure);
			}
			oldSceneManagerRun.call(this, sceneClass);
		};
		xhr.send();
	};
	
	function useRTP(url) {
		if (url[0] === '/') return false;
		var pos = siteStructure;
		var ary = url.split('/');
		for (var i in ary) {
			switch (ary[i]) {
				case '.':
					break;
				case '..':
					if (pos === siteStructure) return false;
					pos = pos.parent;
					break;
				default:
					pos = pos[name];
			}
			if (pos === undefined) return true;
		}
		return false;
	}
	
	var path = PluginManager.parameters('rtp')['RTPPath'];
	
	var oldWebAudioInitialize = WebAudio.prototype.initialize;
	WebAudio.prototype.initialize = function(url) {
		if (useRTP(url)) url = path + url;
		oldWebAudioInitialize.call(this, url);
	};
	
	var oldBitmapLoad = Bitmap.load;
	Bitmap.load = function(url) {
		if (useRTP(url)) url = path + url;
		return oldBitmapLoad(url);
	};
	
	var oldGraphicsSetLoadingImage = Graphics.setLoadingImage;
	Graphics.setLoadingImage = function(url) {
		if (useRTP(url)) url = path + url;
		oldGraphicsSetLoadingImage(url);
	};
	
	var oldHtml5AudioSetup = Html5Audio.setup;
	Html5Audio.setup = function(url) {
		if (useRTP(url)) url = path + url;
		oldHtml5AudioSetup(url);
	}
})();
