// author: Ulysses

(() => {
	var parameters = PluginManager.parameters('remove_savefile');
	var keyCode = parameters.removeKeyCode;
	var keepBackup = parameters.keepBackup;
	var playRemoveSound = parameters.playRemoveSound;
	
	Input.keyMapper[keyCode] = 'remove';
	
	DataManager.removeSavefile = function(savefileId) {
		StorageManager.remove(savefileId);
		if (keepBackup)
			StorageManager.restoreBackup(savefileId);
		var globalInfo = this.loadGlobalInfo() || [];
		globalInfo[savefileId] = this.makeSavefileInfo();
		this.saveGlobalInfo(globalInfo);
	};
	
	var oldWindowSavefileListProcessHandling = Window_SavefileList.prototype.processHandling;
	Window_SavefileList.prototype.processHandling = function() {
		oldWindowSavefileListProcessHandling.call(this);
		if (this.isOpenAndActive() && Input.isTriggered('remove')) {
			playRemoveSound();
			DataManager.removeSavefile(this.index() + 1);
			this.refresh();
		}
	};
})();
