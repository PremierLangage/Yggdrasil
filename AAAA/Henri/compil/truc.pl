@ /utils/sandboxio.py

title = Truc

text==
Test de dépot ?
==

form==#|html|
<button id="addfile">+</button>
<input type="file" id="form_depot">
<script>
    const b = document.getElementById("addfile");
    b.addEventListener('click', (e) => {
        const b = e.target;
        
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
