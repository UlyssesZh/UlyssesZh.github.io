import { TextEncoder, TextDecoder } from 'fastestsmallesttextencoderdecoder'
import { decode, encode } from '@msgpack/msgpack';
import katex from 'katex';

// MiniRacer's V8 context does not expose TextEncoder/TextDecoder
globalThis.TextEncoder = TextEncoder;
globalThis.TextDecoder = TextDecoder;

let options = {};
globalThis.setOptions = function (obj) {
	options = obj;
};

globalThis.render = function (tex, displayMode, feed) {
	const opt = { ...options, displayMode };
	if (feed) {
		opt.output = 'mathml';
	}
	return katex.renderToString(tex, opt);
};
