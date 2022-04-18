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
with open(sys.argv[2], 'r') as f:
    answers = json.load(f)
print(answers, file=sys.stderr)
with open(sys.argv[4], 'w+') as f:
    print(answers, file=f)
==

settings.allow_reroll = true