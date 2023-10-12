files % {}

form==#|html|
<link rel="stylesheet" href="https://hderycke.frama.io/sharecode/lib/codemirror.css">
<script src="https://hderycke.frama.io/sharecode/lib/codemirror.js"></script>
<script src="https://hderycke.frama.io/sharecode/mode/meta.js"></script>
<script src="https://hderycke.frama.io/sharecode/addon/selection/active-line.js"></script>
<script src="https://hderycke.frama.io/sharecode/mode/mllike/mllike.js"></script>
<script src="https://hderycke.frama.io/sharecode/mode/clike/clike.js"></script>
<script src="https://hderycke.frama.io/sharecode/mode/python/python.js"></script>
<script src="https://hderycke.frama.io/sharecode/mode/markdown/markdown.js"></script>

<!--<button onclick="addCM()">+</button>-->
<div id="section_code">
</div>
<script>
    function addCM({id, lang, content, readonly}) {
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
        // id pour PL (angular?)
        textarea.id = "form_code" + id;
        textarea.value = content;

        const editor = CodeMirror.fromTextArea(
            div.appendChild(textarea),
            {
                lineNumbers: true,
                styleActiveLine: true,
                readOnly: readonly,
                value: textarea.value,
            }
        );

        // nécessaire pour synchroniser la valeur de l'éditeur et de la textarea
        editor.on("changes", (cm) => cm.save());

        selectLang.addEventListener('change', () => {
            editor.setOption('mode', selectLang.value);
        });
        return editor;
    }
</script>
<script>
    {% for file in files %}
    {
        const editor = addCM({{ { 
            "id": file, 
            "content": files[file].code,
            "readonly": files[file].readonly == "1"
        }|tojson }});
        editor.setOption('mode', {{ files[file].lang|tojson }});
    }
    {% endfor %}
</script>
==

grader==#|py|
import json 
import sys
try:
    with open(sys.argv[1], 'r') as f:
        context = json.load(f)
    with open(sys.argv[2], 'r') as f:
        answers = json.load(f)
    # report current answers
    for name in answers:
        name = name[4:]
        if 'readonly' not in context['files'][name]:
            context['files'][name]['code'] = answers['code' + name]
    with open(sys.argv[3], 'w+') as f:
        json.dump(context, f)
    with open(sys.argv[4], 'w+') as f:
        print('<pre>', answers, '</pre>', file=f)
except Exception as e:
    print(e, file=sys.stderr)
print(100)
==

builder==#|py|
import json 
import sys
import html
try:
    with open(sys.argv[1], 'r') as f:
        context = json.load(f)
    context['text'] = '<pre>' + html.escape(json.dumps(context, indent=2)).replace('{','&#123;').replace('}','&#124;') + '</pre>'
    with open(sys.argv[2], 'w') as f:
        json.dump(context, f)
except Exception as e:
    print(e, file=sys.stderr)
==