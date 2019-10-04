@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

# STEP 1
match =: MatchList

# remove the comment of the next line to display the properties of the component
# in realtime inside the form.

# match.debug % true

# STEP 2
before==
import random
match.nodes = []
expected = []

match.nodes.append({"id": "i", "content": "int", "source": True,})


match.nodes.append({"id": "pos", "content": "", "target": True,})


expected.append({ "source": "i", "target": "pos" })

random.shuffle(match.nodes)
==

title==
Match List Component
==

text==
*Link each operation to the appropriate result.*
==

# STEP 3
form==
{{ match|component }}
==

# STEP 4
evaluator== #|python|

def in_links(conn, links):
    for e in links:
        if e['source'] == conn["source"] and  e['target'] == conn["target"]:
            return True
    return False

error = 0
for e in expected:
    if not in_links(e, match.links):
        error = error + 1

for e in match.links:
    e['css'] = 'error-state anim-fade'
    if in_links(e, expected):
        e['css'] = 'success-state  anim-flip'

if error == 0:
    grade = (100, 'Good answser')
else:
    grade = (0, 'Bad answer, you made %d mistakes' % error)
==


