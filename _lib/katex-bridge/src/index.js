import './polyfills.js';
import { decode, encode } from '@msgpack/msgpack';
import katex from 'katex';

function walk(value, options) {
	if (Array.isArray(value)) {
		return value.map((item) => walk(item, options));
	}
	if (value && typeof value === 'object') {
		if (value.t === 'Math') {
			return {
				t: 'RawInline',
				c: ['html', katex.renderToString(value.c[1], {
					...options,
					displayMode: value.c[0].t === 'DisplayMath',
				})],
			};
		}
		for (const key of Object.keys(value)) {
			value[key] = walk(value[key], options);
		}
	}
	return value;
}

let options = {};
let optionsFeed = {};

globalThis.setOptions = function setOptions(obj) {
	options = obj;
	optionsFeed = Object.assign({}, obj);
	optionsFeed.output = 'mathml';
};

globalThis.renderMath = function renderMath(ast, feed = false) {
	walk(ast, feed ? optionsFeed : options);
	// MiniRacer converts the whole underlying ArrayBuffer of a typed array back to Ruby,
	// so return an exactly-sized copy.
	return encode(ast).slice();
};

globalThis.renderMathFeed = function renderMathFeed(ast) {
	return renderMath(ast, true);
};
