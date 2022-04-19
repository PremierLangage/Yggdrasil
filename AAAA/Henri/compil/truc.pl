@ /utils/sandboxio.py

title = Truc

text==
Test de dépot ?
==

form==#|html|
<button id="addfile">+</button>
<c-code-editor cid="form_bidule"> </c-code-editor> 
<c-code-editor cid="form_machin"> </c-code-editor> 
<script>
    let i = 1;
    const b = document.getElementById("addfile");
    b.addEventListener('click', (e) => {
        const p = e.target.parentNode;
        const el = document.createElement('c-code-editor');
        el.setAttribute("cid","form_code" + i);
        p.appendChild(el);
        i++;
    })
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
