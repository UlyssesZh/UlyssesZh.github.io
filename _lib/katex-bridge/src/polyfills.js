// MiniRacer's V8 context does not expose TextEncoder/TextDecoder

if (typeof globalThis.TextEncoder === 'undefined') {
	globalThis.TextEncoder = class TextEncoder {
		constructor() {
			this.encoding = 'utf-8';
		}

		encode(value) {
			const binary = unescape(encodeURIComponent(String(value)));
			const bytes = new Uint8Array(binary.length);
			for (let i = 0; i < binary.length; i += 1) {
				bytes[i] = binary.charCodeAt(i);
			}
			return bytes;
		}

		encodeInto(value, destination) {
			const bytes = this.encode(value);
			const written = Math.min(bytes.length, destination.length);
			destination.set(bytes.subarray(0, written));
			return { read: String(value).length, written };
		}
	};
}

if (typeof globalThis.TextDecoder === 'undefined') {
	globalThis.TextDecoder = class TextDecoder {
		constructor() {
			this.encoding = 'utf-8';
		}

		decode(input) {
			if (!input) {
				return '';
			}
			let bytes;
			if (input instanceof Uint8Array) {
				bytes = input;
			} else if (ArrayBuffer.isView(input)) {
				bytes = new Uint8Array(input.buffer, input.byteOffset, input.byteLength);
			} else if (input instanceof ArrayBuffer) {
				bytes = new Uint8Array(input);
			} else {
				bytes = new Uint8Array(input);
			}
			let binary = '';
			for (let i = 0; i < bytes.length; i += 1) {
				binary += String.fromCharCode(bytes[i]);
			}
			try {
				return decodeURIComponent(escape(binary));
			} catch {
				return binary;
			}
		}
	};
}
