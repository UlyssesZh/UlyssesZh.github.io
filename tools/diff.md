---
layout: tool
title: Diff
---

<script src="https://cdn.jsdelivr.net/npm/diff_match_patch@0.1.1/lib/diff_match_patch.js"></script>
<script src="https://cdn.jsdelivr.net/npm/autosize@4.0.2/dist/autosize.min.js"></script>

Diff takes two texts and finds the differences.
This implementation works on a character by character basis.
The result of any diff may contain 'chaff',
irrelevant small commonalities which complicate the output.
A post-diff cleanup algorithm factors out these trivial commonalities.

Copied from the [Demo of Diff](https://neil.fraser.name/software/diff_match_patch/demos/diff.html).

<textarea id="text1" autofocus="true" style="-webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box; width: 100%;"></textarea>
<textarea id="text2" autofocus="true" style="-webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box; width: 100%;"></textarea>

Timeout:
<input id="timeout" type="text" size=3 maxlength=5 value="1">
seconds.
If the mapping phase of the diff computation takes longer than this,
then the computation is truncated and the best solution to date is returned.
While guaranteed to be correct, it may not be optimal.
A timeout of '0' allows for unlimited computation.

<dl>
<dt><input name="cleanup" id="semantic" type="radio" checked>
<label for="semantic">Semantic Cleanup</label></dt>
<dd>Increase human readability by factoring out commonalities
which are likely to be coincidental.</dd>
<dt><input type="radio" name="cleanup" id="efficiency">
<label FOR="efficiency">Efficiency Cleanup</label>,
edit cost: <input type="text" size=3 maxlength=5 value="4" id="editcost"></dt>
<dd>Increase computational efficiency by factoring out short commonalities which are
not worth the overhead.  The larger the edit cost, the more aggressive the cleanup.</dd>
<dt><input type="radio" name="cleanup" id="raw">
<label for="raw">No Cleanup</label></dt>
<dd>Raw output.</dd>
</dl>

[Let's rock (Ctrl+Enter)](javascript:launch();)

---

<div id="outputdiv"></div>

<script>
var dmp = new diff_match_patch();
var textarea1 = document.getElementById('text1');
var textarea2 = document.getElementById('text2');

function launch() {
    var text1 = textarea1.value;
    var text2 = textarea2.value;
    dmp.Diff_Timeout = parseFloat(document.getElementById('timeout').value);
    dmp.Diff_EditCost = parseFloat(document.getElementById('editcost').value);
    
    var ms_start = (new Date()).getTime();
    var d = dmp.diff_main(text1, text2);
    var ms_end = (new Date()).getTime();
    
    if (document.getElementById('semantic').checked) {
        dmp.diff_cleanupSemantic(d);
    }
    if (document.getElementById('efficiency').checked) {
        dmp.diff_cleanupEfficiency(d);
    }
    var ds = dmp.diff_prettyHtml(d);
    document.getElementById('outputdiv').innerHTML = ds + '<BR>Time: ' + (ms_end - ms_start) / 1000 + 's';
}

autosize(textarea1);
autosize(textarea2);

var listener = event => {
    if (event.ctrlKey && event.key === "Enter") launch();
};
textarea1.addEventListener("keydown", listener);
textarea2.addEventListener("keydown", listener);
</script>
