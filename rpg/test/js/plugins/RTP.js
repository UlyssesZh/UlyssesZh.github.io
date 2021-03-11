/*:
 * @plugindesc Make the game find resources from RTP
 * @author Ulysses
 *
 * @param RTPPath
 * @desc The path of RTP. Can be relative.
 * @default ../common/
 *
 * @help
 * Use the jekyll plugin `gen_rpg_map.rb`.
 */

ULYSSES_PLUGINS.register(1);

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
	xhr.onerror = () => console.warn('Error loading map.json');
	
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
		if (siteStructure === undefined) return false;
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
	
	var path = ULYSSES_PLUGINS.parameters().RTPPath;
	
	var oldWebAudioInitialize = WebAudio.prototype.initialize;
	WebAudio.prototype.initialize = function(url) {
		if (useRTP(url)) url = path + url;
		oldWebAudioInitialize.call(this, url);
	};
	
	var oldBitmapLoad = Bitmap.load;
	Bitmap.load = function(url) {
		if (useRTP(url)) url = path + url;
		return oldBitmapLoad.call(this, url);
	};
	
	var oldGraphicsSetLoadingImage = Graphics.setLoadingImage;
	Graphics.setLoadingImage = function(url) {
		if (useRTP(url)) url = path + url;
		oldGraphicsSetLoadingImage.call(this, url);
	};
	
	var oldHtml5AudioSetup = Html5Audio.setup;
	Html5Audio.setup = function(url) {
		if (useRTP(url)) url = path + url;
		oldHtml5AudioSetup.call(this, url);
	};
})();
