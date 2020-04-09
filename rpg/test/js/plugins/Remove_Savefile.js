/*:
 * @plugindesc Add the function of removing savefiles.
 * @author Ulysses
 *
 * @param removeKeyCode
 * @desc The code of the key by triggering which to remove a savefile.
 * @default 46
 *
 * @param keepBackup
 * @desc Whether to keep the backup of a savefile when removing it.
 * @default true
 *
 * @param playRemoveSound
 * @desc How the SE will be played.
 * @default SoundManager.playCancel.bind(SoundManager)
 *
 * @help
 * Add the function of removing savefiles.
 */

ULYSSES_PLUGINS.register(1);

(() => {
	var parameters = ULYSSES_PLUGINS.parameters();
	var keyCode = Number(parameters.removeKeyCode);
	var keepBackup = parameters.keepBackup === 'true';
	var playRemoveSound = eval(parameters.playRemoveSound);
	
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
