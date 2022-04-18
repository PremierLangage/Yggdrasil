@ /utils/sandboxio.py

title = Truc

text==
Test de dépot ?
==

form==
<input type="file" id="form_depot">
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
==

settings.allow_reroll = true