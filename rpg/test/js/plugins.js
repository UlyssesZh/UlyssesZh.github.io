var $plugins = [
	{
		status: true,
		name: 'rtp',
		parameters: {
			RTPPath: '../common/'
		}
	},
	{
		status: true,
		name: 'remove_savefile',
		parameters: {
			removeKeyCode: 46,
			keepBackup: true,
			playRemoveSound: SoundManager.playCancel.bind(SoundManager)
		}
	}
];
