#*****************************************************************************
#  Copyright (C) 2021 Nicolas Borie <nicolas dot borie at univ-eiffel . fr>
#
#  Distributed under the terms of Creative Commons Attribution-ShareAlike 3.0
#  Creative Commons CC-by-SA 3.0
#
#    This code is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#
#  The full text of the CC-By-SA 3.0 is available at:
#
#            https://creativecommons.org/licenses/by-sa/3.0/
#            https://creativecommons.org/licenses/by-sa/3.0/fr/
#*****************************************************************************

@ /utils/sandboxio.py

grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

# STEP 1
match =: MatchList

before==#|python|
import random
match.nodes = []
expected = []

match.nodes.append({"id": "100", "content": "`float`", "target": True})

match.nodes.append({"id": "1", "content": "%d * %d" % (a, b), "source": True})

match.nodes.append({"id": "100", "content": "`float`", "target": True})

expected.append({ "source": sourceId, "target": targetId })
random.shuffle(match.nodes)
==

title==
Match List Component
==

text==
*Link each operation to the appropriate result.*
==

form==
{{ match|component }}
==

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
    e['css'] = 'error-state animated fadeIn'
    if in_links(e, expected):
        e['css'] = 'success-state  animated rotateIn'

if error == 0:
    grade = (100, '<span class="success-state animated pulse infinite">Good answser</span>')
else:
    grade = (0, '<span class="error-state animated pulse infinite">Bad answer, you made %d mistakes</span>' % error)
==






