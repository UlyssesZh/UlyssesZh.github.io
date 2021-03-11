var $plugins = [
	{
		"status": true,
		"name": "Ulysses_Basic",
		"parameters": {
		}
	},
	{
		"status": true,
		"name": "RTP",
		"parameters": {
			"RTPPath": "../common/"
		}
	},
	{
		"status": true,
		"name": "Remove_Savefile",
		"parameters": {
			"removeKeyCode": "46",
			"keepBackup": "true",
			"playRemoveSound": "SoundManager.playCancel.bind(SoundManager)"
		}
	},
	{
		"status": true,
		"name": "Community_Basic",
		"parameters": {
			"cacheLimit": "20",
			"screenWidth": "816",
			"screenHeight": "624",
			"changeWindowWidthTo": "",
			"changeWindowHeightTo": "",
			"renderingMode": "auto",
			"alwaysDash": "off"
		}
	},
	{
		"status": true,
		"name": "MadeWithMv",
		"parameters": {
			"Show Made With MV": "true",
			"Made with MV Image": "MadeWithMv",
			"Show Custom Splash": "false",
			"Custom Image": "",
			"Fade Out Time": "120",
			"Fade In Time": "120",
			"Wait Time": "160"
		}
	}
];
