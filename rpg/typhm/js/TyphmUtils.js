function TyphmUtils() {
	throw new Error('This is a static class');
}

TyphmUtils.getHexFromRatio = function (ratio) {
	return Math.round(ratio*255).toString(16).padStart(2, '0');
}

TyphmUtils.getRgbFromHue = function (hue) {
	const m = (Math.abs(hue) / (Math.PI/3)) % 6;
	if (m < 1) {
		return `#ff${this.getHexFromRatio(m)}00`;
	} else if (m < 2) {
		return `#${this.getHexFromRatio(2-m)}ff00`;
	} else if (m < 3) {
		return `#00ff${this.getHexFromRatio(m-2)}`;
	} else if (m < 4) {
		return `#00${this.getHexFromRatio(4-m)}ff`;
	} else if (m < 5) {
		return `#${this.getHexFromRatio(m-4)}00ff`;
	} else if (m < 6) {
		return `#ff00${this.getHexFromRatio(6-m)}`;
	}
}