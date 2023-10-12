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
<script src="https://hderycke.frama.io/sharecode/mode/markdown/markdown.js"></script>

<button onclick="addCM()">+</button>
<div id="section_code">
</div>
<script>
    let fileid = 0;
    function addCM(id) {
        const uid = fileid++;
        const div = document.createElement('div');
        document.getElementById("section_code").appendChild(div);

        // selecteur de lang (charge ce qui est dispo), ne fait pas parti de la data
        const selectLang = document.createElement('select');
        for (const lang of Object.getOwnPropertyNames(CodeMirror.mimeModes)) {
            const option = document.createElement('option');
            option.value = lang;
            option.textContent = (CodeMirror.findModeByMIME(lang) && CodeMirror.findModeByMIME(lang).name) || lang;
            selectLang.appendChild(option);
        }
        div.appendChild(selectLang);

        const textarea = document.createElement('textarea');
        const editor = CodeMirror.fromTextArea(
            div.appendChild(textarea),
            {
                lineNumbers: true,
                styleActiveLine: true,
            }
        );
        // id pour PL (angular?)
        textarea.id = "form_code" + uid;

        // nécessaire pour synchroniser la valeur de l'éditeur et de la textarea
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
