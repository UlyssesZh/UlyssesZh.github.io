addEventListener('load', () => {
	// select lines in code blocks by clicking or swiping on the lineno gutter
	document.querySelectorAll('.rouge-table').forEach(table => {
		const linenoSpans = table.querySelectorAll('.rouge-gutter .line');
		const codeLineSpans = table.querySelectorAll('.highlight .line');

		const updateSelection = (start, end) => {
			const selection = window.getSelection();
			const range = document.createRange();
			if (start > end) {
				[start, end] = [end, start];
			}
			range.setStartBefore(codeLineSpans[start]);
			range.setEndAfter(codeLineSpans[end]);
			selection.removeAllRanges();
			selection.addRange(range);
		};

		const indexAtY = y => {
			if (y < linenoSpans[0].getBoundingClientRect().top) {
				return 0;
			}
			if (y >= linenoSpans[linenoSpans.length - 1].getBoundingClientRect().bottom) {
				return linenoSpans.length - 1;
			}
			for (let i = 0; i < linenoSpans.length; i++) {
				const {top, bottom} = linenoSpans[i].getBoundingClientRect();
				if (y >= top && y < bottom) {
					return i;
				}
			}
			return null;
		};

		let dragging = false;
		let index = null;
		linenoSpans.forEach((span, i) => span.addEventListener('mousedown', event => {
			event.preventDefault();
			dragging = true;
			updateSelection(index = i, i);
		}));
		window.addEventListener('mouseup', () => dragging = false);
		window.addEventListener('mousemove', ({clientY}) => dragging && updateSelection(index, indexAtY(clientY)));
	});

	const setCopyButton = (button, element) => {
		let doneTimeout = null;
		button.addEventListener('click', event => {
			event.stopPropagation();
			navigator.clipboard.writeText(element.textContent);
			button.classList.add('done');
			if (doneTimeout != null) {
				clearTimeout(doneTimeout);
			}
			doneTimeout = setTimeout(() => {
				button.classList.remove('done');
				doneTimeout = null;
			}, 1000);
		});
	};

	// code block copy button
	document.querySelectorAll('.rouge-table').forEach(table => {
		const pre = table.querySelector('pre');
		const button = document.createElement('button');
		button.tabIndex = -1;
		button.classList.add('copy-button', 'code-block-copy');
		table.append(button);
		pre.addEventListener('click', () => button.classList.toggle('show'));
		setCopyButton(button, pre);
	});

	document.querySelectorAll('.copiable').forEach(element => {
		const button = document.createElement('button');
		button.classList.add('copy-button', 'attached-copy');
		element.after(button);
		setCopyButton(button, element);
	})
});
