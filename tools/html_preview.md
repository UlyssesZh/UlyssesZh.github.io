---
layout: default
---

<script src="https://cdnjs.cloudflare.com/ajax/libs/autosize.js/4.0.2/autosize.min.js"></script>
<style>
	textarea {
		-webkit-box-sizing: border-box;
		-moz-box-sizing: border-box;
		box-sizing: border-box;

		width: 100%;
	}
</style>
This page is used for HTML preview. The texts you input in the area below will be filled into a `<p>` tag below when you press Ctrl+Enter.

MathJax is enabled, so you can type math as $\LaTeX$.

<textarea id="input" autofocus="true"></textarea>
<p id="output"></p>
<script>
	var input = document.getElementById('input');
	var output = document.getElementById('output');
	autosize(input);
	input.addEventListener("keydown", function(event) {
		if (event.ctrlKey && (event.keyCode == 10 || event.keyCode == 13)) {
			try {
				output.innerHTML = input.value;
				MathJax.texReset();
				MathJax.typeset();
			} catch(e) {
				output.innerHTML = e;
			}
		}
	});
</script>
