@ /utils/sandboxio.py

title = Truc

text==
Test de dépot ?
==

form==#|html|
<link rel="stylesheet" href="https://hderycke.frama.io/sharecode/lib/codemirror.css">
<script src="https://hderycke.frama.io/sharecode/lib/codemirror.js"></script>
<script src="https://hderycke.frama.io/sharecode/mode/meta.js"></script>
<script src="https://hderycke.frama.io/sharecode/addon/selection/active-line.js"></script>
<script src="https://hderycke.frama.io/sharecode/mode/mllike/mllike.js"></script>
<script src="https://hderycke.frama.io/sharecode/mode/clike/clike.js"></script>
<script src="https://hderycke.frama.io/sharecode/mode/python/python.js"></script>
<script src="https://hderycke.frama.io/sharecode/mode/y86/y86.js"></script>
<script src="https://hderycke.frama.io/sharecode/mode/markdown/markdown.js"></script>

<p><select id="lang"></select></p>
<div>
    <code><textarea id="form_code"></textarea></code>
</div>
<script>
    window.addEventListener('load', () => {
    const code = document.getElementById('form_code');
    const editor = CodeMirror.fromTextArea(code, {
        lineNumbers: true,
        styleActiveLine: true,
    });
    const selectLang = document.getElementById('lang');
    for (const lang of Object.getOwnPropertyNames(CodeMirror.mimeModes)) {
        const option = document.createElement('option');
        option.value = lang;
        option.textContent = (CodeMirror.findModeByMIME(lang) && CodeMirror.findModeByMIME(lang).name) || lang;
        selectLang.appendChild(option);
    }
    selectLang.addEventListener('change', () => {
        editor.setOption('mode', selectLang.value);
    });
    });
</script>
==

grader==#|py|
import json 
import sys
try:
    with open(sys.argv[2], 'r') as f:
        answers = json.load(f)
    with open(sys.argv[4], 'w+') as f:
        print(answers, file=f)
except Exception as e:
    print(e, file=sys.stderr)
print(100)
==
