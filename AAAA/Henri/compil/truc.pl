title = Truc

text==
Test de dépot ?
==

files % {}

files.main_asm % {}
files.main_asm.lang = x86
files.main_asm.code == #|asm|
section .text
global main
main:
    ; compléter
==
files.main_asm.solution == #|asm|
section .text
global main
main:
    mov eax, 1
    mov ebx, 0
    int 0x80
==

files.compile_sh % {}
files.compile_sh.lang = sh
files.compile_sh.readonly = 1
files.compile_sh.code == #|shell|
nasm -felf32 main.asm -o main.o
ld -m elf_i386 -e main main.o -o main
==

files.main_c % {}
files.main_c.lang = text/x-csrc
files.main_c.readonly = 1
files.main_c.code == #|c|
int main() {
    return 0;
}
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

<!--<button onclick="addCM()">+</button>-->
<div id="section_code">
</div>
<script>
    let fileid = 0;
    function addCM(id, content, readonly) {
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
        // id pour PL (angular?)
        textarea.id = "form_code" + id;
        textarea.value = content;

        const editor = CodeMirror.fromTextArea(
            div.appendChild(textarea),
            {
                lineNumbers: true,
                styleActiveLine: true,
                readOnly: readonly,
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
        const editor = addCM("{{ file }}", `{{ files[file].code }}`, {{ files[file].readonly }});
        editor.setOption('mode', "{{ files[file].lang }}");
    }
    {% endfor %}
</script>
==

builder==#|py|
import json 
import sys
try:
    with open(sys.argv[1], 'r') as f:
        context = json.load(f)
    with open(sys.argv[2], 'w+') as f:
       print(context, file=f)
    print(context)
except Exception as e:
    print(e, file=sys.stderr)
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
