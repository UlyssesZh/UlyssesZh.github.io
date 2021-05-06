---
title: HTML preview
layout: tool
---

<script src="https://cdn.jsdelivr.net/npm/autosize@4.0.2/dist/autosize.min.js"></script>

The texts you input in the area below will
be filled into a `<p>` tag below.

MathJax is enabled, so you can type math as $\LaTeX$.

<textarea id="input" autofocus="true" style="-webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box; width: 100%;"></textarea>
[Let's rock (Ctrl+Enter)](javascript:onoutput();)

---

<p id="output"></p>
<script>
	const input = document.getElementById('input');
	const output = document.getElementById('output');
	autosize(input);
	input.addEventListener("keydown", event => {
		if (event.ctrlKey && event.key === "Enter") {
			onoutput();
		}
	});
	function onoutput() {
		try {
			output.innerHTML = input.value;
			MathJax.texReset();
			MathJax.typeset();
		} catch(e) {
			output.innerHTML = e;
		}
	}
</script>
