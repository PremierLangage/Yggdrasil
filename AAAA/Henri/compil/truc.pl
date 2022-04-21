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

<button onclick="addCM()">+</button>
<div id="section_code">
</div>
<script>
    let fileid = 0;
    function addCM() {
        const uid = fileid++;
        const div = document.createElement('div');
        document.getElementById("section_code").appendChild(div);
        const selectLang = document.createElement('select');
        for (const lang of Object.getOwnPropertyNames(CodeMirror.mimeModes)) {
            const option = document.createElement('option');
            option.value = lang;
            option.textContent = (CodeMirror.findModeByMIME(lang) && CodeMirror.findModeByMIME(lang).name) || lang;
            selectLang.appendChild(option);
        }
        div.appendChild(selectLang);

        const editor = CodeMirror(div, {
            lineNumbers: true,
            styleActiveLine: true,
        });
        editor.getInputField().id = "form_code" + uid;
        editor.on("changes", (cm) => cm.save());

        selectLang.addEventListener('change', () => {
            editor.setOption('mode', selectLang.value);
        });
    }

    // workaround pour la goutière 
    window.addEventListener('load', () => {
        addCM();
    });
</script>

<pre>{{ editor }}</pre>
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
