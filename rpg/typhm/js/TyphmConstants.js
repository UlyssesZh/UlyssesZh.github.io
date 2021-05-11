function TyphmConstants() {
	throw new Error('This is a static class');
}

TyphmConstants.LINES_HEIGHT = 512;
TyphmConstants.TEXT_HEIGHT = 40;
TyphmConstants.LEFT_MARGIN =  16;
TyphmConstants.PREFERENCES_MARGIN = 128;
TyphmConstants.DEFAULT_MILLISECONDS_PER_PIXEL = 10.0;
TyphmConstants.DEFAULT_INACCURACY_TOLERANCE = 200.0;
TyphmConstants.KEYS = new Set();
const keysArray = [...'`1234567890-=qwertyuiop[]\\asdfghjkl;\'zxcvbnm,./~!@#$%^&*()_+QWERTYUIOP{}|ASDFGHJKL:"ZXCVBNM<>?'.split(''), '\\b', '\\n', '\\s'];
for (let i = 0; i < keysArray.length; i++)
	TyphmConstants.KEYS.add(keysArray[i]);
TyphmConstants.ESCAPES = {Backspace: '\\b', Enter: '\\n', ' ': '\\s'};
